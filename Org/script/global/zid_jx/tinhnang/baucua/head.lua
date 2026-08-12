Include("\\script\\vng_lib\\files_lib.lua");

GameFeast = {};

GameFeast.fg = "jxzid/baucua/";
GameFeast.fb = "bet.txt";
GameFeast.tlb = {"ACCOUNT","NAME","CASH","COIN","KNB"};
GameFeast.faw = "award.txt";
GameFeast.tlaw = {"ACCOUNT","NAME","TYPE","ANIMAL","COUNT","BET","AWARD","LASTTIME"};
GameFeast.fl = "log.txt";

GameFeast.st = 0;
GameFeast.mid = 53;
GameFeast.mp = 10;
GameFeast.mc = 3;

GameFeast.tb =  2*60*18;
GameFeast.trs = 10*18;

GameFeast.srs = {};

GameFeast.lts = {
	{0000,0100},
	{0100,0200},
	{0200,0300},
	{0300,0400},
	{0400,0500},
	{0500,0600},
	{0600,0700},
	{0700,0800},
	{0800,0900},
	{0900,1000},
	{1000,1100},
	{1100,1200},
	{1200,1300},
	{1300,1400},
	{1400,1500},
	{1500,1600},
	{1600,1700},
	{1700,1800},
	{1800,1900},
	{1900,2000},
	{2000,2100},
	{2100,2200},
	{2200,2300},
};

GameFeast.pl = {
	{tp="TiÒn §ång", nValue=2, szValue="xu"},
};

GameFeast.anml = {
	{tp="BÇu", nValue=2},
	{tp="Cua", nValue=5},
	{tp="T«m", nValue=6},
	{tp="C¸", nValue=4},
	{tp="Gµ", nValue=3},
	{tp="Nai", nValue=1},
};

function GameFeast:CheckTime()
	local tmn = tonumber(date("%H%M"));
	for i = 1, getn(self.lts) do
		if (self.lts[i][1] >= tmn) and (tmn < self.lts[i][2]) then
			return 1;
		end;
	end;
	return 0;
end;

function GameFeast:GetHistoryAward()
	local np = GetName();
	local tbawl = GameFeast:TableFromFile(self.fg,self.faw,{"*l"});
	if (not tbawl) then
		print("Khong tim thay file hoac khong co du lieu!");
	return (0) end;
	local tbawpl = {};
	local sawpl = "";
	for i = 1, getn(tbawl) do
		if (tbawl[i][2] == np) then
			local sp, spv = self:GetPay(tbawl[i][3]);
			sawpl = sawpl..format("\n<color=green>[%s]<color> ¡n <color=yellow>x%s %s<color> (c­îc %s) ®­îc <color=yellow>%d %s<color>",tbawl[i][8],tbawl[i][5],tbawl[i][4],tbawl[i][6],tbawl[i][7],spv);
			tinsert(tbawpl,tbawl[i]);
		end;
	end;
	return sawpl,tbawpl;
end;

function GameFeast:Result()
	local tbrs = self:GetResultAnimal();
	Msg2SubWorld(format("<color=green>KÕt qu¶ BÇu Cua ®ît nµy lµ:\n<pic=120>\t<color=yellow>%s<color><pic>\n<pic=120>\t<color=yellow>%s<color><pic>\n<pic=120>\t<color=yellow>%s<color><pic><color>",self:GetAnimal(tbrs[1]),self:GetAnimal(tbrs[2]),self:GetAnimal(tbrs[3])));
	self:GetListPlayerWin(tbrs);
	if (getn(self.srs) == 3) then
		self.srs = {};
	end;
end;

function GameFeast:GetListPlayerWin(tbrs)
	local tbtrs = {};
	for i = 1, getn(tbrs) do
		if (not tbtrs[tbrs[i]]) then
			tbtrs[tbrs[i]] = 0;
		end;
		tbtrs[tbrs[i]] = tbtrs[tbrs[i]]+1;
	end;
	
	local tbpb = GameFeast:TableFromFile(self.fg,self.fb,{"*l"});
	local tbtaw = {};
	tinsert(tbtaw, self.tlaw);
	
	local tbpaw = GameFeast:TableFromFile(self.fg,self.faw, {"*l"});
	for i = 1, getn(tbpaw) do
		tinsert(tbtaw,tbpaw[i]);
	end;
	
	for k = 1, 3 do
		for i = 1, getn(tbpb) do
			local tbanml = split(tbpb[i][2+k],"|");
			if (tbanml ~= "") then			
				for m = 1, getn(tbanml) do
					local tban = split(tbanml[m],"=");
					local anm = self:GetAnimal(tban[1]);
					if (tbtrs[anm]) then
						local canm = tban[2]*(tbtrs[anm]+1);
						local sp, spv = self:GetPay(k);
						tinsert(tbtaw, {tbpb[i][1],tbpb[i][2],k,tban[1],tbtrs[anm],tban[2],canm,date("%Y-%m-%d %H:%M:%S")});
						Msg2SubWorld(format("<color=green>%s th¾ng BÇu Cua ¨n ®­îc %d %s <pic=120><pic><color>",tbpb[i][2],canm,spv));
					end;
				end;
			end;
		end;	
	end;
	
	local tbtb = {};
	tinsert(tbtb, self.tlb);
	tbVngLib_File:Table2File(self.fg,self.fb,"w",tbtb);
	tbVngLib_File:Table2File(self.fg,self.faw, "w",tbtaw);
end;

function GameFeast:GetResultAnimal()
	local tbrs = {};
	for i = 1, 3 do
		local rs = 0;
		local tt = 10000000;
		local cr = random(tt,(tt*6)+tt);
		local rs = floor(cr/tt);
		if (rs < 1) then
			rs = 1;
		elseif (rs > 6) then
			rs = 6;
		end;
		tbrs[i] = rs;
	end;
	if (getn(self.srs) == 3) then
		for i = 1, getn(self.srs) do
			tbrs[i] = self.srs[i];
		end;
	end;
	return tbrs;
end;

function GameFeast:Pay(pnu,mc)
	if (pnu == 1) then
		Pay(mc*10000);
		return 1;
	elseif (pnu == 2) then
		local nValue = ConsumeEquiproomItem(mc,4,417,1,-1);
		return nValue;
	elseif (pnu == 3) then
		local nValue = ConsumeEquiproomItem(mc,4,343,1,-1);
		return nValue;
	end;
	return 0;
end;

function GameFeast:GetLoop(pnu,anm)
	local tbpb = GameFeast:TableFromFile(self.fg,self.fb,{"*l"});
	local tbtd = {};
	for i = 1, getn(tbpb) do
		if (not tbtd[tbpb[i][2]]) then
			tbtd[tbpb[i][2]] = tbpb[i];
		end;
	end;
	local np = GetName();
	if (tbtd[np]) then
		local tbanmh = split(tbtd[np][2+pnu],"|");
		for i = 1, getn(tbanmh) do
			local tbanmp = split(tbanmh[i],"=");
			local canm = self:GetAnimal(tbanmp[1]);
			if (canm == anm) then
				return 1;
			end;
		end;
	end;
	return 0;
end;

function GameFeast:TableFromFile(pa,fi,pr)
	local tbt = {};
	local tbl = tbVngLib_File:TableFromFile(pa,fi,pr);
	if (not tbl) then return tbt end;
	if (getn(tbl) > 0) then
		for i = 1, getn(tbl) do
			local tbData = split(tbl[i][1],"	");
			tinsert(tbt,tbData);
		end;
	end;
	return tbt;
end;

function GameFeast:GetCount(pnu)
	local canm = 0;
	local tbpb = GameFeast:TableFromFile(self.fg,self.fb,{"*l"});
	local tbtd = {};
	for i = 1, getn(tbpb) do
		if (not tbtd[tbpb[i][2]]) then
			tbtd[tbpb[i][2]] = tbpb[i];
		end;
	end;
	local np = GetName();
	if (tbtd[np]) then
		local tbanmh = split(tbtd[np][2+pnu],"|");
		for i = 1, getn(tbanmh) do
			canm = canm + 1;
		end;
	end;
	return canm;
end;

function GameFeast:GetHistory(pnu)
	local tbpb = GameFeast:TableFromFile(self.fg,self.fb,{"*l"});
	local tbtd = {};
	for i = 1, getn(tbpb) do
		if (not tbtd[tbpb[i][2]]) then
			tbtd[tbpb[i][2]] = tbpb[i];
		end;
	end;
	local np = GetName();
	local anmhst = "";
	if (tbtd[np]) then
		local tbanmh = split(tbtd[np][2+pnu],"|");
		for i = 1, getn(tbanmh) do
			local tbanmp = split(tbanmh[i],"=");
			if (tbanmp[1] ~= "") then
				local sp, spv = self:GetPay(pnu);
				anmhst = anmhst..format("\n<#>   + %s: <color=green>%d %s<color>",tbanmp[1],tbanmp[2],spv);
			end;
		end;
	end;
	return anmhst;
end;

function GameFeast:AddAnimal(pnu,anm,canm)
	local tbpb = GameFeast:TableFromFile(self.fg,self.fb, {"*l"});
	local tbtb = {};
	tinsert(tbtb,self.tlb);
	local tbtd = {};
	for i = 1, getn(tbpb) do
		if (not tbtd[tbpb[i][2]]) then
			tbtd[tbpb[i][2]] = tbpb[i];
		end;
	end;
	
	local np = GetName();
	local ac = GetAccount();
	local stram = self:GetAnimal(anm);
	
	if (not tbtd[np]) then
		local cg,cn,kb = "","","";
		if (pnu == 1) then
			cg = format("%s=%d",stram,canm);
		elseif (pnu == 2) then
			nCoin = canm;
			cn = format("%s=%d",stram,canm);
		elseif (pnu == 3) then
			kb = format("%s=%d",stram,canm);
		end;
		tbtd[np] = {ac,np,cg,cn,kb};
	else
		local prc,prcn,prkb = tbtd[np][3],tbtd[np][4],tbtd[np][5];
		local cca,ccn,ckb = "","","";
		if (pnu == 1) then
			cca = self:GetStringAnimal(prc);
			cca = cca..format("|%s=%d",stram,canm);
			
			ccn = prcn;
			ckb = prkb;
		elseif (pnu == 2) then
			
			if (prcn ~= "") then
				ccn = self:GetStringAnimal(prcn);
				ccn = ccn..format("|%s=%d",stram,canm);
			else
				ccn = ccn..format("%s=%d",stram,canm);
			end;
			
			cca = prc;
			ckb = prkb;
		elseif (pnu == 3) then
			ckb = self:GetStringAnimal(prkb);
			ckb = ckb..format("|%s=%d",stram,canm);
			
			cca = prc;
			ccn = prcn;
		end;
		tbtd[np] = {ac,np,cca,ccn,ckb};
	end;
	
	for x,y in tbtd do
		tinsert(tbtb,y);
	end;
	
	tbVngLib_File:Table2File(self.fg,self.fb,"w",tbtb);
end;

function GameFeast:GetStringAnimal(szStr)
	local tbsp = split(szStr,"|");
	local stn = "";
	for i = 1, getn(tbsp) do
		if (i == getn(tbsp)) then
			stn = stn..format("%s",tbsp[i]);
		else
			stn = stn..format("%s%s",tbsp[i],"|");
		end;
	end;
	return stn;
end;

function GameFeast:CalcPay(pnu,m)
	local canm = 0;
	if (pnu == 1) then
		canm = GetCash();
		m = m*10000;
	elseif (pnu == 2) then
		canm = CalcEquiproomItemCount(4,417,1,-1);
	elseif (pnu == 3) then
		canm = CalcEquiproomItemCount(4,343,1,-1);
	end;
	local nu = 0;
	while (1) do
		if (canm > m) then
			local cm = mod(canm,m);
			if (cm >= 0) then
				canm = canm - m;
				nu = nu + 1;
			end;
		else
			break
		end;
	end;
	return nu;
end;

function GameFeast:GetAnimal(bAnimal)
	if (tonumber(bAnimal)) then
		for i = 1, getn(self.anml) do
			if (self.anml[i].nValue == tonumber(bAnimal)) then
				return self.anml[i].tp;
			end;
		end;
		return "";
	else
		for i = 1, getn(self.anml) do
			if (self.anml[i].tp == bAnimal) then
				return self.anml[i].nValue;
			end;
		end;
		return 0;
	end;
end;

function GameFeast:GetPay(pb)
	if (tonumber(pb)) then
		for i = 1, getn(self.pl) do
			if (self.pl[i].nValue == tonumber(pb)) then
				return self.pl[i].tp, self.pl[i].szValue;
			end;
		end;
		return "";
	else
		for i = 1, getn(self.pl) do
			if (self.pl[i].tp == pb) then
				return self.pl[i].nValue,self.pl[i].szValue;
			end;
		end;
		return 0;
	end;
end;

function GameFeast:CheckPay(pnu,mc)
	local canm = 0;
	if (pnu == 1) then
		canm = GetCash();
		mc = mc*10000;
	elseif (pnu == 2) then
		canm = CalcEquiproomItemCount(4,417,1,-1);
	elseif (pnu == 3) then
		canm = CalcEquiproomItemCount(4,343,1,-1);
	end;
	if (canm < mc) then
		return 0;
	end;
	return 1;
end;

function GameFeast:CheckEven(mc)
	if (mod(mc,self.mp) == 0) then
		return 1;
	end;
	return 0;
end;

function GameFeast:FileSystem_LoadFile(szLinkFile)
	File_Create(szLinkFile)
	return IniFile_Load(szLinkFile, szLinkFile)
end

function GameFeast:FileSystem_SaveData(szLinkFile)
	IniFile_Save(szLinkFile, szLinkFile)
end

-- LÊy d÷ liÖu
--		+ szLinkFile: ®­êng dÉn file d¹ng "\\data\\log.txt"
--		+ szSection: "SECTION"
--		+ szKey: Tõ khãa cÇn load
function GameFeast:FileSystem_GetData(szLinkFile, szSection, szKey)
	return IniFile_GetData(szLinkFile, szSection, szKey)
end



function GameFeast:LogPlayer(szFileName,szContents)
	local file = openfile(format("jxzid/baucua/%s.txt",szFileName), "a+");
	write(file,tostring(szContents.."\n"));
	closefile(file);
end


