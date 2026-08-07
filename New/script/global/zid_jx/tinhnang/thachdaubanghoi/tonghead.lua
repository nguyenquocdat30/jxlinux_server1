BattleTong = {};
BattleTong.TempData = {};

BattleTong.MoneyMin = 500;
BattleTong.MoneySpace = 500;

BattleTong.PatchData = "\\jxzid\\battletong.ini";
BattleTong.DataSec = "DATA";
BattleTong.ControlSec = "CONTROL";
BattleTong.SecRegister = "Register";
BattleTong.SecKind = "Kind";
BattleTong.SecType = "Type";
BattleTong.SecMem = "Mem";
BattleTong.SecMoney = "Money";
BattleTong.SecCamp1 = "Tong1";
BattleTong.SecCamp2 = "Tong2";

BattleTong.MatchCountList = {50,70,100};
BattleTong.MatchTypeList = {
	{"ChØ dïng Phi tèc, LÖnh bµi", 1},
	{"Kh«ng dïng thuèc bæ trî", 2},
	{"Kh«ng giíi h¹n thuèc", 3},
};
BattleTong.MatchMoneyList = {
	{"TiÒn v¹n",1,"l­îng"},
	{"TiÒn ®ång",2,"xu"},
	{"Kim Nguyªn B¶o",3,"KNB"},
};

BattleTong.ItemList = {
	[157] = "LÖnh bµi",
	[190] = "Phong V©n Phi Tèc hoµn",
	[212] = "Bå c©u",
};

function BattleTong:IsMoney()
	local szTong,nTong = GetTongName();
	local nGiveCash = tonumber(self:GetData(format("%s%s",self.DataSec,1),szTong)) or 0;
	local nGiveCoin = tonumber(self:GetData(format("%s%s",self.DataSec,2),szTong)) or 0;
	local nGiveKNB = tonumber(self:GetData(format("%s%s",self.DataSec,3),szTong)) or 0;
	if (nGiveCash <= 0 and nGiveCoin <= 0 and nGiveKNB <= 0) then
		return 0;
	else
		return 1;
	end;
end;

function BattleTong:CheckItem(nItemIndex)
	local nG,nD,nP = GetItemProp(nItemIndex);
	if (nG == 6) and (nD == 1) then
		if (self.ItemList[nP]) then
			return 1;
		else
			return 0;
		end;
	end;
return 0; end;

function BattleTong:EndGame(nCamp)
	self:LoadData();
	
	local nMem = tonumber(self:GetData(self.ControlSec,self.SecMem)) or 0;
	local nType = tonumber(self:GetData(self.ControlSec,self.SecType)) or 0;
	local nKind = tonumber(self:GetData(self.ControlSec,self.SecKind)) or 0;
	local nRegister = tonumber(self:GetData(self.ControlSec,self.SecRegister)) or 0;
	local nMoney = tonumber(self:GetData(self.ControlSec,self.SecMoney)) or 0;
	local szCamp1 = self:GetData(self.ControlSec,self.SecCamp1);
	local szCamp2 = self:GetData(self.ControlSec,self.SecCamp2);
	
	local nMCamp1 = tonumber(self:GetData(format("%s%s",self.DataSec,nType),self.SecCamp1)) or 0;
	local nMCamp2 = tonumber(self:GetData(format("%s%s",self.DataSec,nType),self.SecCamp2)) or 0;
	
	self:SetData(self.ControlSec,self.SecMem,0);
	self:SetData(self.ControlSec,self.SecType,0);
	self:SetData(self.ControlSec,self.SecKind,0);
	self:SetData(self.ControlSec,self.SecRegister,0);
	self:SetData(self.ControlSec,self.SecMoney,0);
	self:SetData(self.ControlSec,self.SecCamp1,"");
	self:SetData(self.ControlSec,self.SecCamp2,"");
	
	local tbMatchMoneyList = self.MatchMoneyList;

	if (nCamp == 0) then
		self:SetData(format("%s%s",self.DataSec,nKind),szCamp1,(nMoney*0.95) + nMCamp1);
		self:SetData(format("%s%s",self.DataSec,nKind),szCamp2,(nMoney*0.95) + nMCamp2);
		Msg2SubWorld(format("<color=green>Chóc mõng bang héi <color=fire>%s<color> vµ bang héi <color=fire>%s<color> hßa nhau, mçi bªn nhËn ®­îc %s %s!<color>",szCamp1,szCamp2,(nMoney*0.95),tbMatchMoneyList[nKind][3]));
	else
		local szLoseName = "";
		local szWinName = "";
		if (nCamp == 1) then
			szLoseName = szCamp2;
			szWinName = szCamp1;
		else
			szLoseName = szCamp1;
			szWinName = szCamp2;
		end;
		local nGiveAward = (nMoney*2*0.95)+nMCamp2;
		self:SetData(format("%s%s",self.DataSec,nKind),format("%s",szWinName),nGiveAward);
		Msg2SubWorld(format("<color=green>Chóc mõng bang héi <color=fire>%s<color> ®¸nh b¹i bang héi <color=fire>%s<color>, nhËn ®­îc %s %s!<color>",szWinName,szLoseName,(nMoney*2*0.95),tbMatchMoneyList[nKind][3]));
	end;
	
	self:SaveData();
end;

function BattleTong:MoveSignUp()
	local szName = GetTongName();
	if (szName == "") or (not szName) then
		Talk(1,"","Yªu cÇu ng­êi ch¬i ph¶i cã <color=red>bang héi<color> míi cã thÓ vµo ®­îc b¶n ®å nµy!");
	return end;
	
	local tbOption = {"Ng­¬i muèn ®Õn khu vùc b¸o danh cña phe nµo?"};
		tinsert(tbOption, "Phe Tèng/#BattleTong:MoveCamp(1)");
		tinsert(tbOption, "Phe Kim/#BattleTong:MoveCamp(2)");
	CreateTaskSay(tbOption);
end;

function BattleTong:MoveCamp(nCamp)
	if (nCamp == 1) then
		NewWorld( 989, 1541, 3178);
		DisabledUseTownP(0);
		Msg2Player("B¹n ®· ®Õn n¬i b¸o danh ChiÕn tr­êng Bang Héi phe Tèng!");
	else
		NewWorld( 989, 1570, 3085);
		DisabledUseTownP(0);
		Msg2Player("B¹n ®· ®Õn n¬i b¸o danh ChiÕn tr­êng Bang Héi phe Kim!");
	end;
end;

function BattleTong:GetBattleTong(nTong)
	local szTong = self:GetData(self.ControlSec,format("Tong%s",nTong));
return szTong; end;

function BattleTong:GetBattleType()
	local nType = tonumber(self:GetData(self.ControlSec,self.SecType));
	if (not nType) then nType = 0; end;
return nType; end;

function BattleTong:CheckMoney(nKind,nMoney)
	local nNum = 0;
	if (nKind == 1) then
		if (GetCash() < nMoney) then
			return 0;
		end;
	elseif (nKind == 2) then
		if (CalcEquiproomItemCount(4,417,1,-1) < nMoney) then
			return 0;
		end;
	elseif (nKind == 3) then
		if (CalcEquiproomItemCount(4,343,1,-1) < nMoney) then
			return 0;
		end;
	end;
return 1; end;

function BattleTong:CalcMoney(nKind)
	local nNum = 0;
	if (nKind == 1) then
		nNum = GetCash();
	elseif (nKind == 2) then
		nNum = CalcEquiproomItemCount(4,417,1,-1);
	elseif (nKind == 3) then
		nNum = CalcEquiproomItemCount(4,343,1,-1);
	end;
return nNum; end;

function BattleTong:LoadTeamTong()
	local tbTemp = {};
	local nOldPlayer = PlayerIndex;
	for i = 1, 2 do
		PlayerIndex = GetTeamMember(i);
			local szTong = GetTongName();
			tbTemp[getn(tbTemp)+1] = szTong;
		PlayerIndex = nOldPlayer;
	end;
return tbTemp; end;

function BattleTong:CheckRegisterTong()
	local nOldPlayer = PlayerIndex;
	for i = 1, 2 do
		PlayerIndex = GetTeamMember(i);
			local szName = GetName();
			local szTong, nTong = GetTongName();
			if (nTong == 0 ) then
				return 0,szName,szTong;
			end;
			if (self.TempData[szTong]) then
				return 0,szName,szTong;
			end;
		PlayerIndex = nOldPlayer;
	end;
return 1; end;

function BattleTong:CheckTeamTong()
	local nOldPlayer = PlayerIndex;
	for i = 1, 2 do
		PlayerIndex = GetTeamMember(i);
			_,nID = GetTongName();
			if (nID == 0) then
				return 0;
			end;
		PlayerIndex = nOldPlayer;
	end;
return 1; end;

function BattleTong:CheckTeamMaster()
	local nOldPlayer = PlayerIndex;
	local nIs = 0;
	for i = 1, 2 do
		PlayerIndex = GetTeamMember(i);
			local _,nID = GetTongName();
			if (TONGM_GetFigure(nID,GetName()) ~= 0) then
				return 0;
			end;
		PlayerIndex = nOldPlayer;
	end;
return 1; end;

function BattleTong:CheckPlayerAround()
	local nOldPlayer = PlayerIndex;
	local nTeamSize = GetTeamSize();
	local nNpcIndex = GetLastDlgNpc();
	
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i);
			local szName = GetName();
			local szTong = GetTongName();
			local nState = self:GetPlayerAround(nNpcIndex,szName);
			if (nState == 0) then
				Msg2Team(format("Bang chñ %s [%s] ®· ®i ®©u mÊt tiªu råi, h·y mau ®Õn chç cña ®éi tr­ëng mau nµo!",szName,szTong));
				return 0;
			end;
		PlayerIndex = nOldPlayer;
	end;
return 1; end;

function BattleTong:GetPlayerAround(nNpcIndex,szName)
	local nOldPlayer = PlayerIndex;
	local tbAround,nCount = GetNpcAroundPlayerList(nNpcIndex,15);
	for i = 1, nCount do
		PlayerIndex = tbAround[i];
			if (GetName() == szName) then
				return 1;
			end;
		PlayerIndex = nOldPlayer;
	end;
return 0; end;

function BattleTong:CheckStateRegister()
	local nValue = tonumber(self:GetData(self.ControlSec,self.SecRegister));
	if (not nValue) then
		nValue = 0;
	end;
return nValue; end;

function BattleTong:SetData(szSec,szKey,nValue)
	IniFile_SetData(self.PatchData,szSec,szKey,nValue);
end;

function BattleTong:SaveData()
	IniFile_Save(self.PatchData,self.PatchData);
end;

function BattleTong:GetData(szSec,szKey)
	local nValue = IniFile_GetData(self.PatchData,szSec,szKey);
return nValue; end;

function BattleTong:LoadData()
	local nLoad = IniFile_Load(self.PatchData,self.PatchData);
	if (nLoad ~= 1) then
		File_Create(self.PatchData);
	end;
end;

function BattleTong:IsActivity()
	local nTime = tonumber(date("%H%M"));
	-- if (nTime >= 0800) and (nTime <= 2000) then
		return 1;
	-- else
		-- return 0;
	-- end
end;