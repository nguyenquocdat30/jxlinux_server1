IncludeLib("NPCINFO")
IncludeLib("TASKSYS");
Include("\\script\\global\\zid_jx\\lib\\config.lua")

function call_small_boss(bossid, bosslvl, series, mapid, posx, posy, ivs1, bossname, ivs2)
	if SmallBossQuest ~= 1 then
		return
	end
	local mapidx = SubWorldID2Idx(mapid)
	local mapname = SubWorldName(mapid)
	if (mapidx < 0) then
		return
	end
	local npcindex = AddNpcEx(bossid, bosslvl, series, mapidx, posx, posy, ivs1, bossname, ivs2)
	local posx1 = floor((posx/32)/8);
	local posy1 = floor((posy/32)/16);
	if (npcindex > 0) then
		SetNpcDeathScript(npcindex, "\\script\\global\\zid_jx\\tinhnang\\boss\\smallbossdeath.lua");
		SetNpcTimer(npcindex, 120*60*18);
	end
	
end
