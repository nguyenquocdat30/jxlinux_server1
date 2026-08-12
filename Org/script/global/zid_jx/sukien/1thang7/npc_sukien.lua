---------------------***Script*By*Heart*Doldly***--------------------------------
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\npcdailog.lua")
--------------------------------------------------------
HOAPHUONGTRANG	 = 4986
NHANTHUONGMOC		 = 4985
HOAPHUONGTIM		 = 4984
---------------------------------------------------------
function myplayersex()
	if GetSex() == 1 then 
		return "N÷ HiÖp";
	else
		return "§¹i HiÖp";
	end
end
----------------------------------------
function main()
dofile("script/global/quanlygame/sukien/1thang7/npc_sukien.lua")
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName);
	end
	
	local tbDailog = DailogClass:new(szNpcName);
	tbDailog.szTitleMsg = "<npc><bclr=violet>Chµo Mõng Nh©n SÜ Tham Gia Vâ L©m TruyÒn Kú!...<bclr>",
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	local nTime = tonumber(GetLocalDate("%H%M"));
	if (nDate >= 20180413 and nDate <= 20280413 and nTime >= 0000 and nTime <= 2359) then
	if  GetTask(4985) == 0 then
	--tbDailog:AddOptEntry("NhËn Th­ëng Mèc  ", NhanMoc);
	end
	
	tbDailog:Show();
else
Talk(1,"","<bclr=violet>Ho¹t §éng ChØ Më Tõ 0h Ngµy 30 - 07 - 2022 §Õn 23h 59 Ngµy 30 - 01 - 2024 Xin Mêi Quay L¹i Sau<bclr>")
return 0;
end
end
function Reset()
local Xu = CalcEquiproomItemCount(4,1496,1,1)
	if (GetTask(NHANTHUONGMOC) >= 4) then
		if (Xu >= 50) then
			SetTask(4986,0) ConsumeEquiproomItem(50,4,1496,1,-1) SetTask(4985,0)
			Talk(1,"","<color=red>"..myplayersex().." Chóc Mõng B¹n §· Reset Thµnh C«ng...!")
			Msg2SubWorld("<color=green>  Chóc Mõng "..GetName().." §· Reset sv thµnh c«ng ®Ó ¨n l¹i ")
		else
			Talk(1,"","<color=red>"..myplayersex().." Kh«ng §ñ 50 knb Xin KiÓm Tra L¹i...!")
		end
	else
		Talk(1,"","<color=red>"..myplayersex().." Ch­a Sö Dông §ñ 50.000 B¸nh §Æc BiÖt")
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function NhanMoc()
Say("<color=green>"..myplayersex().." §· Sö Dông: <color=red>"..GetTask(HOAPHUONGTRANG).."<color> event<color>\n §· NhËn Mèc<color=red> "..GetTask(NHANTHUONGMOC).."<color> Mèc Huy HiÖu Sao Vµng<color>\n<color=orange>L­u ý: NhËn Mèc Tèi §a 200000 Huy HiÖu Sao Vµng\nTrong Suèt Thêi Gian Ho¹t §éng<color>",2,"Xem PhÇn Th­ëng Mèc 200K/XemMoc10000","Hñy Bá/No")
end


function XemMoc10000()
if (GetTask(NHANTHUONGMOC) == 0) then
Say("<color=green>"..myplayersex().." §· Sö Dông: <color=red>"..GetTask(HOAPHUONGTRANG).."/200000<color>event<color>\n<color=orange>PhÇn Th­ëng Mèc Nµy Gåm<color>",2,"NhËn PhÇn Th­ëng Mèc 200000/Moc10000","Hñy Bá/No")
else 
Say("<color=green>"..myplayersex().." §· Sö Dông: <color=red>"..GetTask(HOAPHUONGTRANG).."/200000<color> event<color>\n<color=red>Kh«ng §ñ §iÒu KiÖn §Ó NhËn Mèc Nµy HoÆc §· NhËn Råi<color=red>\n<color=orange>PhÇn Th­ëng Mèc Nµy Gåm <color>",1,"Hñy Bá/No")
end
end
function XemMoc15000()
if (GetTask(NHANTHUONGMOC) == 1) then
Say("<color=green>"..myplayersex().." §· Sö Dông: <color=red>"..GetTask(HOAPHUONGTRANG).."/20000<color> Huy HiÖu Sao Vµng<color>\n<color=orange>PhÇn Th­ëng Mèc Nµy Gåm<color>",2,"NhËn PhÇn Th­ëng Mèc 20000/Moc15000","Hñy Bá/No")
else 
Say("<color=green>"..myplayersex().." §· Sö Dông: <color=red>"..GetTask(HOAPHUONGTRANG).."/20000<color> Huy HiÖu Sao Vµng<color>\n<color=red>Kh«ng §ñ §iÒu KiÖn §Ó NhËn Mèc Nµy HoÆc §· NhËn Råi<color=red>\n<color=orange>PhÇn Th­ëng Mèc Nµy Gåm<color>",1,"Hñy Bá/No")
end
end
function XemMoc20000()
if (GetTask(NHANTHUONGMOC) == 2) then
Say("<color=green>"..myplayersex().." §· Sö Dông: <color=red>"..GetTask(HOAPHUONGTRANG).."/30000<color>Huy HiÖu Sao Vµng<color>\n<color=orange>PhÇn Th­ëng Mèc Nµy Gåm <color>",2,"NhËn PhÇn Th­ëng Mèc 30000/Moc20000","Hñy Bá/No")
else 
Say("<color=green>"..myplayersex().." §· Sö Dông: <color=red>"..GetTask(HOAPHUONGTRANG).."/30000<color> Huy HiÖu Sao Vµng<color>\n<color=red>Kh«ng §ñ §iÒu KiÖn §Ó NhËn Mèc Nµy HoÆc §· NhËn Råi<color=red>\n<color=orange>PhÇn Th­ëng Mèc Nµy Gåmh<color>",1,"Hñy Bá/No")
end
end
function XemMoc25000()
if (GetTask(NHANTHUONGMOC) == 3) then
Say("<color=green>"..myplayersex().." §· Sö Dông: <color=red>"..GetTask(HOAPHUONGTRANG).."/50000<color>Huy HiÖu Sao Vµng<color>\n<color=orange>PhÇn Th­ëng Mèc Nµy Gåm <color>",2,"NhËn PhÇn Th­ëng Mèc 50000/Moc25000","Hñy Bá/No")
else 
Say("<color=green>"..myplayersex().." §· Sö Dông: <color=red>"..GetTask(HOAPHUONGTRANG).."/50000<color> Huy HiÖu Sao Vµng<color>\n<color=red>Kh«ng §ñ §iÒu KiÖn §Ó NhËn Mèc Nµy HoÆc §· NhËn Råi<color=red>\n<color=orange>PhÇn Th­ëng Mèc Nµy Gåm <color>",1,"Hñy Bá/No")
end
end


----------------------------------------------------Nhan Moc 2000 -----------------------------------------------------------------------------------------------------
function Moc10000()
	if (GetTask(HOAPHUONGTRANG) >= 200000)  and (GetTask(4985) == 0)then
		local tbAward = {
			[1] = {
				{szName="B¸nh TiÒm N¨ng",tbProp={6,1,4598,1,0,0},nCount=1},
				{szName="NhÉn Cµng Kh«n",tbProp={0,4369},nQuality=1,nCount=1},
				
				{szName="B¸nh TiÒm N¨ng",tbProp={6,1,4537,1,0,0},nCount=1},
				{szName="B¸nh TiÒm N¨ng",tbProp={6,1,4538,1,0,0},nCount=1},
				{szName="NhÉn Cµng Kh«n",tbProp={0,3507},nQuality=1,nCount=1},

			},
		}
		tbAwardTemplet:GiveAwardByList(tbAward,"PhÇn Th­ëng Mèc 10000") SetTask(4985,1)
		local nCureLevel = GetLevel()
		
local nAddLevel = 200 - nCureLevel
		
ST_LevelUp(nAddLevel)
	else
		Talk(1,"","<color=red>"..myplayersex().." Ch­a §¹t Tíi Mèc Nµy")
		end
	end
		
		
		
	
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Moc15000()
	
	if (GetTask(HOAPHUONGTRANG) >= 20000)  and (GetTask(4985) == 1)then
		local tbAward = {
			[1] = {
				{nExp_tl = 200e9},
				{szName="Hµnh HiÖp LÖnh",tbProp={6,1,6993,1,0,0},nCount=10},
				{szName="Ch©n Nguyªn 100 Tû Exp",tbProp={6,1,30340,1,0,0},nCount=10},
				{szName="Manh Mn",tbProp={6,1,6862,1,0,0},nCount=1},
			},
		}
		tbAwardTemplet:GiveAwardByList(tbAward,"PhÇn Th­ëng Mèc 15000") SetTask(4985,2)
	else
		Talk(1,"","<color=red>"..myplayersex().." Ch­a §¹t Tíi Mèc Nµy")
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Moc20000()
	if (GetTask(HOAPHUONGTRANG) >= 30000) and (GetTask(4985) == 2) then
		local tbAward = {
			[1] = {
				{nExp_tl = 300e9},
				{szName="LÖnh Bµi Gäi Boss",tbProp={6,1,30345,1,0,0},nCount=50},
				{szName="LÖnh Bµi Gäi Boss Kiem Tien",tbProp={6,1,30348,1,0,0},nCount=2},
				{szName="Ch©n Nguyªn Exp 100 tû exp",tbProp={6,1,30341,1,0,0},nCount=40},
				{szName="§¸ Xuyªn Y ( CÊp 3 )",tbProp={6,1,6849,1,0,0},nCount=1},

			},
		}
		tbAwardTemplet:GiveAwardByList(tbAward,"PhÇn Th­ëng Mèc 20000") SetTask(4985,3)
	else
		Talk(1,"","<color=red>"..myplayersex().." Ch­a §¹t Tíi Mèc Nµy")
	end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Moc25000()
	if (GetTask(HOAPHUONGTRANG) >= 50000)  and (GetTask(4985) == 3)then
		local tbAward = {
			[1] = {
				{nExp_tl = 400e9},
				{szName="NhÉn Cµng Kh«n",tbProp={0,random(8826,8839)},nQuality=1,nCount=1},
				{szName="§¸ Ngò Hµnh Ên ( CÊp 3 )",tbProp={6,1,6835,1,0,0},nCount=1},
				{szName="Phi phong TiÓu Tö",tbProp={6,1,6878,1,0,0},nCount=1},
				{szName="Long Tinh H¾c Hæ V­¬ng",tbProp={6,1,6827,1,0,0},nCount=1},
				{szName="Long Tinh H¾c Hæ V­¬ng",tbProp={6,1,4338,1,0,0},nCount=1},
				{szName="Tinh S­¬ng Trïng LuyÖn Ngäc",tbProp={6,1,5425,1,0,0},nCount=200},


			},
		}
		tbAwardTemplet:GiveAwardByList(tbAward,"PhÇn Th­ëng Mèc 25000") SetTask(4985,4)
	else
		Talk(1,"","<color=red>"..myplayersex().." Ch­a §¹t Tíi Mèc Nµy")
	end
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function NhanMoc1()
Say("<color=green>"..myplayersex().." §· Sö Dông: <color=red>"..GetTask(HOAPHUONGTRANG).."<color> Huy HiÖu Sao Vµng<color>\n §· NhËn Mèc<color=red> "..GetTask(NHANTHUONGMOC).."<color> Mèc Huy HiÖu Sao Vµng<color>\n<color=orange>L­u ý: NhËn Mèc Tèi §a 50000 Huy HiÖu Sao Vµng\nTrong Suèt Thêi Gian Ho¹t §éng<color>",5,"Xem PhÇn Th­ëng Mèc 10K/XemMoc100001","Xem PhÇn Th­ëng Mèc 20K/XemMoc150001","Xem PhÇn Th­ëng Mèc 30K/XemMoc200001","Xem PhÇn Th­ëng Mèc 50K/XemMoc250001","Hñy Bá/No")
end


function XemMoc100001()
if (GetTask(NHANTHUONGMOC) == 0) then
Say("<color=green>"..myplayersex().." §· Sö Dông: <color=red>"..GetTask(HOAPHUONGTRANG).."/10000<color>Huy HiÖu Sao Vµng<color>\n<color=orange>PhÇn Th­ëng Mèc Nµy Gåm<color>",2,"NhËn PhÇn Th­ëng Mèc 10000/Moc100001","Hñy Bá/No")
else 
Say("<color=green>"..myplayersex().." §· Sö Dông: <color=red>"..GetTask(HOAPHUONGTRANG).."/10000<color> Huy HiÖu Sao Vµng<color>\n<color=red>Kh«ng §ñ §iÒu KiÖn §Ó NhËn Mèc Nµy HoÆc §· NhËn Råi<color=red>\n<color=orange>PhÇn Th­ëng Mèc Nµy Gåm <color>",1,"Hñy Bá/No")
end
end
function XemMoc150001()
if (GetTask(NHANTHUONGMOC) == 1) then
Say("<color=green>"..myplayersex().." §· Sö Dông: <color=red>"..GetTask(HOAPHUONGTRANG).."/20000<color> Huy HiÖu Sao Vµng<color>\n<color=orange>PhÇn Th­ëng Mèc Nµy Gåm<color>",2,"NhËn PhÇn Th­ëng Mèc 20000/Moc150001","Hñy Bá/No")
else 
Say("<color=green>"..myplayersex().." §· Sö Dông: <color=red>"..GetTask(HOAPHUONGTRANG).."/20000<color> Huy HiÖu Sao Vµng<color>\n<color=red>Kh«ng §ñ §iÒu KiÖn §Ó NhËn Mèc Nµy HoÆc §· NhËn Råi<color=red>\n<color=orange>PhÇn Th­ëng Mèc Nµy Gåm<color>",1,"Hñy Bá/No")
end
end
function XemMoc200001()
if (GetTask(NHANTHUONGMOC) == 2) then
Say("<color=green>"..myplayersex().." §· Sö Dông: <color=red>"..GetTask(HOAPHUONGTRANG).."/30000<color>Huy HiÖu Sao Vµng<color>\n<color=orange>PhÇn Th­ëng Mèc Nµy Gåm <color>",2,"NhËn PhÇn Th­ëng Mèc 30000/Moc200001","Hñy Bá/No")
else 
Say("<color=green>"..myplayersex().." §· Sö Dông: <color=red>"..GetTask(HOAPHUONGTRANG).."/30000<color> Huy HiÖu Sao Vµng<color>\n<color=red>Kh«ng §ñ §iÒu KiÖn §Ó NhËn Mèc Nµy HoÆc §· NhËn Råi<color=red>\n<color=orange>PhÇn Th­ëng Mèc Nµy Gåmh<color>",1,"Hñy Bá/No")
end
end
function XemMoc250001()
if (GetTask(NHANTHUONGMOC) == 3) then
Say("<color=green>"..myplayersex().." §· Sö Dông: <color=red>"..GetTask(HOAPHUONGTRANG).."/50000<color>Huy HiÖu Sao Vµng<color>\n<color=orange>PhÇn Th­ëng Mèc Nµy Gåm <color>",2,"NhËn PhÇn Th­ëng Mèc 50000/Moc250001","Hñy Bá/No")
else 
Say("<color=green>"..myplayersex().." §· Sö Dông: <color=red>"..GetTask(HOAPHUONGTRANG).."/50000<color> Huy HiÖu Sao Vµng<color>\n<color=red>Kh«ng §ñ §iÒu KiÖn §Ó NhËn Mèc Nµy HoÆc §· NhËn Råi<color=red>\n<color=orange>PhÇn Th­ëng Mèc Nµy Gåm <color>",1,"Hñy Bá/No")
end
end


----------------------------------------------------Nhan Moc 2000 -----------------------------------------------------------------------------------------------------
function Moc100001()
	if (GetTask(HOAPHUONGTRANG) >= 10000)  and (GetTask(4985) == 0)then
		local tbAward = {
			[1] = {
				{nExp_tl = 50e9},
				{szName="B¸nh TiÒm N¨ng",tbProp={6,1,127,1,0,0},nCount=50},
                     			{szName="B¸nh ky N¨ng",tbProp={6,1,128,1,0,0},nCount=50},
				{szName="lb vong quay",tbProp={6,1,4668,1,0,0},nCount=50},

			},
		}
		tbAwardTemplet:GiveAwardByList(tbAward,"PhÇn Th­ëng Mèc 10000") SetTask(4985,1)

	else
		Talk(1,"","<color=red>"..myplayersex().." Ch­a §¹t Tíi Mèc Nµy")
		end
	end
		
		
		
	
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Moc150001()
	
	if (GetTask(HOAPHUONGTRANG) >= 20000)  and (GetTask(4985) == 1)then
		local tbAward = {
			[1] = {
				{nExp_tl = 100e9},
				{szName="Hµnh HiÖp LÖnh",tbProp={6,1,6993,1,0,0},nCount=10},
				{szName="Ch©n Nguyªn 100 Tû Exp",tbProp={6,1,30340,1,0,0},nCount=10},
				{szName="Manh Mn",tbProp={6,1,6862,1,0,0},nCount=1},
			},
		}
		tbAwardTemplet:GiveAwardByList(tbAward,"PhÇn Th­ëng Mèc 15000") SetTask(4985,2)
	else
		Talk(1,"","<color=red>"..myplayersex().." Ch­a §¹t Tíi Mèc Nµy")
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Moc200001()
	if (GetTask(HOAPHUONGTRANG) >= 30000) and (GetTask(4985) == 2) then
		local tbAward = {
			[1] = {
				{nExp_tl = 150e9},
				{szName="LÖnh Bµi Gäi Boss",tbProp={6,1,30345,1,0,0},nCount=50},
				{szName="LÖnh Bµi Gäi Boss Kiem Tien",tbProp={6,1,30348,1,0,0},nCount=2},
				{szName="Ch©n Nguyªn Exp 100 tû exp",tbProp={6,1,30341,1,0,0},nCount=40},
				{szName="§¸ Xuyªn Y ( CÊp 3 )",tbProp={6,1,6849,1,0,0},nCount=1},

			},
		}
		tbAwardTemplet:GiveAwardByList(tbAward,"PhÇn Th­ëng Mèc 20000") SetTask(4985,3)
	else
		Talk(1,"","<color=red>"..myplayersex().." Ch­a §¹t Tíi Mèc Nµy")
	end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Moc250001()
	if (GetTask(HOAPHUONGTRANG) >= 50000)  and (GetTask(4985) == 3)then
		local tbAward = {
			[1] = {
				{nExp_tl = 200e9},
				{szName="NhÉn Cµng Kh«n",tbProp={0,random(8826,8839)},nQuality=1,nCount=1},
				{szName="§¸ Ngò Hµnh Ên ( CÊp 3 )",tbProp={6,1,6835,1,0,0},nCount=1},
				{szName="Phi phong TiÓu Tö",tbProp={6,1,6878,1,0,0},nCount=1},
				{szName="Long Tinh H¾c Hæ V­¬ng",tbProp={6,1,6827,1,0,0},nCount=1},
				{szName="Long Tinh H¾c Hæ V­¬ng",tbProp={6,1,4338,1,0,0},nCount=1},
				{szName="Tinh S­¬ng Trïng LuyÖn Ngäc",tbProp={6,1,5425,1,0,0},nCount=200},


			},
		}
		tbAwardTemplet:GiveAwardByList(tbAward,"PhÇn Th­ëng Mèc 25000") SetTask(4985,4)
	else
		Talk(1,"","<color=red>"..myplayersex().." Ch­a §¹t Tíi Mèc Nµy")
	end
end
