Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\dailogsys\\dailogsay.lua");

Include("\\script\\global\\zid_jx\\lib\\config.lua");
Include("\\script\\global\\zid_jx\\tinhnang\\baicao\\head.lua");

function PaiGowPoker:DialogMain()
	if ScratchCards ~= 1 then
		return Talk(1,"","TÝnh N¨ng <color=yellow>Bµi Cµo <color>§ang T¹m §ãng Vui Lßng Quay L¹i Sau")
	end
	
	local tbPayList = self.PayList;
	local szTitle = "Mêi b¹n chän ph­¬ng thøc thanh to¸n";
	local tbOption = {};
	for i = 1, getn(tbPayList) do
		tinsert(tbOption,{format("%s",tbPayList[i].szName),self.PayConfirm,{self,i}});
	end;
		tinsert(tbOption,{"§ãng."});
	CreateNewSayEx(szTitle,tbOption);
end;

function PaiGowPoker:PayConfirm(nPay)
	local nTeamSize = GetTeamSize();
	if (nTeamSize < 2) then
		Talk(1,"","Tæ ®éi ph¶i 2 ng­êi trë lªn míi cã thÓ ®¸nh bµi cµo!");
	return end;
	
	if (IsCaptain() ~= 1) then
		Talk(1,"","§éi tr­ëng míi cã thÓ më sßng ®¸nh bµi!");
	return end;
	
	local szCaptainName = GetName();
	if (not self.Team[szCaptainName]) then
		self.Team[szCaptainName] = {};
		if (not self.Team[szCaptainName]["State"]) then
			self.Team[szCaptainName]["State"] = 0;
		end;
		if (not self.Team[szCaptainName]["Count"]) then
			self.Team[szCaptainName]["Count"] = 0;
		end;
		if (not self.Team[szCaptainName]["TimeOut"]) then
			self.Team[szCaptainName]["TimeOut"] = 0;
		end;
	end;
	
	if (GetTimerId() > 0) then
		Say("Ng­¬i d¹o nµy bËn rén qu¸ nhØ, nghØ ng¬i chót ®i!");
	return end;
	
	if (self.Team[szCaptainName]["State"] ~= 0) then
		Talk(1,"","Tæ ®éi cña b¹n ®ang ®¸nh bµi, vui lßng ®îi v¸n sau!");
	return end;
	
	local tbPay = self.PayList[nPay];
	local nCount = CalcEquiproomItemCount(tbPay.tbProp[1],tbPay.tbProp[2],tbPay.tbProp[3],tbPay.tbProp[4]);
	if (nCount <= 0) then
		Talk(1,"","B¹n kh«ng mang tiÒn, vui lßng kiÓm tra l¹i hµnh trang!");
	return end;
	
	g_AskClientNumberEx(1,nCount,"NhËp sè l­îng:",{self.EnterCount, {self,nPay}});
end;

function PaiGowPoker:EnterCount(nPay,nCount)
	local nOldPlayer = PlayerIndex;
	local nCalcItem = self:CalcItem(nPay,nCount);
	if (nCalcItem ~= 1) then
		return
	end;
	
	local tbPay = self.PayList[nPay];
	local szCaptainName = GetName();
	self:AddTotalMember(nPay,nCount,szCaptainName);
	self.Team[szCaptainName]["TimeOut"] = GetCurServerTime()+PGP_TIMER_INVITE;
	self.Team[szCaptainName]["Mem"] = GetTeamSize();
	self.Team[szCaptainName]["Count"] = nCount;
	self.Team[szCaptainName]["State"] = 1;
	local nTeamSize = GetTeamSize();
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
			if (PlayerIndex ~= nOldPlayer) then
				local szTitle = format("Ng­êi ch¬i %s mêi b¹n tham gia v¸n bµi cµo nµy %d %s, b¹n cã muèn tham gia kh«ng?",szCaptainName,nCount,tbPay.szName);
				local tbOption = {szTitle};
					tinsert(tbOption,format("§ång ý!/#PaiGowPoker:Accept(%d,%d,[[%s]])",nPay,nCount,szCaptainName));
					tinsert(tbOption,format("Tõ chèi./#PaiGowPoker:Deny(%d,%d,[[%s]],%d)",nPay,nCount,szCaptainName,0));
				CreateTaskSay(tbOption);
			else
				self.Player[szCaptainName] = {szCaptain=self.Player[szCaptainName].szCaptain,szName=self.Player[szCaptainName].szName,nPlayerIndex=self.Player[szCaptainName].nPlayerIndex,nPay=self.Player[szCaptainName].nPay,nCount=self.Player[szCaptainName].nCount,nState=1,nPoker=self.Player[szCaptainName].nPoker};
			end;
			SetTimer(5,PGP_TIMER_ID);
	end;
	PlayerIndex = nOldPlayer;
end;

function PaiGowPoker:Accept(nPay,nCount,szCaptainName)
	local nCalcItem = self:CalcItem(nPay,nCount);
	if (nCalcItem ~= 1) then
		return
	end;
	
	local szMemberName = GetName();
	local nCurTime = GetCurServerTime();
	local nTimeOut = self.Team[szCaptainName]["TimeOut"];
	if (nTimeOut < nCurTime) then
		Talk(1,"","Thao t¸c nµy hÕt hiÖu lùc!");
	return end;
	
	self.Player[szMemberName] = {szCaptain=self.Player[szMemberName].szCaptain,szName=self.Player[szMemberName].szName,nPlayerIndex=self.Player[szMemberName].nPlayerIndex,nPay=self.Player[szMemberName].nPay,nCount=self.Player[szMemberName].nCount,nState=1,nPoker=self.Player[szMemberName].nPoker};
	Msg2Team(format("%s ®ång ý tham gia ®¸nh bµi!",szMemberName));
	
	local nAccept = self:CheckAccept(szCaptainName);
	if (nAccept == 1) then
		self:StartGame(nPay,nCount,szCaptainName);
	end;
end;

function PaiGowPoker:StartGame(nPay,nCount,szCaptainName)
	local nOldPlayer = PlayerIndex;
	local nCalcItem = self:CalcItem(nPay,nCount);
	if (nCalcItem ~= 1) then
		return
	end;
	self:StopTimerTeam(szCaptainName);
	self:Consume(nPay,nCount,szCaptainName);
	self:ResultGame(nPay,nCount,szCaptainName);
end;

function PaiGowPoker:ResultGame(nPay,nCount,szCaptainName)
	local nOldPlayer = PlayerIndex
	self:UpdateTeam(szCaptainName);
	
	local tbPokerTeam = self:GetPokerTeam(szCaptainName);
	if (getn(tbPokerTeam) == 0) then
		return
	end;
	local tbDuplTemp = {};
	tbDuplTemp[tbPokerTeam[1].nPoker] = {};
	local tbPlayerin = {};
	local tbPlayerout = {};
	local nFail = 0;
	for i = 1, getn(tbPokerTeam) do
		if (tbDuplTemp[tbPokerTeam[i].nPoker]) then
			tinsert(tbPlayerin,tbPokerTeam[i]);
		else
			nFail = nFail + tbPokerTeam[i].nCount;
			tinsert(tbPlayerout,tbPokerTeam[i]);
		end;
	end;
	
	local tbPay = self.PayList[nPay];
	local szTitle = "KÕt qu¶ bµi cµo ®ît nµy lµ:";
	for i = 1, getn(tbPokerTeam) do
		szTitle = szTitle..format("\n+ %s: %s",tbPokerTeam[i].szName,self:GetPoker(tbPokerTeam[i].nPoker));
	end;
	
	if (nFail > 0) then
		local nAward = floor(nFail/getn(tbPlayerin));
		for i = 1, getn(tbPlayerin) do
			local nPlayerIndex = SearchPlayer(tbPlayerin[i].szName);
			if (nPlayerIndex > 0) then
				PlayerIndex = nPlayerIndex;
					Say(szTitle);
					tbAwardTemplet:GiveAwardByList({szName=tbPay.szName,tbProp=tbPay.tbProp,nCount=nAward+tbPlayerin[i].nCount},"Award PaiGowPoker");
					Msg2SubWorld(format("Chóc mõng %s may m¾n më ra %s th¾ng %d %s!",GetName(),self:GetPoker(tbPlayerin[i].nPoker),nAward+tbPlayerin[i].nCount,tbPay.szName));
					self:LogPlayer("tnllogs/Logs_BaiCao.log",format("[%s] Player %s (%s) më ra %s, kÕt qu¶ th¾ng nhËn ®­îc %d %s!",date("%d-%m-%Y %H:%M:%S"),GetName(),GetAccount(),self:GetPoker(tbPlayerin[i].nPoker),nAward+tbPlayerin[i].nCount,tbPay.szName));
					SaveNow();
				PlayerIndex = nOldPlayer;
			end;
		end;
		for i = 1, getn(tbPlayerout) do
			local nPlayerIndex = SearchPlayer(tbPlayerout[i].szName);
			if (nPlayerIndex > 0) then
				PlayerIndex = nPlayerIndex;
					Say(szTitle);
					self:LogPlayer("tnllogs/Logs_BaiCao.log",format("[%s] Player %s (%s) më ra %s, kÕt qu¶ thua khÊu trõ %d %s!",date("%d-%m-%Y %H:%M:%S"),GetName(),GetAccount(),self:GetPoker(tbPlayerout[i].nPoker),tbPlayerout[i].nCount,tbPay.szName));
					SaveNow();
				PlayerIndex = nOldPlayer;
			end;
		end;
	else
		for i = 1, getn(tbPlayerin) do
			local nPlayerIndex = SearchPlayer(tbPlayerin[i].szName);
			if (nPlayerIndex > 0) then
				PlayerIndex = nPlayerIndex;
					Say(szTitle);
					tbAwardTemplet:GiveAwardByList({szName=tbPay.szName,tbProp=tbPay.tbProp,nCount=tbPlayerin[i].nCount},"Award PaiGowPoker");
					Msg2SubWorld(format("Chóc mõng %s may m¾n më ra %s hßa %d %s!",GetName(),self:GetPoker(tbPlayerin[i].nPoker),tbPlayerin[i].nCount,tbPay.szName));
					self:LogPlayer("tnllogs/Logs_BaiCao.log",format("[%s] Player %s (%s) më ra %s, kÕt qu¶ hßa nhËn ®­îc %d %s!",date("%d-%m-%Y %H:%M:%S"),GetName(),GetAccount(),self:GetPoker(tbPlayerin[i].nPoker),tbPlayerin[i].nCount,tbPay.szName));
					SaveNow();
				PlayerIndex = nOldPlayer;
			end;
		end;
		for i = 1, getn(tbPlayerout) do
			local nPlayerIndex = SearchPlayer(tbPlayerout[i].szName);
			if (nPlayerIndex > 0) then
				PlayerIndex = nPlayerIndex;
					Say(szTitle);
					self:LogPlayer("tnllogs/Logs_BaiCao.log",format("[%s] Player %s (%s) më ra %s, kÕt qu¶ thua khÊu trõ %d %s!",date("%d-%m-%Y %H:%M:%S"),GetName(),GetAccount(),self:GetPoker(tbPlayerout[i].nPoker),tbPlayerout[i].nCount,tbPay.szName));
					SaveNow();
				PlayerIndex = nOldPlayer;
			end;
		end;
	end;
	
	for i = 1, getn(tbPokerTeam) do
		self.Player[tbPokerTeam[i].szName] = nil;
	end;
	self.Team[szCaptainName]["State"] = 0;
	self.Team[szCaptainName]["Mem"] = 0;
	self.Team[szCaptainName]["Count"] = 0;
	self.Team[szCaptainName]["TimeOut"] = 0;
end;

function PaiGowPoker:Cancel(szCaptainName)
	local nOldPlayer = PlayerIndex;
	local szMemberName = GetName();
	local nTeamSize = GetTeamSize();
	
	local nPlayerIndex = SearchPlayer(szCaptainName);
	if (nPlayerIndex > 0) then
		PlayerIndex = nPlayerIndex;
		LeaveTeam();
	end;
	for x,y in self.Player do
		if (y.szCaptain == szCaptainName) then
			self.Player[x] = nil;
		end;
	end;
	
	PlayerIndex = nOldPlayer
	self.Team[szCaptainName]["State"] = 0;
	self.Team[szCaptainName]["Mem"] = 0;
	self.Team[szCaptainName]["Count"] = 0;
	self.Team[szCaptainName]["TimeOut"] = 0;
	print("# CANCEL")
end;

function PaiGowPoker:Deny(nPay,nCount,szCaptainName,nStep)
	local nOldPlayer = PlayerIndex;
	local szMemberName = GetName();
	local nCurTime = GetCurServerTime();
	local nTeamSize = GetTeamSize();
	if (nStep == 0) then
		local nState	= self.Team[szCaptainName]["State"];
		local nTimeOut = self.Team[szCaptainName]["TimeOut"];
		if (nTeamSize <= 0) then
			Talk(1,"","Tæ ®éi cña b¹n ®· gi¶i t¸n, h·y t×m ®éi kh¸c ®i!");
		return end;
		
		if (nTimeOut > nCurTime) then
			for i = 1, nTeamSize do
				PlayerIndex = GetTeamMember(i);
					if (PlayerIndex ~= nOldPlayer) then
						Say(format("Ng­êi ch¬i %s ®· tõ chèi tham gia v¸n nµy ®· ®­îc hñy bá!",szMemberName));
					end;
				PlayerIndex = nOldPlayer;
			end;
			self:Cancel(szCaptainName);
		else
			Say(format("Lêi mêi cña %s hÕt h¹n!",szCaptainName));
			self:Cancel(szCaptainName);
		end;
	elseif (nStep == 1) then
		for i = 1, nTeamSize do
			PlayerIndex = GetTeamMember(i);
				if (GetName() ~= szCaptainName) then
					Say(format("Lêi mêi ®¸nh bµi cµo cña %s lÇn nµy ®· hÕt hiÖu lùc!",szCaptainName));
				else
					Say("Kh«ng cã ng­êi ch¬i nµo ®ång ý tham gia!");
				end;
			PlayerIndex = nOldPlayer;
		end;
		self:Cancel(szCaptainName);
	elseif (nStep == 2) then
		for x,y in self.Player do
			if (y.szCaptain == szCaptainName) then
				local nPlayerIndex = SearchPlayer(x);
				if (self:CheckMemberTeam(x) == 1) then
					Msg2Team("V¸n bµi nµy bÞ hñy v× ®éi tr­ëng trôc xuÊt hoÆc ng­êi ch¬i ®· offline!");
					break
				end;
			end;
		end;
		self:Cancel(szCaptainName);
	end;
	
	StopTimer(PGP_TIMER_ID);
end;

function PaiGowPoker:KickMember(nPay,nCount,szCaptainName)
	local nOldPlayer = PlayerIndex;
	for x,y in self.Player do
		if (y.szCaptain == szCaptainName) then
			if (y.nState == 0) then
				local nPlayerIndex = SearchPlayer(x);
				if (nPlayerIndex > 0) then
					PlayerIndex = nPlayerIndex;
						Msg2Team(format("%s tõ chèi tham gia!",GetName()));
						Say(format("Lêi mêi cña %s hÕt hiÖu lùc",szCaptainName));
						self:Deny(nPay,nCount,szCaptainName);
					PlayerIndex = nOldPlayer;
				end;
			end;
		end;
	end;
end;

function PaiGowPoker:OnTimer()
	local nCurTime = GetCurServerTime();
	print("===============START==================")
	local szMemberName = GetName();
	if (not self.Player[szMemberName]) then
		print(szMemberName,"# 1");
		StopTimer(PGP_TIMER_ID);
	return end;
	
	local szCaptainName = self.Player[szMemberName].szCaptain;
	if (not szCaptainName) then
		print(szMemberName,"# 2");
		StopTimer(PGP_TIMER_ID);
	return end;
	
	local nTeam = GetTeam();
	if (not nTeam) then
		print(szMemberName,"# 3");
		self:Cancel(szCaptainName)
		StopTimer(PGP_TIMER_ID);
	return end;
	
	local nPay = self.Player[szMemberName].nPay;
	local nState = self.Team[szCaptainName]["State"];
	local nCount = self.Team[szCaptainName]["Count"];
	local nTimeOut = self.Team[szCaptainName]["TimeOut"];
	if (not nState) or (not nCount) or (not nTimeOut) then
		print(szMemberName,"# 4");
		StopTimer(PGP_TIMER_ID);
	return end;
	
	local nTeamSize = GetTeamSize();
	if (nTeamSize < self.Team[szCaptainName]["Mem"]) then
		print(szMemberName,"# 5",nTeamSize);
		self:Deny(nPay,nCount,szCaptainName,2);
	return end;
	
	if (nState == 1) then
		if (nTimeOut <= nCurTime) then
			local nAccept = self:CheckAccept(szCaptainName);
			if (nAccept == 1) then
				print(szMemberName,"# 6");
				self:StartGame(nPay,nCount,szCaptainName);
			else
				print(szMemberName,"# 7");
				self:Deny(nPay,nCount,szCaptainName,1);
			end;
			return
		else
			local nAccept = self:CheckAccept(szCaptainName);
			if (nAccept == 1) then
				print(szMemberName,"# 8");
				self:StartGame(nPay,nCount,szCaptainName);
			end;
			return
		end;
	end;
	print("===============END==================")
end;

function OnTimer()
	PaiGowPoker:OnTimer();
end;
