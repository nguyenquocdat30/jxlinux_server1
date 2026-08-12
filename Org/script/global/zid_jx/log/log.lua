

function SaveLogs(szFileName,szContents)
	local file = openfile(format("jxzid/%s.txt",szFileName), "a+");
	write(file,tostring(szContents.."\n"));
	closefile(file);
end;