IncludeLib("ITEM")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
------------------------------------------
	
tbAward = {
	{szName="Even",tbProp={6,1,4408,1,0,0},nCount=1,nRate=35},
	{szName="Even",tbProp={6,1,4409,1,0,0},nCount=1,nRate=25},
        	{szName="Even",tbProp={6,1,4410,1,0,0},nCount=1,nRate=25},
	{szName="Even",tbProp={6,1,4411,1,0,0},nCount=1,nRate=15},

}

function main(nItemIdx)

local Free = CalcFreeItemCellCount()
local G,D,P,nLevel = GetItemProp(nItemIdx)
if (G ~= 6) then return 1 end
	if (P == 4407) then
		if (Free >= 4) then
			tbAwardTemplet:GiveAwardByList(tbAward,1)
		else
			Talk(1,"","Hµnh Trang Kh«ng §ñ 1 ¤ Trèng")
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
