Include("\\script\\global\\zid_jx\\tinhnang\\loidaicacuoc\\head.lua");
function OnTimer()
	local nStateMission = GetMissionV(MISS_V_STATE);
	if (nStateMission == 0) then
		return
	end
	local tbCaptainName = BattleChallenge:GetCaptain();
	local szMsg = format("KÕt qu¶ %s lÇn nµy lµ: ",MISSION_S_BATTLENAME);
	local szName = MISSION_S_BATTLENAME;
	local nGroup1PlayerCount = GetMSPlayerCount(MISSION_ID,1);
	local nGroup2PlayerCount = GetMSPlayerCount(MISSION_ID,2);
	local nGroup1Damage = DamagePlayer:GetGroupDamage(2);
	local nGroup2Damage = DamagePlayer:GetGroupDamage(1);
	
	if (nGroup1PlayerCount <= 0) and (nGroup2PlayerCount <= 0) then 
		szMsg = szMsg..format("Hai bªn kh«ng tham gia l«i ®µi, trËn ®Êu bÞ hñy bá!",tbCaptainName[1],nGroup1Damage,tbCaptainName[2],nGroup2Damage);
		BattleChallenge:PlayerBetWinner(-1,tbCaptainName[1]);
		BattleChallenge:PlayerBetWinner(-1,tbCaptainName[2]);
		BattleChallenge:AllGone(szMsg);
		return 
	end;
	
	if (nGroup1PlayerCount <= 0) and (nGroup2PlayerCount > 0) then 
		szMsg = format("<color=green>KÕt qu¶ %s :<color=pink> %s<color=white> tµi hÌn søc män kh«ng d¸m b­íc vµo l«i ®µi solo nªn<color=pink> %s dµnh th¾ng lîi kh«ng tèn chót søc lùc nµo xin chóc mõng <pic=0>.",MISSION_S_BATTLENAME,tbCaptainName[1],tbCaptainName[2]); 
		BattleChallenge:PlayerBetWinner(2,tbCaptainName[2]);
		BattleChallenge:AllGone(szMsg);
		return 
	end;
	
	if (nGroup2PlayerCount <= 0)and (nGroup1PlayerCount > 0) then 
		szMsg = format("<color=green>KÕt qu¶ %s :<color=pink> %s<color=white> tµi hÌn søc män kh«ng d¸m b­íc vµo l«i ®µi solo nªn<color=pink> %s dµnh th¾ng lîi kh«ng tèn chót søc lùc nµo xin chóc mõng <pic=0>.",MISSION_S_BATTLENAME,tbCaptainName[2],tbCaptainName[1]); 
		BattleChallenge:PlayerBetWinner(1,tbCaptainName[1]);
		BattleChallenge:AllGone(szMsg);
		AddGlobalNews(szMsg);
		AddGlobalNews(szMsg);
		return 
	end;
	
	if (nGroup1PlayerCount == nGroup2PlayerCount) then 
		if (nGroup1Damage == nGroup2Damage) then 
				szMsg = format("<color=green>KÕt qu¶ %s <color=white>c¶ 2 ®iÒu rêi khái l«i ®µi: <color=pink> %s [%d dame] <color=white>trong khi ®ã<color=pink> %s [%d dame], <color=green> hai bªn hßa nhau.<pic=0>.",MISSION_S_BATTLENAME,tbCaptainName[1],nGroup1Damage,tbCaptainName[2],nGroup2Damage); 
				BattleChallenge:PlayerBetWinner(0,tbCaptainName[1]);
				BattleChallenge:PlayerBetWinner(0,tbCaptainName[2]);
		elseif (nGroup1Damage > nGroup2Damage) then 
				szMsg = format("<color=green>KÕt qu¶ l«i ®µi c¸ c­îc:<color=pink> %s [%d dame] <color=white>trong khi ®ã<color=pink> %s [%d dame], <color=green> %s <color=white>dame nhiÒu h¬n giµnh chiÕn th¾ng cuèi cïng xin chóc mõng<pic=125>.",tbCaptainName[1],nGroup1Damage,tbCaptainName[2],nGroup2Damage,tbCaptainName[1]); 
				BattleChallenge:PlayerBetWinner(1,tbCaptainName[1]);
		elseif (nGroup2Damage > nGroup1Damage) then 
				szMsg = format("<color=green>KÕt qu¶ l«i ®µi c¸ c­îc:<color=pink> %s [%d dame] <color=white>trong khi ®ã<color=pink> %s [%d dame], <color=green> %s <color=white>dame nhiÒu h¬n giµnh chiÕn th¾ng cuèi cïng xin chóc mõng<pic=125>.",tbCaptainName[2],nGroup2Damage,tbCaptainName[1],nGroup1Damage,tbCaptainName[2]); 
				BattleChallenge:PlayerBetWinner(2,tbCaptainName[2]);
		end;
	
	elseif (nGroup1PlayerCount > nGroup2PlayerCount) then 
		if (nGroup1Damage == nGroup2Damage) then 
			szMsg = format("<color=green>KÕt qu¶ %s <color=white>c¶ 2 ®iÒu rêi khái l«i ®µi:<color=pink> %s [%d dame] <color=white>trong khi ®ã<color=pink> %s [%d dame], <color=green> hai bªn hßa nhau.<pic=0>.",MISSION_S_BATTLENAME,tbCaptainName[1],nGroup1Damage,tbCaptainName[2],nGroup2Damage); 
			BattleChallenge:PlayerBetWinner(0,tbCaptainName[1]);
			BattleChallenge:PlayerBetWinner(0,tbCaptainName[2]);
		elseif (nGroup1Damage > nGroup2Damage) then 
			szMsg = format("<color=green>KÕt qu¶ l«i ®µi c¸ c­îc:<color=pink> %s [%d dame] <color=white>trong khi ®ã<color=pink> %s [%d dame], <color=green> %s <color=white>dame nhiÒu h¬n giµnh chiÕn th¾ng cuèi cïng xin chóc mõng<pic=125>.",tbCaptainName[1],nGroup1Damage,tbCaptainName[2],nGroup2Damage,tbCaptainName[1]); 
			BattleChallenge:PlayerBetWinner(1,tbCaptainName[1]);
		elseif (nGroup2Damage > nGroup1Damage) then 
			szMsg = format("<color=green>KÕt qu¶ l«i ®µi c¸ c­îc:<color=pink> %s [%d dame] <color=white>trong khi ®ã<color=pink> %s [%d dame], <color=green> %s <color=white>dame nhiÒu h¬n giµnh chiÕn th¾ng cuèi cïng xin chóc mõng<pic=125>.",tbCaptainName[2],nGroup2Damage,tbCaptainName[1],nGroup1Damage,tbCaptainName[2]); 
			BattleChallenge:PlayerBetWinner(2,tbCaptainName[2]);
		end;
		
	elseif (nGroup2PlayerCount > nGroup1PlayerCount) then 
		if (nGroup1Damage == nGroup2Damage) then 
			szMsg = format("Hai bªn cïng rêi khái %s, ®éi %s [%d ®iÓm] vµ ®éi %s [%d ®iÓm] b»ng ®iÓm nhau, ®¸nh ngang tµi ngang søc!",MISSION_S_BATTLENAME,tbCaptainName[1],nGroup1Damage,tbCaptainName[2],nGroup2Damage); BattleChallenge:PlayerBetWinner(0,tbCaptainName[1]); 
			BattleChallenge:PlayerBetWinner(0,tbCaptainName[1]);
			BattleChallenge:PlayerBetWinner(0,tbCaptainName[2]);
		elseif (nGroup1Damage > nGroup2Damage) then
			szMsg = format("<color=green>KÕt qu¶ l«i ®µi c¸ c­îc:<color=pink> %s [%d dame] <color=white>trong khi ®ã<color=pink> %s [%d dame], <color=green> %s <color=white>dame nhiÒu h¬n giµnh chiÕn th¾ng cuèi cïng xin chóc mõng<pic=125>.",tbCaptainName[1],nGroup1Damage,tbCaptainName[2],nGroup2Damage,tbCaptainName[1]); 
			BattleChallenge:PlayerBetWinner(1,tbCaptainName[1]);
		elseif (nGroup2Damage > nGroup1Damage) then 
			szMsg = format("<color=green>KÕt qu¶ l«i ®µi c¸ c­îc:<color=pink> %s [%d dame] <color=white>trong khi ®ã<color=pink> %s [%d dame], <color=green> %s <color=white>dame nhiÒu h¬n giµnh chiÕn th¾ng cuèi cïng xin chóc mõng<pic=125>.",tbCaptainName[2],nGroup2Damage,tbCaptainName[1],nGroup1Damage,tbCaptainName[2]); 
			BattleChallenge:PlayerBetWinner(2,tbCaptainName[2]);
		end;
	end;
	
		BattleChallenge:AllGone(szMsg);
		AddGlobalNews(szMsg);
		AddGlobalNews(szMsg);
		
	return 
 
end;
