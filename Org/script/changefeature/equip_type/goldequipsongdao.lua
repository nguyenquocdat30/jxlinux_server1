Include("\\script\\changefeature\\equip_tryon.lua")
-- Include("\\script\\changefeature\\equip_type\\goldequiptamxa.lua")
local tb = tbEquipTryOn:NewTemplate("Song §ao")

tb.szFile_Male = "\\settings\\changefeature\\goldequip_male_songdao.txt"
tb.szFile_Female = "\\settings\\changefeature\\goldequip_female_songdao.txt"




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
	if nG ~= 0 then
		Talk(1, "", "§©y kh«ng ph¶i lµ Vò KhÝ")
		return 
	end
	if nD ~= 0 then
		Talk(1, "", "Vò KhÝ nµy kh«ng ph¶i Song §ao.")
		return 
	end
	if nP ~= 5 then
		Talk(1, "", "Vò KhÝ nµy kh«ng ph¶i Song §ao.")
		return 
	end
	return 1
end

tb:LoadFile()