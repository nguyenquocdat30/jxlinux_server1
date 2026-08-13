Include("\\script\\global\\zid_jx\\tinhnang\\loidaicacuoc\\head.lua");
function OnTimer()
	local szPlayerName = GetName();
	local tbTimerBet = BattleChallenge.TimerBet[szPlayerName];
		if (not tbTimerBet) or (not tbTimerBet.nTimer) or (not tbTimerBet.szCaptain)then
			StopTimer(MISSION_BETTIMER);
			return 
		end;
	local nTotalTimer = (-(GetCurServerTime()-(tbTimerBet.nTimer)));
	local tbInviteBet = BattleChallenge.InviteBet[tbTimerBet.szCaptain];
		if (nTotalTimer >= 0) and (nTotalTimer <= 60) then 
			if (tbInviteBet.nAccept == 1) then
				StopTimer(MISSION_BETTIMER);
			end;
			if (tbInviteBet.nDeny == 1) then
				BattleChallenge:DenyBet();
				StopTimer(MISSION_BETTIMER);
			end;
		end;
		if (nTotalTimer < 0) then 
			BattleChallenge:DenyBet();
			StopTimer(MISSION_BETTIMER);
		end;
end;
