--coding by romandou 2004-12-22
--Õ½ÒÛµÄ±¨ÃûµãNpc¶Ô»°½Å±¾

IncludeLib("BATTLE")
Include("\\script\\global\\zid_jx\\tinhnang\\thachdaubanghoi\\battlehead.lua");
Include("\\script\\global\\zid_jx\\tinhnang\\thachdaubanghoi\\tonghead.lua");

function main()
	dofile("script/global/zid_jx/tinhnang/thachdaubanghoi/battlejoin.lua");

	local nOldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BT_GetGameData(GAME_MAPID));
	local nState = GetMissionV(MS_STATE);
	
	BattleTong:LoadData();
	
	szTitle = "";
	local nRegisterTong = BattleTong:CheckStateRegister();
	if (nState > 0) and (nRegisterTong == 1) then
		local BT_szTitle = BattleTong:GetTitle();
		szTitle = "Th«ng tin vÒ cuéc th¸ch ®Êu lÇn nµy:"..BT_szTitle;
		local nMemSong, nMemJin = bt_checkmemcount_balance();
		if (nMemSong == nil or nMemJin == nil) then
			return
		end;
		if (nState == 1 or nState == 2) and (nMemSong and nMemJin) then
			local szTongSong = BattleTong:GetBattleTong(1);
			local szTongJin = BattleTong:GetBattleTong(2);
			szTitle = szTitle.."\n<color=red>Qu©n sè hiÖn t¹i:<color>";
			szTitle = szTitle..format("\n* Bang héi <color=fire>%s<color> (T): tham gia <color=yellow>%s<color> ng­êi",szTongSong,nMemSong);
			szTitle = szTitle..format("\n* Bang héi <color=fire>%s<color> (K): tham gia <color=yellow>%s<color> ng­êi",szTongJin,nMemJin);
		end;
	else
		szTitle = "HiÖn t¹i <color=red>Th¸ch ®Êu Bang Héi<color> vÉn ch­a ®Õn giê b¸o d¸nh, ng­¬i h·y ®îi th«ng b¸o råi h·y ®Õn nhÐ!";
	end;
	
	local nIsMoney = BattleTong:IsMoney();
	
	local tbOption = {szTitle};
	if (nState == 0) then
		if (nIsMoney == 1) then
			tinsert(tbOption, "NhËn tiÒn th­ëng/#BattleTong:GiveAward()");
		end;
	else
		if (nRegisterTong == 0) then
			tinsert(tbOption, "B¸o danh th¸ch ®Êu!/#BattleTong:DialogMain()");
		elseif (nRegisterTong == 1) then
			tinsert(tbOption, "Tham gia vµo chiÕn tr­êng!/JoinBattleTong");
		end;
	end;
		-- tinsert(tbOption, "Reload/ReloadScript");
		tinsert(tbOption, "KÕt thóc ®èi tho¹i./no");
	CreateTaskSay(tbOption);
end;

function ReloadScript()
	LoadScript("\\script\\global\\zid_jx\\tinhnang\\thachdaubanghoi\\battlehead.lua")
	LoadScript("\\script\\global\\zid_jx\\tinhnang\\thachdaubanghoi\\tongmain.lua")
	LoadScript("\\script\\global\\zid_jx\\tinhnang\\thachdaubanghoi\\tonghead.lua")
	LoadScript("\\script\\global\\zid_jx\\tinhnang\\thachdaubanghoi\\item\\useitemtong.lua")
	LoadScript("\\script\\global\\zid_jx\\tinhnang\\thachdaubanghoi\\item\\pickuptong.lua")
	LoadScript("\\script\\global\\zid_jx\\tinhnang\\thachdaubanghoi\\item\\useitemdefault.lua")
	LoadScript("\\script\\item\\checkmapid.lua")
end;

function JoinBattleTong()
	local nOldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(WORLD_MAPID);
		bt_setnormaltask2type();
		if (BT_GetGameData(GAME_BATTLEID) == 0) then
			Say("<color=red>Th¸ch §Êu Bang Héi<color> vÉn ch­a khai më, h·y chê th«ng b¸o råi ®Õn b¸o danh nhÐ!");
		return end;
		
		SubWorld = nOldSubWorld;
		nMapId = SubWorldIdx2ID(SubWorld);
		local nPlayerLevel = GetLevel();
		
		if (nPlayerLevel < 90) then
			Say("<color=red>Th¸ch §Êu Bang Héi<color> chØ dµnh cho ng­êi ch¬i tõ cÊp 90 trë lªn, ng­¬i vÉn ch­a ®ñ ®iÒu kiÖn. TiÕp tôc cè g¾ng tËp luyÖn thªm ®i!",2,
			"Ta biÕt råi!/no",
			"Ta muèn t×m hiÓu th«ng tin vÒ chiÕn tr­êng/bt_onbattleinfo");
		return end;
	
	---------------------------------------------------------------------------------------------
	SubWorld = SubWorldID2Idx(WORLD_MAPID);
		if (GAME_SIGNMAP ~= nMapId) then
			Say("Khu vùc nµy lµ "..szGAME_GAMELEVEL..", §¼ng cÊp cña ng­¬i hiÖn giê kh«ng thÓ b¸o danh!", 0)--£¿£¿Ã»ÓÐ·ÖµÈ¼¶µÄÌáÊ¾ÐÅÏ¢		 
		return end;
		
		nBattleMap = SubWorldID2Idx(BT_GetGameData(GAME_MAPID));
		if (nBattleMap < 0) then
			Say("TiÒn ph­¬ng cã vÊn ®Ò, t¹m thêi kh«ng thÓ vµo chiÕn tr­êng!");
		return end;
		
	nBattleSubWorld = SubWorld;
	SubWorld = nBattleMap;
		nState = GetMissionV(MS_STATE);
		if (nState == 0) then
			Say("Xin lçi! §¹i chiÕn vÉn ch­a b¾t ®Çu! LÇn sau quay l¹i nhÐ!", 0);
			return
		elseif (nState == 3) then
			Say("Xin lçi! §¹i chiÕn ®· kÕt thóc! LÇn sau quay l¹i nhÐ!", 0);
			return
		else
			szBattleName = BT_GetBattleName();
		end;
	SubWorld = nBattleSubWorld;
	---------------------------------------------------------------------------------------------
	SubWorld = SubWorldID2Idx(WORLD_MAPID);
		if (BT_GetGameData(GAME_BATTLEID) ~= BT_GetData(PL_BATTLEID) or BT_GetGameData(GAME_BATTLESERIES) ~= BT_GetData(PL_BATTLESERIES)) then
			if (nState ~= 1 and nState ~= 2) then
				Say("Xin lçi! §¹i chiÕn ®· kÕt thóc! LÇn sau quay l¹i nhÐ!", 0);
			return end;
			
			local nRegState = BattleTong:JoinBattle(bt_ncamp);
			if (nRegState == 0) then
				return
			else
				if (bt_ncamp == 1) then
					Say(format("%s",szTitle),2,
					"Ta muèn gãp søc cho bang héi ta!/bt_joinsong",
					"§Ó ta suy nghÜ l¹i!/bt_oncancel");
				elseif (bt_ncamp == 2) then
					Say(format("%s",szTitle),2,
					"Ta muèn gãp søc cho bang héi ta!/bt_joinjin",
					"§Ó ta suy nghÜ l¹i!/bt_oncancel");
				end;
			end;
		return end;
		
		if (BT_GetGameData(GAME_KEY) == BT_GetData(PL_KEYNUMBER) and BT_GetData(PL_BATTLECAMP) ~= bt_ncamp) then
			local szTong = BattleTong:GetBattleTong(bt_ncamp);
			Say(format("Ng­¬i ®Çu qu©n cho <color=yellow>%s<color> kh«ng thÓ tham gia vµo phe nµy!",szTong));
		return end;
	
		local nMemSong, nMemJin = bt_checkmemcount_balance();
		if (nMemSong == nil or nMemJin == nil) then
			return
		end;
		
		local nRegState = BattleTong:JoinBattle(bt_ncamp);
		if (nRegState == 0) then
			return
		end;
		
		local szTongSong = BattleTong:GetBattleTong(1);
		local szTongJin = BattleTong:GetBattleTong(2);
		local szTitle = "HiÖn t¹i qu©n sè cña 2 bªn tham gia vµo chiÕn tr­êng lµ:";
		szTitle = szTitle..format("\n* Qu©n sè bang héi <color=yellow>%s<color> (T): %d ng­êi",szTongSong,nMemSong)
		szTitle = szTitle..format("\n* Qu©n sè bang héi <color=yellow>%s<color> (K): %d ng­êi",szTongJin,nMemJin)
		Say(szTitle,2,"H·y cho ta tham gia!/bt_enterbattle","§Ó ta suy nghÜ l¹i!/bt_oncancel");
		
		SubWorld = nOldSubWorld
end;

function bt_enterbattle()
	local nOldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(WORLD_MAPID);
		nMapId = BT_GetGameData(GAME_MAPID);
		if (nMapId > 0) then
			nMapIdx = SubWorldID2Idx(nMapId);
			if (nMapIdx < 0) then
				Say("Xin lçi, tiÒn tuyÕn ®ang cã vÊn ®Ò, t¹m thêi kh«ng thÓ vµo chiÕn tr­êng.",0);
				nSignMapId = SubWorldIdx2ID(SubWorld);
				nBattleId = BT_GetGameData(GAME_BATTLEID);
			return end;
			
			SubWorld = nMapIdx;
			BT_SetData(PL_SERIESKILL, 0);
			SetTask(TV_SERIESKILL_REALY,0);
			BT_SetData(PL_BATTLECAMP, bt_ncamp);
			JoinMission(BT_GetGameData(GAME_RULEID), bt_ncamp);
			return
		else
			Say("Xin lçi! TiÒn ph­¬ng cã vÊn ®Ò, t¹m thêi kh«ng thÓ vµo chiÕn tr­êng", 0);
		end;
	SubWorld = nOldSubWorld;
end;

function bt_joinsong()
	local nOldSubWorld = SubWorld;
	local szNameSong = GetName();
	local szTongSong, nTongSong = GetTongName();
	SubWorld = SubWorldID2Idx(WORLD_MAPID);
		BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID));
		BT_SetData(PL_BATTLESERIES, BT_GetGameData(GAME_BATTLESERIES));
		BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND));
		BT_SetData(PL_KEYNUMBER, 0);
		BT_SetData(PL_BATTLEPOINT, 0);
		SetTask(1017, 0);
		SetTask(TV_SERIESKILL_REALY,0);
		BT_SetData(PL_BATTLECAMP, 0);
		
		nMapId = BT_GetGameData(GAME_MAPID);
		if (nMapId > 0) then
			nMapIdx = SubWorldID2Idx(nMapId);
			if (nMapIdx < 0) then
				Say("Xin lçi, tiÒn tuyÕn ®ang cã vÊn ®Ò, t¹m thêi kh«ng thÓ vµo chiÕn tr­êng.",0);
				nSignMapId = SubWorldIdx2ID(SubWorld);
				nBattleId = BT_GetGameData(GAME_BATTLEID);
			return end;
			
			SubWorld = nMapIdx;
			BT_SetData(PL_SERIESKILL, 0);
			SetTask(TV_SERIESKILL_REALY,0);
			BT_SetData(PL_BATTLECAMP, bt_ncamp);
			JoinMission(BT_GetGameData(GAME_RULEID), bt_ncamp);
			return
		else
			Say("Xin lçi! TiÒn ph­¬ng cã vÊn ®Ò, t¹m thêi kh«ng thÓ vµo chiÕn tr­êng", 0);
		end;
		
		Msg2Player("C«ng c¸o: §· b¾t ®Çu chiÕn dÞch míi, ®iÓm tÝch ph©n hiÖn giê sÏ lµ 0!");
		Msg2Player(format("<color=green>Hoan nghªnh b¹n ®· tham gia ®Çu qu©n cho bang héi <color=yellow>%s<color>!<color>",szTongSong));
		Msg2Tong(nTongSong, format("C¶m kÝch thµnh viªn <color=fire>%s<color> ®· tham gia vµo chiÕn tr­êng Th¸ch §Êu Bang Héi gióp søc cho bang héi!",szNameSong));
	SubWorld = nOldSubWorld;
end;

function bt_joinjin()
	local nOldSubWorld = SubWorld;
	local szNameJin = GetName();
	local szTongJin, nTongJin = GetTongName();
	SubWorld = SubWorldID2Idx(WORLD_MAPID);
		BT_SetData(PL_BATTLEID, BT_GetGameData(GAME_BATTLEID));
		BT_SetData(PL_BATTLESERIES, BT_GetGameData(GAME_BATTLESERIES));
		BT_SetData(PL_ROUND,BT_GetGameData(GAME_ROUND));
		BT_SetData(PL_KEYNUMBER, 0);
		BT_SetData(PL_BATTLEPOINT, 0);
		SetTask(1017, 0);
		SetTask(TV_SERIESKILL_REALY,0);
		BT_SetData(PL_BATTLECAMP, 0);
		
		nMapId = BT_GetGameData(GAME_MAPID);
		if (nMapId > 0) then
			nMapIdx = SubWorldID2Idx(nMapId);
			if (nMapIdx < 0) then
				Say("Xin lçi, tiÒn tuyÕn ®ang cã vÊn ®Ò, t¹m thêi kh«ng thÓ vµo chiÕn tr­êng.",0);
				nSignMapId = SubWorldIdx2ID(SubWorld);
				nBattleId = BT_GetGameData(GAME_BATTLEID);
			return end;
			
			SubWorld = nMapIdx;
			BT_SetData(PL_SERIESKILL, 0);
			SetTask(TV_SERIESKILL_REALY,0);
			BT_SetData(PL_BATTLECAMP, bt_ncamp);
			JoinMission(BT_GetGameData(GAME_RULEID), bt_ncamp);
			return
		else
			Say("Xin lçi! TiÒn ph­¬ng cã vÊn ®Ò, t¹m thêi kh«ng thÓ vµo chiÕn tr­êng", 0);
		end;
		
		Msg2Player("C«ng c¸o: §· b¾t ®Çu chiÕn dÞch míi, ®iÓm tÝch ph©n hiÖn giê sÏ lµ 0!");
		Msg2Player(format("<color=green>Hoan nghªnh b¹n ®· tham gia ®Çu qu©n cho bang héi <color=yellow>%s<color>!<color>",szTongJin));
		Msg2Tong(nTongJin, format("C¶m kÝch thµnh viªn <color=fire>%s<color> ®· tham gia vµo chiÕn tr­êng Th¸ch §Êu Bang Héi gióp søc cho bang héi!",szNameJin));
	SubWorld = nOldSubWorld;
end;

function bt_checkmemcount_balance()
	local nMapId = BT_GetGameData(GAME_MAPID);
	if (nMapId > 0) then
		if (SubWorldID2Idx(nMapId) >= 0) then
			oldSubWorld = SubWorld
			SubWorld = SubWorldID2Idx(nMapId)
			local nMemSong = GetMSPlayerCount(BT_GetGameData(GAME_RULEID), 1)
			local nMemJin = GetMSPlayerCount(BT_GetGameData(GAME_RULEID), 2)
			SubWorld = oldSubWorld
			
			if BT_GetGameData(GAME_BATTLEID) == 2 then
				if (bt_ncamp == 1 and nMemSong >= BALANCE_GUOZHAN_MAXCOUNT) or (bt_ncamp == 2 and nMemJin >= BALANCE_GUOZHAN_MAXCOUNT) then
				else
					return nMemSong, nMemJin
				end
			end
			
			if (bt_ncamp == 1 and (nMemSong - nMemJin) >= BALANCE_MAMCOUNT ) then
				Say("HiÖn t¹i binh lùc phe ta lµ <color=yellow>"..nMemSong.." ng­êi<color>, ®Þch ph­¬ng lµ <color=yellow>"..nMemJin.." ng­êi<color>, c¸ch biÖt <color=red>"..BALANCE_MAMCOUNT.." ng­êi<color>. Qu©n lùc cña ta hiÖn giê ®· d­ søc tiªu diÖt Kim binh! Tr¸ng sÜ xin ®îi trËn sau nhÐ!", 0)
				return
			elseif (bt_ncamp == 2 and (nMemJin - nMemSong) >= BALANCE_MAMCOUNT ) then
				Say("HiÖn t¹i binh lùc phe ta lµ <color=yellow>"..nMemJin.." ng­êi<color>, ®Þch ph­¬ng lµ <color=yellow>"..nMemSong.." ng­êi<color>, c¸ch biÖt <color=red>"..BALANCE_MAMCOUNT.." ng­êi<color>. Qu©n lùc cña ta hiÖn giê ®· d­ søc tiªu diÖt Tèng qu©n. Tr¸ng sÜ xin ®îi trËn sau nhÐ!", 0)
				return
			else
				return nMemSong, nMemJin
			end
		end
	end
	Say("Xin lçi! TiÒn ph­¬ng cã vÊn ®Ò, t¹m thêi kh«ng thÓ vµo chiÕn tr­êng", 0);
	return nil
end

function bt_oncancel()
end