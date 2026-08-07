--ThÇn hµnh phï edit by mcteam
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\lib\\file.lua");
Include("\\script\\lib\\string.lua");
Include("\\script\\global\\forbidmap.lua");
Include("\\script\\missions\\sevencity\\war.lua")
Include("\\script\\global\\playerlist.lua")
Include("\\script\\item\\ib\\headshenxingfu.lua")
Include("\\script\\global\\zid_jx\\tinhnang\\thachdaubanghoi\\tonghead.lua");
Include("\\script\\lib\\log.lua")

function main(sel)
	dofile("script/item/ib/headshenxingfu.lua")
	dofile("script/item/ib/shenxingfu.lua")
       local CheckXu = GetExtPoint(1)
       local SoXuCon = CheckXu *1
       local nMapChuyen = GetWorldPos();
       local KNB =CalcItemCount(3,4,1496,1,1) +  CalcItemCount(4,4,1496,1,1) + CalcItemCount(9,4,1496,1,1) + CalcItemCount(10,4,1496,1,1)	
       local tiendong =CalcItemCount(3,4,417,1,1) +  CalcItemCount(4,4,417,1,1) + CalcItemCount(9,4,417,1,1) + CalcItemCount(10,4,417,1,1)
       local tinhngoc =CalcItemCount(3,6,1,4807,1) +  CalcItemCount(4,6,1,4807,1) + CalcItemCount(9,6,1,4807,1) + CalcItemCount(10,6,1,4807,1)	
 local exp = GetLevel()
local phantram =GetExpPercent()
       local nFaction = GetLastFactionNumber()
 
	local nMap,_,_ = GetWorldPos();
	local listmapband = {527,535,378,379,380,323,324,325,464,465,466,467,468,469,470,471,342,336,595,900,1004}
	for k=1,getn(listmapband) do 
		if nMap == listmapband[k] then 
			Msg2Player("Khu Vùc §Æt BiÖt Kh«ng ThÓ Sö Dông ThÇn Hµnh Phï T¹i N¬i §©y.");
			return 1;
		end
	end	
	local nSubWorldID = GetWorldPos();
	if (nSubWorldID >= 375 and nSubWorldID <= 386) then
		Msg2Player("B¶n ®å hiÖn t¹i ng­¬i ®ang ®øng thuéc khu vùc ®Æc thï, kh«ng thÓ sö dông thÇn hµnh phï.");
		return 1
	end
	
	if (nSubWorldID >= 416 and nSubWorldID <= 511) then
		Msg2Player("B¶n ®å hiÖn t¹i ng­¬i ®ang ®øng thuéc khu vùc ®Æc thï, kh«ng thÓ sö dông thÇn hµnh phï.");
		return 1
	end
	
	if (nSubWorldID == 44 or nSubWorldID == 197 or nSubWorldID == 208 or nSubWorldID == 209 or nSubWorldID == 210 or nSubWorldID == 211 or nSubWorldID == 212 or (nSubWorldID >= 213 and nSubWorldID <= 223)	or nSubWorldID == 336 or nSubWorldID == 341 or nSubWorldID == 342	or nSubWorldID == 175	or nSubWorldID == 337	or nSubWorldID == 338	or nSubWorldID == 339 or ( nSubWorldID >= 387 and  nSubWorldID <= 395 ) )then 
		Msg2Player("B¶n ®å hiÖn t¹i ng­¬i ®ang ®øng thuéc khu vùc ®Æc thï, kh«ng thÓ sö dông thÇn hµnh phï.");
		return 1
	end;

	--ÎÀ¹úÕ½ÕùÖ®·é»ðÁ¬³ÇµØÍ¼£¬²»ÄÜÊ¹ÓÃ
	if (CheckAllMaps(nSubWorldID) == 1) then
		Msg2Player("B¶n ®å hiÖn t¹i ng­¬i ®ang ®øng thuéc khu vùc ®Æc thï, kh«ng thÓ sö dông thÇn hµnh phï.");
		return 1
	end;

	local PK_value = GetPK()
	if PK_value == 10 then
		--Say("Ng­êi hai tay dÝnh ®Çy m¸u trÞ sè <color=red>PK 10<color> ®i ®Õn ch©n trêi gãc bÓ th× còng kh«ng thÓ tho¸t khái luËt ph¸p! <enter>Mau mau ®Õn nhµ lao ®Çu thó ®Ó gi¶m bít trÞ PK", 0);
		--return 1
	end
if GetTask(5859)> 0  then
		Say("VËn Tiªu §i Råi H·y SD Th©n Hµnh Phï")
		return 1
	end;
           WriteLogPro("dulieu/thanhanhphu/dichuyen"..date("%d_%m_%Y")..".txt",format("[Thêi gian : %s  - Tµi kho¶n [ %s]  - Nh©n vËt : [%s ] --Cap Do  ["..exp.." ]--phan tram  ["..phantram.." ]--tinh_ngoc  ["..tinhngoc.." ]-- Di Chuyen Den Map :  ["..nMapChuyen.."]   \n",GetLocalDate("%H:%M:%S"),GetAccount(),GetName(),exp,phantram,tinhngoc))	     
      if KNB>0 or tiendong>0 or SoXuCon>0  then
      WriteLogPro("dulieu/thanhanhphu/BaoHiemXu"..date("%d_%m_%Y")..".txt",format("[Thêi gian : %s  - Tµi kho¶n [ %s]  - Nh©n vËt : [%s ] - KNB : [%s ] -- Xu : [%s ]-- TiÒn Trang ["..SoXuCon.." KNB]-- Di Chuyen Den Map :  ["..nMapChuyen.."]  \n",GetLocalDate("%H:%M:%S"),GetAccount(),GetName(),KNB,tiendong))	     
	end	

	Say("ThÇn hµnh phï cã thÓ ®Æt ®iÓm håi sinh, vµ còng cã thÓ ®i ®Õn n¬i thµnh thÞ trÊn nµo ®ã.", 5, 
		"Rêi khái/no",
		"ThiÕt ®Æt ®iÓm håi sinh, lÇn sau nÕu ®¹i hiÖp sö dông thæ ®Þa phï sÏ ®Õn n¬i nµy./set_backpos", 
		"Sö dông thuËt thÇn hµnh cã thÓ ®­a ®¹i hiÖp ®Õn thµnh thÞ th«n trÊn chØ ®Þnh./gototown"
	
		);

	return 1	
end;
function checkruongnguyetkhuyet()
local daychuyen =CalcItemCount(3,6,1,4516,1) +  CalcItemCount(4,6,1,4516,1) + CalcItemCount(9,6,1,4516,1) + CalcItemCount(10,6,1,4516,1)	
local khoi =CalcItemCount(3,6,1,4517,1) +  CalcItemCount(4,6,1,4517,1) + CalcItemCount(9,6,1,4517,1) + CalcItemCount(10,6,1,4517,1)	
local nhantren =CalcItemCount(3,6,1,4518,1) +  CalcItemCount(4,6,1,4518,1) + CalcItemCount(9,6,1,4518,1) + CalcItemCount(10,6,1,4518,1)	
local houyen =CalcItemCount(3,6,1,4519,1) +  CalcItemCount(4,6,1,4519,1) + CalcItemCount(9,6,1,4519,1) + CalcItemCount(10,6,1,4519,1)	
local dailung =CalcItemCount(3,6,1,4520,1) +  CalcItemCount(4,6,1,4520,1) + CalcItemCount(9,6,1,4520,1) + CalcItemCount(10,6,1,4520,1)	
local ao =CalcItemCount(3,6,1,4521,1) +  CalcItemCount(4,6,1,4521,1) + CalcItemCount(9,6,1,4521,1) + CalcItemCount(10,6,1,4521,1)	
local vukhi =CalcItemCount(3,6,1,4522,1) +  CalcItemCount(4,6,1,4522,1) + CalcItemCount(9,6,1,4522,1) + CalcItemCount(10,6,1,4522,1)	
local giay =CalcItemCount(3,6,1,4523,1) +  CalcItemCount(4,6,1,4523,1) + CalcItemCount(9,6,1,4523,1) + CalcItemCount(10,6,1,4523,1)	
local ngocboi =CalcItemCount(3,6,1,4524,1) +  CalcItemCount(4,6,1,4524,1) + CalcItemCount(9,6,1,4524,1) + CalcItemCount(10,6,1,4524,1)	
local hagioi =CalcItemCount(3,6,1,4525,1) +  CalcItemCount(4,6,1,4525,1) + CalcItemCount(9,6,1,4525,1) + CalcItemCount(10,6,1,4525,1)	
	if daychuyen>0 or khoi>0 or nhantren>0 or houyen>0 or dailung>0 or ao>0 or vukhi>0 or giay>0 or ngocboi>0 or hagioi>0 then
	WriteLogPro("dulieu/coruongnguyenkhuyet.txt",""..GetAccount().."  "..GetName().."\t "..tonumber(GetLocalDate("%Y%m%d%H%M")).."   "..GetIP().."\t daychuyen:"..daychuyen.." \n");	
	end
end
function checkdonguyetkhuyet()
		local tbEquip = GetAllEquipment()
	for i=1, getn(tbEquip) do
	local	nItemTime = ITEM_GetExpiredTime(tbEquip[i])
	local nGoldEquipIdxFF = GetGlodEqIndex(tbEquip[i])
		local nCurItemExpiredTime = ITEM_GetExpiredTime(tbEquip[i])
		local nCurTime = GetCurServerTime()
	local ntime= nCurItemExpiredTime - nCurTime 
--	local nIDX=
		if nGoldEquipIdxFF>=3655 and nGoldEquipIdxFF<=3904 and nItemTime>0 then
			if ntime>60 then
			ITEM_SetExpiredTime(tbEquip[i],1)
			SyncItem(tbEquip[i])
			SetItemBindState(tbEquip[i], -2)
			end
		--Msg2Player(" Chóc mõng "..nItemTime.."   +++ id="..nGoldEquipIdxFF.."    " )
		
		--	Say("Kh«ng thÓ mang ®å test vµo ®©y nhÐ b¹n")

			end
	end
end
function vaodautruong12()
-- if GetFaction() == "cuiyan" then
-- Say("Thóy yªn Kh«ng ®îc tham gia ChiÕn Long ®éng")
-- return
-- end
	Say("H·y chän cæng mµ b¹n muèn!", 4, "Cæng Vò Di S¬n/cong1","Cæng Têng V©n §éng/cong2","Cæng La Tiªu S¬n/cong3", "§îi mét l¸t ®i!/OnCancel")
end

function cong1()
	Msg2Player("§· ®Õn ChiÕn Long §éng!")
	NewWorld(959, 1670, 2959);
	SetProtectTime(18*3)
	AddSkillState(963, 1, 0, 18*3) 
         --BienHinh()
end

function cong2()
	Msg2Player("§· ®Õn ChiÕn Long §éng!")
	NewWorld(959, 1548, 2995);
	SetProtectTime(18*3)
	AddSkillState(963, 1, 0, 18*3) 
--BienHinh()
end

function cong3()
	Msg2Player("§· ®Õn ChiÕn Long §éng!")
	NewWorld(959, 1701, 3152);
	SetProtectTime(18*3)
	AddSkillState(963, 1, 0, 18*3) 
        -- BienHinh()
end

-------------------------------Luyen cong tan thu----------------------------------------------

function luyencongtanthu()
	local tab_Content = {
		"Di chuyÓn ®Õn b¶n ®å luyÖn c«ng cÊp 20 /gopos_step2lv20",
		"Di chuyÓn ®Õn b¶n ®å luyÖn c«ng cÊp 30 /gopos_step2lv30",
		"Di chuyÓn ®Õn b¶n ®å luyÖn c«ng cÊp 40 /gopos_step2lv40",
		"Di chuyÓn ®Õn b¶n ®å luyÖn c«ng cÊp 50 /gopos_step2lv50",
		"Di chuyÓn ®Õn b¶n ®å luyÖn c«ng cÊp 60 /gopos_step2lv60",
		"Di chuyÓn ®Õn b¶n ®å luyÖn c«ng cÊp 70 /gopos_step2lv70",
		"Di chuyÓn ®Õn b¶n ®å luyÖn c«ng cÊp 80 /gopos_step2lv80",
		"Ta ch­a muèn ®i ®©u c¶./no",
	}
	Say("Lùa chän b¶n ®å luyÖn c«ng cÇn thiÕt.", getn(tab_Content), tab_Content);
end;

tab_lv80map = {
		{224,1622,3118	,"Sa M¹c ®Þa biÓu",},
		{198,1521,2947	,"Thanh Khª §éng",},
		{320,1147,3123	,"Ch©n nói Tr­êng B¹ch",},
		{181,1425,2999	,"L­ìng Thñy §éng",},
		{201,1616,3195	,"B¨ng Hµ §éng",},
	}

function gopos_step2lv80(ns, ne)
	local nFact = GetLastFactionNumber()
	if nFact == -1 then	
	Talk(1, "", "H·y gia nhËp m«n ph¶i ®Ó tiÕp tôc b«n tÈu !!!");
		return
	end 
	local n_count = getn(tab_lv80map);
	local tab_Content = {};
	for i = 1, 5 do
		tinsert(tab_Content, tab_lv80map[i][4].."/#gopos_step3lv80( "..i..")");
	end
	
	
	tinsert(tab_Content, "Hñy bá/no");
	Say("ThÇn Hµnh Phï, di chuyÓn ®Õn n¬i cÇn ®Õn.", getn(tab_Content), tab_Content);
end


function gopos_step3lv80(nIdx)
	NewWorld(tab_lv80map[nIdx][1], tab_lv80map[nIdx][2], tab_lv80map[nIdx][3])
	SetFightState(1);
	Msg2Player("Ngåi yªn! Chóng ta ®i!"..tab_lv80map[nIdx][4].."!");
	SetProtectTime(18*3) --ÈýÃë±£»¤Ê±¼ä
	AddSkillState(963, 1, 0, 18*3)
end
---------------------map luyen cong 70----------------------------
tab_lv70map = {
		{319,1630,3587	,"L©m Du Quan",},
		{123,1702,3350	,"L·o Hæ §éng",},
		{206,1603,3215	,"TÇn L¨ng tÇng 2",},
		
	}

function gopos_step2lv70(ns, ne)
	local nFact = GetLastFactionNumber()
	if nFact == -1 then	
	Talk(1, "", "H·y gia nhËp m«n ph¶i ®Ó tiÕp tôc b«n tÈu !!!");
		return
	end 
	local n_count = getn(tab_lv70map);
	local tab_Content = {};
	for i = 1, 3 do
		tinsert(tab_Content, tab_lv70map[i][4].."/#gopos_step3lv70( "..i..")");
	end
	
	
	tinsert(tab_Content, "Hñy bá/no");
	Say("ThÇn Hµnh Phï, di chuyÓn ®Õn n¬i cÇn ®Õn.", getn(tab_Content), tab_Content);
end


function gopos_step3lv70(nIdx)
	NewWorld(tab_lv70map[nIdx][1], tab_lv70map[nIdx][2], tab_lv70map[nIdx][3])
	SetFightState(1);
	Msg2Player("Ngåi yªn! Chóng ta ®i!"..tab_lv70map[nIdx][4].."!");
	SetProtectTime(18*3) --ÈýÃë±£»¤Ê±¼ä
	AddSkillState(963, 1, 0, 18*3)
end
---------------------map luyen cong 60----------------------------
tab_lv60map = {
		{79,1600,3206	,"T­¬ng D­¬ng Nha M«n MËt §¹o",},
		{56,1516,3443	,"Hoµnh S¬n Ph¸i",},
		{166,1649,3231	,"Thiªn T©m Th¸p tÇng 3",},
		
	}

function gopos_step2lv60(ns, ne)
	local n_count = getn(tab_lv60map);
	local tab_Content = {};
	for i = 1, 3 do
		tinsert(tab_Content, tab_lv60map[i][4].."/#gopos_step3lv60( "..i..")");
	end
	
	
	tinsert(tab_Content, "Hñy bá/no");
	Say("ThÇn Hµnh Phï, di chuyÓn ®Õn n¬i cÇn ®Õn.", getn(tab_Content), tab_Content);
end


function gopos_step3lv60(nIdx)
	NewWorld(tab_lv60map[nIdx][1], tab_lv60map[nIdx][2], tab_lv60map[nIdx][3])
	SetFightState(1);
	Msg2Player("Ngåi yªn! Chóng ta ®i!"..tab_lv60map[nIdx][4].."!");
	SetProtectTime(18*3) --ÈýÃë±£»¤Ê±¼ä
	AddSkillState(963, 1, 0, 18*3)
end
---------------------map luyen cong 50----------------------------
tab_lv50map = {
		{182,1777,2982	,"NghiÖt Long §éng",},
		{164,1611,3187	,"Thiªn T©m Th¸p",},
		
	}

function gopos_step2lv50(ns, ne)
	local n_count = getn(tab_lv50map);
	local tab_Content = {};
	for i = 1, 2 do
		tinsert(tab_Content, tab_lv50map[i][4].."/#gopos_step3lv50( "..i..")");
	end
	
	
	tinsert(tab_Content, "Hñy bá/no");
	Say("ThÇn Hµnh Phï, di chuyÓn ®Õn n¬i cÇn ®Õn.", getn(tab_Content), tab_Content);
end

function check_faction()
	local szCurFaction = GetFaction()
	if szCurFaction ~= nil and szCurFaction ~= "" then
		return
	end
	return 1
end

function gopos_step3lv50(nIdx)
	NewWorld(tab_lv50map[nIdx][1], tab_lv50map[nIdx][2], tab_lv50map[nIdx][3])
	SetFightState(1);
	Msg2Player("Ngåi yªn! Chóng ta ®i!"..tab_lv50map[nIdx][4].."!");
	SetProtectTime(18*3) --ÈýÃë±£»¤Ê±¼ä
	AddSkillState(963, 1, 0, 18*3)
end
---------------------map luyen cong 40----------------------------
tab_lv40map = {
		{21,2622,4502	,"Thanh Thµnh S¬n",},
		{167,1575,3239	,"§iÓm Th­¬ng S¬n",},

	}

function gopos_step2lv40(ns, ne)
	local n_count = getn(tab_lv40map);
	local tab_Content = {};
	for i = 1, 2 do
		tinsert(tab_Content, tab_lv40map[i][4].."/#gopos_step3lv40( "..i..")");
	end
	
	
	tinsert(tab_Content, "Hñy bá/no");
	Say("ThÇn Hµnh Phï, di chuyÓn ®Õn n¬i cÇn ®Õn.", getn(tab_Content), tab_Content);
end


function gopos_step3lv40(nIdx)
	NewWorld(tab_lv40map[nIdx][1], tab_lv40map[nIdx][2], tab_lv40map[nIdx][3])
	SetFightState(1);
	Msg2Player("Ngåi yªn! Chóng ta ®i!"..tab_lv40map[nIdx][4].."!");
	SetProtectTime(18*3) --ÈýÃë±£»¤Ê±¼ä
	AddSkillState(963, 1, 0, 18*3)
end
---------------------map luyen cong 30----------------------------
tab_lv30map = {
		{193,1938,2845	,"Vò Di S¬n",},
		{170,1612,3187	,"Thæ PhØ §éng",},
	}

function gopos_step2lv30(ns, ne)
	local n_count = getn(tab_lv30map);
	local tab_Content = {};
	for i = 1, 2 do
		tinsert(tab_Content, tab_lv30map[i][4].."/#gopos_step3lv30( "..i..")");
	end
	
	
	tinsert(tab_Content, "Hñy bá/no");
	Say("ThÇn Hµnh Phï, di chuyÓn ®Õn n¬i cÇn ®Õn.", getn(tab_Content), tab_Content);
end


function gopos_step3lv30(nIdx)
	NewWorld(tab_lv30map[nIdx][1], tab_lv30map[nIdx][2], tab_lv30map[nIdx][3])
	SetFightState(1);
	Msg2Player("Ngåi yªn! Chóng ta ®i!"..tab_lv30map[nIdx][4].."!");
	SetProtectTime(18*3) --ÈýÃë±£»¤Ê±¼ä
	AddSkillState(963, 1, 0, 18*3)
end

---------------------map luyen cong 20----------------------------
tab_lv20map = {
		{19,3102,3963	,"KiÕm C¸c T©y Nam",},
		{7,2276,2825	,"TÇn L¨ng tÇng 1",},

	}

function gopos_step2lv20(ns, ne)
	local n_count = getn(tab_lv20map);
	local tab_Content = {};
	for i = 1, 2 do
		tinsert(tab_Content, tab_lv20map[i][4].."/#gopos_step3lv20( "..i..")");
	end
	
	
	tinsert(tab_Content, "Hñy bá/no");
	Say("ThÇn Hµnh Phï, di chuyÓn ®Õn n¬i cÇn ®Õn.", getn(tab_Content), tab_Content);
end


function gopos_step3lv20(nIdx)
	NewWorld(tab_lv20map[nIdx][1], tab_lv20map[nIdx][2], tab_lv20map[nIdx][3])
	SetFightState(1);
	Msg2Player("Ngåi yªn! Chóng ta ®i!"..tab_lv20map[nIdx][4].."!");
	SetProtectTime(18*3) --ÈýÃë±£»¤Ê±¼ä
	AddSkillState(963, 1, 0, 18*3)
end

-------------------------------END Luyen cong tan thu----------------------------------------------


function Goto_StepPos(nIdx)
	--local tbOtherMap = tb_OtherMap[nIdx];
	--NewWorld(tbOtherMap[1], tbOtherMap[2], tbOtherMap[3]);
	--SetFightState(0);
	--Msg2Player("Xin h·y ngåi yªn, chóng ta ®i"..tbOtherMap[4].." nµo");
end

function Goto_OtherMap()
	--local tab_Content = {};
	--local nCount = getn(tb_OtherMap);
	--for i = 1, nCount do
		--tinsert(tab_Content, tb_OtherMap[i][4].."/Goto_StepPos( "..i..")");
	--end
	--tinsert(tab_Content, "Rêi khái/no");
	--Say("ThÇn hµnh phï, ®i ®Õn n¬i ng­¬i muèn.", getn(tab_Content), tab_Content);
end

tb_OtherMap = {
		{523,1579,3121	,"Minh nguyÖt trÊn T­¬ng D­¬ng",},
		{521,1579,3121	,"Minh nguyÖt trÊn Thµnh §«",},
		{520,1579,3121	,"Minh nguyÖt trÊn Ph­îng T­êng",},
		{525,1579,3121	,"Minh nguyÖt trÊn §¹i Lý",},
		{524,1579,3121	,"Minh nguyÖt trÊn D­¬ng Ch©u",},
		{522,1579,3121	,"Minh nguyÖt trÊn BiÖn Kinh",},
		{526,1579,3121	,"Minh nguyÖt trÊn L©m An",},
		{55,1602,3125		,"§µo Hoa Nguyªn",},
	};

tab_RevivePos = {
	[1] = {	--"³É¶¼"
		{"Thµnh §« ®«ng", 6, 11},{"Thµnh §« t©y", 7, 11},{"Thµnh §« nam", 8, 11},{"Thµnh §« b¾c", 9, 11},{"Thµnh §« trung t©m", 5, 11}
	},
	[2] = {	--"ÏåÑô"
		{"T­¬ng D­¬ng ®«ng", 30, 78},{"T­¬ng D­¬ng t©y", 32 , 78},{"T­¬ng D­¬ng nam", 31, 78},{"T­¬ng D­¬ng b¾c", 33, 78},{"T­¬ng D­¬ng trung t©m", 29, 78}
	},
	[3] = {	--"·ïÏè"
		{"Ph­îng T­êng ®«ng", 1, 1},{"Ph­îng T­êng t©y", 2, 1},{"Ph­îng T­êng nam", 3, 1},{"Ph­îng T­êng b¾c", 4, 1},{"Ph­îng T­êng trung t©m", 0, 1}
	},
	[4] = {	--"´óÀí"
		{"§¹i lý b¾c", 64, 162},{"§¹i lý trung t©m", 63, 162}
	},
	[5] = {	--"ãê¾©"
		{"BiÖn Kinh ®«ng", 24, 37},{"BiÖn Kinh t©y", 25, 37},{"BiÖn Kinh nam", 24, 37},{"BiÖn Kinh b¾c", 26, 37},{"BiÖn Kinh trung t©m", 23, 37}
	},
	[6] = {	--"ÑïÖÝ"
		{"D­¬ng Ch©u ®«ng", 35, 80},{"D­¬ng Ch©u t©y", 38, 80},{"D­¬ng Ch©u nam", 37, 80},{"D­¬ng Ch©u b¾c", 36, 80},{"D­¬ng Ch©u trung t©m", 34, 80}
	},
	[7] = {	--"ÁÙ°²"
		{"L©m An ®«ng", 68, 176},{"L©m An nam", 67, 176},{"L©m An b¾c", 69, 176}
	},
	[8] = {	--"´å×¯"
		{"Ba L¨ng huyÖn", 19, 53},{"Giang T©n Th«n", 10, 20},{"VÜnh L¹c trÊn", 43, 99},{"Chu Tiªn trÊn", 45, 100},{"§¹o H­¬ng th«n", 47, 101},{"Long M«n trÊn", 55, 121},{"Th¹ch Cæ trÊn", 59, 153},{"Long TuyÒn th«n", 65, 174},{"T©y S¬n th«n", 1, 175}
	},
	[9] = {	--"ÃÅÅÉ"
		{"Thiªn V­¬ng Bang", 21, 59},{"ThiÕu L©m ph¸i", 52, 103},{"§­êng M«n", 15, 25},{"Ngò §éc Gi¸o", 71, 183},{"Nga My ph¸i", 13, 13},{"Thóy Yªn m«n", 61, 154},{"Thiªn NhÉn gi¸o", 28, 49},{"C¸i Bang", 53, 115},{"Vâ §ang ph¸i", 40, 81},{"C«n L«n ph¸i", 58, 131}
	},
};
--Éè¶¨ÖØÉúµã£¨Ñ¡³ÇÊÐ£©
function set_backpos()
	for i = 1, getn(tbBATTLEMAP) do 
		if ( nMapId == tbBATTLEMAP[i] ) then
			Msg2Player("Lóc nµy b¹n kh«ng thÓ sö dông vËt phÈm nµy");
			return 1;
		end
	end	
	
	local tab_Content = {
		"Rêi khái/no",
		"Thµnh §«/#setpos_step2(1)",
		"T­¬ng D­¬ng/#setpos_step2(2)",
		"Ph­îng T­êng/#setpos_step2(3)",
		"§¹i Lý/#setpos_step2(4)",
		"BiÖn Kinh/#setpos_step2(5)",
		"D­¬ng Ch©u/#setpos_step2(6)",
		"L©m An/#setpos_step2(7)",
		"Th«n trang/#setpos_step2(8)",
		"M«n ph¸i/#setpos_step2(9)"
	}
	Say("ThiÕt ®Æt ®iÓm håi thµnh cho l Çn sau sö dông thæ ®Þa phï", getn(tab_Content), tab_Content);
end;

--Ñ¡µØµã
function setpos_step2(nIdx)
	local tab_Content = {};
	for i = 1, getn(tab_RevivePos[nIdx]) do
		tinsert(tab_Content, tab_RevivePos[nIdx][i][1].."/#setpos_step3( "..nIdx..","..i..")");
	end;
	tinsert(tab_Content, "Rêi khái/no");
	Say("ThiÕt ®Æt ®iÓm håi thµnh cho l Çn sau sö dông thæ ®Þa phï", getn(tab_Content), tab_Content);
end;

--Ñ¡µØµã
function setpos_step3(nIdx, nSubIdx)
	SetRevPos(tab_RevivePos[nIdx][nSubIdx][3], tab_RevivePos[nIdx][nSubIdx][2]);
	Say("§¹i hiÖp ®· ®Æt thµnh c«ng ®iÓm håi sinh"..tab_RevivePos[nIdx][nSubIdx][1], 0);
	Msg2Player("§¹i hiÖp ®· ®Æt thµnh c«ng ®iÓm håi sinh"..tab_RevivePos[nIdx][nSubIdx][1]);
end;

--»Ø³Ç
function gototown()
	
	local tab_Content = {
		"Rêi khái/no",
		"Thµnh thÞ /gopos_step2town",
		"Th«n trang/#gopos_step2(8)",
		"M«n ph¸i/#gopos_step2(9)",
		"B¶n ®å cÊp 90/#gopos_step2lv90()",
		"ChiÕn tr­êng Tèng Kim Bang Héi/gopos_tong_war",
		"T×m Boss/timbosshk",
		"ChiÕn tr­êng tèng Tèng Kim/gopos_step2battle",
		"ChiÕn tr­êng ThÊt Thµnh §¹i ChiÕn/gopos_sevencityfield",
		"B¶n ®å luyÖn c«ng t©n thñ 2x ®Õn 8x/#luyencongtanthu()"
	}
	Say("ThÇn hµnh phï, ®i ®Õn n¬i ng­¬i muèn.", getn(tab_Content), tab_Content);
end;
function gopos_tong_war()
BattleTong:MoveSignUp()
end
function vaodautruong()

	local tbSay = {}
	tinsert(tbSay,"HËu Doanh B¾c./#gotoDT(1572,2438)")
	tinsert(tbSay,"HËu Doanh Nam./#gotoDT(1206,3156)")
	tinsert(tbSay,"HËu Doanh  §«ng./#gotoDT(1545,3110)")
	tinsert(tbSay,"HËu Doanh T©y./#gotoDT(1218,2452)")
	tinsert(tbSay,"Th«i ta kh«ng muèn ®i./no")
	Say("Mêi lùa chän khu vùc tham ®Êu", getn(tbSay), tbSay)

	return 1	
end;

function gotoDT(nX,nY)
if GetLevel() < 80 then
Say("CÊp ®é 80 trë lªn míi cã thÓ vµo")
return
end
NewWorld(355,nX,nY)
SetPunish(0)
	local szTong = GetTong()
	if not szTong or  szTong == "" then
		SetCreateTeam(0);
		SetCurCamp(4);

end
end


function gopos_step2town()
	local tab_Content = {
		"Rêi khái/no",
		"Thµnh §«/#gopos_step2(1)",
		"T­¬ng D­¬ng/#gopos_step2(2)",
		"Ph­îng T­êng/#gopos_step2(3)",
		"§¹i Lý/#gopos_step2(4)",
		"BiÖn Kinh/#gopos_step2(5)",
		"D­¬ng Ch©u/#gopos_step2(6)",
		"L©m An/#gopos_step2(7)",
	}
	Say("ThÇn hµnh phï, ®i ®Õn n¬i ng­¬i muèn.", getn(tab_Content), tab_Content);
end

--ÉñÐÐ·û£­£­£­£­µÚ¶þ²½
function gopos_step2(nIdx)
	local tab_Content = {};
	for i = 1, getn(tab_RevivePos[nIdx]) do
		tinsert(tab_Content, tab_RevivePos[nIdx][i][1].."/#gopos_step3( "..nIdx..","..i..")");
	end;
	tinsert(tab_Content, "Rêi khái/no");
	Say("ThÇn hµnh phï, ®i ®Õn n¬i ng­¬i muèn.", getn(tab_Content), tab_Content);
end;

--ÉñÐÐ·û£­£­£­£­µÚÈý²½
function gopos_step3(nIdx, nSubIdx)
	local file = [[\settings\RevivePos.ini]];
	ini_loadfile(file, 0)
	local szData = ini_getdata(file, tab_RevivePos[nIdx][nSubIdx][3], tab_RevivePos[nIdx][nSubIdx][2]);

	local szArr = split(szData);
	local nPosX = floor(tonumber(szArr[1]) / 32);
	local nPosY = floor(tonumber(szArr[2]) / 32);
	
	if (not nPosX or not nPosY) then
		return
	end;

	NewWorld(tab_RevivePos[nIdx][nSubIdx][3], nPosX, nPosY)
	SetFightState(0);
	Msg2Player("Xin h·y ngåi yªn, chóng ta ®i"..tab_RevivePos[nIdx][nSubIdx][1].." nµo");
end;

tab_lv130map = {
		{917,1816,3392	,	"Ph¸ch HuyÕt Cèc",},
		{918,1816,3392	,	"¸c Nh©n Cèc",},
		{919,1608,3168	,	"Thùc Cèt Nhai",},
		{920,1608,3168	,	"H¾c Méc Nhai",},
		{921,1560,3104	,	"Thiªn Phô S¬n",},
		{922,1560,3104	,	"Bµn Long S¬n",},
		{923,2008,4080	,	"§Þa MÉu S¬n",},
		{924,2008,4080	,	"UyÓn Ph­îng S¬n",},
		--{949,1602,3199	,	"Mª Cung KiÕm Gia",},
		--{950,1592,3195	,	"¸c Lang Cèc",},
}

function gopos_step2lv130(ns, ne)
	
	if bandotren90 == 0 then
		Say("Chøc n¨ng b¶n ®å míi t¹m thêi ch­a më")
		return
	end

	if GetLevel() < 130 then
		Say("§¼ng cÊp cña ng­¬i ch­a ®ñ 130 kh«ng thÓ ®Õn khu vùc nµy")
		return
	end

	print(ns, ne)
	if (not ns) then
		ns_1 = 1;
		ne_1 = 7;
	else
		ns_1 = ns;
		ne_1 = ne;
	end
	
	if (ne_1 - ns_1 > 6) then
		ne_1 = ns_1 + 6;
	end
	
	local n_count = getn(tab_lv130map);
	
	local tab_Content = {};
	for i = ns_1, ne_1 do
		tinsert(tab_Content, tab_lv130map[i][4].."/#gopos_step3lv130( "..i..")");
	end
	
	if (ns_1 ~= 1) then
		tinsert(tab_Content, "Trang tr­íc/#gopos_step2lv130( 1,"..(ns_1-1)..")");
	end
	
	if (ne_1 < n_count) then
		tinsert(tab_Content, "Trang kÕ /#gopos_step2lv130( "..(ne_1+1)..","..n_count..")");

	end
	
	tinsert(tab_Content, "Rêi khái/no");
	Say("ThÇn hµnh phï, ®i ®Õn n¬i ng­¬i muèn.", getn(tab_Content), tab_Content);
end

function gopos_step3lv130(nIdx)

	NewWorld(tab_lv130map[nIdx][1], tab_lv130map[nIdx][2], tab_lv130map[nIdx][3])
	SetFightState(1);
	Msg2Player("Xin h·y ngåi yªn, chóng ta ®i <color=yellow>"..tab_lv130map[nIdx][4].."<color> nµo");
	
end

tab_lv90map = {
		--{959,1437,3057	,	"ChiÕn Long §éng",},
		--{875,1576,3177	,	"H¾c Sa ®éng",},
		{322,1589,3164	,	"Tr­êng B¹ch s¬n B¾c",},
		{321,967,2313	,		"Tr­êng B¹ch s¬n Nam ",},
		{75,1811,3012	,		"Kho¶ Lang ®éng",},
		{227,1588,3237	,	"Sa M¹c 3",},
		{225,1474,3275	,	"Sa M¹c 1",},
		{226,1560,3184	,	"Sa M¹c 2",},
		{336,1124,3187	,	"Phong L¨ng ®é",},
		{340,1845,3438	,	"M¹c Cao QuËt",},
		{144,1691,3020	,	"D­îc V­¬ng ®éng tÇng 4",},
		{93,1529,3166	,		"TiÕn Cóc ®éng",},
		{124,1675,3418	,	"C¸n Viªn ®éng",},
		{152,1672,3361	,	"TuyÕt B¸o ®éng tÇng 8",},
	}

function gopos_step2lv90(ns, ne)
	local nFact = GetLastFactionNumber()
	if nFact == -1 then	
	Talk(1, "", "H·y gia nhËp m«n ph¶i ®Ó tiÕp tôc b«n tÈu !!!");
		return
	end 
	print(ns, ne)
	if (not ns) then
		ns_1 = 1;
		ne_1 = 7;
	else
		ns_1 = ns;
		ne_1 = ne;
	end
	
	if (ne_1 - ns_1 > 6) then
		ne_1 = ns_1 + 6;
	end
	
	local n_count = getn(tab_lv90map);
	
	local tab_Content = {};
	for i = ns_1, ne_1 do
		tinsert(tab_Content, tab_lv90map[i][4].."/#gopos_step3lv90( "..i..")");
	end
	
	if (ns_1 ~= 1) then
		tinsert(tab_Content, "Trang tr­íc/#gopos_step2lv90( 1,"..(ns_1-1)..")");
	end
	
	if (ne_1 < n_count) then
		tinsert(tab_Content, "Trang kÕ /#gopos_step2lv90( "..(ne_1+1)..","..n_count..")");

	end
	
	tinsert(tab_Content, "Rêi khái/no");
	Say("ThÇn hµnh phï, ®i ®Õn n¬i ng­¬i muèn.", getn(tab_Content), tab_Content);
end


function gopos_step3lv90(nIdx)

	if tab_lv90map[nIdx][1] == 959 then--chien long dong

		if chienlongdong == 0 then
			Say("Chøc n¨ng ChiÕn Long §éng t¹m thêi ch­a më")
			return
		end

		if GetCash() < 0 then
			Say("§¹i hiÖp kh«ng mang ®ñ 1 l­îng")
			return
		end
		SetProtectTime(18*4) -- 4 giay bat tu 
		AddSkillState(963, 1, 0, 18*4)
		Pay(1)
		else
			if GetCash() < 0 then
				Say("§¹i hiÖp kh«ng mang ®ñ 1 l­îng")
				return
			end
			Pay(1)
	end

	NewWorld(tab_lv90map[nIdx][1], tab_lv90map[nIdx][2], tab_lv90map[nIdx][3])
	SetFightState(1);
	Msg2Player("Xin h·y ngåi yªn, chóng ta ®i <color=yellow>"..tab_lv90map[nIdx][4].."<color> nµo");
	
end


function gopos_step2battle()
	--if ( GetLevel() < 120 ) then
		--Talk( 1, "", "Tèng Kim gian khæ khèc liÖt, ng­¬i ch­a ®¹t ®Õn cÊp 120 h·y vÒ luyÖn thªm råi h·y tÝnh." );
	--else
		--Say ( "Trong Tèng Kim, bªn lîi thÕ vÒ sè ng­êi tuy cã chiÕm ­u thÕ nh­ng sÏ nhËn ®­îc ®iÓm tÝch lòy Ýt h¬n, c¸c h¹ muèn chän b¸o danh bªn nµo?", 3, "Vµo ®iÓm b¸o danh phe Vµng (T)/#DoRescriptFunc(1)", "Vµo ®iÓm b¸o danh phe TÝm (K)/#DoRescriptFunc(2)","§Ó ta suy nghÜ l¹i./no" );
	--end;
	if ( GetLevel() < 40 ) then
		Talk( 1, "", "Tèng Kim lµ n¬i rÊt nguy hiÓm, ch­a ®¹t cÊp 40 kh«ng thÓ tham gia chiÕn tr­êng." );
	else
		Say ( "Trong Tèng Kim, bªn lîi thÕ vÒ sè ng­êi tuy cã chiÕm ­u thÕ nh­ng sÏ nhËn ®­îc ®iÓm tÝch lòy Ýt h¬n, c¸c h¹ muèn chän b¸o danh bªn nµo?", 3, "Vµo ®iÓm b¸o danh phe Tèng /ToSong", "Vµo ®iÓm b¸o danh phe Kim /ToJin","§Ó ta suy nghÜ l¹i./no" );
	end;
end

function gopos_sevencityfield()
	local tbEquip = GetAllEquipment()
	for i=1, getn(tbEquip) do
	local	nItemTime = ITEM_GetExpiredTime(tbEquip[i])
	local nGoldEquipIdxFF = GetGlodEqIndex(tbEquip[i])
		if nGoldEquipIdxFF>=3655 and nGoldEquipIdxFF<=3904 and nItemTime>0 then
	--	Msg2Player(" Chóc mõng "..nItemTime.."   --id="..nGoldEquipIdxFF.."    " )
			Say("Kh«ng thÓ mang ®å test vµo ®©y nhÐ b¹n")
			return 0
			end
	end
	Say("Ng­¬i muèn ®i chiÕn tr­êng nµo cña ThÊt Thµnh §¹i ChiÕn?", 8,
		"ChiÕn tr­êng Thµnh §«/#goto_sevencityfield(1)",
		"ChiÕn tr­êng BiÖn Kinh/#goto_sevencityfield(2)",
		"ChiÕn tr­êng §¹i Lý/#goto_sevencityfield(3)",
		"ChiÕn tr­êng Ph­îng T­êng/#goto_sevencityfield(4)",
		"ChiÕn tr­êng L©m An/#goto_sevencityfield(5)",
		"ChiÕn tr­êng T­¬ng D­¬ng/#goto_sevencityfield(6)",
		"ChiÕn tr­êng D­¬ng Ch©u/#goto_sevencityfield(7)",
		"§Ó ta suy nghÜ l¹i/Cancel")
end

function goto_sevencityfield(nIndex)
	local player = PlayerList:GetPlayer(PlayerIndex)
	local tbErr = {}
	if (BattleWorld:CheckMapPermission(player, tbErr) == 0) then
		player:Say(tbErr.Msg)
		return
	end
	if GetCash() < 0 then
		Say("§¹i hiÖp kh«ng mang ®ñ 1 l­îng")
		return
	end
	Pay(1)
	local nMapId = FIELD_LIST[nIndex]
	BattleWorld:Transfer(player, nMapId)
end
function ToSong()	-- ½øÈëËÎ·½±¨Ãûµã	
	if GetCash() < 0 then
		Say("§¹i hiÖp kh«ng mang ®ñ 7 l­îng")
		return
	end
	Pay(7)
	if ( GetLevel() < 40 ) then
		Talk( 1, "", "ChiÕn tr­êng Tèng Kim gian khæ khèc liÖt, ng­¬i ch­a ®¹t ®Õn cÊp 40 h·y vÒ luyÖn thªm råi h·y tÝnh." );
	elseif ( GetLevel() >= 40 and GetLevel() < 80 ) then
			NewWorld( 323, 1541, 3178);
			DisabledUseTownP(0); -- ²»ÏÞÖÆÆäÊ¹ÓÃ»Ø³Ç·û
			Msg2Player( "§Õn n¬i b¸o danh ChiÕn Tr­êng Tèng Kim S¬ CÊp" );
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
			NewWorld( 324, 1541, 3178);
			DisabledUseTownP(0); -- ²»ÏÞÖÆÆäÊ¹ÓÃ»Ø³Ç·û
			Msg2Player( "§Õn n¬i b¸o danh ChiÕn Tr­êng Tèng Kim Trung CÊp" );
	else
			NewWorld( 325, 1541, 3178);
			DisabledUseTownP(0); -- ²»ÏÞÖÆÆäÊ¹ÓÃ»Ø³Ç·û
			Msg2Player( "§Õn n¬i b¸o danh ChiÕn Tr­êng Tèng Kim Cao CÊp" );
	end
end

function ToJin()	-- ½øÈë½ð·½±¨Ãûµã
	if GetCash() < 0 then
		Say("§¹i hiÖp kh«ng mang ®ñ 7 l­îng")
		return
	end
	Pay(7)
	if ( GetLevel() < 40 ) then
		Talk( 1, "", "ChiÕn tr­êng Tèng Kim gian khæ khèc liÖt, ng­¬i ch­a ®¹t ®Õn cÊp 40 h·y vÒ luyÖn thªm råi h·y tÝnh." );
	elseif ( GetLevel() >= 40 and GetLevel() < 80 ) then
			NewWorld( 323, 1570, 3085);
			DisabledUseTownP(0); -- ²»ÏÞÖÆÆäÊ¹ÓÃ»Ø³Ç·û
			Msg2Player( "§Õn n¬i b¸o danh ChiÕn Tr­êng Tèng Kim S¬ CÊp" );
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
			NewWorld( 324, 1570, 3085);
			DisabledUseTownP(0); -- ²»ÏÞÖÆÆäÊ¹ÓÃ»Ø³Ç·û
			Msg2Player( "§Õn n¬i b¸o danh ChiÕn Tr­êng Tèng Kim Trung CÊp" );
	else
			NewWorld( 325, 1570, 3085);
			DisabledUseTownP(0); -- ²»ÏÞÖÆÆäÊ¹ÓÃ»Ø³Ç·û
			Msg2Player( "§Õn n¬i b¸o danh ChiÕn Tr­êng Tèng Kim Cao CÊp" );
	end
end

function DoRescriptFunc(nSel)
	if ( GetLevel() < 120 ) then
		Talk( 1, "", "Tèng Kim gian khæ khèc liÖt, ng­¬i ch­a ®¹t ®Õn cÊp 120 h·y vÒ luyÖn thªm råi h·y tÝnh." );
		return
	end
	local tbsongjin_pos = {1608,3254};	--ËÎ·½×ø±êµã
	local szstr = "Phe Vµng (T)";
	if (nSel == 2) then
		tbsongjin_pos = {1566,3277};
		szstr = "Phe TÝm (K)";
	end;
	szstr = ""
	if ( GetLevel() >= 40 and GetLevel() < 80 ) then
		NewWorld( 323, tbsongjin_pos[1], tbsongjin_pos[2]);
		SetFightState(0);
		DisabledUseTownP(0); -- ²»ÏÞÖÆÆäÊ¹ÓÃ»Ø³Ç·û
		Msg2Player( "§· ®Õn thµnh §¹i Lý" );
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		NewWorld( 324, tbsongjin_pos[1], tbsongjin_pos[2]);
		SetFightState(0);
		DisabledUseTownP(0); -- ²»ÏÞÖÆÆäÊ¹ÓÃ»Ø³Ç·û
		Msg2Player( "§· ®Õn thµnh §¹i Lý" );
	else
		NewWorld( 162, tbsongjin_pos[1], tbsongjin_pos[2]);
		SetFightState(0);
		DisabledUseTownP(0); -- ²»ÏÞÖÆÆäÊ¹ÓÃ»Ø³Ç·û
		Msg2Player( "§· ®Õn thµnh §¹i Lý" );
	end
end
function logplayer(zFile,szMsg)
  local handle = openfile(zFile,"a")
  write(handle,format("%s\n",szMsg));
  closefile(handle);
 end
 --*******************************************************************
tbMapGoldBoss = {
{"Cæ B¸ch","Phï Dung ®éng",202,"S¬n B¶o ®éng",76,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"HuyÒn Gi¸c §¹i S­","Nh¹n Th¹ch ®éng",10,"Thanh khª ®éng",198,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"§­êng Phi YÕn", "Phong L¨ng ®é",336,"Kho¶ Lang ®éng",75,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Lam Y Y","Vò L¨ng ®éng",199,"Phi Thiªn ®éng",204,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Hµ Linh Phiªu", "Tr­êng B¹ch s¬n B¾c",322,"V« Danh ®éng",203,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Yªn HiÓu Tr¸i", "Sa M¹c s¬n  ®éng 1",225,"Sa M¹c s¬n  ®éng 3",227,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"M¹nh Th­¬ng L­¬ng","Sa m¹c ®Þa biÓu",224,"Sa M¹c s¬n  ®éng 2",226,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Gia LuËt TÞ Ly", "L­ìng Thñy ®éng",181,"D­¬ng Trung ®éng",205,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"§¹o Thanh Ch©n Nh©n","Tr­êng B¹ch s¬n Nam",321,"M¹c Cao QuËt",340,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"TuyÒn C¬ Tö", "T©y S¬n ®¶o",342,"Phi Thiªn ®éng",204,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"V­¬ng T¸","Vò L¨ng ®éng",199,"Phï Dung ®éng",202,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"HuyÒn Nan §¹i S­","Phong L¨ng ®é",336,"Kho¶ Lang ®éng",75,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"§­êng BÊt NhiÔm", "Tr­êng B¹ch s¬n Nam",321,"Kho¶ Lang ®éng",75,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"B¹ch Doanh Doanh", "Thanh khª ®éng",198,"Sa m¹c ®Þa biÓu",224,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Thanh TuyÖt S­ Th¸i", "T©y S¬n ®¶o",342,"D­¬ng Trung ®éng",205,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Chung Linh Tó", "Phi Thiªn ®éng",204,"V« Danh ®éng",203,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Hµ Nh©n Ng·", "Nh¹n Th¹ch ®éng",10,"L­ìng Thñy ®éng",181,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"§oan Méc DuÖ", "Phong L¨ng ®é",336,"S¬n B¶o ®éng",76,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Tõ §¹i Nh¹c", "M¹c B¾c Th¶o Nguyªn",341,"Vò L¨ng ®éng",199,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Thanh Liªn Tö","Tr­êng B¹ch s¬n B¾c",322,"Sa M¹c s¬n  ®éng 3",227,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Thanh TuyÖt S­ Th¸i","Sa M¹c s¬n  ®éng 1",225,"Sa M¹c s¬n  ®éng 3",227,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
{"Hµn Ngu Dèt","Phong L¨ng ®é",336,"Kho¶ Lang ®éng",75,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176},
}

function timbosshk()
    findgoldboss(1,12)
end
function findgoldboss(f_bossx,f_bossy)

	if (not f_bossx) then
		f_bossx1 = 1;
		f_bossy1 = 12;
	else
		f_bossx1 = f_bossx;
		f_bossy1 = f_bossy;
	end

	if (f_bossy1 - f_bossx1 > 11) then
		f_bossy1 = f_bossx1 + 11;
	end

	local n_count = getn(tbMapGoldBoss);
	local tab_Content = {}

	for i = f_bossx1, f_bossy1 do
		tinsert(tab_Content, tbMapGoldBoss[i][1].."/#findgoldboss_Step2( "..i..")");
	end
	if (f_bossx1 ~= 1) then
		tinsert(tab_Content, "Trang tr­íc/#findgoldboss( 1,"..(f_bossx1-1)..")");
	end

	if (f_bossy1 < n_count) then
		tinsert(tab_Content, "Trang sau/#findgoldboss( "..(f_bossy1+1)..","..n_count..")");
	end
	tinsert(tab_Content, "Tho¸t./no");
	Say("§¹i hiÖp t×m cao thñ nµo?", getn(tab_Content), tab_Content);
end
function findgoldboss_Step2(nId)
	local tb = {}
	for i=2,getn(tbMapGoldBoss[nId]),2 do --"buoc nhay 2 tuc la i=2,4,6,8,10
	local npcidxtab = GetMapNpcWithName(tbMapGoldBoss[nId][i+1], tbMapGoldBoss[nId][1])
		if npcidxtab == nil then
				nNPCCount = 0
		else
			nNPCCount = getn(npcidxtab);
		end
		for j = 1, nNPCCount do
			x, y, subworld = GetNpcPos(npcidxtab[j]);
			m,n,k = floor(x/32),floor(y/32),SubWorldIdx2ID(subworld)

			--tinsert(tbOpt, {tbMapGoldBoss[nId][1].."-"..tbMapGoldBoss[nId][i].."["..m.."-"..n.."]",bbbbb, {m,n,k}})
			tinsert(tb,tbMapGoldBoss[nId][1].."-"..tbMapGoldBoss[nId][i].."["..floor(m/8).."-"..floor(n/16).."]/#findgoldboss_Step3("..m..","..n..","..k..")")
		end
	end
	strTittle = "T×m thÊy cao thñ vâ l©m "..tbMapGoldBoss[nId][1].." t¹i c¸c vÞ trÝ sau ®©y."
	tinsert(tb,"Quay l¹i./#findgoldboss(1,12)")
	tinsert(tb,"Tho¸t./Quit")
	Say(strTittle,getn(tb),tb)
end
function findgoldboss_Step3(nX,nY,Map)
	NewWorld(Map,nX,nY) --
	SetFightState(1)
end


function no()
end
function WriteLogPro(data,str)
	local Data2 = openfile(""..data.."", "a+");
	write(Data2,tostring(str));
	closefile(Data2);
end