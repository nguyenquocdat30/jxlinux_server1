IncludeLib("ITEM")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\composelistclass.lua")
Include("\\script\\lib\\composeex.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\bonus_onlinetime\\func_onlineaward.lua")
IncludeLib("SETTING")
IncludeLib("FILESYS")
IncludeLib("TASKSYS")
IncludeLib("BATTLE")
IncludeLib("RELAYLADDER");
IncludeLib("TONG")
Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
---------------------------------------------
HOAPHUONGTIM = 4984
--------------------------------------
function myplayersex()
	if GetSex() == 1 then 
		return "N÷ HiÖp";
	else
		return "§¹i HiÖp";
	end
end
----------------------------------------------------
function main()
dofile("script/global/quanlygame/sukien/1thang7/vonghoa.lua")

--local nHour = tonumber(GetLocalDate("%H%M"))
--if (nHour >= 1300 and nHour <= 1400) or (  nHour >= 1900 and nHour <= 2200)    then
--Say("<color=white><pic=26>Tõ 13h00 ®Õn 14h, 19h00 ®Õn 22h  lµ thêi gian TK , vui lßng quay l¹i sau.",0)
--return 1
 --end
local nDate = tonumber(GetLocalDate("%Y%m%d"));
local nTime = tonumber(GetLocalDate("%H%M"));
if ( nDate >= 20250818) then
		Talk(1,"","VËt PhÈm §· Qu¸ H¹n Sö Dông SÏ Tù §éng MÊt §i")
	return 1
 end
if GetLevel() < 120 and ST_IsTransLife() ~= 1 then
	Talk(1,"",""..myplayersex().." Ch­a §ñ CÊp 120 Trïng Sinh Kh«ng Giíi H¹n §¼ng CÊp")
return 1
 end
if CalcFreeItemCellCount() < 4 then
	Talk(1,"",""..myplayersex().."Vui Lßng Chõa 4 Chç Trèng")
	return 1
 end
if  GetTask(HOAPHUONGTIM ) >= 2000 then
	Say(""..myplayersex().." §· Sö Dông Tèi §a 2000 B¸nh  §Æc BiÖt\nTrong Suèt Thêi Gian Ho¹t §éng")
	return 1
 end	
tbAwardTemplet:GiveAwardByList(tbAward,"PhÇn Th­ëng B¸nh Sinh NhËt §Æc BiÖt")
SetTask(HOAPHUONGTIM, GetTask(HOAPHUONGTIM) + 1);
end

	
-----------------------------------------------------------------------------------------------------------------------
tbAward = {
	[1] = {
		{nExp_tl = 1500},
	},
	[2] = {
		
		--{szName="§ua Top Event",tbProp={6,1,4413,1,0,0},nCount=1,nRate=0.0001},
		--{szName="kim bµi d· tÈu",tbProp={6,1,4385,1,0,0},nCount=1,nRate=0.1},
		--{szName="TÝn VËt M«n Ph¸i",tbProp={6,1,1670,1,0,0},nCount=1,nRate=0.1},
		{szName="MËt TÞch Kü N¨ng 90 CÊp 21",tbProp={6,1,4386,1,0,0},nCount=1,nRate=0.01},
		{szName="Phi Tèc",tbProp={6,1,190,1,0,0},nCount=1,nRate=10},
		{szName="LÖnh Bµi",tbProp={6,1,157,1,0,0},nCount=1,nRate=10},
		{szName="ChiÕn Cç",tbProp={6,1,156,1,0,0},nCount=1,nRate=10},
		{szName="Tiªn Th¶o Lé §Æc BiÖt ",tbProp={6,1,1181,1,0,0},nCount=1,nRate=0.1},
		{szName="QuÕ Hoa Töu  ",tbProp={6,1,125,1,0,0},nCount=1,nRate=15},
		{szName="Thiªn s¬n  B¶o Lé  ",tbProp={6,1,72,1,0,0},nCount=1,nRate=15},
		{szName="Tiªn Th¶o Lé ",tbProp={6,1,71,1,0,0},nCount=1,nRate=1},
		{szName="B¶o R­¬ng §å Xanh ",tbProp={6,1,4413,1,0,0},nCount=1,nRate=10},
		{szName="Håi thiªn t¸i t¹o lÔ bao ",tbProp={6,1,2527,1,0,0},nCount=1,nRate=3},
		{szName="NhÊt Kû Cµn Kh«n Phï",tbProp={6,1,2126,1,0,0},nCount=1,nRate=0.05},
		{szName="B¸nh TiÒm N¨ng",tbProp={6,1,127,1,0,0},nCount=1,nRate=0.03},
		{szName="B¸nh Kü n¨ng",tbProp={6,1,128,1,0,0},nCount=1,nRate=0.03},
		{szName="LÖnh Bµi Phong L¨ng §é",tbProp={4,489,1,1,0},nCount=1,nRate=0.1},
		--{szName="MÆt N¹ ChiÕn Tr­êng Th¸nh Gi¶",tbProp={0,11,806,1,0,0},nCount=1,nExpiredTime=1440,nRate=0.1},
		{szName="Nguyªn So¸i ChiÕn M·", tbProp={0,5321}, nQuality=1, nCount = 1,nExpiredTime=10080,nRate=0.1},
		{szName="Nguyªn So¸i Quan Ên", tbProp={0,5291}, nQuality=1, nCount = 1,nExpiredTime=10080,nRate=0.1},
		{szName="Nguyªn So¸i Trang Søc", tbProp={0,5301}, nQuality=1, nCount = 1,nExpiredTime=10080,nRate=0.1},
		{szName="Nguyªn So¸i Phi Phong", tbProp={0,5311}, nQuality=1, nCount = 1,nExpiredTime=10080,nRate=0.1},
		{szName="Nguyªn So¸i MÆt N¹", tbProp={0,5331}, nQuality=1, nCount = 1,nExpiredTime=10080,nRate=0.1},
		{szName="Nguyªn So¸i ChiÕn M·", tbProp={0,5321}, nQuality=1, nCount = 1,nRate=0.001},
		{szName="Nguyªn So¸i Quan Ên", tbProp={0,5291}, nQuality=1, nCount = 1,nRate=0.001},
		{szName="Nguyªn So¸i Trang Søc", tbProp={0,5301}, nQuality=1, nCount = 1,nRate=0.001},
		{szName="Nguyªn So¸i Phi Phong", tbProp={0,5311}, nQuality=1, nCount = 1,nRate=0.001},
		{szName="Nguyªn So¸i MÆt N¹", tbProp={0,5331}, nQuality=1, nCount = 1,nRate=0.001},

	},
}
------------------------------------------------------------------------------------------------------------------------------------------------