
Include("\\script\\lib\\common.lua");

File = {};

function File:Load(szPatch,szFile)
	if (not szPatch) or (not szFile) then
		return error("# szPatch or szFile invalid!!!");
	end;
	local tbTemp = {};
	local tbList = tbVngLib_File:TableFromFile(szPatch,szFile,{"*l"});
	if (not tbList) then return tbTemp end;
	if (getn(tbList) > 0) then
		for i = 1, getn(tbList) do
			local tbData = split(tbList[i][1],"	");
			tinsert(tbTemp,tbData);
		end;
	end;
	return tbTemp;
end;

function File:Save(szPatch,szFile,tbTemp)
	if (not szPatch) or (not szFile) or (not tbTemp) then
		return nil;
	end;
	tbVngLib_File:Table2File(szPatch,szFile,"w",tbTemp);
end;


function File:Create(szPatch)
	if (not szPatch) then return nil end;
	local find = strfind(szPatch,"/");
	if (find) then
		local repstr = replace(szPatch,"/","\\\\");
		return File_Create(format("\\\\%s",repstr));
	else
		return File_Create(szPatch);
	end;
return nil; end;

function File:LoadLine(szPatch)
	if (not szPatch) then return nil end;
	local handle = openfile(szPatch,"r");
	if (not handle) then
		self:Create(szPatch);
		handle = openfile(szPatch,"r");
	end;
	local tbTemp = {};
	while (tbTemp) do
		local str = read(handle,"*l");
		if (str) then
			tinsert(tbTemp,str);
		else
			break;
		end;
	end;
	closefile(handle);
	return tbTemp;
end;

function File:LoadTable(szPatch)
	if (not szPatch) then return nil end;
	local handle = openfile(szPatch,"r");
	if (not handle) then
		self:Create(szPatch);
		handle = openfile(szPatch,"r");
	end;
	local tbTemp = {};
	while (tbTemp) do
		local str = read(handle,"*l");
		if (str) then
			local tbCol = split(str,"	");
			tinsert(tbTemp,tbCol);
		else
			break;
		end;
	end;
	closefile(handle);
	return tbTemp;
end;

function File:SaveLine(szPatch,tbData)
	if (not szPatch) then return end;
	local handle = openfile(szPatch,"w");
	if (not handle) then
		self:Create(szPatch);
		handle = openfile(szPatch,"w");
	end;
	
	if (type(tbData[1]) == "table") then
		print(format("[ERROR] File:SaveLine: Data in file [%s] is a table!",szPatch));
		return
	end;
	
	for i = 1, getn(tbData) do
		write(handle,tbData[i],"\n");
	end;
	closefile(handle);
end;

function File:SaveTable(szPatch,tbData)
	if (not szPatch) then return end;
	local handle = openfile(szPatch,"w");
	if (not handle) then
		self:Create(szPatch);
		handle = openfile(szPatch,"w");
	end;
	
	if (type(tbData[1]) ~= "table") then
		print(format("[ERROR] File:SaveTable: Data param [1] in file [%s] isn't a table!",szPatch));
		return
	elseif (type(tbData[1][1]) == "table") then
		print(format("[ERROR] File:SaveTable: Data param [1][1] in file [%s] is a table!",szPatch));
		return
	end;
	
	for i = 1, getn(tbData) do
		local strParam = "";
		for k = 1, getn(tbData[i]) do
			if (k == getn(tbData[i])) then
				strParam = strParam..format("%s",tbData[i][k]);
			else
				strParam = strParam..format("%s\t",tbData[i][k]);
			end;
		end;
		write(handle,strParam,"\n");
	end;
	closefile(handle);
end;