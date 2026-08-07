
INFORMATION_DEVELOPER = "\n-----------------------------------------------------\n* <color=green>M�i chi ti�t xin li�n h�:<color>\n\t\t+ S� �i�n tho�i: 0337 917 310 (JxZid)\n\t\t+ Facebook: fb.com/jxzid\n\t\t+ Trang Ch�: Jxzid.net"

TASKTEMP_LOGIN_LBGM = 250;
TASKTEMP_KICKOUT = 1;
FRAME2TIME = 18;
TIMETASK_ID = 115;
TASKS_LOCKSYSTEM = 1;
TASKS_GETITEM = 2;
TIMER_KICKOUT = 5; --Th�i gian kick kh�i game, m�c ��nh l� 5s

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
	[0] = "chuy�n sang m�u PK Luy�n C�ng th�nh c�ng!",
	[1] = "chuy�n sang m�u PK Ch�nh Ph�i th�nh c�ng!",
	[2] = "chuy�n sang m�u PK T� Ph�i th�nh c�ng!",
	[3] = "chuy�n sang m�u PK Trung L�p th�nh c�ng!",
	[4] = "chuy�n sang m�u PK S�t Th� th�nh c�ng!",
	[5] = "chuy�n sang m�u PK GM th�nh c�ng!",
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
	local szTitle = "GM mu�n nh�n v�t ph�m n�o?";
	local tbOption = {};
		tinsert(tbOption,{"<#> S�ch k� n�ng 90",							self.MenuBook90,{self}});
		tinsert(tbOption,{"<#> Kho�ng Th�ch �p ��",							self.KhoangThach,{self}});
		tinsert(tbOption,{"<#> V�t ph�m h� tr� kh�c",						self.MenuGive,{self,tbVatPhamKhac,1}});
		tinsert(tbOption,{"<#> V�t ph�m h� tr� c�y cu�c",					self.MenuGive,{self,tbVatPhamCayCuoc,1}});
		tinsert(tbOption,{"<#> V�t ph�m tham gia ho�t ��ng",				self.MenuGive,{self,tbVatPhamHoatDong,1}});
		tinsert(tbOption,{"��ng"});
	CreateNewSayEx(szTitle,tbOption);
end;

function TestKhoangThach()
TestGM:KhoangThach()
end
function TestGM:KhoangThach()
	local szTitle = "GM mu�n nh�n v�t ph�m n�o?";
	local tbOption = {};
		tinsert(tbOption,{"<#> �� Hi�n",							self.MenuGive,{self,TABLIST_ITEM_DAHien,1}});
		tinsert(tbOption,{"<#> �� �n",							self.MenuGive,{self,TABLIST_ITEM_DAAN,1}});
		tinsert(tbOption,{"<#> Huy�n Tinh Kho�ng Th�ch",							self.MenuGive,{self,TABLIST_ITEM_HT,1}});
		tinsert(tbOption,{"<#> Thu� Tinh",							self.MenuGive,{self,TABLIST_ITEM_ThuyTinh,1}});
		tinsert(tbOption,{"��ng"});
	CreateNewSayEx(szTitle,tbOption);
end;

function TestGM:MenuBook90()
	local szTitle = "GM mu�n nh�n v�t ph�m n�o?";
	local tbOption = {};
		tinsert(tbOption,{"<#> S�ch k� n�ng 90 (c�p 21)",							self.MenuGive,{self,TAB_LISTITEM_BOOK90LEVEL21,1}});
		tinsert(tbOption,{"<#> S�ch k� n�ng 90 (c�p 22)",							self.MenuGive,{self,TAB_LISTITEM_BOOK90LEVEL22,1}});
		tinsert(tbOption,{"<#> S�ch k� n�ng 90 (c�p 23)",							self.MenuGive,{self,TAB_LISTITEM_BOOK90LEVEL23,1}});
		tinsert(tbOption,{"<#> S�ch k� n�ng 90 (c�p 24)",							self.MenuGive,{self,TAB_LISTITEM_BOOK90LEVEL24,1}});
		tinsert(tbOption,{"<#> S�ch k� n�ng 90 (c�p 25)",							self.MenuGive,{self,TAB_LISTITEM_BOOK90LEVEL25,1}});
		tinsert(tbOption,{"��ng"});
	CreateNewSayEx(szTitle,tbOption);
end;

function TestGM:MenuGive(tbItemList,nPage)
	local nItemList = getn(tbItemList);
	local tbOption = {};
	local nPageMax = 10;
	nPage = nPage or 1;
	if (nPage > 1) then
		tinsert(tbOption,{"Trang tr��c",self.MenuGive,{self,tbItemList,(nPage-1)}});
	end
	if (nItemList <= (nPageMax*nPage)) then
		for i = (nPageMax*(nPage-1)+1), nItemList do
			local szName = tbItemList[i].szName;
			local nCount = tbItemList[i].nCount or 1;
			tinsert(tbOption,{format("%s (s� l��ng %d)",szName,nCount),self.GiveConfirm,{self,tbItemList,i}});
		end;
	else
		for i = (nPageMax*(nPage-1)+1), (nPageMax*nPage) do
			local szName = tbItemList[i].szName;
			local nCount = tbItemList[i].nCount or 1;
			tinsert(tbOption,{format("%s (s� l��ng %d)",szName,nCount),self.GiveConfirm,{self,tbItemList,i}});
		end
		tinsert(tbOption,{"Trang sau",self.MenuGive,{self,tbItemList,(nPage+1)}});
	end;
		tinsert(tbOption, {"K�t th�c ��i tho�i."});
	CreateNewSayEx("GM h�y ch�n v�t ph�m c�n l�y",tbOption);
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
		Say(format("H�nh trang c�a b�n t�i thi�u ph�i c�n %dx%d � tr�ng, vui l�ng s�p x�p l�i h�nh trang c�a m�nh!",tbRoom[1][2],tbRoom[1][3]),0);
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
		Msg2Player(format("B�n nh�n ���c %d %s!",nAwardCount,szName));
	end;
	
	if type(tbItem.pFun) == "function" then
		tbItem:pFun(nAwardCount);
	end;
	
	if (tbItem.nExp) then
		AddOwnExp(tbItem.nExp);
		Msg2Player(format("B�n nh�n ���c %d �i�m kinh nghi�m kh�ng c�ng d�n!",tbItem.nExp));
	end;
	
	if (tbItem.nStackExp) then
		StackExp(tbItem.nStackExp);
		Msg2Player(format("B�n nh�n ���c %d �i�m kinh nghi�m c�ng d�n!",tbItem.nStackExp));
	end;
	
	if (tbItem.nEarn) then
		StackExp(tbItem.nEarn);
		Msg2Player(format("B�n nh�n ���c %d l��ng b�c!",tbItem.nEarn));
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
	{szName="Lam Thu� Tinh",	tbProp={4,238,1,-1,0,0},nCount=10},
	{szName="T� Thu� Tinh", 	tbProp={4,239,1,-1,0,0},nCount=10},
	{szName="L�c Thu� Tinh", 	tbProp={4,240,1,-1,0,0},nCount=10},
};


TABLIST_ITEM_HT = {
	{szName="Huy�n Tinh Kho�ng Th�ch(C�p 1)",	tbProp={6,1,147,1,0,0},nCount=5},
	{szName="Huy�n Tinh Kho�ng Th�ch(C�p 2)", 	tbProp={6,1,147,2,0,0},nCount=5},
	{szName="Huy�n Tinh Kho�ng Th�ch(C�p 3)", 	tbProp={6,1,147,3,0,0},nCount=5},
	{szName="Huy�n Tinh Kho�ng Th�ch(C�p 4)",	tbProp={6,1,147,4,0,0},nCount=5},
	{szName="Huy�n Tinh Kho�ng Th�ch(C�p 5)", 	tbProp={6,1,147,5,0,0},nCount=5},
	{szName="Huy�n Tinh Kho�ng Th�ch(C�p 6)", 	tbProp={6,1,147,6,0,0},nCount=5},
	{szName="Huy�n Tinh Kho�ng Th�ch(C�p 7)", 	tbProp={6,1,147,7,0,0},nCount=5},
	{szName="Huy�n Tinh Kho�ng Th�ch(C�p 8)",	tbProp={6,1,147,8,0,0},nCount=5},
	{szName="Huy�n Tinh Kho�ng Th�ch(C�p 9)", 	tbProp={6,1,147,9,0,0},nCount=5},
	{szName="Huy�n Tinh Kho�ng Th�ch(C�p 10)", 	tbProp={6,1,147,10,0,0},nCount=5},
};

TABLIST_ITEM_DAHien = {
	{szName="Huy�n Thi�t Nguy�n Kho�ng",	tbProp={6,1,149,0,0,0},nCount=5},
	{szName="M�t Ng�n Nguy�n Kho�ng", 		tbProp={6,1,151,0,0,0},nCount=5},
	{szName="Chu Sa Nguy�n Kho�ng", 		tbProp={6,1,153,0,0,0},nCount=5},
};


TABLIST_ITEM_DAAN = {
	{szName="Kh�ng T��c Nguy�n Th�ch Kim",	tbProp={6,1,150,0,0,0},nCount=5},
	{szName="Kh�ng T��c Nguy�n Th�ch M�c", 	tbProp={6,1,150,0,1,0},nCount=5},
	{szName="Kh�ng T��c Nguy�n Th�ch Thu�", tbProp={6,1,150,0,2,0},nCount=5},
	{szName="Kh�ng T��c Nguy�n Th�ch Ho�",	tbProp={6,1,150,0,3,0},nCount=5},
	{szName="Kh�ng T��c Nguy�n Th�ch Th�", 	tbProp={6,1,150,0,4,0},nCount=5},
	{szName="Ph� Dung Nguy�n Th�ch Kim", 	tbProp={6,1,152,0,0,0},nCount=5},
	{szName="Ph� Dung Nguy�n Th�ch M�c", 	tbProp={6,1,152,0,1,0},nCount=5},
	{szName="Ph� Dung Nguy�n Th�ch Thu�",	tbProp={6,1,152,0,2,0},nCount=5},
	{szName="Ph� Dung Nguy�n Th�ch Ho�", 	tbProp={6,1,152,0,3,0},nCount=5},
	{szName="Ph� Dung Nguy�n Th�ch Th�", 	tbProp={6,1,152,0,4,0},nCount=5},
	{szName="Chung Nh� Nguy�n Th�ch Kim", 	tbProp={6,1,154,0,0,0},nCount=5},
	{szName="Chung Nh� Nguy�n Th�ch M�c", 	tbProp={6,1,154,0,1,0},nCount=5},
	{szName="Chung Nh� Nguy�n Th�ch Thu�",	tbProp={6,1,154,0,2,0},nCount=5},
	{szName="Chung Nh� Nguy�n Th�ch Ho�", 	tbProp={6,1,154,0,3,0},nCount=5},
	{szName="Chung Nh� Nguy�n Th�ch Th�", 	tbProp={6,1,154,0,4,0},nCount=5},
	
};


TABLIST_ITEM_KHAC = {
	{szName="H�i Thi�n T�i T�o L� Bao", tbProp={6,1,1781,0,0,0}, tbParam={60}},
	{szName="Th�n H�nh Ph�", tbProp={6,1,1266,1,0,0},nCount=1},
	{szName="T� M�u L�nh", tbProp={6,1,1427,1,0,0},nCount=1},
	{szName="T�y T�y Kinh", tbProp={6,1,22,1,0,0},nCount=1},
	{szName="V� L�m M�t T�ch", tbProp={6,1,26,1,0,0},nCount=1},
	{szName="S�ch k� n�ng c�p 90", tbProp={6,1,2426,1,0,0},nCount=1},
	{szName="B� quy�t k� n�ng c�p 120", tbProp={6,1,1125,1,0,0},nCount=1},
	{szName="��i Th�nh B� K�p 90", tbProp={6,1,2524,1,0,0},nCount=1},
	{szName="��i Th�nh B� K�p 120", tbProp={6,1,2526,1,0,0},nCount=1},
	{szName="T�n v�t m�n ph�i", tbProp={6,1,1670,1,0,0},nCount=1},
	{szName="T�n v�t D��ng Anh", tbProp={6,1,1671,1,0,0},nCount=1},
	{szName="Nh�t K� C�n Kh�n Ph�", tbProp={6,1,2126,1,0,0},nCount=1},
	{szName="Nh�c V��ng Ki�m l� bao", tbProp={6,1,2340,1,0,0},nCount=1},
};

TABLIST_ITEM_CAYCUOC = {
	{szName="Ti�n Th�o L�", tbProp={6,1,71,1,0,0},nCount=1},
	{szName="Ti�n Th�o L� (��c bi�t)", tbProp={6,1,1181,1,0,0},nCount=1},
	{szName="Thi�n S�n B�o L�", tbProp={6,1,72,1,0,0},nCount=1},
	{szName="Qu� Hoa T�u", tbProp={6,1,125,1,0,0},nCount=1},
};

TABLIST_ITEM_HOATDONG = {
	{szName="L�nh b�i Phong L�ng ��",tbProp={4,489,1,0,0,0},nCount=1},
	{szName="S�t th� gi�n (c�p 40)",tbProp={4,400,1,40,0,0},nCount=1},
	{szName="S�t th� gi�n (c�p 90)",tbProp={4,400,1,90,0,0},nCount=1},
	{szName="Truy c�ng l�nh",tbProp={6,1,2015,1,0,0},nCount=1},
	{szName="Long Huy�t Ho�n",tbProp={6,1,2117,1,0,0},nCount=1},
};

TAB_LISTITEM_BOOK90LEVEL21 = {
	{szName="��t Ma �� Giang (c�p 21)", tbProp={6,1,4265,1,0,0},nCount=1},
	{szName="Ho�nh T�o Thi�n Qu�n (c�p 21)", tbProp={6,1,4266,1,0,0},nCount=1},
	{szName="V� T��ng Tr�m (c�p 21)", tbProp={6,1,4267,1,0,0},nCount=1},
	{szName="Ph� Thi�n Tr�m (c�p 21)", tbProp={6,1,4268,1,0,0},nCount=1},
	{szName="Truy Phong Quy�t (c�p 21)", tbProp={6,1,4269,1,0,0},nCount=1},
	{szName="Truy Tinh Tr�c Nguy�t (c�p 21)", tbProp={6,1,4270,1,0,0},nCount=1},
	{szName="Nhi�p H�n Nguy�t �nh (c�p 21)", tbProp={6,1,4271,1,0,0},nCount=1},
	{szName="B�o V� L� Hoa (c�p 21)", tbProp={6,1,4272,1,0,0},nCount=1},
	{szName="C�u Cung Phi Tinh (c�p 21)", tbProp={6,1,4273,1,0,0},nCount=1},
	{szName="�m Phong Th�c C�t (c�p 21)", tbProp={6,1,4274,1,0,0},nCount=1},
	{szName="Huy�n �m Tr�m (c�p 21)", tbProp={6,1,4275,1,0,0},nCount=1},
	{szName="Phong S��ng To�i �nh (c�p 21)", tbProp={6,1,4276,1,0,0},nCount=1},
	{szName="Tam Nga T� Tuy�t (c�p 21)", tbProp={6,1,4277,1,0,0},nCount=1},
	{szName="B�ng Tung V� �nh (c�p 21)", tbProp={6,1,4278,1,0,0},nCount=1},
	{szName="B�ng T�m Ti�n T� (c�p 21)", tbProp={6,1,4279,1,0,0},nCount=1},
	{szName="Phi Long T�i Thi�n (c�p 21)", tbProp={6,1,4280,1,0,0},nCount=1},
	{szName="Thi�n H� V� C�u (c�p 21)", tbProp={6,1,4281,1,0,0},nCount=1},
	{szName="V�n Long K�ch (c�p 21)", tbProp={6,1,4282,1,0,0},nCount=1},
	{szName="Thi�n Ngo�i L�u Tinh (c�p 21)", tbProp={6,1,4283,1,0,0},nCount=1},
	{szName="Thi�n ��a V� C�c (c�p 21)", tbProp={6,1,4284,1,0,0},nCount=1},
	{szName="Nh�n Ki�m H�p Nh�t (c�p 21)", tbProp={6,1,4285,1,0,0},nCount=1},
	{szName="Ng�o Tuy�t Ti�u Phong (c�p 21)", tbProp={6,1,4286,1,0,0},nCount=1},
	{szName="L�i ��ng C�u Thi�n (c�p 21)", tbProp={6,1,4287,1,0,0},nCount=1},
};

TAB_LISTITEM_BOOK90LEVEL22 = {				
	{szName="��t Ma �� Giang (c�p 22)"	, tbProp={6,1,4288,1,0,0},nCount=1},
	{szName="Ho�nh T�o Thi�n Qu�n (c�p 22)"	, tbProp={6,1,4289,1,0,0},nCount=1},
	{szName="V� T��ng Tr�m (c�p 22)", tbProp={6,1,4290,1,0,0},nCount=1},
	{szName="Ph� Thi�n Tr�m (c�p 22)", tbProp={6,1,4291,1,0,0},nCount=1},
	{szName="Truy Phong Quy�t (c�p 22)", tbProp={6,1,4292,1,0,0},nCount=1},
	{szName="Truy Tinh Tr�c Nguy�t (c�p 22)", tbProp={6,1,4293,1,0,0},nCount=1},
	{szName="Nhi�p H�n Nguy�t �nh (c�p 22)", tbProp={6,1,4294,1,0,0},nCount=1},
	{szName="B�o V� L� Hoa (c�p 22)", tbProp={6,1,4295,1,0,0},nCount=1},
	{szName="C�u Cung Phi Tinh (c�p 22)", tbProp={6,1,4296,1,0,0},nCount=1},
	{szName="�m Phong Th�c C�t (c�p 22)", tbProp={6,1,4297,1,0,0},nCount=1},
	{szName="Huy�n �m Tr�m (c�p 22)", tbProp={6,1,4298,1,0,0},nCount=1},
	{szName="Phong S��ng To�i �nh (c�p 22)", tbProp={6,1,4299,1,0,0},nCount=1},
	{szName="Tam Nga T� Tuy�t (c�p 22)", tbProp={6,1,4300,1,0,0},nCount=1},
	{szName="B�ng Tung V� �nh (c�p 22)", tbProp={6,1,4301,1,0,0},nCount=1},
	{szName="B�ng T�m Ti�n T� (c�p 22)", tbProp={6,1,4302,1,0,0},nCount=1},
	{szName="Phi Long T�i Thi�n (c�p 22)", tbProp={6,1,4303,1,0,0},nCount=1},
	{szName="Thi�n H� V� C�u (c�p 22)", tbProp={6,1,4304,1,0,0},nCount=1},
	{szName="V�n Long K�ch (c�p 22)", tbProp={6,1,4305,1,0,0},nCount=1},
	{szName="Thi�n Ngo�i L�u Tinh (c�p 22)", tbProp={6,1,4306,1,0,0},nCount=1},
	{szName="Thi�n ��a V� C�c (c�p 22)", tbProp={6,1,4307,1,0,0},nCount=1},
	{szName="Nh�n Ki�m H�p Nh�t (c�p 22)", tbProp={6,1,4308,1,0,0},nCount=1},
	{szName="Ng�o Tuy�t Ti�u Phong (c�p 22)", tbProp={6,1,4309,1,0,0},nCount=1},
	{szName="L�i ��ng C�u Thi�n (c�p 22)", tbProp={6,1,4310,1,0,0},nCount=1},
};

TAB_LISTITEM_BOOK90LEVEL23 = {				
	{szName="��t Ma �� Giang (c�p 23)", tbProp={6,1,4311,1,0,0},nCount=1},
	{szName="Ho�nh T�o Thi�n Qu�n (c�p 23)", tbProp={6,1,4312,1,0,0},nCount=1},
	{szName="V� T��ng Tr�m (c�p 23)", tbProp={6,1,4313,1,0,0},nCount=1},
	{szName="Ph� Thi�n Tr�m (c�p 23)", tbProp={6,1,4314 ,1,0,0},nCount=1},
	{szName="Truy Phong Quy�t (c�p 23)", tbProp={6,1,4315 ,1,0,0},nCount=1},
	{szName="Truy Tinh Tr�c Nguy�t (c�p 23)", tbProp={6,1,4316 ,1,0,0},nCount=1},
	{szName="Nhi�p H�n Nguy�t �nh (c�p 23)", tbProp={6,1,4317 ,1,0,0},nCount=1},
	{szName="B�o V� L� Hoa (c�p 23)", tbProp={6,1,4318 ,1,0,0},nCount=1},
	{szName="C�u Cung Phi Tinh (c�p 23)", tbProp={6,1,4319 ,1,0,0},nCount=1},
	{szName="�m Phong Th�c C�t (c�p 23)", tbProp={6,1,4320 ,1,0,0},nCount=1},
	{szName="Huy�n �m Tr�m (c�p 23)", tbProp={6,1,4321 ,1,0,0},nCount=1},
	{szName="Phong S��ng To�i �nh (c�p 23)", tbProp={6,1,4322 ,1,0,0},nCount=1},
	{szName="Tam Nga T� Tuy�t (c�p 23)", tbProp={6,1,4323 ,1,0,0},nCount=1},
	{szName="B�ng Tung V� �nh (c�p 23)", tbProp={6,1,4324 ,1,0,0},nCount=1},
	{szName="B�ng T�m Ti�n T� (c�p 23)", tbProp={6,1,4325 ,1,0,0},nCount=1},
	{szName="Phi Long T�i Thi�n (c�p 23)", tbProp={6,1,4326 ,1,0,0},nCount=1},
	{szName="Thi�n H� V� C�u (c�p 23)", tbProp={6,1,4327 ,1,0,0},nCount=1},
	{szName="V�n Long K�ch (c�p 23)", tbProp={6,1,4328 ,1,0,0},nCount=1},
	{szName="Thi�n Ngo�i L�u Tinh (c�p 23)", tbProp={6,1,4329 ,1,0,0},nCount=1},
	{szName="Thi�n ��a V� C�c (c�p 23)", tbProp={6,1,4330 ,1,0,0},nCount=1},
	{szName="Nh�n Ki�m H�p Nh�t (c�p 23)", tbProp={6,1,4331 ,1,0,0},nCount=1},
	{szName="Ng�o Tuy�t Ti�u Phong (c�p 23)", tbProp={6,1,4332 ,1,0,0},nCount=1},
	{szName="L�i ��ng C�u Thi�n (c�p 23)", tbProp={6,1,4333,1,0,0},nCount=1},
};

TAB_LISTITEM_BOOK90LEVEL24 = {				
	{szName="��t Ma �� Giang (c�p 24)", tbProp={6,1,4334,1,0,0},nCount=1},
	{szName="Ho�nh T�o Thi�n Qu�n (c�p 24)", tbProp={6,1,4335,1,0,0},nCount=1},
	{szName="V� T��ng Tr�m (c�p 24)", tbProp={6,1,4336,1,0,0},nCount=1},
	{szName="Ph� Thi�n Tr�m (c�p 24)", tbProp={6,1,4337,1,0,0},nCount=1},
	{szName="Truy Phong Quy�t (c�p 24)", tbProp={6,1,4338,1,0,0},nCount=1},
	{szName="Truy Tinh Tr�c Nguy�t (c�p 24)", tbProp={6,1,4339,1,0,0},nCount=1},
	{szName="Nhi�p H�n Nguy�t �nh (c�p 24)", tbProp={6,1,4340,1,0,0},nCount=1},
	{szName="B�o V� L� Hoa (c�p 24)", tbProp={6,1,4341,1,0,0},nCount=1},
	{szName="C�u Cung Phi Tinh (c�p 24)", tbProp={6,1,4342,1,0,0},nCount=1},
	{szName="�m Phong Th�c C�t (c�p 24)", tbProp={6,1,4343,1,0,0},nCount=1},
	{szName="Huy�n �m Tr�m (c�p 24)", tbProp={6,1,4344,1,0,0},nCount=1},
	{szName="Phong S��ng To�i �nh (c�p 24)", tbProp={6,1,4345,1,0,0},nCount=1},
	{szName="Tam Nga T� Tuy�t (c�p 24)", tbProp={6,1,4346,1,0,0},nCount=1},
	{szName="B�ng Tung V� �nh (c�p 24)", tbProp={6,1,4347,1,0,0},nCount=1},
	{szName="B�ng T�m Ti�n T� (c�p 24)", tbProp={6,1,4348,1,0,0},nCount=1},
	{szName="Phi Long T�i Thi�n (c�p 24)", tbProp={6,1,4349,1,0,0},nCount=1},
	{szName="Thi�n H� V� C�u (c�p 24)", tbProp={6,1,4350,1,0,0},nCount=1},
	{szName="V�n Long K�ch (c�p 24)", tbProp={6,1,4351,1,0,0},nCount=1},
	{szName="Thi�n Ngo�i L�u Tinh (c�p 24)", tbProp={6,1,4352,1,0,0},nCount=1},
	{szName="Thi�n ��a V� C�c (c�p 24)", tbProp={6,1,4353,1,0,0},nCount=1},
	{szName="Nh�n Ki�m H�p Nh�t (c�p 24)", tbProp={6,1,4354,1,0,0},nCount=1},
	{szName="Ng�o Tuy�t Ti�u Phong (c�p 24)", tbProp={6,1,4355,1,0,0},nCount=1},
	{szName="L�i ��ng C�u Thi�n (c�p 24)", tbProp={6,1,4356,1,0,0},nCount=1},
};				

TAB_LISTITEM_BOOK90LEVEL25 = {				
	{szName="��t Ma �� Giang (c�p 25)", tbProp={6,1,4357,1,0,0},nCount=1},
	{szName="Ho�nh T�o Thi�n Qu�n (c�p 25)", tbProp={6,1,4358,1,0,0},nCount=1},
	{szName="V� T��ng Tr�m (c�p 25)", tbProp={6,1,4359,1,0,0},nCount=1},
	{szName="Ph� Thi�n Tr�m (c�p 25)", tbProp={6,1,4360,1,0,0},nCount=1},
	{szName="Truy Phong Quy�t (c�p 25)", tbProp={6,1,4361,1,0,0},nCount=1},
	{szName="Truy Tinh Tr�c Nguy�t (c�p 25)", tbProp={6,1,4362,1,0,0},nCount=1},
	{szName="Nhi�p H�n Nguy�t �nh (c�p 25)", tbProp={6,1,4363,1,0,0},nCount=1},
	{szName="B�o V� L� Hoa (c�p 25)", tbProp={6,1,4364,1,0,0},nCount=1},
	{szName="C�u Cung Phi Tinh (c�p 25)", tbProp={6,1,4365,1,0,0},nCount=1},
	{szName="�m Phong Th�c C�t (c�p 25)", tbProp={6,1,4366,1,0,0},nCount=1},
	{szName="Huy�n �m Tr�m (c�p 25)", tbProp={6,1,4367,1,0,0},nCount=1},
	{szName="Phong S��ng To�i �nh (c�p 25)", tbProp={6,1,4368,1,0,0},nCount=1},
	{szName="Tam Nga T� Tuy�t (c�p 25)", tbProp={6,1,4369,1,0,0},nCount=1},
	{szName="B�ng Tung V� �nh (c�p 25)", tbProp={6,1,4370,1,0,0},nCount=1},
	{szName="B�ng T�m Ti�n T� (c�p 25)", tbProp={6,1,4371,1,0,0},nCount=1},
	{szName="Phi Long T�i Thi�n (c�p 25)", tbProp={6,1,4372,1,0,0},nCount=1},
	{szName="Thi�n H� V� C�u (c�p 25)", tbProp={6,1,4373,1,0,0},nCount=1},
	{szName="V�n Long K�ch (c�p 25)", tbProp={6,1,4374,1,0,0},nCount=1},
	{szName="Thi�n Ngo�i L�u Tinh (c�p 25)", tbProp={6,1,4375,1,0,0},nCount=1},
	{szName="Thi�n ��a V� C�c (c�p 25)", tbProp={6,1,4376,1,0,0},nCount=1},
	{szName="Nh�n Ki�m H�p Nh�t (c�p 25)", tbProp={6,1,4377,1,0,0},nCount=1},
	{szName="Ng�o Tuy�t Ti�u Phong (c�p 25)", tbProp={6,1,4378,1,0,0},nCount=1},
	{szName="L�i ��ng C�u Thi�n (c�p 25)", tbProp={6,1,4379,1,0,0},nCount=1},
};				
