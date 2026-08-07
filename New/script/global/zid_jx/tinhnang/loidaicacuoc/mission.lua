Include("\\script\\global\\zid_jx\\tinhnang\\loidaicacuoc\\head.lua");
function InitMission() 
	for i = 1, 40 do 
		if (GetMissionV(i) ~= 0) then
			SetMissionV(i,0);
		end;
		if (GetMissionS(i) ~= "") then
			SetMissionS(i,"");
		end;
	end;
	local tbCaptainName = BattleChallenge:GetCaptain();
	Msg2MSAll(MISSION_ID, format("Thêi gian b¾t ®Çu thi ®Êu cßn l¹i <color=yellow>%d phót<color> n÷a.",floor((TIMER_SIGNUP/18)/60)));
	SetMissionV(MISS_V_STATE,1);
	StartMissionTimer(MISSION_ID, MISSION_SMALLTIMER,TIMER_NOTICE);
	StartMissionTimer(MISSION_ID, MISSION_TOTALTIMER,TIMER_TOTALMATCH);
end;

function RunMission()
	BattleChallenge:Group2Fight(1);
	BattleChallenge:Group2Fight(2);
	Msg2MSAll(MISSION_ID, "<color=green>H·y thËt cÈn träng trong lóc thi ®Êu nhÐ!");
	SetMissionV(MISS_V_STATE,2);
end;

function EndMission()
	for i = 1, 40 do
		if (GetMissionV(i) ~= 0) then
			SetMissionV(i,0);
		end;
		if (GetMissionS(i) ~= "") then 
			SetMissionS(i,"");
		end;
	end;
	
	BattleChallenge:GameOver();
	StopMissionTimer(MISSION_ID, MISSION_SMALLTIMER);
	StopMissionTimer(MISSION_ID, MISSION_TOTALTIMER);
	DamagePlayer:ClearStat();
	BattleChallenge.InvitePlayer = {};
	BattleChallenge.TimerWait = {};
	BattleChallenge.InviteBet = {};
	BattleChallenge.TimerBet = {};
	BattleChallenge.PlayerBG = {};
	local nWorld = SubWorldIdx2ID(SubWorld);
	ClearMapNpc(nWorld);
end;

function OnLeave(RoleIndex)
	PlayerIndex = RoleIndex;
	BattleChallenge:LeaveGame();
	local nWorld = GetTask(TASK_SIGNUP_WORLD);
	local nPosX = GetTask(TASK_SIGNUP_POSX);
	local nPosY = GetTask(TASK_SIGNUP_POSY);
	NewWorld(nWorld,nPosX,nPosY);
end;
