Include("\\script\\global\\zid_jx\\tinhnang\\loidaicacuoc\\damage.lua");
Include("\\script\\global\\zid_jx\\tinhnang\\loidaicacuoc\\forbid.lua");
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\global\\zid_jx\\log\\log.lua")
IncludeLib("LEAGUE")


MISSION_ID = 71;
MISSION_SMALLTIMER = 116;
MISSION_TOTALTIMER = 117;
MISSION_WAITTIMER = 118;
MISSION_BETTIMER = 119;
MISSION_S_BATTLENAME = "L«i §µi C¸ C­îc";
MISSION_S_CAPTAINNAME = {1,2};
MISS_V_STATE = 1;
MISSION_V_VS = 2;
MISSION_V_KEY = {3,4};
TIMER_FRAME2TIME = 18;
TIMER_NOTICE = 20*TIMER_FRAME2TIME;
TIMER_SIGNUP = 3*3*TIMER_NOTICE;
TIMER_MATCH = 10*3*TIMER_NOTICE;
TIMER_TOTALMATCH = TIMER_MATCH+TIMER_SIGNUP;
TIMER_INVITE = 10;
TIMER_INVITEBET = 10;
MAP_WORLD = 209;
MAP_POS = { {209, 1620, 3202}, {209, 1612, 3187}, {209, 1619,3193}, };
TASK_SIGNUP_WORLD = 300;
TASK_SIGNUP_POSX = 301;
TASK_SIGNUP_POSY = 302;
MISSION_MAXGROUP = 500;
BattleChallenge = {};
function BattleChallenge:CheckPotion() 
	for i = 0, 9 do 
		local nCount = CalcEquiproomItemCount(1,i,0,-1);
		if (nCount > 0) then
			return 1;
		end;
	end;
	return 0;
end;
 
function BattleChallenge:StatePlayer(nCamp) 
	SetTaskTemp(200,1);
	SetFightState(0);
	SetLogoutRV(1);
	SetPunish(0);
	ForbidEnmity(1);
	DisabledStall(1);
	ForbitTrade(1);
	SetCreateTeam(0);
	ForbidChangePK(1);
	DisabledUseTownP(1);
	if (nCamp == 0) then
		SetPKFlag(0);
		SetHide(1);
		Msg2Player("Tr¹ng th¸i xem thi ®Êu!");
	else SetPKFlag(2);
	end;
	SetDeathScript("\\script\\global\\zid_jx\\tinhnang\\loidaicacuoc\\playerdeath.lua");
	self:SetRev();
 
	local nWorld = GetTask(TASK_SIGNUP_WORLD);
 
	local nPosX = GetTask(TASK_SIGNUP_POSX);
 
	local nPosY = GetTask(TASK_SIGNUP_POSY);
	SetTempRevPos(nWorld,nPosX*32,nPosY*32);
end;

function BattleChallenge:SetRev() 
	local nWorld = GetTask(TASK_SIGNUP_WORLD);
	SetRevPos(nWorld,1);
end;

function BattleChallenge:OnCamp(nCamp) LeaveTeam();
	Forbid:RemoveSkillState();
	local nCurCamp = 0;
	if (nCamp == 3) then
		nCurCamp = 0;
	else
		nCurCamp = nCamp;
	end;
	AddMSPlayer(MISSION_ID,nCamp);
	SetCurCamp(nCurCamp);
	self:StatePlayer(nCurCamp);
 
	local nWorld = MAP_POS[nCamp][1];
	 
	local nPosX = MAP_POS[nCamp][2];
	 
	local nPosY = MAP_POS[nCamp][3];
	if (nCamp == 1) then
		NewWorld(nWorld,nPosX,nPosY);
		Msg2MSAll(format("§èi thñ <color=yellow>%s<color> ®· vµo l«i ®µi!",GetName()));
	elseif (nCamp == 2) then
		NewWorld(nWorld,nPosX,nPosY);
		Msg2MSAll(format("§èi thñ <color=yellow>%s<color> ®· vµo l«i ®µi!",GetName()));
	else NewWorld(nWorld,nPosX,nPosY);
		Msg2MSAll(format("Ng­êi xem <color=yellow>%s<color> ®· vµo l«i ®µi!",GetName()));
	end;
end;

function BattleChallenge:LeaveGame() 
	local nGroup = GetCurCamp();
	DamagePlayer:FetchDamageToGroup(PlayerIndex, nGroup);
	SetFightState(0) SetTaskTemp(200,0);
	SetPunish(1);
	SetPKFlag(0);
	ForbidChangePK(0);
	RestoreOwnFeature();
	DisabledStall(0);
	ForbitTrade(0);
	SetCurCamp(GetCamp());
	DisabledUseTownP(0) ForbidEnmity(0);
	DelMSPlayer(MISSION_ID, PlayerIndex);
	SetLogoutRV(0);
	SetCreateTeam(1);
	SetDeathScript("");
	ForbitStamina(0);
	SetHide(0);
	DamagePlayer:FinishPersonalStat(PlayerIndex);
end;
function BattleChallenge:GameOver() 
	local tbPlayer = {};
 
	local nIdx = 0;
 
	local i = 0;
 
	local k = 1;
	for i = 1, 500 do
		nIdx, nPIdx = GetNextPlayer(MISSION_ID, nIdx, 0);
		if (nPIdx > 0) then
			tbPlayer[k] = nPIdx;
			k = k + 1;
		end;
		if (nIdx == 0) then
			break
		end;
	end;
 
	local nCount = getn(tbPlayer);
 
	local nOldPlayer = PlayerIndex;
	for i = 1, nCount do 
		PlayerIndex = tbPlayer[i];
		DelMSPlayer(MISSION_ID, PlayerIndex);
 
		local nWorld = GetTask(TASK_SIGNUP_WORLD);
		 
		local nPosX = GetTask(TASK_SIGNUP_POSX);
		 
		local nPosY = GetTask(TASK_SIGNUP_POSY);
		NewWorld(nWorld,nPosX,nPosY);
	end;
	PlayerIndex = nOldPlayer;
end;

function BattleChallenge:Group2Fight(nGroup)
	if (nGroup < 0) then
		return 
	end;
	DamagePlayer:BeginDamage(nGroup);
 
		local nOldPlayer = PlayerIndex;
		 
		local nIdx = 0;
		 
		local nPIdx, i;
	for i = 1, 500 do
		nIdx, nPIdx = GetNextPlayer(MISSION_ID,nIdx,nGroup);
		if (nPIdx > 0) then
			PlayerIndex = nPIdx;
			SetFightState(1);
			ForbitStamina(1);
		end;
		if (nIdx == 0) then
			break 
		end;
	end;
	PlayerIndex = nOldPlayer;
end;
 
 
function BattleChallenge:AllGone(szMsg) 
	Msg2SubWorld(szMsg);
	CloseMission(MISSION_ID);
end;
 
 
function BattleChallenge:PlayerBetWinner(nResult,szCaptain) 
	local nOldPlayer = PlayerIndex;
	for x,y in self.PlayerBG do 
		if (y.szBG == szCaptain) then 
			PlayerIndex = SearchPlayer(x);
			if (nResult == -1) then 
				szNewst2=(format("<color=white>Ng­êi ch¬i <color=green>%s <color=white>bá trËn c¸ c­îc bÞ mÊt tr¾ng toµn bé xu c­îc!",GetName()));
				LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szNewst2 , "", ""); 
			elseif (nResult == 0) then 
				tbAwardTemplet:GiveAwardByList({tbProp={4,417,1,0,0,0}, nCount=y.nBG*0.95}, "Award");
				local szNewst3 =(format("<color=white>§¹i hiÖp <color>"..GetName().." <color=white>nhËn l¹i ®­îc <color=cyan>%d xu<color=white> do 2 ®éi hßa nhau.",(y.nBG*0.95))); 
				LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szNewst3 , "", ""); 
			else 
				local tb_award = {tbProp = {4,417,1,0,0,0}, szName = "TiÒn §ång",  nCount = y.nBG*2*0.95};
				tbAwardTemplet:GiveAwardByList(tb_award);
				local szNewst4 =(format("<color=white>Chóc mõng <color>"..GetName().." <color=white>®· c­îc chÝnh x¸c ng­êi th¾ng l«i ®µi.<color=red>"..GetName().." <color=white>nhËn ®­îc<color=cyan> %d xu.",tb_award.nCount)); 
				LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szNewst4 , "", ""); 
				SaveLogs("traxu_loidai", format("[%s] | Nh©n VËt "..GetName().." Th¾ng §­îc §· NhËn ®ñ TiÒn §ång",date("%H:%M:%S - %d/%m/%Y")));

			end;
		end;
	end;
	PlayerIndex = nOldPlayer;
end;
 

 
function BattleChallenge:NoticeTime(nTime) 
	local nRestMin = floor((nTime/18)/60);
 
	local nRestSec = mod(floor(nTime/18),60);
	if (nRestMin > 0) and (nRestSec == 0) then
		Msg2MSAll(MISSION_ID, format("Thêi gian thi ®Êu cßn <color=yellow>%d<color> phót!",nRestMin));
	elseif (nRestMin <= 0) and (nRestSec > 0) then
		Msg2MSAll(MISSION_ID, format("Thêi gian thi ®Êu cßn <color=yellow>%d<color> gi©y!",nRestSec));
	end;
end;

function BattleChallenge:NoticeKey() 
	local nOldPlayer = PlayerIndex;
	for i = 1, 2 do PlayerIndex = SearchPlayer(MISSION_S_CAPTAINNAME[i]);
		if (PlayerIndex > 0) then
		local nKey = GetMissionV(MISSION_V_KEY[i]);
			szMsg = format("<color=cyan>M· sè thi ®Êu lµ: %d",nKey);
			Msg2Player(szMsg);
		end;
	end;
	PlayerIndex = nOldPlayer;
end;

function BattleChallenge:GetKey() 
	local tbKey = {};
	 tbKey[1] = random(1000,9999);
	 tbKey[2] = random(1000,9999);
	 if (tbKey[1] == tbKey[2]) then
		if (tbKey[1] < 9996) then
			tbKey[2] = tbKey[1]+3;
		else 
			tbKey[2] = tbKey[1]-3;
		end;
	end;
	return tbKey;
end;

function BattleChallenge:GetCaptain() 
	local nOldWorld = SubWorld;
	local nMapIndex = MAP_WORLD;
	local nSubWorld = SubWorldID2Idx(nMapIndex);
	local tbCaptainName = {};
	if (nSubWorld == -1) then
		print("[T9-Team] Ban do khu vuc thi dau khong ton tai!");
		return tbCaptainName;
	end;
	SubWorld = nSubWorld;
	tbCaptainName[1] = GetMissionS(MISSION_S_CAPTAINNAME[1]);
	tbCaptainName[2] = GetMissionS(MISSION_S_CAPTAINNAME[2]);
	SubWorld = nOldWorld;
	return tbCaptainName;
end;

function AddNpc_LoiDai_Dialog()
BattleChallenge:AddNpcDialog()
end
function BattleChallenge:AddNpcDialog() 
	local nNpcIndex = AddNpc(1571,1,SubWorldID2Idx(78),1581*32,3204*32,0,"L«i §µi C¸ C­îc");
	SetNpcScript(nNpcIndex, "\\script\\global\\zid_jx\\tinhnang\\loidaicacuoc\\npcdialog.lua");
end;
 
function BattleChallenge:AcceptBattle() 
	local nOldWorld = SubWorld;
	local nMapIndex = MAP_WORLD;
	local nState = MISS_V_STATE;
	local nVS = MISSION_V_VS;
	SubWorld = SubWorldID2Idx(nMapIndex);
	local nStateMission = GetMissionV(MISS_V_STATE);
		if (nStateMission ~= 0) then
			return 0;
		end;
		if (GetTeamSize() ~= 2) then
			return 
		end;
 
	local nOldPlayer = PlayerIndex;
	local szPlayerName = GetName();
	local tbTimerWait = self.TimerWait[szPlayerName];
	local nAcceptInvite,nDenyInvite;
	if (tbTimerWait) then
		nAcceptInvite = self.InvitePlayer[tbTimerWait.szCaptain].nAccept;
		nDenyInvite = self.InvitePlayer[tbTimerWait.szCaptain].nDeny;
			if (nDenyInvite ~= 0) then
			Say("B¸o danh thÊt b¹i, lêi th¸ch ®Êu nµy kh«ng cßn t¸c dông!",0);
				return
			end;
			self.InvitePlayer[tbTimerWait.szCaptain].nAccept = self.InvitePlayer[tbTimerWait.szCaptain].nAccept + 1;
			nAcceptInvite = self.InvitePlayer[tbTimerWait.szCaptain].nAccept;
			nDenyInvite = self.InvitePlayer[tbTimerWait.szCaptain].nDeny;
			if (nAcceptInvite == 0) and (nDenyInvite == 0) then
				return 0;
			end;
		for i = 1, 2 do PlayerIndex = GetTeamMember(i);
			if (PlayerIndex ~= nOldPlayer) then
				if (nAcceptInvite >= 1) and (nDenyInvite == 0) then
					Msg2Player(format("<color=geen>§èi thñ <color=cyan>%s<color=white> ®· chÊp nhËn lêi th¸ch ®Êu lÇn nµy cña b¹n, h·y chuÈn bÞ cho cuéc giao ®Êu tr­íc m¾t!",GetName()));
				end;
			end;
			PlayerIndex = nOldPlayer;
		end;
	end;
	SubWorld = nOldWorld;
	return 1;
end;

function BattleChallenge:DenyBattle() 
	local nOldWorld = SubWorld;
	local nMapIndex = MAP_WORLD;
	local nState = MISS_V_STATE;
	local nVS = MISSION_V_VS;
	SubWorld = SubWorldID2Idx(nMapIndex);
	local nStateMission = GetMissionV(MISS_V_STATE);
	if (nStateMission ~= 0) then
		return 
	end;
	if (GetTeamSize() ~= 2) then
		return 
	end;
 
	local nOldPlayer = PlayerIndex;
	local szPlayerName = GetName();
	local tbTimerWait = self.TimerWait[szPlayerName];
	if (tbTimerWait) then
		self.InvitePlayer[tbTimerWait.szCaptain].nDeny = self.InvitePlayer[tbTimerWait.szCaptain].nDeny + 1;
		local nAcceptInvite = self.InvitePlayer[tbTimerWait.szCaptain].nAccept; 
		local nDenyInvite = self.InvitePlayer[tbTimerWait.szCaptain].nDeny;
		for i = 1, 2 do
			PlayerIndex = GetTeamMember(i);
			if (PlayerIndex ~= nOldPlayer) then
				if (nAcceptInvite == 0) and (nDenyInvite == 1) then
					Msg2Player(format("<color=white>§èi thñ kh«ng d¸m chÊp nhËn lêi th¸ch ®Êu lÇn nµy cña b¹n, cuéc thi ®Êu ®· ®­îc hñy bá xin h·y chän ®èi thñ xøng tÇm cho m×nh.",GetName()));
				end;
			end;
			PlayerIndex = nOldPlayer;
		end;
	end;
	SubWorld = nOldWorld;
end;

function BattleChallenge:AcceptBet() 
	local nOldWorld = SubWorld;
	local nMapIndex = MAP_WORLD;
	local nState = MISS_V_STATE;
	local nVS = MISSION_V_VS;
	SubWorld = SubWorldID2Idx(nMapIndex); 
	local nStateMission = GetMissionV(MISS_V_STATE);
	if (nStateMission ~= 1) then
		return 0;
	end;
	if (GetTeamSize() ~= 2) then
		return 
	end;
 
	local nOldPlayer = PlayerIndex;
	local szPlayerName = GetName();
	local tbTimerBet = self.TimerBet[szPlayerName];
	local nAcceptInvite,nDenyInvite;
		if (tbTimerBet) then
			nAcceptInvite = self.InviteBet[tbTimerBet.szCaptain].nAccept;
			nDenyInvite = self.InviteBet[tbTimerBet.szCaptain].nDeny;
				if (nDenyInvite ~= 0) then
					Say("§Æt c­îc thÊt b¹i, lêi mêi ®Æt c­îc nµy kh«ng cßn t¸c dông!",0);
					return 0;
				end;
			self.InviteBet[tbTimerBet.szCaptain].nAccept = self.InviteBet[tbTimerBet.szCaptain].nAccept + 1;
			nAcceptInvite = self.InviteBet[tbTimerBet.szCaptain].nAccept;
			nDenyInvite = self.InviteBet[tbTimerBet.szCaptain].nDeny;
				if (nAcceptInvite == 0) and (nDenyInvite == 0) then
					return 0;
				end;
			for i = 1, 2 do PlayerIndex = GetTeamMember(i);
				if (PlayerIndex ~= nOldPlayer) then
					if (nAcceptInvite == 1) and (nDenyInvite == 0) then
						local szNewst5=(format("Tay cê b¹c <color=cyan>%s<color> <color=white>b¾t kÌo c¸ c­îc bªn ngoµi cho trËn l«i ®µi.<pic=20>",GetName()));
						LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szNewst5 , "", "");  
					end;
				end;
				PlayerIndex = nOldPlayer;
			end;
		end;
		SubWorld = nOldWorld;
	return 1;
end;

function BattleChallenge:DenyBet() 
	local nOldWorld = SubWorld;
	local nMapIndex = MAP_WORLD;
	local nState = MISS_V_STATE;
	local nVS = MISSION_V_VS;
	SubWorld = SubWorldID2Idx(nMapIndex);
	local nStateMission = GetMissionV(MISS_V_STATE);
	if (nStateMission ~= 1) then
		return
	end;
	if (GetTeamSize() ~= 2) then
		return
	end;
 
		local nOldPlayer = PlayerIndex;
		local szPlayerName = GetName();
		local tbTimerBet = self.TimerBet[szPlayerName];
		if (tbTimerBet) then
			self.InviteBet[tbTimerBet.szCaptain].nDeny = self.InviteBet[tbTimerBet.szCaptain].nDeny + 1;
			local nAcceptInvite = self.InviteBet[tbTimerBet.szCaptain].nAccept;
			local nDenyInvite = self.InviteBet[tbTimerBet.szCaptain].nDeny;
			for i = 1, 2 do
				PlayerIndex = GetTeamMember(i);
					if (PlayerIndex ~= nOldPlayer) then
						if (nDenyInvite == 1) and (nAcceptInvite == 0) then
							local szNewst5=(format("Tay cê b¹c <color=cyan>%s<color> <color=white>chÊp nhËn kÌo c¸ c­îc bªn ngoµi cho trËn l«i ®µi.<pic=20>",GetName()));
							LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szNewst5 , "", ""); 
						end;
					end;
				self.PlayerBG[GetName()] = nil;
				PlayerIndex = nOldPlayer;
			end;
		end;
	SubWorld = nOldWorld;
end;

function BattleChallenge:Cancel()
end;

function BattleChallenge:Init() 
	self.InvitePlayer = {};
	self.TimerWait = {};
	self.InviteBet = {};
	self.TimerBet = {};
	self.PlayerBG = {};
end;

BattleChallenge:Init()