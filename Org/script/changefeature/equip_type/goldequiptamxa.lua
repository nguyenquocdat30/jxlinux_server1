Include("\\script\\changefeature\\equip_tryon.lua")

local tb = tbEquipTryOn:NewTemplate("TÇm Xa - Phi Tiªu")

tb.szFile_Male = "\\settings\\changefeature\\goldequip_male_tamxa.txt"
tb.szFile_Female = "\\settings\\changefeature\\goldequip_female_tamxa.txt"




function tb:TryOn(nNo)
	self:ChangeFeature(-1, -1,nNo,-1)
end

function tb:CheckEquip(nItemIndex)
	
	local nG, nD,nP = GetItemProp(nItemIndex)
	--local nQuality = GetItemQuality(nItemIndex)
	--if nQuality ~= 1 and nQuality ~= 4 then
	--	Talk(1, "", "§©y kh«ng ph¶i lµ trang bÞ hoµng kim.")
	--	return
	--end
	
	-- local tamxa = 0 or 1 or 2
	if nG ~= 0 then
		Talk(1, "", "§©y kh«ng ph¶i lµ Vò KhÝ")
		return 
	end
	if nD ~= 1 then
		Talk(1, "", "§©y kh«ng ph¶i vò khÝ Phi Tiªu.")
		return 
	end
	if nP ~= 0 then
		Talk(1, "", "§©y kh«ng ph¶i vò khÝ Phi Tiªu.")
		return 
	end
	return 1
end

tb:LoadFile()