Include("\\script\\changefeature\\equip_tryon.lua")

local tb = tbEquipTryOn:NewTemplate("TÇm Xa - Tô TiÔn")

tb.szFile_Male = "\\settings\\changefeature\\goldequip_male_tamxa2.txt"
tb.szFile_Female = "\\settings\\changefeature\\goldequip_female_tamxa2.txt"




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
		Talk(1, "", "§©y kh«ng ph¶i vò khÝ Tô TiÔn.")
		return 
	end
	if nP ~= 2 then
		Talk(1, "", "§©y kh«ng ph¶i vò khÝ Tô TiÔn.")
		return 
	end
	return 1
end

tb:LoadFile()