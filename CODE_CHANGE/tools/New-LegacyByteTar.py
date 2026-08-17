#!/usr/bin/env python3
"""Build a tar whose member names preserve the legacy Linux filename bytes.

The Windows working tree uses U+EF80..U+EFFF as a reversible display bridge
for bytes that are not valid UTF-8. A normal Windows tar program encodes those
private-use characters as UTF-8, which breaks byte-exact lookups by jxlinux.
This writer reverses the bridge while composing POSIX ustar headers.
"""

import argparse
import fnmatch
import hashlib
import json
import os
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import BinaryIO, Dict, Iterable, List, Optional, Tuple


BLOCK_SIZE = 512
ROOTS = ("script", "settings")
RAW_MAP20_PREFIX = b"script/\xce\xf7\xc4\xcf\xb1\xb1\xc7\xf8/\xbd\xad\xbd\xf2\xb4\xe5/"
PUA_UTF8_MAP20_PREFIX = bytes.fromhex(
    "73 63 72 69 70 74 2f "
    "ee bf 8e ee bf b7 ee bf 84 cf b1 ee be b1 ee bf 87 ee bf b8 2f "
    "ee be bd ee be ad ee be bd ee bf b2 ee be b4 ee bf a5 2f"
)


def is_backup_artifact(relative: Path) -> bool:
    """Match the same backup families excluded by the dependency copier."""
    lowered_parts = [part.lower() for part in relative.parts]
    for part in lowered_parts[:-1]:
        if part in {"back", "backup", "backups", "bak", "old", "orig", "save", "tmp"}:
            return True
        if part.startswith("backup_") or part.endswith("_backup"):
            return True
    leaf = lowered_parts[-1]
    patterns = (
        "*.bak", "*.bak.*", "*.old", "*.old.*", "*.orig", "*.orig.*",
        "*.save", "*.save.*", "*.tmp", "*.tmp.*", "*.lua__", "*~",
    )
    return any(fnmatch.fnmatchcase(leaf, pattern) for pattern in patterns)


def is_backup_directory(relative: Path) -> bool:
    leaf = relative.parts[-1].lower()
    return (
        leaf in {"back", "backup", "backups", "bak", "old", "orig", "save", "tmp"}
        or leaf.startswith("backup_")
        or leaf.endswith("_backup")
    )


@dataclass(frozen=True)
class Entry:
    raw_name: bytes
    source: Path
    is_dir: bool
    size: int
    mtime: int


def bridge_component_to_raw(value: str) -> bytes:
    result = bytearray()
    index = 0
    while index < len(value):
        codepoint = ord(value[index])
        if 0xEF80 <= codepoint <= 0xEFFF:
            result.append(codepoint & 0xFF)
            index += 1
            continue
        if (
            0xD800 <= codepoint <= 0xDBFF
            and index + 1 < len(value)
            and 0xDC00 <= ord(value[index + 1]) <= 0xDFFF
        ):
            low = ord(value[index + 1])
            combined = 0x10000 + ((codepoint - 0xD800) << 10) + (low - 0xDC00)
            result.extend(chr(combined).encode("utf-8"))
            index += 2
            continue
        result.extend(value[index].encode("utf-8", "surrogatepass"))
        index += 1
    return bytes(result)


def relative_path_to_raw(relative: Path, is_dir: bool) -> bytes:
    raw = b"/".join(bridge_component_to_raw(part) for part in relative.parts)
    if is_dir:
        raw += b"/"
    if b"\0" in raw or raw.startswith(b"/"):
        raise ValueError("unsafe raw archive path: " + raw.hex(" "))
    if any(part in (b"", b".", b"..") for part in raw.rstrip(b"/").split(b"/")):
        raise ValueError("unsafe archive path segment: " + raw.hex(" "))
    return raw


def collect_entries(workspace: Path, exclude_backups: bool = False) -> List[Entry]:
    entries: List[Entry] = []
    excluded_files = 0
    excluded_directories = 0
    for root_name in ROOTS:
        root = workspace / root_name
        if not root.is_dir():
            raise FileNotFoundError("missing source root: " + str(root))
        for directory, directory_names, file_names in os.walk(str(root)):
            directory_names.sort()
            file_names.sort()
            directory_path = Path(directory)
            if directory_path.is_symlink():
                raise ValueError("symlinked directory is not supported: " + str(directory_path))
            relative_directory = directory_path.relative_to(workspace)
            if exclude_backups:
                kept_directories = []
                for name in directory_names:
                    if is_backup_directory((directory_path / name).relative_to(workspace)):
                        excluded_directories += 1
                    else:
                        kept_directories.append(name)
                directory_names[:] = kept_directories
            stat_result = directory_path.stat()
            entries.append(
                Entry(
                    relative_path_to_raw(relative_directory, True),
                    directory_path,
                    True,
                    0,
                    int(stat_result.st_mtime),
                )
            )
            for file_name in file_names:
                file_path = directory_path / file_name
                if exclude_backups and is_backup_artifact(file_path.relative_to(workspace)):
                    excluded_files += 1
                    continue
                if file_path.is_symlink():
                    raise ValueError("symlinked file is not supported: " + str(file_path))
                stat_result = file_path.stat()
                if not file_path.is_file():
                    raise ValueError("unsupported filesystem entry: " + str(file_path))
                entries.append(
                    Entry(
                        relative_path_to_raw(file_path.relative_to(workspace), False),
                        file_path,
                        False,
                        stat_result.st_size,
                        int(stat_result.st_mtime),
                    )
                )

    entries.sort(key=lambda item: item.raw_name)
    seen: Dict[bytes, Entry] = {}
    folded: Dict[bytes, Entry] = {}
    for entry in entries:
        if entry.raw_name in seen:
            raise ValueError("duplicate raw archive path: " + entry.raw_name.hex(" "))
        seen[entry.raw_name] = entry
        folded_name = bytes(
            byte + 32 if 0x41 <= byte <= 0x5A else byte for byte in entry.raw_name
        )
        if folded_name in folded:
            raise ValueError(
                "ASCII-case-only archive collision: " + entry.raw_name.hex(" ")
            )
        folded[folded_name] = entry
    return entries, excluded_files, excluded_directories


def octal_field(value: int, width: int) -> bytes:
    encoded = format(value, "o").encode("ascii")
    if len(encoded) > width - 1:
        raise ValueError("numeric value does not fit in tar header")
    return b"0" * (width - 1 - len(encoded)) + encoded + b"\0"


def split_ustar_name(raw_name: bytes) -> Tuple[bytes, bytes]:
    if len(raw_name) <= 100:
        return raw_name, b""
    for split_at in range(len(raw_name) - 1, -1, -1):
        if raw_name[split_at : split_at + 1] != b"/":
            continue
        prefix = raw_name[:split_at]
        name = raw_name[split_at + 1 :]
        if len(prefix) <= 155 and len(name) <= 100 and name:
            return name, prefix
    raise ValueError(
        "path does not fit POSIX ustar name/prefix fields: " + raw_name.hex(" ")
    )


def make_header(entry: Entry) -> bytes:
    name, prefix = split_ustar_name(entry.raw_name)
    header = bytearray(BLOCK_SIZE)
    header[0 : len(name)] = name
    header[100:108] = octal_field(0o755 if entry.is_dir else 0o644, 8)
    header[108:116] = octal_field(0, 8)
    header[116:124] = octal_field(0, 8)
    header[124:136] = octal_field(entry.size, 12)
    header[136:148] = octal_field(entry.mtime, 12)
    header[148:156] = b"        "
    header[156:157] = b"5" if entry.is_dir else b"0"
    header[257:263] = b"ustar\0"
    header[263:265] = b"00"
    header[265:269] = b"root"
    header[297:301] = b"root"
    header[329:337] = octal_field(0, 8)
    header[337:345] = octal_field(0, 8)
    header[345 : 345 + len(prefix)] = prefix
    checksum = sum(header)
    header[148:156] = (format(checksum, "06o") + "\0 ").encode("ascii")
    return bytes(header)


def copy_file(source: Path, destination: BinaryIO, expected_size: int) -> str:
    digest = hashlib.sha256()
    written = 0
    with source.open("rb") as stream:
        while True:
            chunk = stream.read(1024 * 1024)
            if not chunk:
                break
            destination.write(chunk)
            digest.update(chunk)
            written += len(chunk)
    if written != expected_size:
        raise RuntimeError("source changed while packing: " + str(source))
    padding = (-written) % BLOCK_SIZE
    if padding:
        destination.write(b"\0" * padding)
    return digest.hexdigest()


def write_archive(output: Path, entries: Iterable[Entry]) -> Dict[bytes, str]:
    source_hashes: Dict[bytes, str] = {}
    temporary = output.with_name(output.name + ".tmp")
    if temporary.exists():
        temporary.unlink()
    try:
        with temporary.open("xb") as archive:
            for entry in entries:
                archive.write(make_header(entry))
                if not entry.is_dir:
                    source_hashes[entry.raw_name] = copy_file(
                        entry.source, archive, entry.size
                    )
            archive.write(b"\0" * (BLOCK_SIZE * 2))
        os.replace(str(temporary), str(output))
    except Exception:
        if temporary.exists():
            temporary.unlink()
        raise
    return source_hashes


def parse_octal(field: bytes) -> int:
    value = field.rstrip(b"\0 ").lstrip(b" ")
    return int(value or b"0", 8)


def source_sha256(entry: Entry) -> str:
    digest = hashlib.sha256()
    with entry.source.open("rb") as stream:
        while True:
            chunk = stream.read(1024 * 1024)
            if not chunk:
                break
            digest.update(chunk)
    return digest.hexdigest()


def validate_archive(
    archive_path: Path,
    entries: List[Entry],
    known_source_hashes: Optional[Dict[bytes, str]] = None,
    excluded_backup_files: int = 0,
    excluded_backup_directories: int = 0,
) -> dict:
    expected = {entry.raw_name: entry for entry in entries}
    expected_hashes = known_source_hashes or {
        entry.raw_name: source_sha256(entry) for entry in entries if not entry.is_dir
    }
    found: Dict[bytes, bool] = {}
    map20_entries = 0
    pua_map20_entries = 0
    with archive_path.open("rb") as archive:
        while True:
            header = archive.read(BLOCK_SIZE)
            if len(header) != BLOCK_SIZE:
                raise ValueError("truncated tar header")
            if header == b"\0" * BLOCK_SIZE:
                second = archive.read(BLOCK_SIZE)
                if second != b"\0" * BLOCK_SIZE:
                    raise ValueError("tar has only one zero trailer block")
                if archive.read(1):
                    raise ValueError("unexpected bytes after tar trailer")
                break

            stored_checksum = parse_octal(header[148:156])
            checksum_header = bytearray(header)
            checksum_header[148:156] = b"        "
            if sum(checksum_header) != stored_checksum:
                raise ValueError("invalid tar header checksum")

            name = header[0:100].split(b"\0", 1)[0]
            prefix = header[345:500].split(b"\0", 1)[0]
            raw_name = prefix + (b"/" if prefix else b"") + name
            if raw_name in found:
                raise ValueError("duplicate tar member: " + raw_name.hex(" "))
            found[raw_name] = True
            if raw_name.startswith(RAW_MAP20_PREFIX):
                map20_entries += 1
            if raw_name.startswith(PUA_UTF8_MAP20_PREFIX):
                pua_map20_entries += 1

            entry = expected.get(raw_name)
            if entry is None:
                raise ValueError("unexpected tar member: " + raw_name.hex(" "))
            type_flag = header[156:157]
            if entry.is_dir and type_flag != b"5":
                raise ValueError("directory has incorrect tar type")
            if not entry.is_dir and type_flag not in (b"0", b"\0"):
                raise ValueError("file has incorrect tar type")
            size = parse_octal(header[124:136])
            if size != entry.size:
                raise ValueError("tar member size mismatch: " + raw_name.hex(" "))

            remaining = size
            digest = hashlib.sha256()
            while remaining:
                chunk = archive.read(min(1024 * 1024, remaining))
                if not chunk:
                    raise ValueError("truncated tar member data")
                digest.update(chunk)
                remaining -= len(chunk)
            padding = (-size) % BLOCK_SIZE
            if padding and len(archive.read(padding)) != padding:
                raise ValueError("truncated tar member padding")
            if not entry.is_dir and digest.hexdigest() != expected_hashes[raw_name]:
                raise ValueError("content hash mismatch: " + raw_name.hex(" "))

    missing = set(expected) - set(found)
    if missing:
        raise ValueError("missing tar member: " + next(iter(missing)).hex(" "))
    if map20_entries == 0:
        raise ValueError("archive contains no raw-GBK map 20 member")
    if pua_map20_entries:
        raise ValueError("archive still contains UTF-8 encoded PUA map 20 paths")

    archive_digest = hashlib.sha256()
    with archive_path.open("rb") as stream:
        while True:
            chunk = stream.read(1024 * 1024)
            if not chunk:
                break
            archive_digest.update(chunk)
    aggregate = hashlib.sha256()
    for raw_name in sorted(expected_hashes):
        aggregate.update(raw_name)
        aggregate.update(b"\0")
        aggregate.update(bytes.fromhex(expected_hashes[raw_name]))

    return {
        "archive": str(archive_path),
        "archive_bytes": archive_path.stat().st_size,
        "archive_sha256": archive_digest.hexdigest(),
        "tree_content_sha256": aggregate.hexdigest(),
        "entries": len(entries),
        "files": sum(not entry.is_dir for entry in entries),
        "directories": sum(entry.is_dir for entry in entries),
        "content_bytes": sum(entry.size for entry in entries if not entry.is_dir),
        "max_raw_path_bytes": max(len(entry.raw_name) for entry in entries),
        "map20_raw_gbk_entries": map20_entries,
        "map20_pua_utf8_entries": pua_map20_entries,
        "excluded_backup_files": excluded_backup_files,
        "excluded_backup_directories": excluded_backup_directories,
        "raw_map20_prefix_hex": RAW_MAP20_PREFIX.hex(" "),
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    default_workspace = Path(__file__).resolve().parent.parent
    parser.add_argument("--workspace", type=Path, default=default_workspace)
    parser.add_argument("--output", type=Path, default=None)
    parser.add_argument("--validate-only", action="store_true")
    parser.add_argument(
        "--exclude-backups",
        action="store_true",
        help="omit .bak/.old/.orig/.save/.tmp/.lua__/tilde artifacts",
    )
    parser.add_argument(
        "--include-backups",
        action="store_true",
        help="include backup artifacts (default is to omit them)",
    )
    parser.add_argument("--manifest", type=Path, default=None)
    arguments = parser.parse_args()

    workspace = arguments.workspace.resolve()
    output = (arguments.output or (workspace / "CODE_CHANGE.raw.tar")).resolve()
    exclude_backups = arguments.exclude_backups or not arguments.include_backups
    entries, excluded_backup_files, excluded_backup_directories = collect_entries(
        workspace, exclude_backups=exclude_backups
    )
    source_hashes: Optional[Dict[bytes, str]] = None
    if not arguments.validate_only:
        source_hashes = write_archive(output, entries)
    elif not output.is_file():
        raise FileNotFoundError("archive does not exist: " + str(output))

    report = validate_archive(
        output,
        entries,
        source_hashes,
        excluded_backup_files=excluded_backup_files,
        excluded_backup_directories=excluded_backup_directories,
    )
    manifest = arguments.manifest
    if manifest is None:
        manifest = output.with_name(output.name + ".manifest.json")
    manifest.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n", "utf-8")
    print(json.dumps(report, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    try:
        sys.exit(main())
    except Exception as error:
        print("ERROR: " + str(error), file=sys.stderr)
        sys.exit(1)
