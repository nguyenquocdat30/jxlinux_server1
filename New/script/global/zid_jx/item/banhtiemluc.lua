IncludeLib("ITEM")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
----------------------------------------------------------
TSK_BANHKYNANG = 5091
TSK_BANHTIEMNANG = 5092

function main(nItemIdx)
local Free = CalcFreeItemCellCount()
local G,D,P,nLevel = GetItemProp(nItemIdx)

	if (G ~= 6) then
		return 1
	end

	--B¸nh Kü N¨ng
	if (P == 127) then
		if (GetTask(TSK_BANHKYNANG) < 50) then
			AddMagicPoint(1) SetTask(TSK_BANHKYNANG,GetTask(TSK_BANHKYNANG)+1) Msg2Player("Chóc Mõng Ng­¬i NhËn §­îc 1 §iÓm Kü N¨ng")
		else
			Talk(1,"","Mçi Nh©n VËt ChØ §­îc Sö Dông Tèi §a 50 B¸nh Kü N¨ng")
		end
	end
	--B¸nh TiÒm N¨ng
	if (P == 128) then
		if (GetTask(TSK_BANHTIEMNANG) < 50) then
			AddProp(5) SetTask(TSK_BANHTIEMNANG,GetTask(TSK_BANHTIEMNANG)+1) Msg2Player("Chóc Mõng Ng­¬i NhËn §­îc 5 §iÓm TiÒm N¨ng")
		else
			Talk(1,"","Mçi Nh©n VËt ChØ §­îc Sö Dông Tèi §a 50 B¸nh TiÒm N¨ng")
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
