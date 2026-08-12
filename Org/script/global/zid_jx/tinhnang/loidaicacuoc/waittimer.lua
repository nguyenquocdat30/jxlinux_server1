Include("\\script\\global\\zid_jx\\tinhnang\\loidaicacuoc\\head.lua");
function OnTimer() 
	local szPlayerName = GetName();
	local tbTimerWait = BattleChallenge.TimerWait[szPlayerName];
	if (not tbTimerWait) or (not tbTimerWait.nTimer) or (not tbTimerWait.szCaptain)then
		StopTimer(MISSION_WAITTIMER);
		return
	end;
	
	local nTotalTimer = (-(GetCurServerTime()-(tbTimerWait.nTimer)));
	local tbInvitePlayer = BattleChallenge.InvitePlayer[tbTimerWait.szCaptain];
	
	if (nTotalTimer >= 0) and (nTotalTimer <= 60) then
		if (tbInvitePlayer.nAccept == 1) then
			StopTimer(MISSION_WAITTIMER);
		end;
		if (tbInvitePlayer.nDeny == 1) then BattleChallenge:DenyBattle();
			StopTimer(MISSION_WAITTIMER);
		end;
	end;
	if (nTotalTimer < 0) then BattleChallenge:DenyBattle();
		StopTimer(MISSION_WAITTIMER);
	end;
end;
