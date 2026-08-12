Include("\\script\\vng_lib\\files_lib.lua")

---------------------------------------------
tbGioiHanBonAccIP = {};
tbGioiHanBonAccIP.Patch = "data/";
tbGioiHanBonAccIP.File = "limitip.log";
tbGioiHanBonAccIP.Max = 4;
tbGioiHanBonAccIP.IP = {};
-----------------------------------------
function tbGioiHanBonAccIP:AskSetMax()
	g_AskClientStringEx("",1,256,"§Þa chØ IP",{self.EnterIP,{self}});
end;

function tbGioiHanBonAccIP:EnterIP(szIP)
	g_AskClientNumberEx(1,999,"Sè l­îng acc", {self.EnterSetMax,{self,szIP}});
end;

function tbGioiHanBonAccIP:EnterSetMax(szIP,nCount)
	local tbTemp = {};
	tinsert(tbTemp,{"IP","LIMIT"});
	local tbLoop = {};
	local tbPlayerIP = tbVngLib_File:TableFromFile(self.Patch,self.File,{"*l"});
	if (not tbPlayerIP) then tbPlayerIP = {}; end;
	for i = 1, getn(tbPlayerIP) do
		local tbParam = split(tbPlayerIP[i][1],"	");
		if (not tbLoop[tbParam[1]]) then
			tbLoop[tbParam[1]] = {tbParam[1],tonumber(tbParam[2]) or 0};
		end;
	end;
	tbLoop[szIP] = {szIP,nCount};
	
	for x,y in tbLoop do
		tinsert(tbTemp,y);
	end;
	tbVngLib_File:Table2File(self.Patch,self.File,"w",tbTemp);
	Msg2Player(format("ThiÕt lËp cho IP %s login ®­îc %d thµnh c«ng!",szIP,nCount));
end;

function tbGioiHanBonAccIP:Login()
	local nMax = self.Max;
	local szIP = self:GetIP();
	local szName = GetName();
	local tbPlayerIP = tbVngLib_File:TableFromFile(self.Patch,self.File,{"*l"});
	if (not tbPlayerIP) then tbPlayerIP = {}; end;
	local nCheckIP,nMaxIP = self:CheckIP(tbPlayerIP,szIP);
	if (nCheckIP == 1) then
		nMax = nMaxIP;
	end;
	
	if (not self.IP[szName]) then
		self.IP[szName] = {"",0};
	end;
	
	self.IP[szName] = {szIP,self:GetCount(szIP)+1};
	for x,y in self.IP do
		if (y[1] == szIP) then
			self.IP[x] = {y[1],self.IP[szName][2]};
		end;
	end;
	
	if (self.IP[szName][2] > nMax) then
		return 1;
	else
		return 0;
	end;
end;

function tbGioiHanBonAccIP:GetCount(szIP)
	local nCount = 0;
	for x,y in self.IP do
		if (y[1] == szIP) then
			nCount = nCount+1;
		end;
	end;
	return nCount;
end;

function tbGioiHanBonAccIP:Logout()
	local szName = GetName();
	if (not self.IP[szName]) then
		return
	end;
	szIP = self.IP[szName][1];
	self.IP[szName] = {"",0};
	for x,y in self.IP do
		if (y[1] == szIP) then
			self.IP[x] = {y[1],y[2]-1};
		end;
	end;
end;

function tbGioiHanBonAccIP:KickOut(nPlayerIndex)
	OfflineLive(nPlayerIndex);
	KickOutSelf();
end;

function tbGioiHanBonAccIP:CheckIP(tbPlayerIP,szIP)
	for i = 1, getn(tbPlayerIP) do
		local tbParam = split(tbPlayerIP[i][1],"	");
		if (tbParam[1] == szIP) then
			return 1,tonumber(tbParam[2]) or 0;
		end;
	end;
	return 0;
end;

function tbGioiHanBonAccIP:GetIP()
	local tbIP = split(GetIP()," :");
	return tbIP[1];
end;
