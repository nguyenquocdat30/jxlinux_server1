

PGP_TIMER_ID = 121;
PGP_TIMER_INVITE = 10;
PGP_TIMER_GAME = 10;

PaiGowPoker = {};
PaiGowPoker.Team = {};
PaiGowPoker.Player = {};

PaiGowPoker.PokerList = {
	{szName="Bï",nPoker=0},
	{szName="1 nót",nPoker=1},
	{szName="2 nót",nPoker=2},
	{szName="3 nót",nPoker=3},
	{szName="4 nót",nPoker=4},
	{szName="5 nót",nPoker=5},
	{szName="6 nót",nPoker=6},
	{szName="7 nót",nPoker=7},
	{szName="8 nót",nPoker=8},
	{szName="9 nót",nPoker=9},
	{szName="3 cµo",nPoker=10},
};

PaiGowPoker.PayList = {
	{szName="TiÒn ®ång", tbProp={4,417,1,1,0,0}},
};

function PaiGowPoker:UpdateTeam(szCaptainName)
	local nOldPlayer = PlayerIndex;
	local nPlayerIndex = SearchPlayer(szCaptainName);
	if (nPlayerIndex > 0) then
		PlayerIndex = nPlayerIndex;
			local tbDataTemp = {};
			for x, y in self.Player do
				if (y.szCaptain == szCaptainName) then
					if (self:CheckMemberTeam(x) == 0) then
						self.Player[x] = nil;
					end;
				end;
			end;
		PlayerIndex = nOldPlayer;
	end;
end;

function PaiGowPoker:CheckMemberData(szName)
	for x,y in self.Player do
		if (y.szCaptain == szCaptainName) then
			if (y.szName == szName) then
				return 1;
			end;
		end;
	end;
	return 0;
end;

function PaiGowPoker:CheckOnline(szCaptainName)
	for x,y in self.Player do
		if (y.szCaptain == szCaptainName) then
			local nPlayerIndex = SearchPlayer(x);
			if (nPlayerIndex <= 0) then
				self.Player[x] = nil;
			end;
		end;
	end;
end;

function PaiGowPoker:CalcItem(nPay,nCount)
	local nOldPlayer = PlayerIndex;
	local tbPay = self.PayList[nPay];
	local nNum = 0;
	local nTeamSize = GetTeamSize();
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
			local nCurCount = CalcEquiproomItemCount(tbPay.tbProp[1],tbPay.tbProp[2],tbPay.tbProp[3],tbPay.tbProp[4]);
			if (nCurCount >= nCount) then
				nNum = nNum+1;
			else
				Msg2Team(format("Ng­êi ch¬i %s kh«ng ®ñ %d %s ®Ó tham gia ®¸nh bµi cµo!",GetName(),nCount,tbPay.szName));
				Say(format("B¹n kh«ng cã ®ñ %d %s ®Ó tham gia v¸n bµi nµy!",nCount,tbPay.szName));
			end;
		PlayerIndex = nOldPlayer;
	end;
	if (nNum == nTeamSize) then
		return 1;
	else
		return 0;
	end;
end;

function PaiGowPoker:AddTotalMember(nPay,nCount,szCaptainName)
	local nOldPlayer = PlayerIndex;
	local nTeamSize = GetTeamSize();
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
			self.Player[GetName()] = {szCaptain=szCaptainName,szName=GetName(),nPlayerIndex=PlayerIndex,nPay=nPay,nCount=nCount,nState=0,nPoker=-1};
		PlayerIndex = nOldPlayer;
	end;
end;

function PaiGowPoker:CheckMemberTeam(szMemberName)
	local nOldPlayer = PlayerIndex;
	local nTeamSize = GetTeamSize();
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
			if (GetName() == szMemberName) then
				return 1;
			end;
		PlayerIndex = nOldPlayer;
	end;
	return 0;
end;

function PaiGowPoker:CheckDeny(szCaptainName)
	local nDeny = 0;
	local nTeamSize = GetTeamSize();
	for x,y in self.Player do
		if (y.szCaptain == szCaptainName) then
			if (y.nState == 0) and (self:CheckMemberTeam(y.szName) == 1) then
				nDeny = nDeny + 1;
			end;
		end;
	end;
	if (nDeny >= 1) then
		return 1;
	else
		return 0;
	end;
	return 0;
end;

function PaiGowPoker:CheckAccept(szCaptainName)
	local nAccept = 0;
	local nTeamSize = GetTeamSize();
	for x,y in self.Player do
		if (y.szCaptain == szCaptainName) then
			if (y.nState == 1) and (self:CheckMemberTeam(y.szName) == 1) then
				nAccept = nAccept + 1;
			end;
		end;
	end;
	if (nAccept == nTeamSize) then
		return 1;
	else
		return 0;
	end;
	return 0;
end;

function PaiGowPoker:GetPoker(nPoker)
	for i = 1, getn(self.PokerList) do
		if (self.PokerList[i].nPoker == nPoker) then
			return self.PokerList[i].szName;
		end;
	end;
	return "";
end;

function PaiGowPoker:Consume(nPay,nCount,szCaptainName)
	local nOldPlayer = PlayerIndex;
	local tbPay = self.PayList[nPay];
	for x, y in self.Player do
		if (y.szCaptain == szCaptainName) then
			local nPlayerIndex = SearchPlayer(x);
			if (nPlayerIndex > 0) then
				PlayerIndex = nPlayerIndex;
					if (ConsumeEquiproomItem(nCount,tbPay.tbProp[1],tbPay.tbProp[2],tbPay.tbProp[3],tbPay.tbProp[4]) ~= 1) then
						self:Deny(nPay,nCount,szCaptainName);
					end;
				PlayerIndex = nOldPlayer;
			end;
		end;
	end;
end;

function PaiGowPoker:StopTimerTeam(szCaptainName)
	local nOldPlayer = PlayerIndex;
	local nTeamSize = GetTeamSize()
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
			StopTimer(PGP_TIMER_ID);
		PlayerIndex = nOldPlayer;
	end;
end;

function PaiGowPoker:GetPokerTeam(szCaptainName)
	local tbTeamTemp = {}
	for x,y in self.Player do
		if (y) and (y.szCaptain == szCaptainName) then
			y.nPoker = random(0,10);
			self.Player[x] = y;
			tinsert(tbTeamTemp,self.Player[x]);
		end;
	end;
	sort(tbTeamTemp, function(a,b) return(a.nPoker > b.nPoker) end);
	return tbTeamTemp
end;

function PaiGowPoker:LogPlayer(zFile,szMsg)
	local handle = openfile(zFile,"a")
	write(handle,format("%s\n",szMsg));
	closefile(handle);
end