/*[[		Th«ng Tin Server		]]*/

Server_Name = "vl-ctc";
-- Tªn M¸y Chñ
Server_Open_Time = "190030082021";
-- Thêi Gian Open Chİnh Thøc
Server_Open_Test = 0;
-- Më Open Test

FootNewbie_Support = 0;
-- Vßng S¸ng T©n Thñ : 1 : Më -> 0 : §ãng
FootNewbie_LimitLevel_Max = 200;
-- Vßng S¸ng T©n Thñ Hç Trî §Õn CÊp



/*[[		C¸c Ho¹t §éng		]]*/
Seasonnpc = 1;
-- D· TÈu
-- /script/global/seasonnpc.lua
Seasonnpc_Lv = 50
-- Â§¼ng CÊp Yªu CÇu §Ó Lµm D· TÈu
----------------------------------------
Challengeoftime = 1;
-- V­ît ¶i
-- /script/task/tollgate/killer/nieshichen.lua
Buy_STG_Of_Coin = 0;
-- Buy_STG_Of_Coin = 1 Th× Mua S¸t Thñ Gi¶n 90 B»ng TiÒn §ång
-- Buy_STG_Of_Coin = 0 Th× Mua S¸t Thñ Gi¶n 90 B»ng TiÒn V¹n
Price_Cash = 200000; -- Gi¸ TiÒn V¹n / 1 c¸i STG90
Price_Coin = 10; -- Gi¸ TiÒn §ång / 1 C¸i STG 90
Challenge_Mem = 2;
-- Â§iÒu KiÖn Ng­êi Ch¬i Trong Team
Challenge_res = 2;
-- Sè L­îng Tham Gia V­ît ¶i Mçi NGµy
----------------------------------------
KillerBoss = 1;
-- Boss S¸t Thñ
-- /script/task/tollgate/killer/nieshichen.lua
KillerBoss_Of_Day = 8;
-- Sè L­îng §­îc NhËn NhiÖm Vô S¨n Boss Mçi Ngµy
----------------------------------------
Fengling_ferry = 1;
-- Phong L¨ng §é 
-- /script/Ã–ÃÃ”Â­Â±Â±Ã‡Ã¸/Â·Ã§ÃÃªÂ¶Ã‰/npc/south_boatman_head.lua
Fengling_res = 10;
-- Sè L­îng §­îc Tham Gia Phong L¨ng §é Mçi Ngµy
Fengling_Lv = 80;
-- Â§¼ng CÊp Yªu CÇu Khi Tham Gia Phong L¨ng §é
----------------------------------------
Leaguematch = 0;
-- Liªn §Êu
-- /script/missions/leaguematch/npc/officer.lua
----------------------------------------
Battles = 1;
-- Tèng Kim
-- /script/battles/battlejoin.lua
----------------------------------------
GoldenQuest =1;
-- NhiÖm Vô Hoµng Kim
-- /script/task/newtask/education/dragonfive.lua
GoldenQuest_award = 0;
-- Th­êng §å Thiªn hoµng HoÆc kh«ng
----------------------------------------
BigBossQuest = 1;
-- Boss §¹i Hoµng Kim
-- /script/global/zid_jx/tinhnang/boss/...
----------------------------------------
SmallBossQuest = 1;
-- Boss TiÓu Hoµng Kim
-- /script/global/zid_jx/tinhnang/boss/...
----------------------------------------
FruitsOfGlory = 1;
-- Qu¶ Huy Hoµng
-- script/gmscript.lua
FruitsOfGlory_nCount = 5;
-- Sè L­îng Sö Dông Qu¶ Huy Hoµng Mçi Ngµy
----------------------------------------
FlowerEvents = 0;
-- Â§o¸n Hoa §¨ng
--/script/event/great_night/lantern/create_lanterns.lua
FlowerEvents_nCount = 50;
-- Sè L­îng C©u Hái Hoa §¨ng Mçi Ngµy
----------------------------------------
SingleArena = 1;
-- L«i §µi C¸ C­îc
-- /script/global/zid_jx/tinhnang/loidaicacuoc/npcdialog.lua
SingleArena_feeds = 10;
-- Phİ Phô Thu Khi Giao KÌo (10 Lµ 10%)
----------------------------------------
YanDiQuest = 0;
-- Viªm §Õ
-- /script/missions/yandibaozang/npc/yandibaozang_main.lua
YanDiQuest_Day_ncount = 2;
-- Sè L­îng §­îc Tham Gia Viªm §Õ Mçi Ngµy
YanDiQuest_Week_ncount = 2;
-- Sè L­îng Tham Gia Viªm §Õ Mçi TuÇn
YanDiQuest_Lv = 70;
-- §¼ng CÊp Yªu CÇu Khi Tham Gia Viªm §Õ
----------------------------------------
HeroesOfWar = 1;
-- Lo¹n ChiÕn Anh Hïng
-- /script/global/zid_jx/tinhnang/loanchienanhhung/dialog.lua
----------------------------------------
ScratchCards = 1;
-- Â§¸nh Bµi cµo
-- /script/global/zid_jx/tinhnang/baicao/main.lua
----------------------------------------
RockPaperScissors_Quest = 1;
-- O¼n Tï T×
-- /script/global/zid_jx/tinhnang/oantuty/main.lua
----------------------------------------
CoinStall = 0;
-- Kú Tr©n C¸c
-- /script/shop/shop_checkmap.lua
----------------------------------------
PurpleCrafting = 0;
-- ChÕ T¹o §å Tİm
-- /script/item/compound/equip_compound.lua
----------------------------------------
CardOfTeacher = 0;
-- s­ ®å thiÕp
-- \script\item\card\card_shitu.lua
----------------------------------------
ThanBiThuongNhanShop = 0;
-- ThÇn Bİ Th­¬ng nh©n T­¬ng d­¬ng
-- \script\global\Â·ÈË_ÉñÃØÉÌÈËÁøÒÒ.lua
----------------------------------------
NPCVanSuThong = 0;
-- NPC V¹n sù th«ng - Nam nh¹c trÊn
-- \script\Á½ºşÇø\ÄÏÔÀÕò\npc\Ö°ÄÜ_ÍòÊÂÍ¨.lua
----------------------------------------	
NPCDichQuan = 1;
-- NPC DŞch Quan t¹i tÊt c¶ c¸c thµnh thŞ
-- \script\global\ËÍĞÅÈÎÎñ.lua
----------------------------------------	
NPCThamCuu_Namnhac = 0;
-- NPC ThÈm Cöu t¹i Nam Nh¹c TrÊn(B¸n HoÆc Kh«ng B¸n Ngùa 80)
-- \script\global\ËÍĞÅÈÎÎñ.lua
----------------------------------------	
NPCThamCuu_BaLang = 1;
-- NPC ThÈm Cöu t¹i Ba L¨ng HuyÖn (Cho PhĞp HoÆc Kh«ng Cho PhĞp Më Réng R­¬ng)
-- /script/Á½ºşÇø/°ÍÁêÏØ/npc/°ÍÁêÏØ_Â·ÈË10ÉÌÈË¶Ô»°.lua
CoinRuong1 = 50;	--|
CoinRuong2 = 80;	--| -- Gi¸ Më R­¬ng
CoinRuong3 = 100;	--|

----------------------------------------	
FlowerMountainBattle= 0;
-- Hoa S¬n §¹i ChiÕn
-- /script/missions/huashanqunzhan/dailog.lua


