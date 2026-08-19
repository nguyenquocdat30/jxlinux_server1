Include("\\script\\lib\\remoteexc.lua")


SmallBossHK = {}
SmallBossHK.Debug = 1
SmallBossHK.b = {
	{id = 523, npc_name = "LiÔu Thanh Thanh", lever = 95, series = 1},
	{id = 513, npc_name = "DiÖu Nh­", lever = 95, series = 2},
	{id = 511, npc_name = "Tr­¬ng T«ng ChÝnh", lever = 95, series = 4},
}
SmallBossHK.m = {
	{map = 42, map_name = "Thiªn T©m §éng", pos = {{1678, 3109}, {1614, 3165}, {1558, 2984}} },
	{map = 91, map_name = "Mª cung Kª Qu¸n §éng", pos = {{1612, 2979}, {1580, 2722}, {1722, 2769}}},
	{map = 6, map_name = "Táa V©n §éng", pos = {{1579, 3245}, {1661, 3250}}},
	{map = 5, map_name = "Kinh Hoµng §éng", pos = {{1544, 3331}, {1540, 3439}}},
	{map = 4, map_name = "Kim Quang §éng", pos = {{1656, 3161}, {1579, 3116}, {1701, 3024}}},
	{map = 71, map_name = "B¹ch Thñy §éng", pos = {{1646, 3055}, {1705, 3127}, {1607, 3153}, {1699, 3206}, {1597, 3251}}},
	{map = 73, map_name = "Phôc L­u §éng", pos = {{1535, 3203}, {1505, 3084}, {1545, 2808}, {1509, 2994}}},
	{map = 23, map_name = "ThÇn Tiªn §éng", pos = {{1892, 3153}, {1808, 3232}, {1625, 3178}, {1643, 3241}, {1792, 3364}}},
	{map = 22, map_name = "B¹ch V©n §éng", pos = {{1898, 3163}, {1792, 3239}, {1757, 3114}}},
	{map = 94, map_name = "Linh Cèc §éng", pos = {{1549, 3193}, {1675, 3202}, {1644, 3022}}},
	{map = 182, map_name = "NghiÖt Long §éng", pos = {{2196, 3500}, {1683, 3238}, {1934, 3152}}},
	{map = 180, map_name = "Long Cung §éng", pos = {{1522, 3000}, {1524, 3161}, {1630, 3154}}},
	{map = 194, map_name = "Ngäc Hoa §éng", pos = {{1602, 3363}, {1458, 3119}, {1583, 2866}, {1729, 3135}}},
}

function SmallBossHK:Call()
	local a, b, d
	
	for _i = 1, getn(self.b) do
		a = random(1, getn(self.m))
		b = random(1, getn(self.m[a].pos))
		bossid = self.b[_i].id;
		bosslv = self.b[_i].lever;
		bosssr = self.b[_i].series;
		bossname = self.b[_i].npc_name;
		bossmapid = self.m[a].map;
		bossposx = self.m[a].pos[b][1] *32;
		bossposy = self.m[a].pos[b][2] *32;
		
		if self.Debug == 1 then
			print("BOSS: "..self.b[_i].npc_name.." Map: "..self.m[a].map_name.." Pos: "..floor(self.m[a].pos[b][1]/8)..", "..floor(self.m[a].pos[b][2]/16))
		end
		GlobalExecute(format("dw call_small_boss(%d, %d, %d, %d, %d, %d, %d, [[%s]], %d )",bossid, bosslv, bosssr, bossmapid, bossposx, bossposy, 1, bossname, 1 ));
		local szNews = format("Giang hå truyÒn r»ng <color=yellow>%s<color> ®· xuÊt hiÖn ë <color=yellow>%s<color>! Giang hå ¾t sÏ cã mét trËn ®Ém m¸u!", self.b[_i].npc_name, self.m[a].map_name);
		GlobalExecute(format("dw AddLocalNews([[%s]])", szNews));	
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szNews));	
	end
end

