@echo off
setlocal EnableExtensions DisableDelayedExpansion

cd /d "%~dp0"

set "PACKER=tools\New-LegacyByteTar.py"
set "ARCHIVE=CODE_CHANGE.tar"
set "MANIFEST=CODE_CHANGE.tar.manifest.json"

if not exist "%PACKER%" (
    echo [ERROR] Missing packer: %PACKER%
    exit /b 1
)
if not exist "script\" (
    echo [ERROR] Missing folder: script
    exit /b 1
)
if not exist "settings\" (
    echo [ERROR] Missing folder: settings
    exit /b 1
)

rem Prefer a real python.exe. Windows Store aliases and an empty py launcher
rem can exist even when they cannot run Python, so every candidate is tested.
for /f "delims=" %%P in ('where python 2^>nul') do (
    "%%P" -c "import sys; assert sys.version_info.major == 3" >nul 2>nul
    if not errorlevel 1 (
        set "PYTHON_EXE=%%P"
        goto :pack
    )
)

for /d %%D in ("%LocalAppData%\Programs\Python\Python*") do (
    if exist "%%~fD\python.exe" (
        "%%~fD\python.exe" -c "import sys; assert sys.version_info.major == 3" >nul 2>nul
        if not errorlevel 1 (
            set "PYTHON_EXE=%%~fD\python.exe"
            goto :pack
        )
    )
)

py -3 -c "import sys; assert sys.version_info.major == 3" >nul 2>nul
if not errorlevel 1 (
    set "PYTHON_EXE=py"
    set "PYTHON_ARGS=-3"
    goto :pack
)

echo [ERROR] A working Python 3 installation was not found.
echo [ERROR] Install Python 3, then run this file again.
exit /b 1

:pack
echo ============================================================
echo Packing script and settings for jxlinux...
echo Output: %CD%\%ARCHIVE%
echo ============================================================

"%PYTHON_EXE%" %PYTHON_ARGS% "%PACKER%" ^
    --workspace "%CD%" ^
    --output "%CD%\%ARCHIVE%" ^
    --exclude-backups ^
    --manifest "%CD%\%MANIFEST%"

if errorlevel 1 (
    echo.
    echo [ERROR] Packing or validation failed. Existing archive was preserved.
    exit /b 1
)

echo.
echo [OK] Archive and manifest were created and validated.
echo [OK] %CD%\%ARCHIVE%
echo [OK] %CD%\%MANIFEST%
exit /b 0
