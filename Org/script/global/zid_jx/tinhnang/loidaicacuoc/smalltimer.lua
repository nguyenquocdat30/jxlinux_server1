Include("\\script\\global\\zid_jx\\tinhnang\\loidaicacuoc\\head.lua");
function OnTimer()
	local nTotalTimer = GetMSRestTime(MISSION_ID,MISSION_TOTALTIMER);
	local nStateMission = GetMissionV(MISS_V_STATE);
	local nVSMission = GetMissionV(MISSION_V_VS);
	if (nStateMission == 1) then
		local nRestMinSignUp = floor(((nTotalTimer-TIMER_MATCH)/18)/60);
		local nRestSecSignUp = mod(floor((nTotalTimer-TIMER_MATCH)/18),60);
		if (nRestMinSignUp > 0) and (nRestSecSignUp <= 0) then
			Msg2MSAll(MISSION_ID, format("\n<color=white>Thêi gian chuÈn bÞ thi ®Êu cßn <color>%d<color> phót!",nRestMinSignUp));
		elseif (nRestMinSignUp <= 0) and (nRestSecSignUp > 0) then
			Msg2MSAll(MISSION_ID, format("\n<color=white>Thêi gian chuÈn bÞ thi ®Êu cßn <color>%d<color> gi©y!",nRestSecSignUp));
		end
		if (nVSMission > 1) then
			BattleChallenge:NoticeKey();
		end
		if (nRestMinSignUp <= 0) and (nRestSecSignUp <= 0) then 
			Msg2MSAll(MISSION_ID, format("<pic=8><color=green>Thi ®Êu chÝnh thøc b¾t ®Çu"));
			RunMission(MISSION_ID);
		end
	elseif (nStateMission == 2) then local nRestMinMatch = floor(((nTotalTimer)/18)/60);
		local nRestSecMatch = mod(floor((nTotalTimer)/18),60);
			BattleChallenge:NoticeTime(nTotalTimer);
			BattleChallenge:CheckPlayerWinnerSmallTimer();
		if (nRestMinMatch <= 0) and (nRestSecMatch <= 0) then
			Msg2MSAll(MISSION_ID, format("Thêi gian thi ®Êu ®· kÕt thóc!"));
			SetMissionV(MISS_V_STATE,3);
		end
	elseif (nStateMission == 3) then
		BattleChallenge:GetPlayerWinnerTimeOut();
	end
end

function BattleChallenge:CheckPlayerWinnerSmallTimer() 

		local szMsg = format("KÕt qu¶ <color=yellow>%s<color> lÇn nµy lµ: ",MISSION_S_BATTLENAME);
		local szName = MISSION_S_BATTLENAME;
		local tbCaptainName = BattleChallenge:GetCaptain();
		local nGroup1PlayerCount = GetMSPlayerCount(MISSION_ID,1);
		local nGroup2PlayerCount = GetMSPlayerCount(MISSION_ID,2);
		local nGroup1Damage = DamagePlayer:GetGroupDamage(2);
		local nGroup2Damage = DamagePlayer:GetGroupDamage(1);
		if (nGroup1PlayerCount <= 0) and (nGroup2PlayerCount <= 0) then 
			szMsg = szMsg..format("<color=cyan>Hai bªn kh«ng tham gia l«i ®µi, trËn ®Êu bÞ hñy bá hai bªn mÊt toµn bé tiÒn c­îc.",tbCaptainName[1],nGroup1Damage,tbCaptainName[2],nGroup2Damage);
			BattleChallenge:PlayerBetWinner(-1,tbCaptainName[1]);
			BattleChallenge:PlayerBetWinner(-1,tbCaptainName[2]);
			BattleChallenge:AllGone(szMsg);
			AddGlobalNews(szMsg);
			AddGlobalNews(szMsg);
			return 
		end
		
		if (nGroup1PlayerCount <= 0) and (nGroup2PlayerCount > 0) then 
			szMsg = format("<color=green>KÕt qu¶ %s :<color=cyan> %s<color=white> tµi hÌn søc män kh«ng ®ñ søc b­íc vµo l«i ®µi solo nªn<color=cyan> %s <color=white>dµnh th¾ng lîi kh«ng tèn chót søc lùc xin chóc mõng <pic=0>.",MISSION_S_BATTLENAME,tbCaptainName[1],tbCaptainName[2]); 
			BattleChallenge:PlayerBetWinner(2,tbCaptainName[2]);
			BattleChallenge:AllGone(szMsg);
			AddGlobalNews(szMsg);
			AddGlobalNews(szMsg);
			return
		end
		if (nGroup2PlayerCount <= 0)and (nGroup1PlayerCount > 0) then 
			szMsg = format("<color=green>KÕt qu¶ %s :<color=cyan> %s<color=white> tµi hÌn søc män kh«ng ®ñ søc b­íc vµo l«i ®µi solo nªn<color=cyan> %s <color=white>dµnh th¾ng lîi kh«ng tèn chót søc lùc xin chóc mõng <pic=0>.",MISSION_S_BATTLENAME,tbCaptainName[2],tbCaptainName[1]); 
			BattleChallenge:PlayerBetWinner(1,tbCaptainName[1]);
			BattleChallenge:AllGone(szMsg);
			AddGlobalNews(szMsg);
			AddGlobalNews(szMsg);
			return 
		end
end

function BattleChallenge:GetPlayerWinnerTimeOut() 
	local szMsg = format("KÕt qu¶ <color=yellow>%s<color> lÇn nµy lµ: ",MISSION_S_BATTLENAME);
	local szName = MISSION_S_BATTLENAME;
	local tbCaptainName = BattleChallenge:GetCaptain();
	local nGroup1PlayerCount = GetMSPlayerCount(MISSION_ID,1);
	local nGroup2PlayerCount = GetMSPlayerCount(MISSION_ID,2);
	local nGroup1Damage = DamagePlayer:GetGroupDamage(2);
	local nGroup2Damage = DamagePlayer:GetGroupDamage(1);
	if (nGroup1PlayerCount > 0) and (nGroup2PlayerCount > 0) then 
		if (nGroup1Damage == nGroup2Damage) then 
			szMsg = format("<color=green>KÕt qu¶ %s <color=white>c¶ 2 ®iÒu rêi khái l«i ®µi:<color=cyan> %s [%d dame] <color=white>trong khi ®ã<color=cyan> %s [%d dame], <color=green> hai bªn hßa nhau.<pic=0>",MISSION_S_BATTLENAME,tbCaptainName[1],nGroup1Damage,tbCaptainName[2],nGroup2Damage); 
			BattleChallenge:PlayerBetWinner(0,tbCaptainName[1]);
			BattleChallenge:PlayerBetWinner(0,tbCaptainName[2]);
		elseif (nGroup1Damage > nGroup2Damage) then 
			szMsg = format("<color=green>KÕt qu¶ l«i ®µi c¸ c­îc:<color=cyan> %s [%d dame] <color=white>trong khi ®ã<color=cyan> %s [%d dame]  =><color=green> %s <color=white>dame nhiÒu h¬n giµnh chiÕn th¾ng cuèi cïng xin chóc mõng<pic=125>",tbCaptainName[1],nGroup1Damage,tbCaptainName[2],nGroup2Damage,tbCaptainName[1]); 
			BattleChallenge:PlayerBetWinner(1,tbCaptainName[1]);
		elseif (nGroup2Damage > nGroup1Damage) then 
			szMsg = format("<color=green>KÕt qu¶ l«i ®µi c¸ c­îc:<color=cyan> %s [%d dame] <color=white>trong khi ®ã<color=cyan> %s [%d dame] =><color=green> %s <color=white>dame nhiÒu h¬n giµnh chiÕn th¾ng cuèi cïng xin chóc mõng<pic=125>",tbCaptainName[2],nGroup2Damage,tbCaptainName[1],nGroup1Damage,tbCaptainName[2]); 
			BattleChallenge:PlayerBetWinner(2,tbCaptainName[2]);
		end
			BattleChallenge:AllGone(szMsg);
			AddGlobalNews(szMsg);
			AddGlobalNews(szMsg);
			return 
	elseif (nGroup1PlayerCount <= 0) and (nGroup2PlayerCount <= 0) then 
			szMsg = szMsg..format("<colo=cyan>Hai bªn kh«ng tham gia l«i ®µi, trËn ®Êu bÞ hñy bá hai bªn mÊt toµn bé tiÒn c­îc.",tbCaptainName[1],nGroup1Damage,tbCaptainName[2],nGroup2Damage);
			BattleChallenge:PlayerBetWinner(-1,tbCaptainName[1]);
			BattleChallenge:PlayerBetWinner(-1,tbCaptainName[2]);
			BattleChallenge:AllGone(szMsg);
			AddGlobalNews(szMsg);
			AddGlobalNews(szMsg);
			return 
	end
	
	if (nGroup1PlayerCount <= 0) and (nGroup2PlayerCount > 0) then 
			szMsg = szMsg..format("<color=green>KÕt qu¶ l«i ®µi c¸ c­îc:®éi <color=green>%s <color=white>kh«ng cã ai tham gia ®éi <color=cyan> %s<color=white> dµnh th¾ng cuéc<pic=125>",tbCaptainName[1],tbCaptainName[2]);
			BattleChallenge:PlayerBetWinner(2,tbCaptainName[2]);
			BattleChallenge:AllGone(szMsg);
			AddGlobalNews(szMsg);
			AddGlobalNews(szMsg);
			return 
	end
	if (nGroup2PlayerCount <= 0)and (nGroup1PlayerCount > 0) then 
			szMsg = szMsg..format("<color=green>KÕt qu¶ l«i ®µi c¸ c­îc:®éi <color=green>%s <color=white>kh«ng cã ai tham gia ®éi <color=cyan> %s<color=white> dµnh th¾ng cuéc<pic=125>",tbCaptainName[2],tbCaptainName[1]);
			BattleChallenge:PlayerBetWinner(1,tbCaptainName[1]);
			BattleChallenge:AllGone(szMsg);
			AddGlobalNews(szMsg);
			AddGlobalNews(szMsg);
			return
	end
end
