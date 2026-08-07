Include("\\script\\global\\zid_jx\\tinhnang\\loidaicacuoc\\head.lua");
function OnDeath(nPIdx)
	local tbCaptainName = BattleChallenge:GetCaptain();
	local nDeathIndex = PlayerIndex;
	local nKillerIndex = NpcIdx2PIdx(nPIdx);
	local szDeathPlayer = GetName();
	local nVSMission = GetMissionV(MISSION_V_VS);
	local szMsg;
	
	if (nKillerIndex > 0) then PlayerIndex = nKillerIndex;
		local nKillerGroup = GetCurCamp();
		local szKillerName = GetName();
		if (nVSMission > 1) then
			szMsg = format("Thµnh viªn <color=yellow>%s<color> cña chiÕn ®éi [%s] ®· ®¸nh b¹i thµnh viªn <color=yellow>%s<color> cña chiÕn ®éi [%s]!",szKillerName,tbCaptainName[nKillerGroup-1],szDeathPlayer,tbCaptainName[4-nKillerGroup]);
		else
			szMsg = format("Thµnh viªn <color=yellow>%s<color> ®· ®¸nh b¹i thµnh viªn <color=yellow>%s<color>!",szKillerName,szDeathPlayer);
		end
		Msg2MSAll(MISSION_ID,szMsg);
		PlayerIndex = nDeathIndex;
	end
	if (szMsg ~= nil) then
		DelMSPlayer(MISSION_ID,PlayerIndex);
	end
	BattleChallenge:CheckPlayerWinnerDeath();
end

function BattleChallenge:CheckPlayerWinnerDeath()
	local nStateMission = GetMissionV(MISS_V_STATE);
	local szNameMission = MISSION_S_BATTLENAME;
	local tbCaptainName = BattleChallenge:GetCaptain();
	local szMsg = format("KÕt qu¶ <color=yellow>%s<color> lÇn nµy lµ: ",MISSION_S_BATTLENAME);
	local nGroup1PlayerCount = GetMSPlayerCount(MISSION_ID,1);
	local nGroup2PlayerCount = GetMSPlayerCount(MISSION_ID,2);
	local nGroup1Damage = DamagePlayer:GetGroupDamage(2);
	local nGroup2Damage = DamagePlayer:GetGroupDamage(1);
	if (nStateMission ~= 2) then
		return
	end
	if (nGroup1PlayerCount <= 0) and (nGroup2PlayerCount <= 0) then 
		szMsg = format("<color=green><color=white>Hai bªn cïng rêi khái %s,<color=cyan>  ®éi %s vµ ®éi %s <color=white>®¸nh ngang tµi ngang søc!",MISSION_S_BATTLENAME,tbCaptainName[1],tbCaptainName[2]); BattleChallenge:PlayerBetWinner(0,tbCaptainName[1]); BattleChallenge:PlayerBetWinner(0,tbCaptainName[2]); 
		BattleChallenge:PlayerBetWinner(0,tbCaptainName[1]);
		BattleChallenge:PlayerBetWinner(0,tbCaptainName[2]);
	end
	if (nGroup1PlayerCount <= 0) and (nGroup2PlayerCount > 0) then 
		szMsg = format("<color=green>KÕt qu¶ l«i ®µi c¸ c­îc: <color=cyan>%s <color=white>h¹ thñ thµnh c«ng<color=cyan> %s<color=green> %s <color=white>giµnh chiÕn th¾ng cuèi cïng xin chóc mõng<pic=125>",tbCaptainName[2],tbCaptainName[1],tbCaptainName[2]); 
		BattleChallenge:PlayerBetWinner(2,tbCaptainName[2]);
	end
	if (nGroup2PlayerCount <= 0)and (nGroup1PlayerCount > 0) then 
		szMsg = format("<color=green>KÕt qu¶ l«i ®µi c¸ c­îc: <color=cyan>%s <color=white>h¹ thñ thµnh c«ng<color=cyan> %s<color=green> %s <color=white>giµnh chiÕn th¾ng cuèi cïng xin chóc mõng<pic=125>",tbCaptainName[1],tbCaptainName[2],tbCaptainName[1]); 
		BattleChallenge:PlayerBetWinner(1,tbCaptainName[1]);
	end
	BattleChallenge:AllGone(szMsg);
	AddGlobalNews(szMsg);
	AddGlobalNews(szMsg);
	return
end
