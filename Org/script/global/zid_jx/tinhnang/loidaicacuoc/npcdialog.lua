Include("\\script\\global\\zid_jx\\tinhnang\\loidaicacuoc\\head.lua");
Include("\\script\\global\\zid_jx\\lib\\config.lua");
Include("\\script\\global\\zid_jx\\log\\log.lua")
Include("\\script\\dailogsys\\dailogsay.lua");
IncludeLib("ITEM") 
IncludeLib("LEAGUE")


 
function main() 
dofile("script/global/zid_jx/tinhnang/loidaicacuoc/npcdialog.lua")
if SingleArena ~= 1 then
	return Talk(1,"","TÝnh N¨ng <color=yellow>L«i §µi C¸ C­îc<color> §ang §­îc T¹m §ãng Vui Lßng Quay L¹i Sau")
end
BattleChallenge:DialogMain();
end
 
function BattleChallenge:DialogMain() 
	local nOldWorld = SubWorld;
	local nWorld,nPosX,nPosY = GetWorldPos();
	SetTask(TASK_SIGNUP_WORLD,nWorld);
	SetTask(TASK_SIGNUP_POSX,nPosX);
	SetTask(TASK_SIGNUP_POSY,nPosY);
	local nState = MISS_V_STATE;
	local nVS = MISSION_V_VS;
	local nMapIndex = MAP_WORLD;
	local szName = MISSION_S_BATTLENAME;
	local tbCaptainName = BattleChallenge:GetCaptain();
	local nSubWorld = SubWorldID2Idx(nMapIndex);
	if (nSubWorld == -1) then
		print("[Team] Ban do khu vuc thi dau khong ton tai!");
		return
	end
	SubWorld = nSubWorld;
	local nStateMission = GetMissionV(nState);
	local nVSMission = GetMissionV(nVS);
	local szTitle;
	if (nStateMission == 0) then 
		szTitle = format("<color=orange>%s<color=green> lµ n¬i diÔn ra c¸c cuéc thi ®Êu solo ®Ém m¸u trèn giang hå,bao nhiu anh hïng hµo kiÖt ®· ph¶i bá m¹ng t¹i ®©y còng v× danh tiÕng vµ tiÒn b¹c,xin h·y c©n nh¾c kü kÎo mét ®i kh«ng vÒ!",szName); 
		local tbOption = {szTitle}; 
		tinsert(tbOption, "Ta muèn c¸ c­îc solo víi ®èi thñ/#BattleChallenge:OnRegister()"); 
		tinsert(tbOption, "T×m hiÓu quy t¾c thi ®Êu!/quytaccacuoc"); 
		tinsert(tbOption, "§Ó lóc kh¸c ta sÏ ®Õn./#BattleChallenge:Cancel()"); 
		CreateTaskSay(tbOption);
	elseif (nStateMission == 1) then 
		szTitle = format("<color=orange>%s<color> HiÖn t¹i khu vùc nµy ®ang trong thêi gian chuÈn bÞ thi ®Êu gi÷a chiÕn ®éi <color=yellow>%s<color> vs <color=yellow>%s<color> tranh tµi [%d VS %d].<enter>Ng­¬i cã cÇn ta gióp g× kh«ng?",szName,tbCaptainName[1],tbCaptainName[2],nVSMission,nVSMission); 
		local tbOption = {szTitle};
		tinsert(tbOption, "Ta lµ tuyÓn thñ trong trËn thi ®Êu nµy, h·y ®­a ta ®Õn khu vùc thi ®Êu!/#BattleChallenge:OnEnterMatch()"); 
		tinsert(tbOption, "Ta muèn vµo xem trËn thi ®Êu nµy!/#BattleChallenge:OnLook()"); 
		tinsert(tbOption, "Ta lµ con b¹c, muèn ®Æt c­îc cho trËn ®Êu nµy/#BattleChallenge:GameBet()"); 
		tinsert(tbOption, "§Ó lóc kh¸c ®i, b©y giê ta kh«ng høng thó./BattleChallenge_OnCancel"); 
		CreateTaskSay(tbOption);
	elseif (nStateMission == 2) then 
		szTitle = format("<color=orange>%s<color> lµ n¬i diÔn ra nh÷ng cuéc tû thÝ, tû vâ trong giíi giang hå vâ l©m nµy. HiÖn t¹i ch­a cã ai ®¨ng ký tham gia vµo thi ®Êu, c¸c h¹ cã muèn b¸o danh kh«ng?",szName); 
		local tbOption = {szTitle};
		if (not self.TimerWait[GetName()]) then
			tinsert(tbOption, "Ta muèn vµo xem trËn thi ®Êu nµy!/#BattleChallenge:OnLook()");
		end
		tinsert(tbOption, "§Ó lóc kh¸c ®i, b©y giê ta kh«ng høng thó./BattleChallenge_OnCancel");
		CreateTaskSay(tbOption);
	end
	SubWorld = nOldWorld;
end
 
 function quytaccacuoc()
		local tbarytalk ={
			"<dec><npc>Xin chµo!<color=yellow> "..GetName().."<color><enter><color=green>§éi tr­ëng tiÕn hµnh ra gi¸ c­îc<enter>§èi thñ chÊp nhËn gi¸ tiÒn c­îc solo.<enter>Ai th¾ng gom hÕt tiÒn ®· c­îc trõ <color=cyan>5% <color=green>phÝ.<enter>NÕu hÕt giê kh«ng ai chÕt sÏ tÝnh theo dame.<color>",
			"§· hiÓu râ/Oncane",
		}
		CreateTaskSay(tbarytalk)
		return
end
 
 
function BattleChallenge:OnRegister()
	local nMapIndex = MAP_WORLD;
	local nState = MISS_V_STATE;
	local nVS = MISSION_V_VS;
	local nOldWorld = SubWorld;
	local nSubWorld = SubWorldID2Idx(nMapIndex);
	SubWorld = nSubWorld;
	local nStateMission = GetMissionV(nState);
	local nVSMission = GetMissionV(nVS);
	if (nStateMission ~= 0) then 
		Say("B¸o danh thi ®Êu thÊt b¹i! HiÖn t¹i ®· cã ng­êi b¸o danh thi ®Êu råi, h·y ®îi ®Õn l­ît sau nhÐ!", 0); 
		return 
	end  
	if (GetTeamSize() ~= 2) then 
		Say("Ph¶i lµ <color=red>®éi tr­ëng<color> vµ b¾t buéc ph¶i ®ñ <color=red>2 ng­êi<color> (kh«ng h¬n còng kh«ng thiÕu) th× míi cã thÓ b¸o danh solo!",0); 
		return 
	end  
	if (IsCaptain() ~= 1) then 
		Say("Ph¶i lµ <color=red>®éi tr­ëng<color> vµ b¾t buéc ph¶i ®ñ <color=red>2 ng­êi<color> (kh«ng h¬n còng kh«ng thiÕuªu) th× míi cã thÓ b¸o danh solo!",0); 
		return 
	end  
	
	local szTitle = "Ng­¬i muèn b¸o danh thi ®Êu víi bao nhiªu ng­êi?";
	local tbOption = {szTitle};
		tinsert(tbOption, "§Êu 1 vs 1/#BattleChallenge:OnCount(1)");
		-- tinsert(tbOption, "§Êu 2 vs 2/#BattleChallenge:OnCount(2)");
		-- tinsert(tbOption, "§Êu 3 vs 3/#BattleChallenge:OnCount(3)");
		-- tinsert(tbOption, "§Êu 4 vs 4/#BattleChallenge:OnCount(4)");
		-- tinsert(tbOption, "§Êu 5 vs 5/#BattleChallenge:OnCount(5)");
		-- tinsert(tbOption, "§Êu 6 vs 6/#BattleChallenge:OnCount(6)");
		-- tinsert(tbOption, "§Êu 7 vs 7/#BattleChallenge:OnCount(7)");
		-- tinsert(tbOption, "§Êu 8 vs 8/#BattleChallenge:OnCount(8)");
		tinsert(tbOption, "Rêi khái!/#BattleChallenge:Cancel()");
		CreateTaskSay(tbOption);
		SubWorld = nOldWorld;
end
 
function BattleChallenge:OnCount(nCount)
	local nMoney = CalcEquiproomItemCount(4,417,1,-1);
	if (nMoney == 0) then 
		Say("RÊt tiÕc! Ng­¬i kh«ng cã mang theo tiÒn trªn ng­êi, lµm sao cã thÓ c¸ c­îc solo víi ai ®ã.",0); 
		return
	end
	g_AskClientNumberEx(1,nMoney,"NhËp sè tiÒn c­îc:", {self.OnEnterCount,{self,nCount}});
end

function BattleChallenge:OnEnterCount(nCount,nMoney)
	local nOldWorld = SubWorld;
	local nMapIndex = MAP_WORLD;
	local nState = MISS_V_STATE;
	local nVS = MISSION_V_VS;
	local nSubWorld = SubWorldID2Idx(nMapIndex);
	if (nSubWorld == -1) then
		print("[Team] Ban do khu vuc thi dau khong ton tai!");
		return
	end
	local nLimitMoney = mod(nMoney,100);
	if (nLimitMoney > 0) then 
		Say("ThËt xin lçi! Mçi lÇn ®Æt c­îc chØ ®­îc ®Æt tõ 100, 200, 300, ... xu trë lªn. Kh«ng cho phÐp ®Æt c¸c sè lÎ.",0);
		return
	end
	SubWorld = nSubWorld;
	local nStateMission = GetMissionV(nState);
	local nVSMission = GetMissionV(nVS);
	if (nStateMission ~= 0) then 
		Say("B¸o danh thi ®Êu thÊt b¹i! HiÖn t¹i ®· cã ng­êi b¸o danh thi ®Êu råi, h·y ®îi ®Õn l­ît sau nhÐ!", 0); 
		return 
	end
	local nOldPlayer = PlayerIndex;
	local nTimerCur = GetCurServerTime();
	local szCaptainName = GetName();
		self.InvitePlayer[szCaptainName] = {nAccept=0, nDeny=0};
	local tbCaptainName = {};
	for i = 1, 2 do
		PlayerIndex = GetTeamMember(i) tbCaptainName[i] = GetName();
		PlayerIndex = nOldPlayer;
	end
	for i = 1, 2 do
			PlayerIndex = GetTeamMember(i);
		local szPlayerName = GetName();
			self.TimerWait[szPlayerName] = {nTimer=nTimerCur+TIMER_INVITE,szCaptain=szCaptainName};
		if (PlayerIndex ~= nOldPlayer) then self.TimerWait[szPlayerName] = {nTimer=nTimerCur+TIMER_INVITE,szCaptain=szCaptainName};
			local szTitle = format("<color=green>Th¸ch ®Êu gi÷a chiÕn ®éi <color=cyan>%s<color> vs <color=cyan>%s<color>",tbCaptainName[1],tbCaptainName[2]); 
			szTitle = szTitle.."<enter>"..format("+ H×nh thøc: <color=yellow>%d<color> vs <color=yellow>%d<color>",nCount,nCount); 
			szTitle = szTitle.."<enter>"..format("+ TiÒn c­îc: <color=yellow>%d<color> xu",nMoney); 
			szTitle = szTitle.."<enter>".."B¹n cã d¸m chÊp nhËn lêi th¸ch ®Êu cña ®èi thñ kh«ng?.Xin h·y tr¶ lêi l¹i ®èi thñ trong thêi gian 30 gi©y."; 
			local tbOption = {szTitle};
			local tbOption = {szTitle}; 
				tinsert(tbOption, format("§Êm nã lu«n/#BattleChallenge:AcceptChallenge(%d,%d)",nCount,nMoney)); 
				tinsert(tbOption, "Kh«ng d¸m./#BattleChallenge:DenyBattle()"); 
				CreateTaskSay(tbOption);
				SetTimer(TIMER_FRAME2TIME,MISSION_WAITTIMER);
		else 
			Msg2Player("<color=Orange>§èi ph­¬ng ®ang suy nghÜ cã nªn nhËn lêi th¸ch ®Êu cña ®¹i hiÖp hay kh«ng.Xin h·y kiªn nhÉn chê ®îi trong gi©y l¸t"); 
		end
	end
	PlayerIndex = nOldPlayer;
	SubWorld = nOldWorld;
end

function BattleChallenge:AcceptChallenge(nCount,nMoney)
	StopTimer(MISSION_BETTIMER);
	local nOldPlayer = PlayerIndex;
	local nOldWorld = SubWorld;
	local nMapIndex = MAP_WORLD;
	local nState = MISS_V_STATE;
	local nVS = MISSION_V_VS;
	local szName = MISSION_S_BATTLENAME;
	local nSubWorld = SubWorldID2Idx(nMapIndex);
	local tbKey,szMsg;
	if (CalcEquiproomItemCount(4,417,1,-1) < nMoney) then
		BattleChallenge:DenyBattle();
		Msg2Team(format("Ng­êi ch¬i %s kh«ng ®ñ %d xu, hñy bá ®Æt c­îc!",GetName(),nMoney));
		return
	end
	SubWorld = nSubWorld;
	if (self:AcceptBattle() == 1) then
		local nStateMission = GetMissionV(nState);
		if (nStateMission ~= 0) then 
			Say("B¸o danh thi ®Êu thÊt b¹i! HiÖn t¹i ®· cã ng­êi b¸o danh thi ®Êu råi, h·y ®îi ®Õn l­ît sau nhÐ!", 0);
			return 
		end
		OpenMission(MISSION_ID);
		if (nCount > 1) then
		tbKey = self:GetKey();
			if (tbKey[1]) and (tbKey[2]) then
				SetMissionV(MISSION_V_KEY[1],tbKey[1]);
				SetMissionV(MISSION_V_KEY[2],tbKey[2]);
			end
		end
		
		local szPlayerName = GetName();
		for i = 1, 2 do PlayerIndex = GetTeamMember(i);
		ConsumeEquiproomItem(nMoney,4,417,1,-1);
			local szPlayerName = GetName();
			SetMissionS(MISSION_S_CAPTAINNAME[i],szPlayerName);
			self.PlayerBG[szPlayerName] = {szBG=szPlayerName, nBG=nMoney};
			if (nCount > 1) then 
				Msg2Player(format("M· sè thi ®Êu cña ®éi b¹n lµ <color=green>[%d], <color>h·y göi m· sè nµy ®Õn c¸c thµnh viªn ®Ó tham gia solo",tbKey[i])); 
			end
			PlayerIndex = nOldPlayer;
		end
		local tbCaptainName = self:GetCaptain();
		SetMissionV(MISSION_V_VS,nCount);
		if (nCount > 1) then 
			szMsg1= format("<color=green>%s<color=white>: \nChiÕn ®éi <color=cyan>%s<color=red> vs <color=white>ChiÕn ®éi <color=yellow>%s<color=white>chuÈn bÞ thi ®Êu, sè tiÒn c­îc lµ<color=green> %d xu.<color=white>Thêi gian thi ®Êu <color=yellow>%d<color> phót n÷a",szName,tbCaptainName[1],tbCaptainName[2],nMoney,floor((TIMER_SIGNUP/18)/60));
			AddGlobalNews(szMsg1);
			LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szMsg1, "", "");

		else 
			szMsg2= format("<color=green>%s<color=white>:<color=red>®éi <color=cyan>%s<color> vs <color=red>®éi <color=yellow>%s<color=white>chuÈn bÞ thi ®Êu, sè tiÒn c­îc lµ<color=green> %d xu.<color=white>Thêi gian thi ®Êu <color=yellow>%d<color> phót n÷a",szName,tbCaptainName[1],tbCaptainName[2],nMoney,floor((TIMER_SIGNUP/18)/60)); 
			AddGlobalNews(szMsg2);
			LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szMsg2, "", "");
			SaveLogs("thachdauloidai", format("[%s] | Nh©n VËt (%s) Th¸ch §Êu (%s) |sè tiÒn c­îc lµ (%d) xu",date("%H:%M:%S - %d/%m/%Y"),tbCaptainName[1],tbCaptainName[2],nMoney));

		end
		Msg2SubWorld(szMsg);
	end
	SubWorld = nOldWorld;
end
 
 
function BattleChallenge:OnEnterMatch()
	local nOldPlayer = PlayerIndex;
	local nOldWorld = SubWorld;
	local nMapIndex = MAP_WORLD;
	local nState = MISS_V_STATE;
	local nVS = MISSION_V_VS;
	local szName = MISSION_S_BATTLENAME;
	local nSubWorld = SubWorldID2Idx(nMapIndex);
	local tbCaptainName = self:GetCaptain();
	SubWorld = nSubWorld;
	if (SubWorld <= 0) then
		return
	end
		local nStateMission = GetMissionV(nState);
		local nVSMission = GetMissionV(nVS);
		if (nStateMission ~= 1) then
			Say("RÊt tiÕc! §· hÕt thêi gian vµo khu vùc thi ®Êu, lÇn sau h·y ®Õn sím h¬n tr­íc khi b¾t ®Çu thêi gian thi ®Êu!",0);
			return
		end
		local nStateLag = Forbid:CheckStateForbid();
		if (nStateLag ~= 1) then
			Say("Ng­¬i d¸m c¶ gan ®em thuèc l¾c vµo ®©y sao? Mau cót khái ®©y nhanh lªn!",0);
			return
		end
		local szPlayerName = GetName();
		if (szPlayerName == tbCaptainName[1]) or (szPlayerName == tbCaptainName[2]) then
			BattleChallenge:OnGroup(0);
		else
			if (nVSMission > 1) then
				Say("Xin mêi nhËp m· sè thi ®Êu ®Ó tiÕn vµo khu vùc thi ®Êu.",2,"NhËp m· sè!/#BattleChallenge:OnEnterKey()","Ta kh«ng nhí, ®Ó ta hái ®éi tr­ëng./#BattleChallenge:Cancel()");
			else
				Say("B¹n kh«ng ph¶i lµ tuyÓn thñ lÇn nµy, v× thÕ kh«ng thÓ vµo!",0);
			end
		end
		SubWorld = nOldWorld;
end
function BattleChallenge:OnEnterKey()
	g_AskClientNumberEx(1,10000,"M· sè thi ®Êu:", {self.OnEnterKeyConfirm, {self}});
end

function BattleChallenge:OnEnterKeyConfirm(nKey)
	local nOldPlayer = PlayerIndex;
	local nOldWorld = SubWorld;
	local nMapIndex = MAP_WORLD;
	local nState = MISS_V_STATE;
	local nVS = MISSION_V_VS;
	local szName = MISSION_S_BATTLENAME;
	local nSubWorld = SubWorldID2Idx(nMapIndex);
	SubWorld = nSubWorld;
	if (SubWorld <= 0) then
		return
	end
	if (nKey == GetMissionV(MISSION_V_KEY[1])) then
		BattleChallenge:OnGroup(1);
	elseif (nKey == GetMissionV(MISSION_V_KEY[2])) then
		BattleChallenge:OnGroup(2);
	else
	Say("M· sè thi ®Êu mµ b¹n nhËp vµo kh«ng hîp lÖ, vui lßng liªn hÖ víi <color=red>®éi tr­ëng<color> cña chiÕn ®éi m×nh ®Ó nhËn l¹i m· sè thi ®Êu!",0);
	end
	SubWorld = nOldWorld;
end

function BattleChallenge:OnGroup(nGroup)
	local nOldPlayer = PlayerIndex;
	local nOldWorld = SubWorld;
	local nMapIndex = MAP_WORLD;
	local nState = MISS_V_STATE;
	local nVS = MISSION_V_VS;
	local szName = MISSION_S_BATTLENAME;
	local szPlayerName = GetName();
	local tbCaptainName = self:GetCaptain();
	local nSubWorld = SubWorldID2Idx(nMapIndex);
	SubWorld = nSubWorld;
	local nStateMission = GetMissionV(nState);
	local nVSMission = GetMissionV(nVS);
		if (szPlayerName == tbCaptainName[1]) then
			if (nStateMission ~= 1) then
				BattleChallenge:OnCamp(3);
			else
				BattleChallenge:OnCamp(1);
			end
		elseif (szPlayerName == tbCaptainName[2]) then
			if (nStateMission ~= 1) then
				BattleChallenge:OnCamp(3);
			else
				BattleChallenge:OnCamp(2);
			end
		elseif (nGroup == 1) or (nGroup == 2) then
			local nMasterIndex = SearchPlayer(GetMissionS(nGroup));
			local nMasterNum = 0;
			if (nMasterIndex > 0) then
				if (PIdx2MSDIdx(MISSION_ID,nMasterIndex) > 0) then
					nMasterNum = 1;
				end
				if ((GetMSPlayerCount(MISSION_ID,nGroup) - nMasterNum) < (GetMissionV(MISSION_V_VS) - 1)) then
					BattleChallenge:OnCamp(nGroup);
				else
					Say("Sè ng­êi thi ®Êu hiÖn t¹i cña chiÕn ®éi nµy ®· ®ñ, kh«ng thÓ vµo thªm ®­îc n÷a!",0);
				end
			end
		elseif (nGroup == 3) then
			BattleChallenge:OnCamp(3);
		else
			Say("C¸c h¹ kh«ng ph¶i lµ tuyÓn thñ ®· b¸o danh v× vËy kh«ng thÓ vµo l«i ®µi, xin h·y ®øng ngoµi xem", 0);
		end
	SubWorld = nOldWorld;
end

function BattleChallenge:OnLook() 
		local nOldWorld = SubWorld;
		local nMapIndex = MAP_WORLD;
		local szName = MISSION_S_BATTLENAME;
		local nCheckPotion = self:CheckPotion();
	if (nCheckPotion ~= 0) then 
		Say("Muèn vµo xem thi ®Êu, yªu cÇu ng­êi ch¬i ph¶i bá tÊt c¶ c¸c lo¹i thuèc ra ngoµi, kh«ng ®­îc mang theo trªn ng­êi!",0);
		return
	end
		local nSubWorld = SubWorldID2Idx(nMapIndex);
		SubWorld = nSubWorld;
		local tbCaptainName = self:GetCaptain();
		local szTitle = format("HiÖn t¹i chiÕn ®éi <color=yellow>%s<color> vs <color=yellow>%s<color> ®ang thi ®Êu, ng­¬i cã muèn vµo xem kh«ng?",tbCaptainName[1],tbCaptainName[2]);
		local tbOption = {szTitle};
		tinsert(tbOption,"Ta muèn vµo xem!/#BattleChallenge:OnWatch()");
		tinsert(tbOption,"Th«i ®Ó khi kh¸c./#BattleChallenge:Cancel()");
		CreateTaskSay(tbOption);
	SubWorld = nOldWorld;
end

function BattleChallenge:OnWatch() 
	local nCheckPotion = self:CheckPotion();
	
	if (nCheckPotion ~= 0) then 
		Say("Muèn vµo xem thi ®Êu, yªu cÇu ng­êi ch¬i ph¶i bá tÊt c¶ c¸c lo¹i thuèc ra ngoµi, kh«ng ®­îc mang theo trªn ng­êi!",0);
		return
	end
	
	local nOldWorld = SubWorld;
	local nMapIndex = MAP_WORLD;
	local szName = MISSION_S_BATTLENAME;
	local tbCaptainName = self:GetCaptain();
	local nSubWorld = SubWorldID2Idx(nMapIndex);
	
	if (nSubWorld == -1) then 
		return 
	end
	SubWorld = nSubWorld;
	self:OnGroup(3);
	SubWorld = nOldWorld;
end

function BattleChallenge:GameBet()
	local nOldWorld = SubWorld;
	local nMapIndex = MAP_WORLD;
	local nState = MISS_V_STATE;
	local nVS = MISSION_V_VS;
	local szName = MISSION_S_BATTLENAME;
	local nSubWorld = SubWorldID2Idx(nMapIndex);
	
	if (nSubWorld <= 0) then 
		return 
	end
	
	SubWorld = nSubWorld;
	local nStateMission = GetMissionV(nState);
	local nVSMission = GetMissionV(nVS);
	local tbCaptainName = self:GetCaptain();
	
	if (nStateMission ~= 1) then 
		Say("RÊt tiÕc! Thêi gian ®Æt c­îc ®· hÕt, lÇn sau h·y quay l¹i nhÐ!",0);
		return 
	end
	if (GetTeamSize() ~= 2) then
		Say("Tæ ®éi ®óng 2 ng­êi míi cã thÓ ®Æt c­îc víi nhau!",0);
		return 
	end
	if (IsCaptain() ~= 1) then Say("Ph¶i lµ ®éi tr­ëng míi cã thÓ khëi ®éng ®Æt c­îc!",0);
		return 
	end
	local szTitle = format("Th«ng tin chiÕn ®éi thi ®Êu %s:",szName);
	szTitle = szTitle.."<enter>"..format("+ ChiÕn ®éi thi ®Êu: <color=yellow>%s<color> vs <color=yellow>%s<color>",tbCaptainName[1],tbCaptainName[2]);
	szTitle = szTitle.."<enter>"..format("+ H×nh thøc thi ®Êu: <color=yellow>%d<color> vs <color=yellow>%d<color>",nVSMission,nVSMission);
	local tbOption = {szTitle};
	local szPlayerName = GetName();
	for i = 1, 2 do local szCaptainName = GetMissionS(MISSION_S_CAPTAINNAME[i]);
		tinsert(tbOption, format("§Æt c­îc vµo %s th¾ng/#BattleChallenge:EnterBG([[%s]])",szCaptainName,szCaptainName));
	end
		tinsert(tbOption, "Hñy bá./#BattleChallenge:Cancel()");
		CreateTaskSay(tbOption);
	SubWorld = nOldWorld;
end

function BattleChallenge:EnterBG(szPlayerBet)
	local nIsPlayerBet = self:IsPlayerBet();
		if (nIsPlayerBet == 1) then
			Say("B¹n ®· ®Æt c­îc råi, kh«ng thÓ ®Æt c­îc thªm lÇn n÷a!",0);
			return
		else
			BattleChallenge:CountBG(szPlayerBet);
		end
end

function BattleChallenge:CountBG(szPlayerBet) 
	local nMoney = CalcEquiproomItemCount(4,417,1,-1);
	g_AskClientNumberEx(1,nMoney,"TiÒn ®Æt c­îc:", {self.ConfirmBG,{self,szPlayerBet}});
end

function BattleChallenge:ConfirmBG(szPlayerBet,nMoney) 
	local nOldWorld = SubWorld;
	local nOldPlayer = PlayerIndex;
	local nMapIndex = MAP_WORLD;
	local nState = MISS_V_STATE;
	local nVS = MISSION_V_VS;
	local szName = MISSION_S_BATTLENAME;
	local nLimitMoney = mod(nMoney,100);
		if (nLimitMoney > 0) then 
			Say("ThËt xin lçi! Mçi lÇn ®Æt c­îc chØ ®­îc ®Æt tõ 100, 200, 300, ... xu trë lªn. Kh«ng cho phÐp ®Æt c¸c sè lÎ.",0) 
			return 
		end
		local nSubWorld = SubWorldID2Idx(nMapIndex);
		if (nSubWorld <= 0) then 
			return 
		end
		SubWorld = nSubWorld;
	local nStateMission = GetMissionV(nState);
	local nVSMission = GetMissionV(nVS);
	local tbCaptainName = self:GetCaptain();
	
	if (nStateMission ~= 1) then 
	Say("RÊt tiÕc! Thêi gian ®Æt c­îc ®· hÕt, lÇn sau h·y quay l¹i nhÐ!",0);
		return 
	end
	local szPlayerName = GetName();
	local nIsPlayerBet = self:IsPlayerBet();
	if (nIsPlayerBet == 0) then 
		self.PlayerBG[szPlayerName] = {szBG=szPlayerBet,nBG=nMoney};
		self.InviteBet[szPlayerName] = {nAccept=0,nDeny=0};
		for i = 1, 2 do 
		PlayerIndex = GetTeamMember(i);
		self.TimerBet[GetName()] = {nTimer=GetCurServerTime()+TIMER_INVITEBET,szCaptain=szPlayerName};
		if (PlayerIndex ~= nOldPlayer) then 
		local szTitle = format("<color=white>Tay c¸ c­îc <color=cyan>%s<color=white> ®· ®Æt c­îc vµ ®o¸n chiÕn ®éi <color=green>%s<color=white> sÏ lµ chiÕn ®éi sÏ th¾ng cuéc víi gi¸ c­îc  <color=red>%d xu<color=white>b¹n ph¶i c­îc vµo ng­êi cßn l¹i.!",szPlayerName,szPlayerBet,nMoney);
		local tbOption = {szTitle};
		for k = 1, 2 do 
			local szCaptainName = GetMissionS(MISSION_S_CAPTAINNAME[k]);
			if (self.PlayerBG[szPlayerName].szBG ~= szCaptainName) then 
				tinsert(tbOption, format("§Æt c­îc vµo %s th¾ng/#BattleChallenge:ConfirmPlayerBG(%d,[[%s]])",szCaptainName,nMoney,szCaptainName));
			end
		end
		tinsert(tbOption, "Hñy bá kÌo./#BattleChallenge:DenyBet()");
		CreateTaskSay(tbOption);
		SetTimer(TIMER_FRAME2TIME,MISSION_BETTIMER);
		end
		PlayerIndex = nOldPlayer;
		end
	end
	SubWorld = nOldWorld;
end

function BattleChallenge:ConfirmPlayerBG(nMoney,szPlayerBet)
	local nOldPlayer = PlayerIndex;
	local szPlayerName = GetName();
	local nAcceptBet = self:AcceptBet();
	if (nAcceptBet == 0) then
		Say("RÊt tiÕc! §Æt c­îc lÇn nµy thÊt b¹i, h·y chê ®Õn lÇn ®Æt c­îc tiÕp theo!",0);
		return 
	end
	if (CalcEquiproomItemCount(4,417,1,-1) < nMoney) then 
		BattleChallenge:DenyBet();
		Msg2Team(format("Ng­êi ch¬i %s kh«ng ®ñ %d xu, hñy bá ®Æt c­îc lÇn nµy xin h·y kiÓm tra xu råi c­îc l¹i nÕu cßn kÞp!",szPlayerName,nMoney));
		return 
	end
	
	self.PlayerBG[szPlayerName] = {szBG=szPlayerBet,nBG=nMoney};
	for i = 1, 2 do
		PlayerIndex = GetTeamMember(i);
		ConsumeEquiproomItem(nMoney,4,417,1,-1);
		PlayerIndex = nOldPlayer;
	end
end

function BattleChallenge:IsPlayerBet()
	local szPlayerName = GetName();
	if (self.PlayerBG[szPlayerName]) then
		return 1;
	else
		return 0;
	end
end
