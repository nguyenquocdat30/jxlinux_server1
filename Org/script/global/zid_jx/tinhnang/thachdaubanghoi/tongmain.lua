IncludeLib("TONG");
Include("\\script\\lib\\awardtemplet.lua");
-- Include("\\script\\tnlteam\\lib\\awardex.lua");
Include("\\script\\global\\zid_jx\\tinhnang\\thachdaubanghoi\\tonghead.lua");

function main()
BattleTong:DialogMain()
end


function BattleTong:DialogMain()
	local nActivity = self:IsActivity();
	if (nActivity == 0) then
		Say("HiÖn t¹i ch­a ®Õn giê b¸o danh <color=yellow>Th¸ch ®Êu Bang Héi<color>, vui lßng ®îi th«ng b¸o råi h·y ®Õn nhÐ!");
	return 0; end;
	
	self:LoadData();
	
	local nStateReg = self:CheckStateRegister();
	if (nStateReg ~= 0) then
		Say("RÊt tiÕc b¹n ®· ®Õn trÔ råi, hiÖn t¹i chiÕn tr­êng ®· cã bang héi b¸o danh råi!",2,"Reset/#BattleTong:Reset()","§ãng./no");
	return 0; end;
	
	local nCaptain = IsCaptain();
	if (nCaptain ~= 1) then
		Say("B¹n ph¶i lµ ®éi tr­êng vµ trong tæ ®«i ph¶i ®óng 2 ng­êi th× míi cã thÓ b¸o danh!")
	return 0; end;
	
	local nTeamSize = GetTeamSize();
	if (nTeamSize ~= 2) then
		Say("B¹n ph¶i lµ ®éi tr­êng vµ trong tæ ®«i ph¶i ®óng 2 ng­êi th× míi cã thÓ b¸o danh!")
	end;
	
	local nTeamTong = self:CheckTeamTong();
	if (nTeamTong ~= 1) then
		Say("Thµnh viªn trong tæ ®éi b¹n ch­a cã <color=red>bang héi<color>!")
	return 0; end;
	
	local nTeamMaster = self:CheckTeamMaster();
	if (nTeamMaster ~= 1) then
		Say("Trong tæ ®éi b¹n cã 1 thµnh viªn kh«ng ph¶i lµ <color=red>bang chñ<color>!");
	return 0; end;
	
	local nPlayerAround = self:CheckPlayerAround();
	if (nPlayerAround ~= 1) then
		return 0;
	end;
	
	local nRegTong,szName,szTong = self:CheckRegisterTong();
	if (nRegTong ~= 1) then
		Say(format("Bang chñ <color=yellow>%s<color> cña bang héi <color=yellow>%s<color> ®· b¸o danh tr­íc ®ã råi, h·y t×m bang héi kh¸c ®i!",szName,szTong));
	return 0; end;
	
	tbTeamTong = self:LoadTeamTong();
	local szTitle = format("Tr­íc tiªn, b¹n h·y chän sè l­îng thµnh viªn mçi bªn cÇn tham gia:",tbTeamTong[1],tbTeamTong[2]);
	szTitle = szTitle..format("\n+ Bang héi tham gia: <color=yellow>%s<color> vs <color=yellow>%s<color>",tbTeamTong[1],tbTeamTong[2]);
	
	local tbOption = {szTitle};
	local tbMatchCountList = self.MatchCountList;
	if (getn(tbMatchCountList) > 0) then
		for i = 1, getn(tbMatchCountList) do
			tinsert(tbOption, format("%s vs %s/#BattleTong:SetupCount(%d)",tbMatchCountList[i],tbMatchCountList[i],tbMatchCountList[i]));
		end;
	end;
		tinsert(tbOption, "§ãng./no");
	CreateTaskSay(tbOption);
end;

function BattleTong:SetupCount(nCount)
	local szTitle = "TiÕp theo, mêi b¹n chän h×nh thøc cña trËn ®Êu:";
	szTitle = szTitle..format("\n+ Bang héi tham gia: <color=yellow>%s<color> vs <color=yellow>%s<color>",tbTeamTong[1],tbTeamTong[2]);
	szTitle = szTitle..format("\n+ Thµnh viªn mçi bªn: <color=yellow>%s<color> ng­êi",nCount);
	local tbOption = {szTitle};
	local tbMatchTypeList = self.MatchTypeList;
	if (getn(tbMatchTypeList) > 0) then
		for i = 1, getn(tbMatchTypeList) do
			tinsert(tbOption, format("%s/#BattleTong:SetupType(%d,%d)",tbMatchTypeList[i][1],nCount,i));
		end;
	end;
		tinsert(tbOption, "§ãng./no");
	CreateTaskSay(tbOption);
end;

function BattleTong:SetupType(nCount,nType)
	local tbMatchTypeList = self.MatchTypeList;
	local szTitle = "B©y giê, mêi b¹n chän h×nh thøc cña trËn ®Êu:";
	szTitle = szTitle..format("\n+ Bang héi tham gia: <color=yellow>%s<color> vs <color=yellow>%s<color>",tbTeamTong[1],tbTeamTong[2]);
	szTitle = szTitle..format("\n+ Thµnh viªn mçi bªn: <color=yellow>%s<color> ng­êi",nCount);
	szTitle = szTitle..format("\n+ H×nh thøc trËn chiÕn: <color=yellow>%s<color>",tbMatchTypeList[nType][1]);
	local tbOption = {szTitle};
	local tbMatchMoneyList = self.MatchMoneyList;
	if (getn(tbMatchMoneyList) > 0) then
		for i = 1, getn(tbMatchMoneyList) do
			tinsert(tbOption, format("%s/#BattleTong:SetupMoney(%d,%d,%d)",tbMatchMoneyList[i][1],nCount,nType,i));
		end;
	end;
		tinsert(tbOption, "§ãng./no");
	CreateTaskSay(tbOption);
end;

function BattleTong:SetupMoney(nCount,nType,nKind)
	local tbMatchMoneyList = self.MatchMoneyList;
	local nMoney = self:CalcMoney(nKind);
	local nBaseMoney = self.MoneyMin;
	local nMoneyMin = nBaseMoney;
	if (nKind == 1) then
		nMoneyMin = nMoneyMin*10000;
	end;
	if (nMoney < nMoneyMin) then
		Say(format("Tèi thiÓu ph¶i ®ñ %d %s trë lªn míi cã thÓ b¸o danh <color=red>Th¸ch ®Êu Bang Héi<color>!",nMoneyMin,tbMatchMoneyList[nKind][3]));
	return 0; end;
	
	g_AskClientNumberEx(nMoneyMin,nMoney,"NhËp sè tiÒn:", {self.SetupConfirm,{self,nCount,nType,nKind}});
end;

function BattleTong:SetupConfirm(nCount,nType,nKind,nMoney)
	local tbMatchMoneyList = self.MatchMoneyList;
	local nCheckMoney = self:CheckMoney(nKind,nMoney);
	if (nCheckMoney == 0) then
		Say(format("B¹n kh«ng mang theo ®ñ %d %s ®Ó tham gia b¸o danh!",nMoney,tbMatchMoneyList[nType][3]));
	return 0; end;
	
	if (mod(nMoney,self.MoneySpace) ~= 0) then
		Say(format("TiÒn ®Æt c­îc chØ cho chÐp ®Æt c¸ch nhau <color=red>%d %s<color> vµ <color=red>ch½n tiÒn<color>. Kh«ng nhËn tiÒn lÎ!",self.MoneySpace,tbMatchMoneyList[nType][3]));
	return 0; end;
	
	local tbMatchTypeList = self.MatchTypeList;
	local tbMatchMoneyList = self.MatchMoneyList;
	local szTitle = "Mêi b¹n x¸c nhËn l¹i th«ng tin võa b¸o danh:";
	szTitle = szTitle..format("\n+ Bang héi tham gia: <color=yellow>%s<color> vs <color=yellow>%s<color>",tbTeamTong[1],tbTeamTong[2]);
	szTitle = szTitle..format("\n+ Thµnh viªn mçi bªn: <color=yellow>%s<color> ng­êi",nCount);
	szTitle = szTitle..format("\n+ H×nh thøc trËn chiÕn: <color=yellow>%s<color>",tbMatchTypeList[nType][1]);
	szTitle = szTitle..format("\n+ Sè tiÒn ®Æt c­îc: <color=yellow>%d %s<color>",nMoney,tbMatchMoneyList[nKind][3]);
	local tbOption = {szTitle};
		tinsert(tbOption, format("X¸c nhËn! Göi yªu cÇu cho ®èi thñ./#BattleTong:PlayerConfirm(%d,%d,%d,%d)",nCount,nType,nKind,nMoney));
		tinsert(tbOption, "Hñy bá./no");
	CreateTaskSay(tbOption);
end;

function BattleTong:PlayerConfirm(nCount,nType,nKind,nMoney)
	
	local tbMatchTypeList = self.MatchTypeList;
	local tbMatchMoneyList = self.MatchMoneyList;
	
	local nOldPlayer = PlayerIndex;
	local szMaster1 = GetName();
	local szTong1 = GetTongName();
	Msg2Player("§· göi lêi mêi th¸ch ®Êu ®Õn ®èi thñ, vui lßng ®îi ®èi thñ ph¶n håi!");
	
	for i = 1, 2 do
		PlayerIndex = GetTeamMember(i);
			local szMaster2 = GetName();
			local szTong2 = GetTongName();
			if (PlayerIndex ~= nOldPlayer) then
				local tbMatchMoneyList = self.MatchMoneyList;
				local nCheckMoney = self:CheckMoney(nKind,nMoney);
				if (nCheckMoney == 0) then
					PlayerIndex = nOldPlayer;
					Msg2Team(format("<color=green>Bang chñ <color=yellow>%s<color> bang héi <color=yellow>%s<color> kh«ng mang theo ®ñ <color=red>%d %s<color> ®Ó tham gia b¸o danh, vui lßng thö l¹i sau!<color>",szMaster2,szTong2,nMoney,tbMatchMoneyList[nType][3]));
					Say(format("Bang chñ <color=yellow>%s<color> bang héi <color=yellow>%s<color> kh«ng mang theo ®ñ <color=red>%d %s<color> ®Ó tham gia b¸o danh, vui lßng thö l¹i sau!",szMaster2,szTong2,nMoney,tbMatchMoneyList[nType][3]));
				return 0; end;
			
				local szTitle = format("Lêi mêi th¸ch ®Êu bang héi tõ bang chñ %s bang héi %s, b¹n cã muèn cïng th¸ch ®Êu víi bang nµy kh«ng?",szMaster1,szTong1);
				szTitle = szTitle..format("\n+ Bang héi tham gia: <color=yellow>%s<color> vs <color=yellow>%s<color>",tbTeamTong[1],tbTeamTong[2]);
				szTitle = szTitle..format("\n+ Thµnh viªn mçi bªn: <color=yellow>%s<color> ng­êi",nCount);
				szTitle = szTitle..format("\n+ H×nh thøc trËn chiÕn: <color=yellow>%s<color>",tbMatchTypeList[nType][1]);
				szTitle = szTitle..format("\n+ Sè tiÒn ®Æt c­îc: <color=yellow>%d %s<color>",nMoney,tbMatchMoneyList[nKind][3]);
				local tbOption = {szTitle};
					tinsert(tbOption, format("X¸c nhËn! Göi yªu cÇu cho ®èi thñ./#BattleTong:BattleConfirm(%d,%d,%d,%d)",nCount,nType,nKind,nMoney));
					tinsert(tbOption, "Hñy bá./no");
				CreateTaskSay(tbOption);
			end;
		PlayerIndex = nOldPlayer;
	end;
end;

function BattleTong:BattleConfirm(nCount,nType,nKind,nMoney)	
	local nStateReg = self:CheckStateRegister();
	if (nStateReg ~= 0) then
		Say("RÊt tiÕc b¹n ®· ®Õn trÔ råi, hiÖn t¹i chiÕn tr­êng ®· cã bang héi b¸o danh råi!");
	return 0; end;
	
	local tbMatchTypeList = self.MatchTypeList;
	local tbMatchMoneyList = self.MatchMoneyList;
	local nOldPlayer = PlayerIndex;
	local nNum = 0;
	for i = 1, 2 do
		PlayerIndex = GetTeamMember(i);
			local szMaster = GetName();
			local szTong = GetTongName();
			local nCheckMoney = self:CheckMoney(nKind,nMoney);
			if (nCheckMoney == 0) then
				Msg2Team(format("<color=green>Bang chñ <color=yellow>%s<color> bang héi <color=yellow>%s<color> kh«ng mang theo ®ñ <color=red>%d %s<color> ®Ó tham gia b¸o danh, vui lßng thö l¹i sau!<color>",szMaster,szTong,nMoney,tbMatchMoneyList[nType][3]));
			else
				nNum = nNum + 1;
			end;
		PlayerIndex = nOldPlayer;
	end;
	if (nNum ~= 2) then
		return 0;
	end;
	
	for i = 1, 2 do
		PlayerIndex = GetTeamMember(i);
			if (nKind == 1) then
				Pay(nMoney);
			elseif (nKind == 2) then
				ConsumeEquiproomItem(nMoney,4,417,1,-1);
			elseif (nKind == 3) then
				ConsumeEquiproomItem(nMoney,4,343,1,-1);
			end;
		PlayerIndex = nOldPlayer;
	end;
	
	Msg2SubWorld(format("<color=green>Cuéc thach ®Êu gi÷a bang héi <color=yellow>%s<color> vs bang héi <color=yellow>%s<color> ®· ®­îc b¸o danh hoµn tÊt, c¸c thµnh viªn cña 2 bang chó ý ®Ó ®Õn tham gia!<color>",tbTeamTong[1],tbTeamTong[2]));
	local szMsg = "<color=green>Th«ng tin vÒ cuéc th¸ch ®Êu:";
	szMsg = szMsg..format("\n+ Thµnh viªn mçi bªn: %s ng­êi",nCount);
	szMsg = szMsg..format("\n+ H×nh thøc trËn ®Êu: %s",tbMatchTypeList[nType][1]);
	szMsg = szMsg..format("\n+ Sè tiÒn ®Æt c­îc: %s %s",nMoney,tbMatchMoneyList[nKind][3]);
	szMsg = szMsg.."<color>";
	Msg2SubWorld(szMsg);
		self:SetData(self.ControlSec,self.SecMem,nCount);
		self:SetData(self.ControlSec,self.SecType,nType);
		self:SetData(self.ControlSec,self.SecKind,nKind);
		self:SetData(self.ControlSec,self.SecMoney,nMoney);
		self:SetData(self.ControlSec,self.SecRegister,1);
		self:SetData(self.ControlSec,self.SecCamp1,tbTeamTong[1]);
		self:SetData(self.ControlSec,self.SecCamp2,tbTeamTong[2]);
		self:SaveData();
	SaveNow();
end;

function BattleTong:GiveAward()
	local szName =  GetName();
	local szTong,nTong = GetTongName();
	local nGiveCash = tonumber(self:GetData(format("%s%s",self.DataSec,1),szTong)) or 0;
	local nGiveCoin = tonumber(self:GetData(format("%s%s",self.DataSec,2),szTong)) or 0;
	local nGiveKNB = tonumber(self:GetData(format("%s%s",self.DataSec,3),szTong)) or 0;

	if (TONGM_GetFigure(nTong,szName) ~= 0) then
		Say(format("B¹n kh«ng ph¶i lµ <color=red>bang chñ<color> cña bang héi <color=fire>%s<color>, kh«ng thÓ nhËn tiÒn th­ëng.",szTong));
	return end;
	if (nGiveCash <= 0 and nGiveCoin <= 0 and nGiveKNB <= 0) then
		Say("Ng­¬i ®Þnh lõa ta µ, lµm g× cã tiÒn th­ëng mµ nhËn.");
	return end;
	
	local szTitle = "B¹n cã ch¾c ch¾n muèn nhËn tiÒn th­ëng nµy kh«ng?";
	if (nGiveCash > 0) then
		szTitle = szTitle..format("\n+ TiÒn v¹n: <color=yellow>%s<color> l­îng",nGiveCash);
	end;
	if (nGiveCoin > 0) then
		szTitle = szTitle..format("\n+ TiÒn ®ång: <color=yellow>%s<color> xu",nGiveCoin);
	end;
	if (nGiveKNB > 0) then
		szTitle = szTitle..format("\n+ Kim Nguyªn B¶o: <color=yellow>%s<color> KNB",nGiveKNB);
	end;
	
	Say(szTitle,2,format("§ång ý!/#BattleTong:GiveConfirm(%d,%d,%d)",nGiveCash,nGiveCoin,nGiveKNB),"Hñy bá./no");
end;

function BattleTong:GiveConfirm(nCountCash,nCountCoin,nCountKNB)
	local szName =  GetName();
	local szTong,nTong = GetTongName();
	if (CalcFreeItemCellCount() < 5) then
		Say("Hµng trang kh«ng ®ñ 50 « trèng ®Ó nhËn tiÒn th­ëng, vui lßng s¾p xÕp l¹i hµnh trang tr­íc khi nhËn tiÒn th­ëng!");
	return end;
	if (nCountCash > 0) then
		Earn(nCountCash);
		self:SetData(format("%s%s",self.DataSec,1),szTong,0);
		Msg2Tong(nTong,format("Chóc mõng bang chñ <color=fire>%s<color> nhËn ®­îc %s l­îng tõ tiÒn th­ëng th¾ng cuéc cña Th¸ch §Êu Bang Héi!",szName,nCountCash));
	end;
	if (nCountCoin > 0) then
		AwardEx:GiveSure({szName="TiÒn §ång", tbProp={4,417,1,0,0,0}, nCount=nCountCoin});
		self:SetData(format("%s%s",self.DataSec,2),szTong,0);
		Msg2Tong(nTong,format("Chóc mõng bang chñ <color=fire>%s<color> nhËn ®­îc %s xu tõ tiÒn th­ëng th¾ng cuéc cña Th¸ch §Êu Bang Héi!",szName,nCountCoin));
	end;
	if (nCountKNB > 0) then
		AwardEx:GiveSure({szName="TiÒn §ång", tbProp={4,343,1,0,0,0}, nCount=nCountKNB});
		self:SetData(format("%s%s",self.DataSec,3),szTong,0);
		Msg2Tong(nTong,format("Chóc mõng bang chñ <color=fire>%s<color> nhËn ®­îc %s KNB tõ tiÒn th­ëng th¾ng cuéc cña Th¸ch §Êu Bang Héi!",szName,nCountKNB));
	end;
	self:SaveData();
	SaveNow();
end;

function BattleTong:JoinBattle(nCamp)
	local nOldSubWorld = SubWorld;
	local szTong,nTong = GetTongName();
	local nBattleState = tonumber(self:GetData(self.ControlSec,self.SecRegister));
	if (not nBattleState) or (nBattleState == 0) then
		Say("Kh«ng cã bang héi nµo b¸o danh th¸ch ®Êu, v× thÕ trËn chiÕn lÇn nµy bÞ hñy bá!");
	return 0; end;
	
	local szCamp = self:GetData(self.ControlSec,format("Tong%s",nCamp));
	if (not szCamp) or (szCamp == "") then
		print("§· s¶y ra lçi khi load d÷ liÖu, vui lßng GM kiÓm tra l¹i!");
	return 0; end;
	
	SubWorld = SubWorldID2Idx(WORLD_MAPID);
	local nMapId = BT_GetGameData(GAME_MAPID);
	if (nMapId  > 0) then
		SubWorld = SubWorldID2Idx(nMapId);
			if (szCamp ~= szTong) then
				Say(format("Khu vùc nµy chØ cã thµnh viªn bang héi <color=yellow>%s<color> míi cã thÓ vµo ®­îc, b¹n kh«ng ph¶i lµ thµnh viªn cña bang héi nµy!",szCamp));
			return 0; end;
			
			local nMax = tonumber(self:GetData(self.ControlSec,self.SecMem));
			if (nMax) and (nMax > 0) then
				local nCount = GetMSPlayerCount(BT_GetGameData(GAME_RULEID), nCamp);
				if (nCount >= nMax) then
					Say(format("TrËn ®Êu nµy chØ cho phÐp mçi bªn chØ ®­îc tham gia %d ng­êi mµ th«i!",nMax));
				return 0; end;
			end;
		SubWorld = nOldSubWorld;
	else
		return 0;
	end;
return 1; end;

function BattleTong:GetTitle()
	local nMem = tonumber(self:GetData(self.ControlSec,self.SecMem));
	local nType = tonumber(self:GetData(self.ControlSec,self.SecType));
	local nKind = tonumber(self:GetData(self.ControlSec,self.SecKind));
	local nMoney = tonumber(self:GetData(self.ControlSec,self.SecMoney));
	local nRegister = tonumber(self:GetData(self.ControlSec,self.SecRegister));
	local szCamp1 = self:GetData(self.ControlSec,self.SecCamp1);
	local szCamp2 = self:GetData(self.ControlSec,self.SecCamp2);
	
	local tbMatchTypeList = self.MatchTypeList;
	local tbMatchMoneyList = self.MatchMoneyList;
	
	local szTitle = "";
	szTitle = szTitle..format("\n+ Bang héi th¸ch ®Êu: <color=yellow>%s<color> (T) vs <color=yellow>%s<color> (K)",szCamp1,szCamp2);
	szTitle = szTitle..format("\n+ Thµnh viªn mçi bªn: <color=yellow>%s ng­êi<color>",nMem);
	szTitle = szTitle..format("\n+ H×nh thøc trËn ®Êu: <color=yellow>%s<color>",tbMatchTypeList[nType][1]);
	szTitle = szTitle..format("\n+ Sè tiÒn ®Æt c­îc: <color=yellow>%d %s<color>",nMoney,tbMatchMoneyList[nKind][3]);
return szTitle; end;

function BattleTong:Reset()
	self:SetData(self.ControlSec,self.SecMem,0);
	self:SetData(self.ControlSec,self.SecType,0);
	self:SetData(self.ControlSec,self.SecKind,0);
	self:SetData(self.ControlSec,self.SecMoney,0);
	self:SetData(self.ControlSec,self.SecRegister,0);
	self:SetData(self.ControlSec,self.SecCamp1,"");
	self:SetData(self.ControlSec,self.SecCamp2,"");
	self:SaveData();
end;