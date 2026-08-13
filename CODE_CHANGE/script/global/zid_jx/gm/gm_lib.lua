
INFORMATION_DEVELOPER = "\n-----------------------------------------------------\n* <color=green>Mäi chi tiÕt xin liªn hÖ:<color>\n\t\t+ Sè ®iÖn tho¹i: 0337 917 310 (JxZid)\n\t\t+ Facebook: fb.com/jxzid\n\t\t+ Trang Chñ: Jxzid.net"

TASKTEMP_LOGIN_LBGM = 250;
TASKTEMP_KICKOUT = 1;
FRAME2TIME = 18;
TIMETASK_ID = 115;
TASKS_LOCKSYSTEM = 1;
TASKS_GETITEM = 2;
TIMER_KICKOUT = 5; --Thêi gian kick khái game, mÆc ®Þnh lµ 5s

TAB_LIST_GAMEMASTER = {
	{
		Account = "admin",
		Player = {"GameMaster", "", ""},
		Password = "230893",
		Rank = 1,
	},
	
	{
		Account = "gm02",
		Player = {"GameMaster02", "", ""},
		Password = "12302",
		Rank = 1,
	},
	
	{
		Account = "gm03",
		Player = {"GameMaster03", "", ""},
		Password = "12303",
		Rank = 1,
	},
	
	{
		Account = "gm04",
		Player = {"GameMaster04", "", ""},
		Password = "12304",
		Rank = 1,
	},
	
	{
		Account = "gm05",
		Player = {"GameMaster05", "", ""},
		Password = "12305",
		Rank = 1,
	},
};

TAB_LINKFILEDATA = {
	[1] = {"\\jxzid\\lockplayer.log", "LOCK_PLAYER"},
	[2] = {"\\jxzid\\lockaccount.log","LOCK_ACCOUNT"},
};

TAB_LISTCAMP = {
	[0] = "chuyÓn sang mµu PK LuyÖn C«ng thµnh c«ng!",
	[1] = "chuyÓn sang mµu PK ChÝnh Ph¸i thµnh c«ng!",
	[2] = "chuyÓn sang mµu PK Tµ Ph¸i thµnh c«ng!",
	[3] = "chuyÓn sang mµu PK Trung LËp thµnh c«ng!",
	[4] = "chuyÓn sang mµu PK S¸t Thñ thµnh c«ng!",
	[5] = "chuyÓn sang mµu PK GM thµnh c«ng!",
};

TAB_RANKID = {
	[1] = "Administrator",
	[2] = "GameMaster",
};

TestGM = {};
function AddAllItem()
TestGM:MenuSupportItems()
end
function TestGM:MenuSupportItems()
	local tbVatPhamKhac = TABLIST_ITEM_KHAC;
	local tbVatPhamCayCuoc = TABLIST_ITEM_CAYCUOC;
	local tbVatPhamHoatDong = TABLIST_ITEM_HOATDONG;
	local szTitle = "GM muèn nhËn vËt phÈm nµo?";
	local tbOption = {};
		tinsert(tbOption,{"<#> S¸ch kü n¨ng 90",							self.MenuBook90,{self}});
		tinsert(tbOption,{"<#> Kho¸ng Th¹ch Ðp §å",							self.KhoangThach,{self}});
		tinsert(tbOption,{"<#> VËt phÈm hç trî kh¸c",						self.MenuGive,{self,tbVatPhamKhac,1}});
		tinsert(tbOption,{"<#> VËt phÈm hç trî cµy cuèc",					self.MenuGive,{self,tbVatPhamCayCuoc,1}});
		tinsert(tbOption,{"<#> VËt phÈm tham gia ho¹t ®éng",				self.MenuGive,{self,tbVatPhamHoatDong,1}});
		tinsert(tbOption,{"§ãng"});
	CreateNewSayEx(szTitle,tbOption);
end;

function TestKhoangThach()
TestGM:KhoangThach()
end
function TestGM:KhoangThach()
	local szTitle = "GM muèn nhËn vËt phÈm nµo?";
	local tbOption = {};
		tinsert(tbOption,{"<#> §¸ HiÖn",							self.MenuGive,{self,TABLIST_ITEM_DAHien,1}});
		tinsert(tbOption,{"<#> §¸ Èn",							self.MenuGive,{self,TABLIST_ITEM_DAAN,1}});
		tinsert(tbOption,{"<#> HuyÒn Tinh Kho¸ng Th¹ch",							self.MenuGive,{self,TABLIST_ITEM_HT,1}});
		tinsert(tbOption,{"<#> Thuû Tinh",							self.MenuGive,{self,TABLIST_ITEM_ThuyTinh,1}});
		tinsert(tbOption,{"§ãng"});
	CreateNewSayEx(szTitle,tbOption);
end;

function TestGM:MenuBook90()
	local szTitle = "GM muèn nhËn vËt phÈm nµo?";
	local tbOption = {};
		tinsert(tbOption,{"<#> S¸ch kü n¨ng 90 (cÊp 21)",							self.MenuGive,{self,TAB_LISTITEM_BOOK90LEVEL21,1}});
		tinsert(tbOption,{"<#> S¸ch kü n¨ng 90 (cÊp 22)",							self.MenuGive,{self,TAB_LISTITEM_BOOK90LEVEL22,1}});
		tinsert(tbOption,{"<#> S¸ch kü n¨ng 90 (cÊp 23)",							self.MenuGive,{self,TAB_LISTITEM_BOOK90LEVEL23,1}});
		tinsert(tbOption,{"<#> S¸ch kü n¨ng 90 (cÊp 24)",							self.MenuGive,{self,TAB_LISTITEM_BOOK90LEVEL24,1}});
		tinsert(tbOption,{"<#> S¸ch kü n¨ng 90 (cÊp 25)",							self.MenuGive,{self,TAB_LISTITEM_BOOK90LEVEL25,1}});
		tinsert(tbOption,{"§ãng"});
	CreateNewSayEx(szTitle,tbOption);
end;

function TestGM:MenuGive(tbItemList,nPage)
	local nItemList = getn(tbItemList);
	local tbOption = {};
	local nPageMax = 10;
	nPage = nPage or 1;
	if (nPage > 1) then
		tinsert(tbOption,{"Trang tr­íc",self.MenuGive,{self,tbItemList,(nPage-1)}});
	end
	if (nItemList <= (nPageMax*nPage)) then
		for i = (nPageMax*(nPage-1)+1), nItemList do
			local szName = tbItemList[i].szName;
			local nCount = tbItemList[i].nCount or 1;
			tinsert(tbOption,{format("%s (sè l­îng %d)",szName,nCount),self.GiveConfirm,{self,tbItemList,i}});
		end;
	else
		for i = (nPageMax*(nPage-1)+1), (nPageMax*nPage) do
			local szName = tbItemList[i].szName;
			local nCount = tbItemList[i].nCount or 1;
			tinsert(tbOption,{format("%s (sè l­îng %d)",szName,nCount),self.GiveConfirm,{self,tbItemList,i}});
		end
		tinsert(tbOption,{"Trang sau",self.MenuGive,{self,tbItemList,(nPage+1)}});
	end;
		tinsert(tbOption, {"KÕt thóc ®èi tho¹i."});
	CreateNewSayEx("GM h·y chän vËt phÈm cÇn lÊy",tbOption);
end;

function TestGM:GiveConfirm(tbItemList,nIndex)
	TestGM:GiveAn(tbItemList[nIndex],1);
end;

function TestGM:GiveAn(tbAward,nAwardCount)
	if (not tbAward) then
		return 0;
	end;
	local nCheckRoom = self:CheckRoom(tbAward,nAwardCount);
	if (nCheckRoom ~= 1) then
		return -1;
	end;
	nAwardCount = nAwardCount or 1;
	if (type(tbAward[1]) == "table") then
		local nResult = self:GetAnRandom(tbAward,nAwardCount);
		if (nResult == 0) then
			return 0;
		end;
		return 1;
	else
		self:Add(tbAward,nAwardCount);
		return 1;
	end;
end;

function TestGM:CheckRoom(tbItem,nAwardCount)
	local tbRoom = {};
	if (type(tbItem[1]) == "table") then
		for i = 1, getn(tbItem) do
			nItemIndex = self:NewItemEx(tbItem[i]);
			local nWidth = GetItemWidth(nItemIndex);
			local nHeight = GetItemHeight(nItemIndex);
			tinsert(tbRoom,{i,nWidth,nHeight,nWidth*nHeight});
		end;
	else
		nItemIndex = self:NewItemEx(tbItem);
		local nWidth = GetItemWidth(nItemIndex);
		local nHeight = GetItemHeight(nItemIndex);
		tinsert(tbRoom,{i,nWidth,nHeight,nWidth*nHeight});
	end;
	sort(tbRoom, function(a,b) return (a[4] > b[4]); end);
	if (CountFreeRoomByWH(tbRoom[1][2],tbRoom[1][3],nAwardCount) <= 0) then
		Say(format("Hµnh trang cña b¹n tèi thiÓu ph¶i cßn %dx%d « trèng, vui lßng s¾p xÕp l¹i hµnh trang cña m×nh!",tbRoom[1][2],tbRoom[1][3]),0);
		return 0;
	end;
	return 1;
end;
function TestGM:NewItemEx(tbItem)
	local nRow = 0
	if tbItem.nQuality and (tbItem.nQuality == 1 or tbItem.nQuality == 4) then
		nRow = 1
	end
	tbItem.tbParam = tbItem.tbParam or {};
	return NewItemEx(
		tbItem.nVersion or 4,
		format("%u", tbItem.nRandSeed or 0),
		tbItem.nQuality or 0,
		tbItem.tbProp[1] or 0,
		(tbItem.tbProp[2] or 0) - nRow,
		tbItem.tbProp[3] or 0,
		tbItem.tbProp[4] or 1,
		tbItem.tbProp[5] or random(0,4),
		tbItem.tbProp[6] or 0,
		tbItem.tbParam[1] or 0,
		tbItem.tbParam[2] or 0,
		tbItem.tbParam[3] or 0,
		tbItem.tbParam[4] or 0,
		tbItem.tbParam[5] or 0,
		tbItem.tbParam[6] or 0,
	tbItem.nUpgradeLevel);
end

function TestGM:GetAnRandom(tbAward,nAwardCount)
	if (not tbAward) then
		return 0;
	end;
	local nTotal = 10000000;
	local tbLoad = {};
	local tbNotRate = {};
	for nIndex,tbItem in tbAward do
		if (type(tbItem) == "table") then
			if (tbItem.nRate) then
				if (not tbLoad[tbItem.nRate]) then
					tbLoad[tbItem.nRate] = {nIndex,floor(tbItem.nRate*nTotal/100)};
				else
					tbItem.nRate = tbItem.nRate+1;
					tbLoad[tbItem.nRate] = {nIndex,floor(tbItem.nRate*nTotal/100)};
				end;
			else
				tinsert(tbNotRate,nIndex);
			end;
		end;
	end;
	
	local tbData = {};
	for nIndex, tbItem in tbLoad do
		if (type(tbItem) == "table") then
			tinsert(tbData,tbItem);
		end;
	end;
	
	sort(tbData,function(a,b) return (a[2] > b[2]) end);
	
	local tbCondition = {};
	for i = 1, getn(tbData) do
		local nRand = random(1,nTotal);
		if (tbData[i][2] >= nRand) then
			tinsert(tbCondition,tbData[i]);
		end;
	end;
	
	local tbTemp = {};
	if (getn(tbCondition) == 0) then
		if (getn(tbNotRate) ~= 0) then
			for i = 1, getn(tbNotRate) do
				self:GiveAn(tbAward[tbNotRate[i]],nAwardCount);
			end;
			return 1;
		else
			return 0;
		end;
	elseif (getn(tbCondition) == 1) then
		for i = 1, getn(tbNotRate) do
			self:GiveAn(tbAward[tbNotRate[i]],nAwardCount);
		end;
		self:GiveAn(tbAward[tbCondition[1][1]],nAwardCount);
		return 1;
	else
		while (1) do
			local tbLoop = {};
			for i = 1, getn(tbCondition) do
				local nRand = random(1,nTotal);
				if (tbCondition[i][2] >= nRand) then
					tinsert(tbLoop,tbCondition[i]);
				end;
			end;
			if (getn(tbLoop) == 1) then
				for k = 1, getn(tbNotRate) do
					self:GiveAn(tbAward[tbNotRate[k]],nAwardCount);
				end;
				self:GiveAn(tbAward[tbCondition[1][1]],nAwardCount);
				return 1;
			end;
		end;
	end;
end;

function TestGM:Add(tbItem,nAwardCount)
	local nItemIndex = 0;
	nAwardCount = (nAwardCount or 1)*(tbItem.nCount or 1);
	local szName = "";
	local szCode = "";
	if (tbItem.tbProp) then
		for i = 1, nAwardCount do
			nItemIndex = self:NewItemEx(tbItem);
			if (nItemIndex <= 0) then
				break;
			end;
			if szName == "" then
				szName = GetItemName(nItemIndex);
				if GetItemCmd then
					szCode = GetItemCmd(nItemIndex);
				end;
			end;
			
			i = self:SetStackCount(nItemIndex, i, nAwardCount);
			
			if tbItem.nCurDurability then
				SetCurDurability(nItemIndex, tbItem.nCurDurability);
			end;
			
			if tbItem.nMaxDurability then
				SetMaxDurability(nItemIndex, tbItem.nMaxDurability);
			end;
			
			if tbItem.nExpiredTime then
				ITEM_SetExpiredTime(nItemIndex, tbItem.nExpiredTime);
			end;
			
			if tbItem.nExpiredTime2 then
				ITEM_SetExpiredTime2(nItemIndex, tbItem.nExpiredTime2);
			end;
			
			if tbItem.nUsageTime then
				ITEM_SetLeftUsageTime(nItemIndex, tbItem.nUsageTime);
			end;
			
			if tbItem.nBindState then
				SetItemBindState(nItemIndex, tbItem.nBindState);
			end;
			
			if type(tbItem.CallBack) == "function" then
				tbItem.CallBack(nItemIndex);
			end;
			szName = tbItem.szName or GetItemName(nItemIndex);
			if (szName ~= tbItem.szName) then tbItem.szName = szName; end;
			AddItemByIndex(nItemIndex);
		end;
		Msg2Player(format("B¹n nhËn ®­îc %d %s!",nAwardCount,szName));
	end;
	
	if type(tbItem.pFun) == "function" then
		tbItem:pFun(nAwardCount);
	end;
	
	if (tbItem.nExp) then
		AddOwnExp(tbItem.nExp);
		Msg2Player(format("B¹n nhËn ®­îc %d ®iÓm kinh nghiÖm kh«ng céng dån!",tbItem.nExp));
	end;
	
	if (tbItem.nStackExp) then
		StackExp(tbItem.nStackExp);
		Msg2Player(format("B¹n nhËn ®­îc %d ®iÓm kinh nghiÖm céng dån!",tbItem.nStackExp));
	end;
	
	if (tbItem.nEarn) then
		StackExp(tbItem.nEarn);
		Msg2Player(format("B¹n nhËn ®­îc %d l­îng b¹c!",tbItem.nEarn));
	end;
	
	return 1;
end;

function TestGM:SetStackCount(nItemIndex, i, nAmount)
	if IsItemStackable(nItemIndex) == 1 then
		local nOrgStackCount = GetItemStackCount(nItemIndex);
		local nStackCount = nOrgStackCount + nAmount - i;
		local nMaxStackCount = GetItemMaxStackCount(nItemIndex);
		if nStackCount >= nMaxStackCount then
			nStackCount = nMaxStackCount;
		end;
		SetItemStackCount(nItemIndex, nStackCount);
		return i + nStackCount - nOrgStackCount;
	else
		return i;
	end;
end;


TABLIST_ITEM_ThuyTinh = {
	{szName="Lam Thuû Tinh",	tbProp={4,238,1,-1,0,0},nCount=10},
	{szName="Tö Thuû Tinh", 	tbProp={4,239,1,-1,0,0},nCount=10},
	{szName="Lôc Thuû Tinh", 	tbProp={4,240,1,-1,0,0},nCount=10},
};


TABLIST_ITEM_HT = {
	{szName="HuyÒn Tinh Kho¸ng Th¹ch(CÊp 1)",	tbProp={6,1,147,1,0,0},nCount=5},
	{szName="HuyÒn Tinh Kho¸ng Th¹ch(CÊp 2)", 	tbProp={6,1,147,2,0,0},nCount=5},
	{szName="HuyÒn Tinh Kho¸ng Th¹ch(CÊp 3)", 	tbProp={6,1,147,3,0,0},nCount=5},
	{szName="HuyÒn Tinh Kho¸ng Th¹ch(CÊp 4)",	tbProp={6,1,147,4,0,0},nCount=5},
	{szName="HuyÒn Tinh Kho¸ng Th¹ch(CÊp 5)", 	tbProp={6,1,147,5,0,0},nCount=5},
	{szName="HuyÒn Tinh Kho¸ng Th¹ch(CÊp 6)", 	tbProp={6,1,147,6,0,0},nCount=5},
	{szName="HuyÒn Tinh Kho¸ng Th¹ch(CÊp 7)", 	tbProp={6,1,147,7,0,0},nCount=5},
	{szName="HuyÒn Tinh Kho¸ng Th¹ch(CÊp 8)",	tbProp={6,1,147,8,0,0},nCount=5},
	{szName="HuyÒn Tinh Kho¸ng Th¹ch(CÊp 9)", 	tbProp={6,1,147,9,0,0},nCount=5},
	{szName="HuyÒn Tinh Kho¸ng Th¹ch(CÊp 10)", 	tbProp={6,1,147,10,0,0},nCount=5},
};

TABLIST_ITEM_DAHien = {
	{szName="HuyÒn ThiÕt Nguyªn Kho¸ng",	tbProp={6,1,149,0,0,0},nCount=5},
	{szName="MËt Ng©n Nguyªn Kho¸ng", 		tbProp={6,1,151,0,0,0},nCount=5},
	{szName="Chu Sa Nguyªn Kho¸ng", 		tbProp={6,1,153,0,0,0},nCount=5},
};


TABLIST_ITEM_DAAN = {
	{szName="Khæng T­íc Nguyªn Th¹ch Kim",	tbProp={6,1,150,0,0,0},nCount=5},
	{szName="Khæng T­íc Nguyªn Th¹ch Méc", 	tbProp={6,1,150,0,1,0},nCount=5},
	{szName="Khæng T­íc Nguyªn Th¹ch Thuû", tbProp={6,1,150,0,2,0},nCount=5},
	{szName="Khæng T­íc Nguyªn Th¹ch Ho¶",	tbProp={6,1,150,0,3,0},nCount=5},
	{szName="Khæng T­íc Nguyªn Th¹ch Thæ", 	tbProp={6,1,150,0,4,0},nCount=5},
	{szName="Phï Dung Nguyªn Th¹ch Kim", 	tbProp={6,1,152,0,0,0},nCount=5},
	{szName="Phï Dung Nguyªn Th¹ch Méc", 	tbProp={6,1,152,0,1,0},nCount=5},
	{szName="Phï Dung Nguyªn Th¹ch Thuû",	tbProp={6,1,152,0,2,0},nCount=5},
	{szName="Phï Dung Nguyªn Th¹ch Ho¶", 	tbProp={6,1,152,0,3,0},nCount=5},
	{szName="Phï Dung Nguyªn Th¹ch Thæ", 	tbProp={6,1,152,0,4,0},nCount=5},
	{szName="Chung Nhò Nguyªn Th¹ch Kim", 	tbProp={6,1,154,0,0,0},nCount=5},
	{szName="Chung Nhò Nguyªn Th¹ch Méc", 	tbProp={6,1,154,0,1,0},nCount=5},
	{szName="Chung Nhò Nguyªn Th¹ch Thuû",	tbProp={6,1,154,0,2,0},nCount=5},
	{szName="Chung Nhò Nguyªn Th¹ch Ho¶", 	tbProp={6,1,154,0,3,0},nCount=5},
	{szName="Chung Nhò Nguyªn Th¹ch Thæ", 	tbProp={6,1,154,0,4,0},nCount=5},
	
};


TABLIST_ITEM_KHAC = {
	{szName="Håi Thiªn T¸i T¹o LÔ Bao", tbProp={6,1,1781,0,0,0}, tbParam={60}},
	{szName="ThÇn Hµnh Phï", tbProp={6,1,1266,1,0,0},nCount=1},
	{szName="Tö MÉu LÖnh", tbProp={6,1,1427,1,0,0},nCount=1},
	{szName="TÈy Tñy Kinh", tbProp={6,1,22,1,0,0},nCount=1},
	{szName="Vâ L©m MËt TÞch", tbProp={6,1,26,1,0,0},nCount=1},
	{szName="S¸ch kü n¨ng cÊp 90", tbProp={6,1,2426,1,0,0},nCount=1},
	{szName="BÝ quyÕt kü n¨ng cÊp 120", tbProp={6,1,1125,1,0,0},nCount=1},
	{szName="§¹i Thµnh BÝ KÝp 90", tbProp={6,1,2524,1,0,0},nCount=1},
	{szName="§¹i Thµnh BÝ KÝp 120", tbProp={6,1,2526,1,0,0},nCount=1},
	{szName="TÝn vËt m«n ph¸i", tbProp={6,1,1670,1,0,0},nCount=1},
	{szName="TÝn vËt D­¬ng Anh", tbProp={6,1,1671,1,0,0},nCount=1},
	{szName="NhÊt Kû Cµn Kh«n Phï", tbProp={6,1,2126,1,0,0},nCount=1},
	{szName="Nh¹c V­¬ng KiÕm lÔ bao", tbProp={6,1,2340,1,0,0},nCount=1},
};

TABLIST_ITEM_CAYCUOC = {
	{szName="Tiªn Th¶o Lé", tbProp={6,1,71,1,0,0},nCount=1},
	{szName="Tiªn Th¶o Lé (®Æc biÖt)", tbProp={6,1,1181,1,0,0},nCount=1},
	{szName="Thiªn S¬n B¶o Lé", tbProp={6,1,72,1,0,0},nCount=1},
	{szName="QuÕ Hoa Töu", tbProp={6,1,125,1,0,0},nCount=1},
};

TABLIST_ITEM_HOATDONG = {
	{szName="LÖnh bµi Phong L¨ng §é",tbProp={4,489,1,0,0,0},nCount=1},
	{szName="S¸t thñ gi¶n (cÊp 40)",tbProp={4,400,1,40,0,0},nCount=1},
	{szName="S¸t thñ gi¶n (cÊp 90)",tbProp={4,400,1,90,0,0},nCount=1},
	{szName="Truy c«ng lÖnh",tbProp={6,1,2015,1,0,0},nCount=1},
	{szName="Long HuyÕt Hoµn",tbProp={6,1,2117,1,0,0},nCount=1},
};

TAB_LISTITEM_BOOK90LEVEL21 = {
	{szName="§¹t Ma §é Giang (cÊp 21)", tbProp={6,1,4265,1,0,0},nCount=1},
	{szName="Hoµnh T¶o Thiªn Qu©n (cÊp 21)", tbProp={6,1,4266,1,0,0},nCount=1},
	{szName="V« T­íng Tr¶m (cÊp 21)", tbProp={6,1,4267,1,0,0},nCount=1},
	{szName="Ph¸ Thiªn Tr¶m (cÊp 21)", tbProp={6,1,4268,1,0,0},nCount=1},
	{szName="Truy Phong QuyÕt (cÊp 21)", tbProp={6,1,4269,1,0,0},nCount=1},
	{szName="Truy Tinh Trôc NguyÖt (cÊp 21)", tbProp={6,1,4270,1,0,0},nCount=1},
	{szName="NhiÕp Hån NguyÖt ¶nh (cÊp 21)", tbProp={6,1,4271,1,0,0},nCount=1},
	{szName="B¹o Vò Lª Hoa (cÊp 21)", tbProp={6,1,4272,1,0,0},nCount=1},
	{szName="Cöu Cung Phi Tinh (cÊp 21)", tbProp={6,1,4273,1,0,0},nCount=1},
	{szName="¢m Phong Thùc Cèt (cÊp 21)", tbProp={6,1,4274,1,0,0},nCount=1},
	{szName="HuyÒn ¢m Tr¶m (cÊp 21)", tbProp={6,1,4275,1,0,0},nCount=1},
	{szName="Phong S­¬ng To¸i ¶nh (cÊp 21)", tbProp={6,1,4276,1,0,0},nCount=1},
	{szName="Tam Nga TÒ TuyÕt (cÊp 21)", tbProp={6,1,4277,1,0,0},nCount=1},
	{szName="B¨ng Tung V« ¶nh (cÊp 21)", tbProp={6,1,4278,1,0,0},nCount=1},
	{szName="B¨ng T©m Tiªn Tö (cÊp 21)", tbProp={6,1,4279,1,0,0},nCount=1},
	{szName="Phi Long T¹i Thiªn (cÊp 21)", tbProp={6,1,4280,1,0,0},nCount=1},
	{szName="Thiªn H¹ V« CÈu (cÊp 21)", tbProp={6,1,4281,1,0,0},nCount=1},
	{szName="V©n Long KÝch (cÊp 21)", tbProp={6,1,4282,1,0,0},nCount=1},
	{szName="Thiªn Ngo¹i L­u Tinh (cÊp 21)", tbProp={6,1,4283,1,0,0},nCount=1},
	{szName="Thiªn §Þa V« Cùc (cÊp 21)", tbProp={6,1,4284,1,0,0},nCount=1},
	{szName="Nh©n KiÕm Hîp NhÊt (cÊp 21)", tbProp={6,1,4285,1,0,0},nCount=1},
	{szName="Ng¹o TuyÕt Tiªu Phong (cÊp 21)", tbProp={6,1,4286,1,0,0},nCount=1},
	{szName="L«i ®éng Cöu Thiªn (cÊp 21)", tbProp={6,1,4287,1,0,0},nCount=1},
};

TAB_LISTITEM_BOOK90LEVEL22 = {				
	{szName="§¹t Ma §é Giang (cÊp 22)"	, tbProp={6,1,4288,1,0,0},nCount=1},
	{szName="Hoµnh T¶o Thiªn Qu©n (cÊp 22)"	, tbProp={6,1,4289,1,0,0},nCount=1},
	{szName="V« T­íng Tr¶m (cÊp 22)", tbProp={6,1,4290,1,0,0},nCount=1},
	{szName="Ph¸ Thiªn Tr¶m (cÊp 22)", tbProp={6,1,4291,1,0,0},nCount=1},
	{szName="Truy Phong QuyÕt (cÊp 22)", tbProp={6,1,4292,1,0,0},nCount=1},
	{szName="Truy Tinh Trôc NguyÖt (cÊp 22)", tbProp={6,1,4293,1,0,0},nCount=1},
	{szName="NhiÕp Hån NguyÖt ¶nh (cÊp 22)", tbProp={6,1,4294,1,0,0},nCount=1},
	{szName="B¹o Vò Lª Hoa (cÊp 22)", tbProp={6,1,4295,1,0,0},nCount=1},
	{szName="Cöu Cung Phi Tinh (cÊp 22)", tbProp={6,1,4296,1,0,0},nCount=1},
	{szName="¢m Phong Thùc Cèt (cÊp 22)", tbProp={6,1,4297,1,0,0},nCount=1},
	{szName="HuyÒn ¢m Tr¶m (cÊp 22)", tbProp={6,1,4298,1,0,0},nCount=1},
	{szName="Phong S­¬ng To¸i ¶nh (cÊp 22)", tbProp={6,1,4299,1,0,0},nCount=1},
	{szName="Tam Nga TÒ TuyÕt (cÊp 22)", tbProp={6,1,4300,1,0,0},nCount=1},
	{szName="B¨ng Tung V« ¶nh (cÊp 22)", tbProp={6,1,4301,1,0,0},nCount=1},
	{szName="B¨ng T©m Tiªn Tö (cÊp 22)", tbProp={6,1,4302,1,0,0},nCount=1},
	{szName="Phi Long T¹i Thiªn (cÊp 22)", tbProp={6,1,4303,1,0,0},nCount=1},
	{szName="Thiªn H¹ V« CÈu (cÊp 22)", tbProp={6,1,4304,1,0,0},nCount=1},
	{szName="V©n Long KÝch (cÊp 22)", tbProp={6,1,4305,1,0,0},nCount=1},
	{szName="Thiªn Ngo¹i L­u Tinh (cÊp 22)", tbProp={6,1,4306,1,0,0},nCount=1},
	{szName="Thiªn §Þa V« Cùc (cÊp 22)", tbProp={6,1,4307,1,0,0},nCount=1},
	{szName="Nh©n KiÕm Hîp NhÊt (cÊp 22)", tbProp={6,1,4308,1,0,0},nCount=1},
	{szName="Ng¹o TuyÕt Tiªu Phong (cÊp 22)", tbProp={6,1,4309,1,0,0},nCount=1},
	{szName="L«i ®éng Cöu Thiªn (cÊp 22)", tbProp={6,1,4310,1,0,0},nCount=1},
};

TAB_LISTITEM_BOOK90LEVEL23 = {				
	{szName="§¹t Ma §é Giang (cÊp 23)", tbProp={6,1,4311,1,0,0},nCount=1},
	{szName="Hoµnh T¶o Thiªn Qu©n (cÊp 23)", tbProp={6,1,4312,1,0,0},nCount=1},
	{szName="V« T­íng Tr¶m (cÊp 23)", tbProp={6,1,4313,1,0,0},nCount=1},
	{szName="Ph¸ Thiªn Tr¶m (cÊp 23)", tbProp={6,1,4314 ,1,0,0},nCount=1},
	{szName="Truy Phong QuyÕt (cÊp 23)", tbProp={6,1,4315 ,1,0,0},nCount=1},
	{szName="Truy Tinh Trôc NguyÖt (cÊp 23)", tbProp={6,1,4316 ,1,0,0},nCount=1},
	{szName="NhiÕp Hån NguyÖt ¶nh (cÊp 23)", tbProp={6,1,4317 ,1,0,0},nCount=1},
	{szName="B¹o Vò Lª Hoa (cÊp 23)", tbProp={6,1,4318 ,1,0,0},nCount=1},
	{szName="Cöu Cung Phi Tinh (cÊp 23)", tbProp={6,1,4319 ,1,0,0},nCount=1},
	{szName="¢m Phong Thùc Cèt (cÊp 23)", tbProp={6,1,4320 ,1,0,0},nCount=1},
	{szName="HuyÒn ¢m Tr¶m (cÊp 23)", tbProp={6,1,4321 ,1,0,0},nCount=1},
	{szName="Phong S­¬ng To¸i ¶nh (cÊp 23)", tbProp={6,1,4322 ,1,0,0},nCount=1},
	{szName="Tam Nga TÒ TuyÕt (cÊp 23)", tbProp={6,1,4323 ,1,0,0},nCount=1},
	{szName="B¨ng Tung V« ¶nh (cÊp 23)", tbProp={6,1,4324 ,1,0,0},nCount=1},
	{szName="B¨ng T©m Tiªn Tö (cÊp 23)", tbProp={6,1,4325 ,1,0,0},nCount=1},
	{szName="Phi Long T¹i Thiªn (cÊp 23)", tbProp={6,1,4326 ,1,0,0},nCount=1},
	{szName="Thiªn H¹ V« CÈu (cÊp 23)", tbProp={6,1,4327 ,1,0,0},nCount=1},
	{szName="V©n Long KÝch (cÊp 23)", tbProp={6,1,4328 ,1,0,0},nCount=1},
	{szName="Thiªn Ngo¹i L­u Tinh (cÊp 23)", tbProp={6,1,4329 ,1,0,0},nCount=1},
	{szName="Thiªn §Þa V« Cùc (cÊp 23)", tbProp={6,1,4330 ,1,0,0},nCount=1},
	{szName="Nh©n KiÕm Hîp NhÊt (cÊp 23)", tbProp={6,1,4331 ,1,0,0},nCount=1},
	{szName="Ng¹o TuyÕt Tiªu Phong (cÊp 23)", tbProp={6,1,4332 ,1,0,0},nCount=1},
	{szName="L«i ®éng Cöu Thiªn (cÊp 23)", tbProp={6,1,4333,1,0,0},nCount=1},
};

TAB_LISTITEM_BOOK90LEVEL24 = {				
	{szName="§¹t Ma §é Giang (cÊp 24)", tbProp={6,1,4334,1,0,0},nCount=1},
	{szName="Hoµnh T¶o Thiªn Qu©n (cÊp 24)", tbProp={6,1,4335,1,0,0},nCount=1},
	{szName="V« T­íng Tr¶m (cÊp 24)", tbProp={6,1,4336,1,0,0},nCount=1},
	{szName="Ph¸ Thiªn Tr¶m (cÊp 24)", tbProp={6,1,4337,1,0,0},nCount=1},
	{szName="Truy Phong QuyÕt (cÊp 24)", tbProp={6,1,4338,1,0,0},nCount=1},
	{szName="Truy Tinh Trôc NguyÖt (cÊp 24)", tbProp={6,1,4339,1,0,0},nCount=1},
	{szName="NhiÕp Hån NguyÖt ¶nh (cÊp 24)", tbProp={6,1,4340,1,0,0},nCount=1},
	{szName="B¹o Vò Lª Hoa (cÊp 24)", tbProp={6,1,4341,1,0,0},nCount=1},
	{szName="Cöu Cung Phi Tinh (cÊp 24)", tbProp={6,1,4342,1,0,0},nCount=1},
	{szName="¢m Phong Thùc Cèt (cÊp 24)", tbProp={6,1,4343,1,0,0},nCount=1},
	{szName="HuyÒn ¢m Tr¶m (cÊp 24)", tbProp={6,1,4344,1,0,0},nCount=1},
	{szName="Phong S­¬ng To¸i ¶nh (cÊp 24)", tbProp={6,1,4345,1,0,0},nCount=1},
	{szName="Tam Nga TÒ TuyÕt (cÊp 24)", tbProp={6,1,4346,1,0,0},nCount=1},
	{szName="B¨ng Tung V« ¶nh (cÊp 24)", tbProp={6,1,4347,1,0,0},nCount=1},
	{szName="B¨ng T©m Tiªn Tö (cÊp 24)", tbProp={6,1,4348,1,0,0},nCount=1},
	{szName="Phi Long T¹i Thiªn (cÊp 24)", tbProp={6,1,4349,1,0,0},nCount=1},
	{szName="Thiªn H¹ V« CÈu (cÊp 24)", tbProp={6,1,4350,1,0,0},nCount=1},
	{szName="V©n Long KÝch (cÊp 24)", tbProp={6,1,4351,1,0,0},nCount=1},
	{szName="Thiªn Ngo¹i L­u Tinh (cÊp 24)", tbProp={6,1,4352,1,0,0},nCount=1},
	{szName="Thiªn §Þa V« Cùc (cÊp 24)", tbProp={6,1,4353,1,0,0},nCount=1},
	{szName="Nh©n KiÕm Hîp NhÊt (cÊp 24)", tbProp={6,1,4354,1,0,0},nCount=1},
	{szName="Ng¹o TuyÕt Tiªu Phong (cÊp 24)", tbProp={6,1,4355,1,0,0},nCount=1},
	{szName="L«i ®éng Cöu Thiªn (cÊp 24)", tbProp={6,1,4356,1,0,0},nCount=1},
};				

TAB_LISTITEM_BOOK90LEVEL25 = {				
	{szName="§¹t Ma §é Giang (cÊp 25)", tbProp={6,1,4357,1,0,0},nCount=1},
	{szName="Hoµnh T¶o Thiªn Qu©n (cÊp 25)", tbProp={6,1,4358,1,0,0},nCount=1},
	{szName="V« T­íng Tr¶m (cÊp 25)", tbProp={6,1,4359,1,0,0},nCount=1},
	{szName="Ph¸ Thiªn Tr¶m (cÊp 25)", tbProp={6,1,4360,1,0,0},nCount=1},
	{szName="Truy Phong QuyÕt (cÊp 25)", tbProp={6,1,4361,1,0,0},nCount=1},
	{szName="Truy Tinh Trôc NguyÖt (cÊp 25)", tbProp={6,1,4362,1,0,0},nCount=1},
	{szName="NhiÕp Hån NguyÖt ¶nh (cÊp 25)", tbProp={6,1,4363,1,0,0},nCount=1},
	{szName="B¹o Vò Lª Hoa (cÊp 25)", tbProp={6,1,4364,1,0,0},nCount=1},
	{szName="Cöu Cung Phi Tinh (cÊp 25)", tbProp={6,1,4365,1,0,0},nCount=1},
	{szName="¢m Phong Thùc Cèt (cÊp 25)", tbProp={6,1,4366,1,0,0},nCount=1},
	{szName="HuyÒn ¢m Tr¶m (cÊp 25)", tbProp={6,1,4367,1,0,0},nCount=1},
	{szName="Phong S­¬ng To¸i ¶nh (cÊp 25)", tbProp={6,1,4368,1,0,0},nCount=1},
	{szName="Tam Nga TÒ TuyÕt (cÊp 25)", tbProp={6,1,4369,1,0,0},nCount=1},
	{szName="B¨ng Tung V« ¶nh (cÊp 25)", tbProp={6,1,4370,1,0,0},nCount=1},
	{szName="B¨ng T©m Tiªn Tö (cÊp 25)", tbProp={6,1,4371,1,0,0},nCount=1},
	{szName="Phi Long T¹i Thiªn (cÊp 25)", tbProp={6,1,4372,1,0,0},nCount=1},
	{szName="Thiªn H¹ V« CÈu (cÊp 25)", tbProp={6,1,4373,1,0,0},nCount=1},
	{szName="V©n Long KÝch (cÊp 25)", tbProp={6,1,4374,1,0,0},nCount=1},
	{szName="Thiªn Ngo¹i L­u Tinh (cÊp 25)", tbProp={6,1,4375,1,0,0},nCount=1},
	{szName="Thiªn §Þa V« Cùc (cÊp 25)", tbProp={6,1,4376,1,0,0},nCount=1},
	{szName="Nh©n KiÕm Hîp NhÊt (cÊp 25)", tbProp={6,1,4377,1,0,0},nCount=1},
	{szName="Ng¹o TuyÕt Tiªu Phong (cÊp 25)", tbProp={6,1,4378,1,0,0},nCount=1},
	{szName="L«i ®éng Cöu Thiªn (cÊp 25)", tbProp={6,1,4379,1,0,0},nCount=1},
};				
