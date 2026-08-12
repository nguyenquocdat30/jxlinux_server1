-------------------------------------------------***Create*By*Heart*Doldly***---------------------------------------------------------------
THANHDO	 = 5701
TUONGDUONG	 = 5702
PHUONGTUONG	 = 5703
DAYLY		 = 5704
BIENKINH	 = 5705
DUONGCHAU	 = 5706
LAMAN		 = 5707
GIANGTANTHON	 = 5708
VINHLACTRAN	 = 5709
CHUTIENTRAN	 = 5710
DAOHUONGTHON	 = 5711
THACHCOTRAN	 = 5712
LONGTUYENTHON	 = 5713
TASKTIMEDATE	 = 5714
TASKLIMITDATE	 = 5715
TASKHUYETTHU	 = 5716
TASKAPTHU	 = 5717
TASKXAPHU	 = 5718
TIMESTART	 = 1000
TIMEEND	 = 2300
BATDAU		 = "10:00"
KETTHUC	 = "23:00"
TASKMAXCOUNT	 = 50
TIENDATCUOC	 = 100
------------------------------------------------------------------------------------------------------
tbAward = {
	[1] = {
		{nExp_tl = 1000000},
		{szName="B¶o R­¬ng §¸ HiÖn",tbProp={6,1,4391,1,0,0},nCount=5,nBindState = -2},
		{szName="B¶o R­¬ng §¸ Èn",tbProp={6,1,4392,1,0,0},nCount=1,nBindState = -2},
		--{szName="TiÒn §ång",tbProp={4,417,1,1,0,0},nCount=200},
	},
	[2] = {
		-- {nExp_tl = 1000000},
		  },
	[3] = {
		--{szName="§å Phæ XÝch L©n",tbProp={6,1,random(4389,4398),1,0,0},nCount=1,nRate=15,CallBack = _Message},
		--{szName="§å Phæ Minh Ph­îng",tbProp={6,1,random(4399,4408),1,0,0},nCount=1,nRate=4.5,CallBack = _Message},
		--{szName="§å Phæ §»ng Long",tbProp={6,1,random(4409,4418),1,0,0},nCount=1,nRate=0.5,CallBack = _Message},
		  },
}
-------------------------------------------------------------------------------------------------------
function ClearData()
SetTask(THANHDO,0)
SetTask(TUONGDUONG,0)
SetTask(PHUONGTUONG,0)
SetTask(DAYLY,0)
SetTask(BIENKINH,0)
SetTask(DUONGCHAU,0)
SetTask(LAMAN,0)
SetTask(GIANGTANTHON,0)
SetTask(VINHLACTRAN,0)
SetTask(CHUTIENTRAN,0)
SetTask(DAOHUONGTHON,0)
SetTask(THACHCOTRAN,0)
SetTask(LONGTUYENTHON,0)
SetTask(TASKHUYETTHU,0)
end
-------------------------
function ClearAll()
SetTask(THANHDO,0)
SetTask(TUONGDUONG,0)
SetTask(PHUONGTUONG,0)
SetTask(DAYLY,0)
SetTask(BIENKINH,0)
SetTask(DUONGCHAU,0)
SetTask(LAMAN,0)
SetTask(GIANGTANTHON,0)
SetTask(VINHLACTRAN,0)
SetTask(CHUTIENTRAN,0)
SetTask(DAOHUONGTHON,0)
SetTask(THACHCOTRAN,0)
SetTask(LONGTUYENTHON,0)
SetTask(TASKLIMITDATE,0)
SetTask(TASKHUYETTHU,0)
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function MoveApThu()
	if GetTask(TASKHUYETTHU) == 1 then
		NewWorld(37,1687,3149)
	elseif GetTask(TASKHUYETTHU) == 2 then
		NewWorld(100,1655,3144)
	elseif GetTask(TASKHUYETTHU) == 3 then
		NewWorld(78,1601,3228)
	elseif GetTask(TASKHUYETTHU) == 4 then
		NewWorld(101,1634,3208)
	elseif GetTask(TASKHUYETTHU) == 5 then
		NewWorld(11,3058,4992)
	elseif GetTask(TASKHUYETTHU) == 6 then
		NewWorld(20,3515,6160)
	elseif GetTask(TASKHUYETTHU) == 7 then
		NewWorld(1,1597,3094)
	elseif GetTask(TASKHUYETTHU) == 8 then
		NewWorld(99,1667,3227)
	elseif GetTask(TASKHUYETTHU) == 9 then
		NewWorld(162,1637,3216)
	elseif GetTask(TASKHUYETTHU) == 10 then
		NewWorld(153,1621,3199)
	elseif GetTask(TASKHUYETTHU) == 11 then
		NewWorld(80,1782,3035)
	elseif GetTask(TASKHUYETTHU) == 12 then
		NewWorld(101,1634,3208)
	elseif GetTask(TASKHUYETTHU) == 13 then
		NewWorld(176,1418,3310)
	elseif GetTask(TASKHUYETTHU) == 14 then
		NewWorld(174,1595,3267)
	elseif GetTask(TASKHUYETTHU) == 15 then
		NewWorld(11,3059,4993)
	elseif GetTask(TASKHUYETTHU) == 16 then
		NewWorld(99,1667,3227)
	elseif GetTask(TASKHUYETTHU) == 17 then
		NewWorld(11,3059,4993)
	elseif GetTask(TASKHUYETTHU) == 18 then
		NewWorld(1,1597,3094)
	elseif GetTask(TASKHUYETTHU) == 19 then
		NewWorld(78,1603,3228)
	elseif GetTask(TASKHUYETTHU) == 20 then
		NewWorld(100,1655,3145)
	elseif GetTask(TASKHUYETTHU) == 21 then
		NewWorld(78,1603,3228)
	elseif GetTask(TASKHUYETTHU) == 22 then
		NewWorld(37,1687,3149)
	elseif GetTask(TASKHUYETTHU) == 23 then
		NewWorld(1,1597,3094)
	elseif GetTask(TASKHUYETTHU) == 24 then
		NewWorld(20,3514,6158)
	elseif GetTask(TASKHUYETTHU) == 25 then
		NewWorld(37,1687,3149)
	elseif GetTask(TASKHUYETTHU) == 26 then
		NewWorld(101,1635,3209)
	elseif GetTask(TASKHUYETTHU) == 27 then
		NewWorld(37,1687,3149)
	elseif GetTask(TASKHUYETTHU) == 28 then
		NewWorld(80,1781,3034)
	else
		NewWorld(121,2000,4475)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function XemLoTrinh()
	if (GetTask(TASKHUYETTHU) == 1) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>BiÖn Kinh - Chu Tiªn TrÊn[Täa §é:206/196]<color>"
	elseif (GetTask(TASKHUYETTHU) == 2) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>Chu Tiªn TrÊn - BiÖn Kinh[Täa §é:210/196]<color>"
	elseif (GetTask(TASKHUYETTHU) == 3) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>T­¬ng D­¬ng - §¹o H­¬ng Th«n[Täa §é:204/200]<color>"
	elseif (GetTask(TASKHUYETTHU) == 4) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>§¹o H­¬ng Th«n - T­¬ng D­¬ng[Täa §é:200/201]<color>"
	elseif (GetTask(TASKHUYETTHU) == 5) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>Thµnh §« - Giang T©n Th«n[Täa §é:439/384]<color>"
	elseif (GetTask(TASKHUYETTHU) == 6) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>Giang T©n Th«n - Thµnh §«[Täa §é:382/312]<color>"
	elseif (GetTask(TASKHUYETTHU) == 7) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>Ph­îng T­êng - VÜnh L¹c TrÊn[Täa §é:208/201]<color>"
	elseif (GetTask(TASKHUYETTHU) == 8) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>VÜnh L¹c TrÊn - Ph­îng T­êng[Täa §é:199/193]<color>"
	elseif (GetTask(TASKHUYETTHU) == 9) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>§¹i Lý - Th¹ch Cæ TrÊn[Täa §é:202/200]<color>"
	elseif (GetTask(TASKHUYETTHU) == 10) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>Th¹ch Cæ TrÊn - §¹i Lý[Täa §é:204/201]<color>"
	elseif (GetTask(TASKHUYETTHU) == 11) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>D­¬ng Ch©u - §¹o H­¬ng Th«n[Täa §é:204/200]<color>"
	elseif (GetTask(TASKHUYETTHU) == 12) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>§¹o H­¬ng Th«n - D­¬ng Ch©u[Täa §é:222/189]<color>"
	elseif (GetTask(TASKHUYETTHU) == 13) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>L©m An - Long TuyÒn Th«n[Täa §é:199/204]<color>"
	elseif (GetTask(TASKHUYETTHU) == 14) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>Long TuyÒn Th«n - L©m An[Täa §é:177/206]<color>"
	elseif (GetTask(TASKHUYETTHU) == 15) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>Thµnh §« - KiÕm C¸c T©y Nam - Kinh Hoµng §éng\nKim Quang §éng - KiÕm C¸c Thôc §¹o - Ph­îng T­êng<color>\n                 <color=cyan>VÜnh L¹c TrÊn[Täa §é:208/201]<color>"
	elseif (GetTask(TASKHUYETTHU) == 16) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>VÜnh L¹c TrÊn - Ph­îng T­êng - KiÕm C¸c Thôc §¹o\nKim Quang §éng - Kinh Hoµng §éng - KiÕm C¸c T©y Nam<color>\n                 <color=cyan>Thµnh §«[Täa §é:382/312]<color>"
	elseif (GetTask(TASKHUYETTHU) == 17) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>Thµnh §« - KiÕm C¸c T©y Nam - Kinh Hoµng §éng\nKim Quang §éng - KiÕm C¸c Thôc §¹o<color>\n                 <color=cyan>Ph­îng T­êng[Täa §é:199/193]<color>"
	elseif (GetTask(TASKHUYETTHU) == 18) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>Ph­îng T­êng - KiÕm C¸c Thôc §¹o - Kim Quang §éng\nKinh Hoµng §éng - KiÕm C¸c T©y Nam<color>\n                 <color=cyan>Thµnh §«[Täa §é:382/312]<color>"
	elseif (GetTask(TASKHUYETTHU) == 19) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>T­¬ng D­¬ng - Phôc Ng­u S¬n Nam - Kª Qu¸n §éng\nThiªn T©m §éng - Phôc Ng­u S¬n T©y - BiÖn Kinh<color>\n                 <color=cyan>Chu Tiªn TrÊn[Täa §é:206/196]<color>"
	elseif (GetTask(TASKHUYETTHU) == 20) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>Chu Tiªn TrÊn - BiÖn Kinh - Phôc Ng­u S¬n T©y\nThiªn T©m §éng - Kª Qu¸n §éng - Phôc Ng­u S¬n Nam<color>\n                 <color=cyan>T­¬ng D­¬ng[Täa §é:200/201]<color>"
	elseif (GetTask(TASKHUYETTHU) == 21) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>T­¬ng D­¬ng - Phôc Ng­u S¬n Nam - Kª Qu¸n §éng\nThiªn T©m §éng - Phôc Ng­u S¬n T©y<color>\n                 <color=cyan>BiÖn Kinh[Täa §é:210/196]<color>"
	elseif (GetTask(TASKHUYETTHU) == 22) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>BiÖn Kinh - Phôc Ng­u S¬n T©y - Thiªn T©m §éng\nKª Qu¸n §éng - Phôc Ng­u S¬n Nam<color>\n                 <color=cyan>T­¬ng D­¬ng[Täa §é:200/201]<color>"
	elseif (GetTask(TASKHUYETTHU) == 23) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>Ph­îng T­êng - KiÕm C¸c Thôc §¹o - Kim Quang §éng\nKinh Hoµng §éng - KiÕm C¸c T©y Nam - Thµnh §«<color>\n                 <color=cyan>Giang T©n Th«n[Täa §é:439/384]<color>"
	elseif (GetTask(TASKHUYETTHU) == 24) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>Giang T©n Th«n - Thµnh §« - KiÕm C¸c T©y Nam\nKinh Hoµng §éng - Kim Quang §éng - KiÕm C¸c Thôc §¹o<color>\n                 <color=cyan>Ph­îng T­êng[Täa §é:199/193]<color>"
	elseif (GetTask(TASKHUYETTHU) == 25) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>BiÖn Kinh - Phôc Ng­u S¬n T©y - Thiªn T©m §éng\nKª Qu¸n §éng - Phôc Ng­u S¬n Nam - T­¬ng D­¬ng<color>\n                 <color=cyan>§¹o H­¬ng Th«n[Täa §é:204/200]<color>"
	elseif (GetTask(TASKHUYETTHU) == 26) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>§¹o H­¬ng Th«n - T­¬ng D­¬ng - Phôc Ng­u S¬n Nam\nKª Qu¸n §éng - Thiªn T©m §éng - Phôc Ng­u S¬n T©y<color>\n                 <color=cyan>BiÖn Kinh[Täa §é:210/196]<color>"
	elseif (GetTask(TASKHUYETTHU) == 27) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>BiÖn Kinh - Phôc Ng­u S¬n T©y - Thiªn T©m §éng\nKª Qu¸n §éng - Phôc Ng­u S¬n Nam - T­¬ng D­¬ng - §¹o H­¬ng Th«n<color>\n                 <color=cyan>D­¬ng Ch©u[Täa §é:222/189]<color>"
	elseif (GetTask(TASKHUYETTHU) == 28) then
		return "<color=yellow>Lé Tr×nh:<color>\n<color=green>D­¬ng Ch©u - §¹o H­¬ng Th«n - T­¬ng D­¬ng\nPhôc Ng­u S¬n Nam - Kª Qu¸n §éng - Thiªn T©m §éng - Phôc Ng­u S¬n T©y<color>\n                 <color=cyan>BiÖn Kinh[Täa §é:210/196]<color>"
	else
		return "<color=green>Kh«ng Cã Lé Tr×nh Nµo<color>"
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------