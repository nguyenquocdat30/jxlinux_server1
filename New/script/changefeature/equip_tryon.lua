
IncludeLib("FILESYS")
tbEquipTryOn = {}

tbEquipTryOn.tbTemplate = {}

function tbEquipTryOn:GetCalss(szType)
	return self.tbTemplate[szType] or self
end

function tbEquipTryOn:NewTemplate(szType)
	local tb = {}
	for key, value in self do
		tb[key] = value
	end
	self.tbTemplate[szType] = tb
	return tb
end


tbEquipTryOn.nCountPerPage = 5
tbEquipTryOn.szType = ""
tbEquipTryOn.tbData_Male = 
{
	--{nFeature = 0, szName = "1", nPrice = 1},
}
tbEquipTryOn.tbData_Female = 
{
	--{nFeature = 0, szName = "1", nPrice = 1},
}
--¶Ô»°²Ëµ¥
function tbEquipTryOn:DailogMenu(nPage)
	
	local tbData = self.tbData_Male
	if GetSex() == 1 then
		tbData = self.tbData_Female
	end
	
	local nTotalCount = getn(tbData)
	
	
	
	local nCountPerPage = self.nCountPerPage
	local nStart = (nPage - 1) * nCountPerPage + 1
	local nEnd = nStart + nCountPerPage - 1
	
	if nStart > nTotalCount then
		return
	end
	if nEnd > nTotalCount then
		nEnd = nTotalCount
	end

	local szTitle = "<npc>Ng­¬i cã ®ång ý xem thö tr­íc khi tiÕn hµnh kh¶m n¹m <color=orange>§¸ Ph¸t Ngò S¾c<color>!"
	local tbOpt = {}
	
	
	for i=nStart, nEnd do
		local opt = 
		{
			format("§ång ý xem thö", i, tbData[i].szName),
			self.TryOnDailog,
			{self, i}
		}
		tinsert(tbOpt, opt)
	end
	
	if nStart > 1 then
		tinsert(tbOpt, {"Trang tr­íc", self.DailogMenu, {self, nPage - 1}})
	end
	
	if nEnd < nTotalCount then
		tinsert(tbOpt, {"Trang kÕ ", self.DailogMenu, {self, nPage + 1}})
	end
	
	tinsert(tbOpt, {"KÕt thóc ®èi tho¹i"})
	
	CreateNewSayEx(szTitle, tbOpt)
end


function tbEquipTryOn:TryOnDailog(nIdx)
	
	local tbData = self.tbData_Male
	if GetSex() == 1 then
		tbData = self.tbData_Female
	end
	
	
	self:TryOn(tbData[nIdx].nFeature)
	
	local szTitle = format("<npc>C¸c h¹ c¶m thÊy thÕ nµo? Cã võa lßng kh«ng? Muèn kh¶m n¹m ngo¹i h×nh vò khÝ nµy cÇn 1 viªn <color=yellow>§¸ Ngò S¾c<color>", tbData[nIdx].nPrice)
	local nPage = ceil(nIdx/self.nCountPerPage)
	local tbOpt = 
	{
		{"RÊt võa vÆn, h·y lµm nhanh cho ta.", self.GiveEquip, {self, nIdx}},
		{"§Ó ta xem l¹i.", RestoreOwnFeature}
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function tbEquipTryOn:ChangeFeature(nNewHelmType, nNewArmorType, nNewWeaponType, nNewHorseType)
	local nHelmType, nArmorType, nWeaponType, nHorseType = GetPlayerFeature(PlayerIndex)
	
	local nSettingsIdx = -1 - GetSex()
	
	if nNewHelmType == -1 then
		nNewHelmType = nHelmType
	end
	if nNewArmorType == -1 then
		nNewArmorType = nArmorType
	end
	if nNewWeaponType == -1 then
		nNewWeaponType = nWeaponType
	end
	if nNewHorseType == -1 then
		nNewHorseType = nHorseType
	end
	
	ChangeOwnFeature( 0, -1, nSettingsIdx,  nNewHelmType, nNewArmorType, nNewWeaponType, nNewHorseType)
end
--ÐèÒªÖØÔØÊÔ´©
function tbEquipTryOn:TryOn(nNo)
	
end

--×¢ÈëµÀ¾ßÀï
function tbEquipTryOn:InjectToItem(nItemIndex, nNo)
	SetItemNewFeature(nItemIndex, nNo)
end

--»¹Ô­
function tbEquipTryOn:RestoreItem(nItemIndex)
	SetItemNewFeature(nItemIndex, -1)
end

function tbEquipTryOn:GiveEquip(nIdx)
	
	g_GiveItemUI("Ph¸t s¸ng Vò KhÝ", "N¬i nµy chØ ®Ó Vò KhÝ ngoµi ra kh«ng ®­îc cho vËt phÈm kh¸c vµo!", {self.Proc, {self, nIdx}})
	
end

function tbEquipTryOn:Proc(nIdx, nCount)
	if nCount ~= 1 then
		Talk(1, "", "ChØ ®­îc bá 1 mãn vò khÝ t­¬ng ­íng cÇn ph¸t s¸ng")
		return
	end
	
	local tbData = self.tbData_Male
	if GetSex() == 1 then
		tbData = self.tbData_Female
	end
	
	local pData =  tbData[nIdx]
	if not pData then
		Talk(1, "", "Chän ngo¹i h×nh lçi.")
		return 
	end
	
	local nItemIndex = GetGiveItemUnit(1)
	
	if self:CheckEquip(nItemIndex) ~= 1 then
		return 
	end
	local tbItem = {szName="§¸ Ngò S¾c", tbProp={6, 1, 4384, -1}}
	local tbProp = tbItem.tbProp
	local nCount = pData.nPrice
	if CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4]) <= 0 then
		Talk(1, "", format("Ng­¬i kh«ng mang theo <color=yellow>%s<color> th× ph¶i!", tbItem.szName))
		return 
	end
	ConsumeEquiproomItem(1, tbProp[1], tbProp[2], tbProp[3], tbProp[4])
	
	if pData.nFeature then
		self:InjectToItem(nItemIndex, pData.nFeature)
		Msg2Player(format("Ngo¹i h×nh trang bÞ %s ®· ®­îc ®æi", GetItemName(nItemIndex)))
	end
	
end

function tbEquipTryOn:CheckEquip()
	
end

function tbEquipTryOn:AskFeatureNo()
	local tbData = self.tbData_Male
	if GetSex() == 1 then
		tbData = self.tbData_Female
	end
	
	
	local nMaxCount = getn(tbData)
	g_AskClientNumberEx(1, nMaxCount, "Xin h·y chän sè hiÖu ngo¹i h×nh", {self.GiveEquip, {self}})
end


function tbEquipTryOn:LoadFile()
	self.tbData_Male = {}
	self.tbData_Female = {}
	self:LoadOneFile( self.tbData_Male, self.szFile_Male)
	self:LoadOneFile( self.tbData_Female, self.szFile_Female)
	
end

function tbEquipTryOn:LoadOneFile( tbData, szFile)
	
	if TabFile_Load(szFile, szFile) == 0 then
		WriteLog(format("Load %s is fail", szFile))
		return 0;
	end
	local nRowCount = TabFile_GetRowCount(szFile)
	for i=2, nRowCount do
		local szName	= TabFile_GetCell(szFile, i, "Name")
		local nFeature	= tonumber(TabFile_GetCell(szFile, i, "Feature"))
		local nPrice	= tonumber(TabFile_GetCell(szFile, i, "Price"))
		
		local tb = {nFeature = nFeature, szName = szName, nPrice = nPrice}
		
		tinsert(tbData, tb)
		
	end
end