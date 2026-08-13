-- O¼n tï x× - Author by AloneScript

Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\lib\\awardtemplet.lua");

Include("\\script\\global\\zid_jx\\lib\\config.lua");
Include("\\script\\global\\zid_jx\\tinhnang\\oantuty\\head.lua");

function RockPaperScissors:DialogMain()
	if (RockPaperScissors_Quest ~= 1) then
		return Talk(1,"","TÝnh N¨ng<color=yellow> O¼n Tï T×<color> §ang §­îc T¹m §ãng Vui Lßng Quay L¹i Sau")
	end
	
	local szTitle = "Mêi b¹n chän cæng thanh to¸n:";
	local tbOption = {};
	local tbPayList = self.PayList;
	for i = 1, getn(tbPayList) do
		tinsert(tbOption,{format("%s",tbPayList[i].szName),self.PayConfirm,{self,i}});
	end;
		tinsert(tbOption,{"§ãng."});
	CreateNewSayEx(szTitle,tbOption);
end;

function RockPaperScissors:PayConfirm(nKind)
	-- Yªu cÇu tæ ®éi ph¶i ®óng 2 ng­êi míi cã thÓ khëi ®éng trß ch¬i
	local nTeamSize = GetTeamSize();
	if (nTeamSize ~= 2) then
		Talk(1,"","Yªu cÇu tæ ®éi 2 ng­êi míi ch¬i ®­îc O¼n Tï T×!");
	return end;
	
	-- KiÓm tra ng­êi ch¬i cã ph¶i lµ ®æi tr­ëng hay kh«ng, nÕu kh«ng ph¶i ®éi tr­ëng th× kh«ng cho b¾t ®Çu trß ch¬i
	local nCaptain = IsCaptain();
	if (nCaptain ~= 1) then
		Talk(1,"","ChØ cã ®éi tr­ëng míi cã thÓ b¾t ®Çu trß ch¬i O¼n Tï T×!");
	return end;
	
	-- KiÓm tra ng­êi ch¬i cã mang theo tiÒn hay kh«ng
	local tbPay = self.PayList[nKind];
	local nCount = CalcEquiproomItemCount(tbPay.tbProp[1],tbPay.tbProp[2],tbPay.tbProp[3],tbPay.tbProp[4]);
	if (nCount <= 0) then
		Talk(1,"","B¹n kh«ng mang theo tiÒn bªn ng­êi, kh«ng thÓ ch¬i O¼n Tï T×!");
	return end;
	
	local szCaptainName = GetName();
	if (not self.TeamData[szCaptainName]) then
		self.TeamData[szCaptainName] = {};
		-- Tr¹ng th¸i / t×nh tr¹ng ®ang ch¬i cña tæ ®éi
		if (not self.TeamData[szCaptainName]["State"]) then
			self.TeamData[szCaptainName]["State"] = 0;
		end;
		
		--Thêi gian hÕt giê mçi l­ît ®¸nh cña tæ ®éi
		if (not self.TeamData[szCaptainName]["TimeOut"]) then
			self.TeamData[szCaptainName]["TimeOut"] = 0;
		end;
		
		--Sè tiÒn ®Æt ®­îc mçi lÇn cña tæ ®éi
		if (not self.TeamData[szCaptainName]["Count"]) then
			self.TeamData[szCaptainName]["Count"] = 0;
		end;
	end;
	
	if (GetTimerId() > 0) then
		Say("Ng­¬i d¹o nµy bËn rén qu¸ nhØ, nghØ ng¬i chót ®i!");
	return end;
	
	-- NÕu gi¸ trÞ cña tr¹ng th¸i / t×nh trang trß ch¬i kh¸c 0 th× kh«ng cho thùc thi tiÕp
	if (self.TeamData[szCaptainName]["State"] ~= 0) then
		Talk(1,"","Tæ ®éi cña b¹n ®ang trong lóc O¼n Tï T×, kh«ng thÓ tham gia ngay b©y giê ®­îc!");
	return end;
	
	g_AskClientNumberEx(1,nCount,"NhËp sè l­îng:",{self.EnterCount,{self,nKind}});
end;

function RockPaperScissors:EnterCount(nKind,nCount)
	local nOldPlayer = PlayerIndex;
	local tbPay = self.PayList[nKind];
	
	local nCheckCount = self:CheckCountTotalMember(nKind,nCount);
	if (nCheckCount ~= 2) then
		return
	end;
	
	local szCaptainName = GetName();
	self:AddTotalMemberOfTeam(szCaptainName);
	
	local nTeamSize = GetTeamSize();
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
		self.TeamData[szCaptainName]["TimeOut"] = GetCurServerTime()+RPS_TIMER_INVITE;
		if (GetName() ~= szCaptainName) then
			local szTitle = format("Ng­êi ch¬i %s mêi b¹n ch¬i O¼n Tï T× v¸n %d %s, b¹n cã muèn tham gia kh«ng?",szCaptainName,nCount,tbPay.szName);
			local tbOption = {szTitle};
				tinsert(tbOption,format("§ång ý!/#RockPaperScissors:Accept(%d,%d,[[%s]])",nKind,nCount,szCaptainName));
				tinsert(tbOption,format("Tõ chèi./#RockPaperScissors:Deny(%d,%d,[[%s]],[[%s]])",nKind,nCount,szCaptainName,format("%s kh«ng chÊp nhËn lêi mêi, hñy v¸n nµy!",GetName())));
			CreateTaskSay(tbOption);
		end;
		SetTimer(1*18,RPS_TIMER_ID);
	end;
	PlayerIndex = nOldPlayer;
end;

-- Ng­êi ch¬i ®ång ý tham gia
function RockPaperScissors:Accept(nKind,nCount,szCaptainName)
	local nOldPlayer = PlayerIndex;

	local nCheckCount = self:CheckCountTotalMember(nKind,nCount);
	if (nCheckCount ~= 2) then
		self:Deny(nKind,nCount,szCaptainName);
		return
	end;
	self:StopTimerTeam(szCaptainName);
	self:MemberAccept(nKind,nCount,szCaptainName);
	self.TeamData[szCaptainName]["State"] = 1;
	Msg2Team(format("Ng­êi ch¬i %s ®· ®ång ý tham gia!",GetName()));
	
	local nTeamSize = GetTeamSize();
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
		self.TeamData[szCaptainName]["TimeOut"] = GetCurServerTime()+RPS_TIMER_GAME;
		local tbRPSList = self.RPSList;
		local szTitle = format("Mêi %s chän:",GetName());
		local tbOption = {szTitle};
		for i = 1, getn(tbRPSList) do
			tinsert(tbOption, format("%s/#RockPaperScissors:ChooseConfirm(%d,%d,[[%s]],%d)",tbRPSList[i],nKind,nCount,szCaptainName,i));
		end;
		CreateTaskSay(tbOption);
		SetTimer(18,RPS_TIMER_ID);
	end;
end;

function RockPaperScissors:ChooseConfirm(nKind,nCount,szCaptainName,nRPS)
	local nCheckCount = self:CheckCountTotalMember(nKind,nCount);
	if (nCheckCount ~= 2) then
		self:Deny(nKind,nCount,szCaptainName);
		return
	end;
	
	local nCurTime = GetCurServerTime();
	
	if (not self.TeamData[szCaptainName]) then
		return
	end;
	
	local nTimeOut = self.TeamData[szCaptainName]["TimeOut"];
	if (nTimeOut) and (nTimeOut < nCurTime) then
		Talk(1,"","Thêi gian ch¬i O¼n Tï T× ®· hÕt!");
		return
	end;
	
	self.PlayerData[GetName()] = {szCaptain=self.PlayerData[GetName()].szCaptain,szName=self.PlayerData[GetName()].szName,nPlayerIndex=self.PlayerData[GetName()].nPlayerIndex,nState=self.PlayerData[GetName()].nState,nKind=self.PlayerData[GetName()].nKind,nCount=self.PlayerData[GetName()].nCount,nRPS=nRPS};

	local nPlayerRPS = self:GetPlayerRPS(szCaptainName);
	if (nPlayerRPS ~= 2) then
		Msg2Player(format("§ang chê ®èi ph­¬ng ®¸nh!"));
	else
		self:ResultGame(nKind,nCount,szCaptainName);
	end;
end;

function RockPaperScissors:ResultGame(nKind,nCount,szCaptainName)
	local nOldPlayer = PlayerIndex;
	if (self:Consume(nKind,nCount,szCaptainName) == 1) then
		local tbPay = self.PayList[nKind];
		local tbRPSList = self.RPSList;
		local tbData = self:GetDataMyTeam(szCaptainName);
		local nResult,tbResult = self:GetResult(tbData);
		if (nResult == 0) then
			if (self.TeamData[szCaptainName]["State"]) and (self.TeamData[szCaptainName]["State"] == 1) then
				for i = 1, getn(tbResult) do
					local nPlayerIndex = SearchPlayer(tbResult[i].szName);
					if (nPlayerIndex > 0) then
						PlayerIndex = nPlayerIndex;
							tbAwardTemplet:GiveAwardByList({szName=tbPay.szName,tbProp=tbPay.tbProp,nCount=self.PlayerData[GetName()].nCount});
							Msg2Player(format("O¼n Tï T× hßa, b¹n nhËn l¹i %d %s",self.PlayerData[GetName()].nCount,tbPay.szName));
								self:LogPlayer("tnllogs/Logs_OanTuTi.log",format("[%s] Player %s(%s) o¼n tï t× hßa, nhËn l¹i %d %s!",date("%d-%m-%Y %H:%M:%S"),GetName(),GetAccount(),self.PlayerData[GetName()].nCount,tbPay.szName));
							SaveNow();
						PlayerIndex = nOldPlayer;
					end;
					self.PlayerData[tbResult[i].szName] = {};
				end;
				Msg2SubWorld(format("O¼n Tï T× lÇn nµy, %s ra %s vµ %s ra %s. KÕt qu¶ hßa nhau!",tbResult[1].szName,tbRPSList[tbResult[1].nRPS],tbResult[2].szName,tbRPSList[tbResult[2].nRPS]));
				self.TeamData[szCaptainName]["State"] = 0;
				self.TeamData[szCaptainName]["TimeOut"] = 0;
				self.TeamData[szCaptainName]["Count"] = 0;
			end;
		elseif (nResult == 1) then
			if (self.TeamData[szCaptainName]["State"]) and (self.TeamData[szCaptainName]["State"] == 1) then
				for i = 1, getn(tbResult) do
					local nPlayerIndex = SearchPlayer(tbResult[i].szName);
					if (nPlayerIndex > 0) then
						PlayerIndex = nPlayerIndex;
							if (tbResult[1].szName == GetName()) then
								tbAwardTemplet:GiveAwardByList({szName=tbPay.szName,tbProp=tbPay.tbProp,nCount=self.PlayerData[GetName()].nCount*2});
								Msg2Player(format("O¼n Tï T× th¾ng, b¹n nhËn ®­îc %d %s",self.PlayerData[GetName()].nCount*2,tbPay.szName));
								self:LogPlayer("tnllogs/Logs_OanTuTi.log",format("[%s] Player %s(%s) o¼n tï t× th¾ng, nhËn ®­îc %d %s!",date("%d-%m-%Y %H:%M:%S"),GetName(),GetAccount(),self.PlayerData[GetName()].nCount*2,tbPay.szName));
								SaveNow();
							else
								Msg2Player(format("O¼n Tï T× thua, b¹n bÞ mÊt %d %s",self.PlayerData[GetName()].nCount,tbPay.szName));
								self:LogPlayer("tnllogs/Logs_OanTuTi.log",format("[%s] Player %s(%s) o¼n tï t× thua, bÞ trõ %d %s!",date("%d-%m-%Y %H:%M:%S"),GetName(),GetAccount(),self.PlayerData[GetName()].nCount,tbPay.szName));

								SaveNow();
							end;
						PlayerIndex = nOldPlayer;
					end;
				end;
				Msg2SubWorld(format("O¼n Tï T× lÇn nµy, %s ra %s vµ %s ra %s. KÕt qu¶ %s th¾ng!",tbResult[1].szName,tbRPSList[tbResult[1].nRPS],tbResult[2].szName,tbRPSList[tbResult[2].nRPS],tbResult[1].szName));
				self.TeamData[szCaptainName]["State"] = 0;
				self.TeamData[szCaptainName]["TimeOut"] = 0;
				self.TeamData[szCaptainName]["Count"] = 0;
				self.PlayerData[tbResult[1].szName] = {};
				self.PlayerData[tbResult[2].szName] = {};
			end;
		end;
	else
		self:Deny(nKind,nCount,szCaptainName,"KhÊu trõ thÊt b¹i, l­ît nµy hñy bá!");
	end;
end;

function RockPaperScissors:GetResult(tbData)
	if (tbData[1].nRPS == 1) then
		if (tbData[2].nRPS == 1) then
			return 0,{tbData[1],tbData[2]};
		elseif (tbData[2].nRPS == 2) then
			return 1,{tbData[2],tbData[1]};
		elseif (tbData[2].nRPS == 3) then
			return 1,{tbData[1],tbData[2]};
		end;
	elseif (tbData[1].nRPS == 2) then
		if (tbData[2].nRPS == 1) then
			return 1,{tbData[1],tbData[2]};
		elseif (tbData[2].nRPS == 2) then
			return 0,{tbData[1],tbData[2]};
		elseif (tbData[2].nRPS == 3) then
			return 1,{tbData[2],tbData[1]};
		end;
	elseif (tbData[1].nRPS == 3) then
		if (tbData[2].nRPS == 1) then
			return 1,{tbData[2],tbData[1]};
		elseif (tbData[2].nRPS == 2) then
			return 1,{tbData[1],tbData[2]};
		elseif (tbData[2].nRPS == 3) then
			return 0,{tbData[1],tbData[2]};
		end;
	end;
end;

function RockPaperScissors:GetPlayerRPS(szCaptainName)
	local nCount = 0;
	for x,y in self.PlayerData do
		if (y.szCaptain == szCaptainName) then
			if (y.nRPS ~= 0) then
				nCount = nCount + 1;
			end;
		end;
	end;
	return nCount;
end;

function RockPaperScissors:StopTimerTeam(szCaptainName)
	local nOldPlayer = PlayerIndex;
	for x,y in self.PlayerData do
		if (y.szCaptain == szCaptainName) then
			local nPlayerIndex = SearchPlayer(x);
			if (nPlayerIndex > 0) then
				PlayerIndex = nPlayerIndex
				StopTimer(RPS_TIMER_ID);
			end;
		end;
	end;
	PlayerIndex = nOldPlayer;
end;

function RockPaperScissors:MemberAccept(nKind,nCount,szCaptainName)
	local nOldPlayer = PlayerIndex;
	for x,y in self.PlayerData do
		if (y.szCaptain == szCaptainName) then
			local nPlayerIndex = SearchPlayer(x);
			if (nPlayerIndex > 0) then
				PlayerIndex = nPlayerIndex
				self.PlayerData[GetName()] = {szCaptain=szCaptainName,szName=GetName(),nPlayerIndex=PlayerIndex,nState=1,nKind=nKind,nCount=nCount,nRPS=0};
			end;
		end;
	end;
	PlayerIndex = nOldPlayer;
end;

function RockPaperScissors:Deny(nKind,nCount,szCaptainName,szMsg)
	local nCurTime = GetCurServerTime();
	if (not self.TeamData[szCaptainName]) then
		return
	end;
	local nTimeOut = self.TeamData[szCaptainName]["TimeOut"];
	for x,y in self.PlayerData do
		if (y.szCaptain == szCaptainName) then
			self.PlayerData[x] = {};
			local nPlayerIndex = SearchPlayer(x);
			if (nPlayerIndex > 0) then
				PlayerIndex = nPlayerIndex
				if (szMsg) then
					Msg2Player(szMsg);
				end;
				if (nTimeOut <= nCurTime) then
					Say(format("Lêi mêi cña %s hÕt hiÖu lùc!",szCaptainName));
				end;
			end;
		end;
	end;
	self.TeamData[szCaptainName] = nil;
	LeaveTeam();
end;

function RockPaperScissors:Consume(nKind,nCount,szCaptainName)
	local tbPay = self.PayList[nKind];
	local nOldPlayer = PlayerIndex;
	local nConsume = 0;
	for x,y in self.PlayerData do
		if (y.szCaptain == szCaptainName) then
			local nPlayerIndex = SearchPlayer(x);
			if (nPlayerIndex > 0) then
				PlayerIndex = nPlayerIndex
				if (ConsumeEquiproomItem(nCount,tbPay.tbProp[1],tbPay.tbProp[2],tbPay.tbProp[3],tbPay.tbProp[4]) == 1) then
					nConsume = nConsume + 1;
				end;
			end;
		end;
	end;
	PlayerIndex = nOldPlayer;
	if (nConsume == 2) then
		return 1;
	else
		return 0;
	end;
end;

function RockPaperScissors:AddTotalMemberOfTeam(szCaptainName)
	local nOldPlayer = PlayerIndex;
	local nTeamSize = GetTeamSize();
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
		self.PlayerData[GetName()] = {szCaptain=szCaptainName,szName=GetName(),nPlayerIndex=PlayerIndex,nState=-1,nKind=0,nCount=0,nRPS=0};
	end;
	PlayerIndex = nOldPlayer;
end;

function RockPaperScissors:GetDataMyTeam(szCaptainName)
	local nOldPlayer = PlayerIndex;
	local nTeamSize = GetTeamSize();
	local tbMyTeam = {};
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
		if (self.PlayerData[GetName()]) then
			tinsert(tbMyTeam,self.PlayerData[GetName()])
		end;
	end;
	PlayerIndex = nOldPlayer;
	return tbMyTeam;
end;

-- KiÓm tra sè l­îng ITEM cña toµn bé ng­êi ch¬i trong tæ ®éi xem cã ®ñ so víi yªu cÇu hay kh«ng (nÕu kh«ng th× gi¸ trÞ tr¶ vÒ 0)
function RockPaperScissors:CheckCountTotalMember(nKind,nCount)
	local nOldPlayer = PlayerIndex;
	local tbPay = self.PayList[nKind];
	local nTeamSize = GetTeamSize();
	local nReturn = 0;
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
		local nCurCount = CalcEquiproomItemCount(tbPay.tbProp[1],tbPay.tbProp[2],tbPay.tbProp[3],tbPay.tbProp[4]);
		if (nCurCount < nCount) then
			Msg2Team(format("Ng­êi ch¬i %s kh«ng ®ñ %d %s ®Ó tham gia O¼n Tï T×",GetName(),nCount,tbPay.szName));
			Say(format("B¹n kh«ng ®ñ %d %s ®Ó tham gia O¼n Tï T× lÇn nµy!",nCount,tbPay.szName));
		else
			nReturn = nReturn + 1;
		end;
	end;
	PlayerIndex = nOldPlayer;
	return nReturn;
end;

function RockPaperScissors:OnTimer()
	local szMemberName = GetName();
	
	if (not self.PlayerData[szMemberName]) then
		StopTimer(RPS_TIMER_ID);
	return end;
	
	local szCaptainName = self.PlayerData[szMemberName].szCaptain;
	local nTimeNow = GetCurServerTime();
	-- NÕu kh«ng t×m thÊy d÷ liÖu cña ng­êi ch¬i kh«ng cã ®éi tr­ëng th× STOP
	if (not szCaptainName) then
		StopTimer(RPS_TIMER_ID);
	return end;
	
	local nKind = self.PlayerData[szMemberName].nKind;
	local nCount = self.PlayerData[szMemberName].nCount;
	if (not nKind) or (not nCount) then
		StopTimer(RPS_TIMER_ID);
	return end;
	
	if (not self.TeamData[szCaptainName]) then
		StopTimer(RPS_TIMER_ID);
	return end;
	
	-- NÕu tæ ®éi kh«ng ph¶i 2 ng­êi th× tù ®éng Hñy bá	
	local nState = self.TeamData[szCaptainName]["State"];
	if (not nState) then
		StopTimer(RPS_TIMER_ID);
	return end;
	
	local nTeamSize = GetTeamSize();
	if (nTeamSize ~= 2) then
		self:Deny(nKind,nCount,szCaptainName,"Hñy v¸n ch¬i lÇn nµy, ®èi ph­¬ng kh«ng ch¬i nöa!");
	return end;
	
	if (nState == 0) then
		local nTimeOut = self.TeamData[szCaptainName]["TimeOut"];
		if (not nTimeOut) then
			StopTimer(RPS_TIMER_ID);
		return end;
		
		if (nTimeOut <= nTimeNow) then
			self:Deny(nKind,nCount,szCaptainName,"Tæ ®éi cã ng­êi kh«ng chÊp nhËn lêi mêi, hñy v¸n nµy!");
		return end;
	
	elseif (nState == 1) then
		local nRPS = self.PlayerData[szMemberName].nRPS;
		if (not nRPS) then
			StopTimer(RPS_TIMER_ID);
		return end;
		
		local nTimeOut = self.TeamData[szCaptainName]["TimeOut"];
		if (not nTimeOut) then
			StopTimer(RPS_TIMER_ID);
		return end;
		
		if (nTimeOut <= nTimeNow) then
			self:Deny(nKind,nCount,szCaptainName,"Qu¸ thêi gian cho phÐp, v¸n nµy hÕt hiÖu lùc, vui lßng ch¬i l¹i v¸n kh¸c!");
		return end;
	end;
end;

function OnTimer()
	RockPaperScissors:OnTimer()
end;


function RockPaperScissors:LogPlayer(zFile,szMsg)
	local handle = openfile(zFile,"a")
	write(handle,format("%s\n",szMsg));
	closefile(handle);
end
