IncludeLib("ITEM")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
------------------------------------------
	
tbAward = {
	{szName="Even",tbProp={6,1,4402,1,0,0},nCount=1,nRate=35},
	{szName="Even",tbProp={6,1,4403,1,0,0},nCount=1,nRate=25},
       	 {szName="Even",tbProp={6,1,4404,1,0,0},nCount=1,nRate=25},
	{szName="Even",tbProp={6,1,4405,1,0,0},nCount=1,nRate=15},

}

function main(nItemIdx)

local Free = CalcFreeItemCellCount()
local G,D,P,nLevel = GetItemProp(nItemIdx)
if (G ~= 6) then return 1 end
	if (P == 4401) then
		if (Free >= 1) then
			tbAwardTemplet:GiveAwardByList(tbAward,1)
		else
			Talk(1,"","Hµnh Trang Kh«ng §ñ 1 ¤ Trèng")
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
