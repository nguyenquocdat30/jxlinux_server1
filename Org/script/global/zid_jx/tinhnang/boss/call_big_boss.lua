Include("\\script\\lib\\basic.lua");
Include("\\script\\config.lua")
Include("\\script\\global\\zid_jx\\lib\\config.lua")

function CALL_NEW_BIG_BOSS(bossid, bosslvl, series, mapid, posx, posy, bossname)
	if BigBossQuest ~= 1 then
		return
	end
	local mapidx = SubWorldID2Idx(mapid)
	if (mapidx < 0) then
		return
	end
	local npcindex = AddNpcEx(bossid, bosslvl, series, mapidx, posx*32, posy*32, 1, bossname, 1)
	if (npcindex > 0) then
		SetNpcDeathScript(npcindex, "\\script\\global\\zid_jx\\tinhnang\\boss\\bigbossdeath.lua");
		SetNpcTimer(npcindex, 120*60*18);
	end
end

