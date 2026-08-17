-------------------------------------------------------------------------------------
-- 
-------------------------------------------------------------------------------------
IL("TITLE");
IncludeLib("ITEM");
IncludeLib("TIMER");
IncludeLib("FILESYS");
IncludeLib("SETTING");
IncludeLib("TASKSYS")
IncludeLib("PARTNER");
IncludeLib("BATTLE");
IncludeLib("RELAYLADDER")
IncludeLib("TONG") 
IncludeLib("LEAGUE")


Include("\\script\\lib\\common.lua");
Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\gm_tool\\dispose_item.lua");
Include("\\script\\global\\zid_jx\\gm\\gm_lib.lua");
Include("\\script\\global\\zid_jx\\gm\\gm_help.lua");
Include("\\script\\global\\zid_jx\\gm\\gm_support.lua");
Include("\\script\\global\\zid_jx\\gm\\gm_support_tbhk.lua");
Include("\\script\\global\\zid_jx\\gm\\gm_support_tb_blue.lua");	
Include("\\script\\global\\zid_jx\\lib\\hockynangmonphai.lua");
Include("\\script\\lib\\awardtemplet.lua")


LENHBAI_QTV = "<#><link=image[0]:\\spr\item\script\yupai_haozhao.spr>LÖnh Bµi GM: <link>"

tbZidJx = {};
tbZidJx.nPak = curpack()
function main()
	dofile("script/global/zid_jx/gm/gm_script.lua")
		tbZidJx:GMPassword()
	return 1
end


-- Tr­íc khi sö dông ®­îc chøc n¨ng GM, ng­êi ch¬i ph¶i nhËp mËt khÈu
function tbZidJx:GMPassword()
	local nResult, nIdx = self:CheckGameMaster()
	if (nResult == 0) then
		Talk(1, "", "B¹n kh«ng ph¶i lµ <color=red>GM<color>, kh«ng thÓ sö dông vËt phÈm nµy");
	return 0 end

	local szName = GetName();
	local szAccount = GetAccount();
	local nIsLogin = GetTaskTemp(TASKTEMP_LOGIN_LBGM);
	if (nIsLogin == 1) then
		self:DialogMain();
	return 1 end
	
	g_AskClientStringEx("", 1, 50, "NhËp mËt khÈu:", {self.EnterGMPassword, {self, nIdx, szAccount, szName}})
end

function tbZidJx:EnterGMPassword(nIdx, szAccount, szName, szPassword)
	if (TAB_LIST_GAMEMASTER[nIdx]["Password"] ~= szPassword) then
		Talk(1, "", "MËt khÈu kh«ng ®óng, vui lßng kiÓm tra l¹i!");
	return 0 end
	self:DialogMain();
	SetTaskTemp(TASKTEMP_LOGIN_LBGM, 1)
	Msg2Player("B¹n ®· nhËp mËt khÈu ®óng, ®¨ng nhËp thµnh c«ng! B©y giê cã thÓ sö dông ®­îc chøc n¨ng dµnh cho GM.")
end

function tbZidJx:DialogMain()
	local nW, nX, nY = GetWorldPos()
	local szTitle = format(""..LENHBAI_QTV.."Chµo mõng <color=red><player><color> tham gia m¸y chñ <servername>, ®­îc ph¸t triÓn bëi <dev>! §©y lµ lÖnh bµi hç trî dµnh cho GM ®Ó qu¶n lý, ®iÒu hµnh m¸y chñ cña m×nh.\n<color=cyan>Täa ®é hiÖn t¹i: <color=green>"..nW.."<color> <color=yellow>"..nX.."/"..nY.."<color><color>.");
	local tbOption = {};
		tinsert(tbOption, {"GM - Test", self.Test, {self}})
		tinsert(tbOption, {"GM - Qu¶n lý toµn bé m¸y chñ", self.ManagePlayerSystem, {self}})
		tinsert(tbOption, {"GM - TÝnh n¨ng Më Réng", self.SupportFeatureOther, {self}})
		tinsert(tbOption, {"GM - TÝnh n¨ng hç trî thö nghiÖm", self.SupportGMTestGame})
		tinsert(tbOption, {"GM - Më C¸c Ho¹t §éng", self.SupportGMCallFeature})
		tinsert(tbOption, {"GM - ReLoadScript", reloadscript})
		tinsert(tbOption, {"GM - Xo¸ Toµn Bé vËt PhÈm Trong Hµnh Trang", self.SupportGmDelAllItem, {self}})
		tinsert(tbOption, {"GM - Hñy bá vËt phÈm", DisposeItem})
		tinsert(tbOption, {"GM - T×m hiÓu vÒ tÝnh n¨ng qu¶n trÞ", self.GMHelp, {self}})
			if (GetSkillState(733) == -1) then
				tinsert(tbOption, {"GM - BËt tÝnh n¨ng tµng h×nh", self.GMHide, {self}})
			else
				tinsert(tbOption, {"GM - T¾t tÝnh n¨ng tµng h×nh", self.GMShow, {self}})
			end
			if (IsOwnFeatureChanged() == 0) then
				tinsert(tbOption, {"GM - BiÕn thµnh h×nh d¸ng GM", self.ChangeMask, {self}})
			else
				tinsert(tbOption, {"GM - Håi phôc h×nh d¸ng ban ®Çu", self.RestoreMask, {self}})
			end
		tinsert(tbOption, {"§ãng.", self.Loadds, {self}})
			
	CreateNewSayEx(szTitle..INFORMATION_DEVELOPER, tbOption)
end

function tbZidJx:Test()
AddItem(6,1,1309,0,0,0)
AddItem(6,1,398,0,0,0)

for i = 1,10 do
AddItem(6,1,147,8,0,0)
end
-- AddPlatinaItem(0,76)
-- GiveItemUI("N©ng CÊp Trang BÞ HKMP "," Thµnh Trang bÞ B¹ch Kim", "doo_upgoldeq_process",1);
end
function doo_upgoldeq_process()
UpgradePlatinaFromGoldItem(GetGiveItemUnit(1)) --> hàm up t? trang b? HKMP thành BK
for i = 1,1 do -->> nâng c?p thì trang b? HKMP thành BK s? t? lên +10 , n?u k thích mu?n +7 +8 thì d?i cái s? 10 thành 7 ho?c 8
UpgradePlatinaItem(GetGiveItemUnit(1)) ---> dây là hàm up trang b? bk lên +10
end

end
function tbZidJx:SupportGmDelAllItem()
	local tbEquip  = GetRoomItems(0)
	for _,v in tbEquip do
		RemoveItemByIndex(v)
	end
		local tbAward = 
		{
			{tbProp={6, 1, 4257, 0, 0, 0}, nBindState=-2},
			{tbProp={6, 1, 4258, 0, 0, 0}, nBindState=-2},
			{tbProp={6, 1, 1266, 0, 0, 0}, nBindState=-2},
		}
	tbAwardTemplet:GiveAwardByList(tbAward, "Tr¶ L¹i VËt PhÈm Cña GM")
end



function tbZidJx:XoaXepHang()
	for i=10001,10300 do
		Ladder_ClearLadder(i)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------
--															TÝnh n¨ng Call All Feature																--
-----------------------------------------------------------------------------------------------------------------------------------------------------

function tbZidJx:SupportGMCallFeature()
	local tbSay = {"<dec>"..LENHBAI_QTV.."Mêi GM tr·i nghiÖm chøc n¨ng trong game"};
		tinsert(tbSay, "GM - Gäi Boss TiÓu/Gm_Call_small_Bos")
		tinsert(tbSay, "GM - Gäi Boss §¹i Víi Sè L­îng/Gm_Call_Big_Boss")
		tinsert(tbSay, "GM - Më Ho¹t §éng Tèng Kim/Gm_Call_Battles_")
		tinsert(tbSay, "GM - Më Ho¹t §éng V­ît ¶i/Gm_Call_Va_")
		tinsert(tbSay, "GM - Më Ho¹t §éng Phong L¨ng §é/Gm_Call_Pld_")
		tinsert(tbSay, "GM - Më Ho¹t §éng Qu¶ Huy Hoµng/Gm_Call_QHH_")
		tinsert(tbSay, "GM - Më Ho¹t §éng C«ng Thµnh ChiÕn/Call_Feature_CTC")
		tinsert(tbSay, "GM - Më Ho¹t §éng Viªm §Õ/Gm_Call_YDB_Z")
		tinsert(tbSay, "GM - Më Ho¹t §éng Long M«n Tiªu Côc/Gm_Call_LMTc")
		tinsert(tbSay, "GM - Më Ho¹t §éng Lo¹n ChiÕn Anh Hïng/Gm_Call_LCA_H")
		tinsert(tbSay, "GM - Më Ho¹t §éng ChiÕn Tr­êng Bang Héi/Gm_Call_Battles_Tong")
		tinsert(tbSay, "§ãng./no");
	CreateTaskSay(tbSay);
end

-----------------------------------------------------------------------------------------------------------------------------------------------------
--															TÝnh n¨ng Qu¶n Lý All Server															--
-----------------------------------------------------------------------------------------------------------------------------------------------------

function tbZidJx:ManagePlayerSystem()
	local szTitle = format(""..LENHBAI_QTV.."Mêi GM <color=red>%s<color> lùa chän chøc n¨ng hç trî qu¶n trÞ:", GetName());
	local tbOption = {}
		tinsert(tbOption, {"GM - Chøc n¨ng th«ng b¸o", self.NotificationManage, {self}})
		tinsert(tbOption, {"GM - T×m VÞ TrÝ Ng­êi Ch¬i All GSV", self.TimViTriNguoiChoiAllGSV, {self}})
		tinsert(tbOption, {"GM - Kho¸ Ng­êi Ch¬i", self.ManageSystemGlobal, {self}})
		tinsert(tbOption, {"GM - Thao t¸c ng­êi ch¬i", self.ManipulationOnPlayer, {self}})
		tinsert(tbOption, {"§ãng."})
	CreateNewSayEx(szTitle..INFORMATION_DEVELOPER, tbOption)
end
-----------------------------------------------------------------------------------------------------------------------------------------------------
--															TÝnh n¨ng ReLoad All FIle GM															--
-----------------------------------------------------------------------------------------------------------------------------------------------------
function tbZidJx:Loadds()
	Msg2Player("Refresh All Files GM")
	LoadScript("\\script\\global\\zid_jx\\gm\\gm_script.lua")
	LoadScript("\\script\\global\\zid_jx\\gm\\gm_support.lua")
	LoadScript("\\script\\global\\zid_jx\\gm\\gm_lib.lua")
	LoadScript("\\script\\global\\zid_jx\\gm\\gm_help.lua")
	LoadScript("\\script\\global\\zid_jx\\gm\\gm_support_tb_blue.lua")
	LoadScript("\\script\\global\\zid_jx\\gm\\gm_support_tbhk.lua")
end

-----------------------------------------------------------------------------------------------------------------------------------------------------
--															TÝnh n¨ng hç trî thö nghiÖm																--
-----------------------------------------------------------------------------------------------------------------------------------------------------
function tbZidJx:SupportGMTestGame()
	local tbSay = {"<dec>"..LENHBAI_QTV.."Mêi GM tr·i nghiÖm chøc n¨ng trong game"};
		tinsert(tbSay, "GM - Chøc N¨ng LÊy §å Theo ID/LayDoTheoID")
		tinsert(tbSay, "GM - NhËn c¸c lo¹i ®iÓm/AddAllPoint")
		tinsert(tbSay, "GM - NhËn Thó c­ìi/AddThuCuoi")
		tinsert(tbSay, "GM - NhËn VËt phÈm hç trî/AddAllItem")
		tinsert(tbSay, "GM - NhËn Trang bÞ xanh/Gm_Support_TB_Blue")
		tinsert(tbSay, "GM - NhËn Trang bÞ tÝm/Gm_Support_TB_Violet")
		tinsert(tbSay, "GM - NhËn Trang bÞ hoµng kim th­êng/Gm_Support_TBHK")
		tinsert(tbSay, "GM - NhËn Trang bÞ hoµng kim m«n ph¸i/Gm_Support_TBHKMP")
		tinsert(tbSay, "GM - NhËn Häc kü n¨ng m«n ph¸i/HoTroKyNang")
		tinsert(tbSay, "GM - Chøc N¨ng Bang Héi/DMcreattongtest")
		tinsert(tbSay, "GM - TÈy tñy nhanh/clear_attibute_point")
		tinsert(tbSay, "§ãng./no");
	CreateTaskSay(tbSay);
end

-----------------------------------------------------------------------------------------------------------------------------------------------------

function LayDoTheoID()			
local szTitle = "xin h·y chän vËt phÈm cÇn lÊy ! ";
local tbOpt = 
{
{"LÊy §å Hoµng Kim",LayMenuHKMP},
{"LÊy §å Queskey",LayMenuQueskey},
{"LÊy §å Magic",LayMenuMagic},
{"LÊy Ngùa",LayMenuNgua},
{"LÊy MÆt N¹",LayMenuMatNa},
{"Tho¸t",OnCancel},
}
CreateNewSayEx(szTitle, tbOpt)
end
-------------------------LAY MAGIC----------------------------------
function LayMenuMagic()
AskClientForNumber("LayMenuMagic_1",0,80000,"LÊy ID Nµo")
end
function LayMenuMagic_1(nID)
if nID == nil or nID == 0 or nID < 1 or nID > 80000 then
Msg2Player("Sè kh«ng hîp lÖ")
return
end
SetTask(3355,nID)
AskClientForNumber("LayMenuMagic_2",0,1000,"Sè L­îng Nhiu")
end

function LayMenuMagic_2(nSoLuong)
if nSoLuong == nil or nSoLuong == 0 or nSoLuong < 1 or nSoLuong > 1000 then
Msg2Player("Sè kh«ng hîp lÖ")
return
end
SetTask(3356,nSoLuong)
AskClientForNumber("LayMenuMagic_3",0,365,"Bao Nhiu Ngµy")
end

function LayMenuMagic_3(nHSD)
local nID = GetTask(3355)
local nSL = GetTask(3356)
if nHSD == nil or nHSD > 365 then
Msg2Player("Sè kh«ng hîp lÖ")
return
end
if nHSD == 0 then
local nItemIdx = AddItem(6,1,nID,1,0,0)
local Ten = GetItemName(nItemIdx)
	RemoveItemByIndex(nItemIdx)
tbAwardTemplet:GiveAwardByList({{szName=""..Ten.."",tbProp={6,1,nID,1,0},nCount=nSL,},}, "AD", 1);
logplayer("dulieu/adtien/log_lay_item_adtien.txt",format("TG : %s  - ID [ %s] - NV [ %s] - lÊy "..nSL.." [ "..Ten.." ] -  IP [ %s] ".."",GetLocalDate("%m/%d/%Y_%H:%M:%S"),GetAccount(),GetName(),GetIP()))
return
end
if nHSD ~= 0 then
local nItemIdx = AddItem(6,1,nID,1,0,0)
local Ten = GetItemName(nItemIdx)
RemoveItemByIndex(nItemIdx)
tbAwardTemplet:GiveAwardByList({{szName=""..Ten.."",tbProp={6,1,nID,1,0},nCount=nSL,nExpiredTime=nHSD * 1440},}, "AD", 1);
logplayer("dulieu/adtien/log_lay_item_adtien.txt",format("TG : %s  - ID [ %s] - NV [ %s] - lÊy "..nSL.."  [ "..Ten.." ] -  IP [ %s] - HSD [ "..nHSD.." ]  ngµy".."",GetLocalDate("%m/%d/%Y_%H:%M:%S"),GetAccount(),GetName(),GetIP()))
return
end
end
------------------------LAY QUESKEY---------------------------------------------


function LayMenuQueskey()
AskClientForNumber("LayMenuQueskey_1",0,8000,"LÊy ID Nµo")
end
function LayMenuQueskey_1(nID)
if nID == nil or nID == 0 or nID < 1 or nID > 8000 then
Msg2Player("Sè kh«ng hîp lÖ")
return
end
SetTask(3355,nID)
AskClientForNumber("LayMenuQueskey_2",0,1000,"Sè L­îng Nhiu")
end

function LayMenuQueskey_2(nSoLuong)
if nSoLuong == nil or nSoLuong == 0 or nSoLuong < 1 or nSoLuong > 1000 then
Msg2Player("Sè kh«ng hîp lÖ")
return
end
SetTask(3356,nSoLuong)
AskClientForNumber("LayMenuQueskey_3",0,365,"Bao Nhiu Ngµy")
end

function LayMenuQueskey_3(nHSD)
local nID = GetTask(3355)
local nSL = GetTask(3356)
if nHSD == nil or nHSD > 365 then
Msg2Player("Sè kh«ng hîp lÖ")
return
end
if nHSD == 0 then
local nItemIdx = AddItem(4,nID,1,1,0,0)
local Ten = GetItemName(nItemIdx)
	RemoveItemByIndex(nItemIdx)
tbAwardTemplet:GiveAwardByList({{szName=""..Ten.."",tbProp={4,nID,1,1,0},nCount=nSL,},}, "AD", 1);
logplayer("dulieu/adtien/log_lay_item_adtien.txt",format("TG : %s  - ID [ %s] - NV [ %s] - lÊy "..nSL.." [ "..Ten.." ] -  IP [ %s] ".."",GetLocalDate("%m/%d/%Y_%H:%M:%S"),GetAccount(),GetName(),GetIP()))
return
end
if nHSD ~= 0 then
local nItemIdx = AddItem(4,nID,1,1,0,0)
local Ten = GetItemName(nItemIdx)
RemoveItemByIndex(nItemIdx)
tbAwardTemplet:GiveAwardByList({{szName=""..Ten.."",tbProp={4,nID,1,1,0},nCount=nSL,nExpiredTime=nHSD * 1440},}, "AD", 1);
logplayer("dulieu/adtien/log_lay_item_adtien.txt",format("TG : %s  - ID [ %s] - NV [ %s] - lÊy "..nSL.." [ "..Ten.." ] -  HSD [ "..nHSD.." ]  ngµy - IP [ %s] -".."",GetLocalDate("%m/%d/%Y_%H:%M:%S"),GetAccount(),GetName(),GetIP()))
return
end
end

------------------------LAY HKMP---------------------------------------------
function LayMenuHKMP()
AskClientForNumber("LayMenuHKMP_1",0,10000,"LÊy ID Nµo")
end
function LayMenuHKMP_1(nID)
if nID == nil or nID == 0 or nID < 1 or nID > 10000 then
Msg2Player("Sè kh«ng hîp lÖ")
return
end
SetTask(3355,nID)
AskClientForNumber("LayMenuHKMP_2",0,5,"Sè L­îng Nhiu")
end

function LayMenuHKMP_2(nSoLuong)
if nSoLuong == nil or nSoLuong == 0 or nSoLuong < 1 or nSoLuong > 1000 then
Msg2Player("Sè kh«ng hîp lÖ")
return
end
SetTask(3356,nSoLuong)
AskClientForNumber("LayMenuHKMP_3",0,365,"Bao Nhiu Ngµy")
end

function LayMenuHKMP_3(nHSD)
local nID = GetTask(3355)
local nSL = GetTask(3356)
if nHSD == nil or nHSD > 365 then
Msg2Player("Sè kh«ng hîp lÖ")
return
end
if nHSD == 0 then
local nItemIdx = AddGoldItem(0,nID)
local Ten = GetItemName(nItemIdx)
	RemoveItemByIndex(nItemIdx)
tbAwardTemplet:GiveAwardByList({{szName=""..Ten.."",tbProp={0,nID},nCount=nSL,nQuality=1},}, "AD", 1);
logplayer("dulieu/adtien/log_lay_item_adtien.txt",format("TG : %s  - ID [ %s] - NV [ %s] - lÊy "..nSL.." [ "..Ten.." ] -  IP [ %s] ".."",GetLocalDate("%m/%d/%Y_%H:%M:%S"),GetAccount(),GetName(),GetIP()))
return
end
if nHSD ~= 0 then
local nItemIdx = AddGoldItem(0,nID)
local Ten = GetItemName(nItemIdx)
RemoveItemByIndex(nItemIdx)
tbAwardTemplet:GiveAwardByList({{szName=""..Ten.."",tbProp={0,nID},nCount=nSL,nQuality=1,nExpiredTime=nHSD * 1440},}, "AD", 1);
-- logplayer("dulieu/adtien/log_lay_item_adtien.txt",format("TG : %s  - ID [ %s] - NV [ %s] - lÊy "..nSL.." [ "..Ten.." ] -  HSD [ "..nHSD.." ]  ngµy - IP [ %s] -".."",GetLocalDate("%m/%d/%Y_%H:%M:%S"),GetAccount(),GetName(),getHWID()))
logplayer("dulieu/adtien/log_lay_item_adtien.txt",format("TG : %s  - ID [ %s] - NV [ %s] - lÊy "..nSL.." [ "..Ten.." ] -  HSD [ "..nHSD.." ]  ngµy - IP [ %s] -".."",GetLocalDate("%m/%d/%Y_%H:%M:%S"),GetAccount(),GetName(),GetIP()))
return
end
end

------------------------LAY MAT NA--------------------------------------------


function LayMenuMatNa()
AskClientForNumber("LayMenuMatNa_1",0,8000,"LÊy ID Nµo")
end
function LayMenuMatNa_1(nID)
if nID == nil or nID == 0 or nID < 1 or nID > 8000 then
Msg2Player("Sè kh«ng hîp lÖ")
return
end
SetTask(3355,nID)
AskClientForNumber("LayMenuMatNa_2",0,1000,"Sè L­îng Nhiu")
end

function LayMenuMatNa_2(nSoLuong)
if nSoLuong == nil or nSoLuong == 0 or nSoLuong < 1 or nSoLuong > 1000 then
Msg2Player("Sè kh«ng hîp lÖ")
return
end
SetTask(3356,nSoLuong)
AskClientForNumber("LayMenuMatNa_3",0,365,"Bao Nhiu Ngµy")
end

function LayMenuMatNa_3(nHSD)
local nID = GetTask(3355)
local nSL = GetTask(3356)
if nHSD == nil or nHSD > 365 then
Msg2Player("Sè kh«ng hîp lÖ")
return
end
if nHSD == 0 then
local nItemIdx = AddItem(0,11,nID,1,0,0)
local Ten = GetItemName(nItemIdx)
	RemoveItemByIndex(nItemIdx)
tbAwardTemplet:GiveAwardByList({{szName=""..Ten.."",tbProp={0,11,nID,1,0},nCount=nSL,},}, "AD", 1);
logplayer("dulieu/adtien/log_lay_item_adtien.txt",format("TG : %s  - ID [ %s] - NV [ %s] - lÊy "..nSL.." [ "..Ten.." ] -  M· M¸y [ %s] ".."",GetLocalDate("%m/%d/%Y_%H:%M:%S"),GetAccount(),GetName(),GetIP()))
return
end
if nHSD ~= 0 then
local nItemIdx = AddItem(0,11,nID,1,0,0)
local Ten = GetItemName(nItemIdx)
RemoveItemByIndex(nItemIdx)
tbAwardTemplet:GiveAwardByList({{szName=""..Ten.."",tbProp={0,11,nID,1,0},nCount=nSL,nExpiredTime=nHSD * 1440},}, "AD", 1);
logplayer("dulieu/adtien/log_lay_item_adtien.txt",format("TG : %s  - ID [ %s] - NV [ %s] - lÊy "..nSL.." [ "..Ten.." ] -  HSD [ "..nHSD.." ]  ngµy - M· M¸y [ %s] -".."",GetLocalDate("%m/%d/%Y_%H:%M:%S"),GetAccount(),GetName(),GetIP()))
return
end
end

------------------------LAY Ngua--------------------------------------------


function LayMenuNgua()
AskClientForNumber("LayMenuNgua_1",0,8000,"LÊy ID Nµo")
end
function LayMenuNgua_1(nID)
if nID == nil or nID == 0 or nID < 1 or nID > 8000 then
Msg2Player("Sè kh«ng hîp lÖ")
return
end
SetTask(3355,nID)
AskClientForNumber("LayMenuNgua_2",0,1000,"Sè L­îng Nhiu")
end

function LayMenuNgua_2(nSoLuong)
if nSoLuong == nil or nSoLuong == 0 or nSoLuong < 1 or nSoLuong > 1000 then
Msg2Player("Sè kh«ng hîp lÖ")
return
end
SetTask(3356,nSoLuong)
AskClientForNumber("LayMenuNgua_3",0,365,"Bao Nhiu Ngµy")
end

function LayMenuNgua_3(nHSD)
local nID = GetTask(3355)
local nSL = GetTask(3356)
if nHSD == nil or nHSD > 365 then
Msg2Player("Sè kh«ng hîp lÖ")
return
end
if nHSD == 0 then
local nItemIdx = AddItem(0,10,nID,10,0,0)
local Ten = GetItemName(nItemIdx)
	RemoveItemByIndex(nItemIdx)
tbAwardTemplet:GiveAwardByList({{szName=""..Ten.."",tbProp={0,10,nID,10,0},nCount=nSL,},}, "AD", 1);
logplayer("dulieu/adtien/log_lay_item_adtien.txt",format("TG : %s  - ID [ %s] - NV [ %s] - lÊy "..nSL.." [ "..Ten.." ] -  M· M¸y [ %s] ".."",GetLocalDate("%m/%d/%Y_%H:%M:%S"),GetAccount(),GetName(),GetIP()))
return
end
if nHSD ~= 0 then
local nItemIdx = AddItem(0,10,nID,1,0,0)
local Ten = GetItemName(nItemIdx)
RemoveItemByIndex(nItemIdx)
tbAwardTemplet:GiveAwardByList({{szName=""..Ten.."",tbProp={0,10,nID,10,0},nCount=nSL,nExpiredTime=nHSD * 1440},}, "AD", 1);
logplayer("dulieu/adtien/log_lay_item_adtien.txt",format("TG : %s  - ID [ %s] - NV [ %s] - lÊy "..nSL.." [ "..Ten.." ] -  HSD [ "..nHSD.." ]  ngµy - M· M¸y [ %s] -".."",GetLocalDate("%m/%d/%Y_%H:%M:%S"),GetAccount(),GetName(),GetIP()))
return
end
end




function LayMenusasMagic()
AskClientForNumber("LayMaGic_1",1,1000,"Sè L­îng")
end

function LayMaGsasic_1(num)
local IDVatPham = GetTask(747)
if num == nil or num == 0 or num < 1 or num > 1000 then
Msg2Player("Sè kh«ng hîp lÖ")
return
end
local nItemIdx = AddItem(6,1,IDVatPham,1,0,0)
local Ten = GetItemName(nItemIdx)
	if nItemIdx then
	RemoveItemByIndex(nItemIdx)
tbAwardTemplet:GiveAwardByList({{szName=""..Ten.."",tbProp={6,1,IDVatPham,1,0},nCount=num,},}, "AD", 1);
logplayer("dulieu/log_lay_item_adtien.txt",format("TG : %s  - ID [ %s] - NV [ %s] - lÊy "..num.." [ "..Ten.." ] -  M· M¸y [ %s] ".."",GetLocalDate("%m/%d/%Y_%H:%M:%S"),GetAccount(),GetName(),getHWID()))
return
else
Msg2Player("VËt phÈm kh«ng hîp lÖ")
return
end
end


function logplayer(zFile,szMsg)
	local handle = openfile(zFile,"a")
	write(handle,format("%s\n",szMsg));
	closefile(handle);
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--																						DÞch chuyÓn ®Õn vÞ trÝ																				--
-----------------------------------------------------------------------------------------------------------------------------------------------------

function tbZidJx:MoveToPosition()
	g_AskClientStringEx(GetStringTask(TASK_S_POSITION), 0, 256, "Map,PosX,PosY:", {self.EnterPosition, {self}})
end

function tbZidJx:EnterPosition(szPos)
	local tbPos = split(szPos, ",")
	local nMap = tonumber(tbPos[1])
	local nPosX = tonumber(tbPos[2])
	local nPosY = tonumber(tbPos[3])
	local nMove;
	if nPosX < 1000 and nPosY < 1000 then
		nPosX = nPosX*8
		nPosY = nPosY*16
	end
	
	nMove = NewWorld(nMap,nPosX, nPosY)
	AddSkillState(963, 1, 0, 18*3)
	
	if nMove ~= 1 then
		GMMsg2Player("DÞch chuyÓn ®Õn vÞ trÝ","ThÊt b¹i! VÞ trÝ kh«ng hîp lÖ, vui lßng kiÓm tra l¹i.")
		return
	end
	
	SetStringTask(TASK_S_POSITION, szPos)
	GMMsg2Player("DÞch chuyÓn ®Õn vÞ trÝ","<color=yellow>Thµnh c«ng!")
end
-----------------------------------------------------------------------------------------------------------------------------------------------------
--																	HÖ thèng lÊy kü n¨ng																			--
-----------------------------------------------------------------------------------------------------------------------------------------------------
function tbZidJx:SkillsSystem()
	local szTitle = ""..LENHBAI_QTV.."HÖ thèng kü n¨ng bao gåm thªm kü n¨ng vµ xãa kü n¨ng, b¹n muèn sö dông hÖ thèng kü n¨ng nµo?"
	local tbOpt = {}
		tinsert(tbOpt, {"Thªm kü n¨ng", g_AskClientStringEx, {"", 0,256,"Néi dung th«ng b¸o:", {self.AddSkills, {self}}}})
		tinsert(tbOpt, {"Xãa kü n¨ng", g_AskClientStringEx, {"", 0,256,"Néi dung th«ng b¸o:", {self.DeleteSkills, {self}}}})
		tinsert(tbOpt, {"§ãng."})
	CreateNewSayEx(szTitle, tbOpt)
end

function tbZidJx:AddSkills(szSkills)
	local _,_, nStart, nEnd, _, nPoint = self:GetSplitSkills(szSkills)
	for i = nStart, nEnd do
		AddMagic(i, nPoint)
		GMMsg2Player("Thªm kü n¨ng", "Thªm kü n¨ng “"..GetSkillName(i).."” ®¼ng cÊp "..nPoint.."!")
	end
end

function tbZidJx:DeleteSkills(szSkills)
	local tbSkills, nCount, nStart, _, nEnd, _ = self:GetSplitSkills(szSkills)
	if nCount > 2 then
		GMMsg2Player("Xãa kü n¨ng", "NhËp th«ng sè bÞ lçi, chØ cã thÓ nhËp tèi ®a 2 th«ng sè trë xuèng.")
		return 0
	end
	for i = nStart, nEnd do
		DelMagic(i)
		GMMsg2Player("Xãa kü n¨ng", "Kü n¨ng “"..GetSkillName(i).."” ®· ®­îc xãa bá!")
	end
end

function tbZidJx:GetSplitSkills(szString)
	local nStartSkill, nEndSkill, nEndSkill2, nPointSkill;
	local tbString = split(szString, ",")
	local nType = self:IsParamNumber(tbString)
	if nType ~= 1 then
		GMMsg2Player("Thªm kü n¨ng", "NhËp th«ng sè bÞ lçi, chØ sö dông c¸c ký tù sè tõ 0-9 vµ dÊu phÈy “,”.")
		return 0
	end
	
	if (getn(tbString) == 1) then
		nStartSkill = tbString[1];
		nEndSkill = tbString[1];
		nEndSkill2 = tbString[1];
		nPointSkill = 0;
	elseif (getn(tbString) == 2) then
		nStartSkill = tbString[1];
		nEndSkill = tbString[1];
		nEndSkill2 = tbString[2];
		nPointSkill = tbString[2];
	elseif (getn(tbString) == 3) then
		nStartSkill = tbString[1];
		nEndSkill = tbString[2];
		nPointSkill = tbString[3];
	end

	return tbString, getn(tbString), nStartSkill, nEndSkill, nEndSkill2, nPointSkill;
end

-----------------------------------------------------------------------------------------------------------------------------------------------------
--																	LÊy vËt phÈm chØ ®Þnh																			--
-----------------------------------------------------------------------------------------------------------------------------------------------------
function tbZidJx:TakeSpecifiedItem()
	g_AskClientStringEx(GetStringTask(TASKS_GETITEM), 0, 256, "Th«ng sè item:", {self.TakeSpecifiedItemParam, {self}})
end

function tbZidJx:TakeSpecifiedItemParam(szParam)
	if not szParam then
		Talk(1, "", "GM ch­a nhËp th«ng sè cña mét item bÊt kú, vui lßng thö l¹i.")
		return 0
	end
	
	local nType, tbParam = self:GetTypeParam(szParam)
	if (nType == 0) then
		GMMsg2Player("LÊy vËt phÈm chØ ®Þnh", "ThÊt b¹i! Tèi ®a cho phÐp lµ 16 th«ng sè.")
		return 0
	end
	local nIsParam = self:IsParamNumber(tbParam[2])
	if nIsParam ~= 1 then
		GMMsg2Player("LÊy vËt phÈm chØ ®Þnh", "ThÊt b¹i! ChØ sö dông c¸c ký tù sè tõ 0-9 vµ dÊu phÈy “,”.")
		return 0
	end
	
	self:SetCountSpecifiedItem(nType, tbParam)
end

function tbZidJx:SetCountSpecifiedItem(nType, tbParam)
	local tbOptionSelected = {}
	g_AskClientNumberEx(1, 500, "NhËp sè l­îng:", {self.CountSpecifiedItem, {self, {nType, tbParam, tbOptionSelected}}})
end

function tbZidJx:CountSpecifiedItem(tbSpecifiedItem, nCount, nOptionSelected)
	local szTitle = "H·y thiÕt lËp thªm option nÕu muèn.\n\n* Option GM ®· chän:"
	local nIsTable = self:IsOption(tbSpecifiedItem[3], "table")
	if nIsTable then
		for x, y in tbSpecifiedItem[3] do
			szTitle = szTitle..format("\n"..strfill_right("+", 5, " ").." <color=green>%s<color>",y[1])
		end
	end
	
	local tbOpt = {}
		local nBind = self:GetTypeOption(tbSpecifiedItem[3], 1)
		if nBind ~= 1 then
			tinsert(tbOpt, {"+ Thªm option khãa b¶o hiÓm vÜnh viÔn", self.AddOptionInItem, {self, tbSpecifiedItem, nCount, 1}})
			tinsert(tbOpt, {"+ Thªm option khãa b¶o hiÓm", self.AddOptionInItem, {self, tbSpecifiedItem, nCount, 2}})
		end
		
		local nExpired = self:GetTypeOption(tbSpecifiedItem[3], 2)
		if nExpired ~= 2 then
			tinsert(tbOpt, {"+ Thªm option thêi h¹n sö dông", self.AddOptionInItem, {self, tbSpecifiedItem, nCount, 3}})
		end
		
		tinsert(tbOpt, {"§· xong, ta muèn lÊy ngay b©y giê", self.CreateItemSpecified, {self, tbSpecifiedItem, nCount}})
		tinsert(tbOpt, {"Chän l¹i option", self.ReselectOption, {self, tbSpecifiedItem, nCount}})

		tinsert(tbOpt, {"§ãng."})
	CreateNewSayEx(szTitle, tbOpt)
end

function tbZidJx:CreateItemSpecified(tbSpecifiedItem, nCount)
	local GMPlayer = PlayerIndex;
	local szPlayerName = "";
	local szGMName = "";
	if nPlayerIndex then
		PlayerIndex = nPlayerIndex;
		szPlayerName = GetName();
	end
	
	local nItemIndex = 0;
	local szItemName = "";
	local tbItem = self:GetParamItem(tbSpecifiedItem)
		for i = 1, nCount do
			nItemIndex = self:NewItemEx(tbItem)
			
			if (nItemIndex <= 0) then
				break
			end
				
			szItemName = GetItemName(nItemIndex)
			
			if (IsItemStackable(nItemIndex) == 1) then
				SetItemStackCount(nItemIndex, 1)
			end
			
			for x, y in tbSpecifiedItem[3] do
				if y[3] == 1 then
					SetItemBindState(nItemIndex, y[2])
				end
				if y[3] == 2 then
					ITEM_SetExpiredTime(nItemIndex,y[2]*24*60)
				end
			end
			
			AddItemByIndex(nItemIndex)
		end
	
	SetStringTask(TASKS_GETITEM, tbSpecifiedItem[2][1])

	if nPlayerIndex then
		PlayerIndex = GMPlayer;
			szGMName = GetName()
			Msg2Player(format("B¹n ®· tÆng cho ng­êi ch¬i <color=yellow>%s<color> nµy %d %s", szPlayerName, nCount, szItemName))
		PlayerIndex = nPlayerIndex;
			Msg2Player(format("B¹n ®· ®­îc GM <color=yellow>%s<color> tÆng %d %s", szGMName, nCount, szItemName))
		nPlayerIndex = nil;
	else
		Msg2Player(format("B¹n nhËn ®­îc %d %s", nCount, szItemName))
	end
end

function tbZidJx:GetParamItem(tbSpecifiedItem)
	local nType = tbSpecifiedItem[1]
	local tbParam = tbSpecifiedItem[2][2]
	local nVersion, nQuality;
	local nGenre, nDetailType, nParcular, nLevel, nSeries, nMagic;
	local MagicIndex1, MagicIndex2, MagicIndex3, MagicIndex4, MagicIndex5, MagicIndex6;
	
	if (nType == 1) then
		if (getn(tbParam) == 1) then
			nQuality, nDetailType = 1, (tbParam[1] -1)
		elseif (getn(tbParam) == 2) then
			nQuality, nDetailType = tbParam[1], (tbParam[2] -1);
		end
	elseif (nType == 2) then
		nGenre, nDetailType, nParcular, nLevel, nSeries, nMagic = tbParam[1],tbParam[2],tbParam[3],tbParam[4],tbParam[5],tbParam[6];
	elseif (nType == 3) then
		nGenre, nDetailType, nParcular, nLevel, nSeries, nMagic = tbParam[1],tbParam[2],tbParam[3],tbParam[4],tbParam[5],tbParam[6];
		MagicIndex1, MagicIndex2, MagicIndex3, MagicIndex4, MagicIndex5, MagicIndex6 = tbParam[7],tbParam[8],tbParam[9],tbParam[10],tbParam[11],tbParam[12];
	end
	
	return {
		nVersion or 4,
		nQuality or 2,
		nGenre or 0,
		nDetailType or 0,
		nParcular or 0,
		nLevel or 0,
		nSeries or 0,
		nMagic or 0,
		MagicIndex1 or 0,
		MagicIndex2 or 0,
		MagicIndex3 or 0,
		MagicIndex4 or 0,
		MagicIndex5 or 0,
		MagicIndex6 or 0
	}
end

function tbZidJx:NewItemEx(tbItem)
	return NewItemEx(
		tbItem[1],
		0,
		tbItem[2],
		tbItem[3],
		tbItem[4],
		tbItem[5],
		tbItem[6],
		tbItem[7],
		tbItem[8],
		tbItem[9],
		tbItem[10],
		tbItem[11],
		tbItem[12],
		tbItem[13],
		tbItem[14],
		0)
end

function tbZidJx:ReselectOption(tbSpecifiedItem, nCount)
	tbSpecifiedItem[3] = {}
	self:CountSpecifiedItem(tbSpecifiedItem, nCount)
end

function tbZidJx:GetTypeOption(tbOption, nType)
	for x, y in tbOption do
		if tbOption[x][3] == nType then
			return nType
		end
	end
	return 0
end

function tbZidJx:AddOptionInItem(tbSpecifiedItem, nCount, nOptionSelected)
	local tbListOption =
	{
		[1] = {"Khãa b¶o hiÓm vÜnh viÔn", 1},
		[2] = {"Khãa b¶o hiÓm", 1},
		[3] = {"Thêi h¹n sö dông", 2},
	};
	
	if (nOptionSelected == 1) then
		tbSpecifiedItem[3][nOptionSelected] = {tbListOption[nOptionSelected][1], -2, tbListOption[nOptionSelected][2]};
		self:CountSpecifiedItem(tbSpecifiedItem, nCount)
	elseif (nOptionSelected == 2) then
		tbSpecifiedItem[3][nOptionSelected] = {tbListOption[nOptionSelected][1], -1, tbListOption[nOptionSelected][2]};
		self:CountSpecifiedItem(tbSpecifiedItem, nCount)
	elseif (nOptionSelected == 3) then
		self:SetTimeInItem(tbSpecifiedItem, nCount, nOptionSelected, tbListOption[nOptionSelected]);
	end
end

function tbZidJx:SetTimeInItem(tbSpecifiedItem, nCount, nOptionSelected, tbListOption)
	g_AskClientNumberEx(1,999999, "Thêi h¹n sö dông:", {self.SetTimeOptionInItem, {self, tbSpecifiedItem, nCount, nOptionSelected, tbListOption}})
end

function tbZidJx:SetTimeOptionInItem(tbSpecifiedItem, nCount, nOptionSelected, tbListOption, nTimer)
	tbSpecifiedItem[3][nOptionSelected] = {tbListOption[1], nTimer, tbListOption[2]};
	self:CountSpecifiedItem(tbSpecifiedItem, nCount)
end

function tbZidJx:IsOption(tbOpt, nType)
	if (type(tbOpt) == nType) then
		return 1
	else
		return
	end
end

function tbZidJx:GetTypeParam(szParam)
	local nTypeParam = 0;
	local nMaxParam = 16;
	local tbParam = split(szParam)
	if (getn(tbParam) < 3) then
		nTypeParam = 1;
	elseif (getn(tbParam) == 6) then
		nTypeParam = 2;
	elseif (getn(tbParam) > 6) and (getn(tbParam) < 13) then
		nTypeParam = 3;
	-- elseif (getn(tbParam) >= 13) and (getn(tbParam) =< nMaxParam) then
		-- nTypeParam = 4;
	end
	return nTypeParam, {szParam, tbParam};
end

function tbZidJx:IsParamNumber(tbParam)
	for i = 1, getn(tbParam) do
		local IsNumber = tonumber(tbParam[i])
		if not IsNumber then
			return 0;
		end
	end
	return 1;
end
-----------------------------------------------------------------------------------------------------------------------------------------------------
--																TÝnh n¨ng giµnh cho GM																									--
-----------------------------------------------------------------------------------------------------------------------------------------------------
function tbZidJx:GMHide()
	AddSkillState(733,1,0,777600);
	AddMagic(732,1)
	Msg2Player("BËt chøc n¨ng Èn th©n cho GM");
end

function tbZidJx:GMShow()
	AddSkillState(733,1,0,18*1);
	DelMagic(732)
	Msg2Player("T¾t chøc n¨ng Èn th©n cho GM");
end

function tbZidJx:ChangeMask()
	ChangeOwnFeature(0,0,567);
	Msg2Player("BiÕn thµnh h×nh d¹ng GM");
end

function tbZidJx:RestoreMask()
	RestoreOwnFeature();
	Msg2Player("Trë l¹i h×nh d¹ng ban ®Çu");
end


-----------------------------------------------------------------------------------------------------------------------------------------------------
--																				VËt phÈm hç trî																		--
-----------------------------------------------------------------------------------------------------------------------------------------------------

function tbZidJx:SupportFeatureOther()
	local szTitle = format(""..LENHBAI_QTV.."Chµo mõng <color=red><player><color> tham gia m¸y chñ <servername>, ®­îc ph¸t triÓn bëi <dev>! §©y lµ lÖnh bµi hç trî dµnh cho GM ®Ó qu¶n lý, ®iÒu hµnh m¸y chñ cña m×nh.");
	local tbOption = {};
		tinsert(tbOption, {"GM - DÞch chuyÓn tøc thêi", self.MoveToPosition, {self}})
		tinsert(tbOption, {"GM - LÊy vËt phÈm", self.TakeSpecifiedItem, {self}})
		tinsert(tbOption, {"GM - Kü n¨ng", self.SkillsSystem, {self}})
		tinsert(tbOption, {"GM - Thay ®æi tr¹ng th¸i (mµu pk)", self.GMChangeCamp, {self}})
		tinsert(tbOption, {"GM - Xo¸ All B¶ng XÕp H¹ng", self.XoaXepHang, {self}})
		tinsert(tbOption, {"GM - Save Rank All GSV", self.GM_Save_Rank, {self}})
		tinsert(tbOption, {"GM - Update All GSV Rank", self.GM_Update_Rank, {self}})
		tinsert(tbOption, {"§ãng."})
	CreateNewSayEx(szTitle..INFORMATION_DEVELOPER, tbOption)
end

-----------------------------------------------------------------------------------------------------------------------------------------------------
--																Ta muèn th«ng b¸o ®Õn ng­êi ch¬i															--
-----------------------------------------------------------------------------------------------------------------------------------------------------
function tbZidJx:GMChangeCamp()
	changeCamp()
end
function tbZidJx:GM_Save_Rank()
	Gm_Call_Save_Rank()
end


function tbZidJx:GM_Update_Rank()
	Gm_Call_Update_Rank()
end






function tbZidJx:NotificationManage()
	local szTitle = ""..LENHBAI_QTV.."HiÖn t¹i cã 2 chøc n¨ng th«ng b¸o chÝnh, ®ã lµ:\n+ <color=red>TÇng sè thÕ giíi<color>: kªnh nµy th«ng b¸o trªn khung ch¸t t¸n gÉu trong giao diÖn ng­êi ch¬i.\n+ <color=red>TÇng sè m¸y chñ<color>: kªnh nµy th«ng b¸o ®Õn ng­êi ch¬i trong toµn m¸y chñ, néi dông ch¹y ch÷ ë phÝa trªn ®Çu nh©n vËt."
	local tbOption = {}
		tinsert(tbOption, {"Th«ng b¸o trªn tÇng sè thÕ giíi", g_AskClientStringEx, {"", 0,256,"Néi dung th«ng b¸o:", {self.EnterNotification, {self, 1}}}})
		tinsert(tbOption, {"Th«ng b¸o trªn tÇng sè m¸y chñ", g_AskClientStringEx, {"", 0,256,"Néi dung th«ng b¸o:", {self.EnterNotification, {self, 2}}}})
		tinsert(tbOption, {"Th«ng b¸o trªn tÇng sè m¸y chñ Vµ ThÕ Giíi", g_AskClientStringEx, {"", 0,256,"Néi dung th«ng b¸o:", {self.EnterNotification, {self, 3}}}})
		tinsert(tbOption, {"§ãng."})
	CreateNewSayEx(szTitle..INFORMATION_DEVELOPER, tbOption)
end

function tbZidJx:EnterNotification(nType, szNotices)
	if szNotices == nil or szNotices == "" then
	return 0 end

	if (nType == 1) then
		Msg2Sub("<color=yellow><bclr=red>GM "..GetName().."<bclr> nãi:<color> <color=cyan>"..szNotices)
	elseif (nType == 2) then
		AddGlobal("<color=yellow><bclr=red>GM "..GetName().."<bclr> th«ng b¸o: <color>"..szNotices)
	elseif (nType == 3) then
		AddGlobal_SubWorld("<color=yellow><bclr=red>GM "..GetName().."<bclr> th«ng b¸o: <color>"..szNotices)
	
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------
--															HÖ thèng qu¶n lý toµn m¸y chñ																	--
-----------------------------------------------------------------------------------------------------------------------------------------------------

function tbZidJx:ManageSystemGlobal()
	local szTitle = "HÖ thèng qu¶n lý toµn m¸y chñ ®­îc sö dông ®Ó khãa, cÊm ch¸t, kick out,… ng­êi ch¬i trong m¸y chñ."
	local tbOption = {}
		tinsert(tbOption, {"Khãa nh©n vËt ®ang trùc tuyÕn", self.LockPlayerOnline, {self, 1}})
		tinsert(tbOption, {"Më khãa nh©n vËt", self.UnlockPlayer, {self, 1}})
		tinsert(tbOption, {"Khãa tµi kho¶n ®ang trùc tuyÕn", self. LockPlayerOnline, {self, 2}})
		tinsert(tbOption, {"Më khãa tµi kho¶n", self. UnlockPlayer, {self, 2}})
		tinsert(tbOption, {"§ãng."})
	CreateNewSayEx(szTitle..INFORMATION_DEVELOPER, tbOption)
end

function tbZidJx:UnlockPlayer(nType)
	g_AskClientStringEx("", 1, 50, "Tªn më khãa:", {self.EnterUnlockPlayer, {self, nType}})
end

function tbZidJx:EnterUnlockPlayer(nType, szPlayer)
	self:FileSystem_LoadFile(TAB_LINKFILEDATA[nType][1])
	local nCount = self:FileSystem_GetData(TAB_LINKFILEDATA[nType][1], TAB_LINKFILEDATA[nType][2], szPlayer)
	if (tonumber(nCount) ~= 1) then
		Msg2Player(szPlayer.." kh«ng bÞ khãa")
	return end
	self:FileSystem_SetData(TAB_LINKFILEDATA[nType][1], TAB_LINKFILEDATA[nType][2], szPlayer, "");
	self:FileSystem_SaveData(TAB_LINKFILEDATA[nType][1])
	Msg2Player(format("B¹n ®· më khãa cho <color=yellow>%s<color> nµy thµnh c«ng!", szPlayer));
end

function tbZidJx:LockPlayerOnline(nType)
	g_AskClientStringEx("", 1, 50, "Tªn muèn khãa:", {self.EnterLockPlayerOnline, {self, nType}})
end

function tbZidJx:EnterLockPlayerOnline(nType, szPlayer)
	local nGMPlayer = PlayerIndex
	local nPlayerIndex = 0;
	local szAccount = "";
	if (nType == 1) then
		nPlayerIndex = SearchPlayer(szPlayer)
	elseif (nType == 2) then
		nPlayerIndex= self:SearchAccount(szPlayer)
	end
	
	if (nPlayerIndex <= 0) then
		Msg2Player("Ng­êi nµy hiÖn kh«ng onlone hoÆc kh«ng tån t¹i");
	return 0 end
	
	PlayerIndex = nGMPlayer;
	if (nType == 1) then
		self:LockSystemByNamePlayer(nPlayerIndex);
	elseif (nType == 2) then
		self:LockSystemByAccountPlayer(nPlayerIndex);
	end
end

function tbZidJx:LockSystemByNamePlayer(nPlayerIndex)
	g_AskClientStringEx("", 1, 500, "Lý do bÞ khãa:", {self.EnterLockSystemByNamePlayer, {self, nPlayerIndex}})
end

function tbZidJx:EnterLockSystemByNamePlayer(nPlayerIndex, szMsg)
	local nType = 1;
	self:FileSystem_LoadFile(TAB_LINKFILEDATA[nType][1])
	local szPlayerName = "";
	local szMsg = szMsg or "";
	local nGMPlayer = PlayerIndex;
		PlayerIndex = nPlayerIndex;
			szPlayerName = GetName();
			Msg2Player(format("<color=yellow>Nh©n vËt nµy ®· bÞ khãa, v× lÝ do: %s", szMsg));
			self:FileSystem_SetData(TAB_LINKFILEDATA[nType][1], TAB_LINKFILEDATA[nType][2], szPlayerName, 1)
			self:FileSystem_SaveData(TAB_LINKFILEDATA[nType][1])
			SetTaskTemp(TASKTEMP_KICKOUT, GetCurServerTime());
			SetTimer(1*FRAME2TIME, TIMETASK_ID);
			PlayerIndex = nGMPlayer;
			Msg2Player("B¹n ®· khãa ng­êi ch¬i nµy thµnh c«ng!")
			SetStringTask(TASKS_LOCKSYSTEM, szPlayerName);
end

function tbZidJx:LockSystemByAccountPlayer(nPlayerIndex)
	g_AskClientStringEx("", 1, 500, "Lý do bÞ khãa:", {self.EnterLockSystemByAccountPlayer, {self, nPlayerIndex}})
end

function tbZidJx:EnterLockSystemByAccountPlayer(nPlayerIndex, szMsg)
	local nType = 2;
	self:FileSystem_LoadFile(TAB_LINKFILEDATA[nType][1])
	local szPlayerName = "";
	local szMsg = szMsg or "";
	local nGMPlayer = PlayerIndex;
		PlayerIndex = nPlayerIndex;
			szPlayerName = GetAccount();
			Msg2Player(format("<color=yellow>Nh©n vËt nµy ®· bÞ khãa, v× lÝ do: %s", szMsg));
			self:FileSystem_SetData(TAB_LINKFILEDATA[nType][1], TAB_LINKFILEDATA[nType][2], szPlayerName, 1)
			self:FileSystem_SaveData(TAB_LINKFILEDATA[nType][1])
			SetTaskTemp(TASKTEMP_KICKOUT, GetCurServerTime());
			SetTimer(1*FRAME2TIME, TIMETASK_ID);
			PlayerIndex = nGMPlayer;
			Msg2Player("B¹n ®· khãa ng­êi ch¬i nµy thµnh c«ng!")
			SetStringTask(TASKS_LOCKSYSTEM, szPlayerName);
end

function tbZidJx:SearchAccount(szAccount)
	for i = 1, GetPlayerCount() do
		PlayerIndex = i;
			if (GetAccount() == szAccount) then
			return i end;
	end
return 0 end

function tbZidJx:GameServerKickOut(nPlayerIndex)
	self:FileSystem_LoadFile(TAB_LINKFILEDATA[1][1])
	self:FileSystem_LoadFile(TAB_LINKFILEDATA[2][1])
	local GMPlayer = PlayerIndex;
		PlayerIndex = nPlayerIndex;
	
	local nIsPlayer = tonumber(self:FileSystem_GetData(TAB_LINKFILEDATA[1][1], TAB_LINKFILEDATA[1][2], GetName())) or 0;
		
		if (nIsPlayer == 1) then
			Msg2Player("Nh©n vËt nµy cña b¹n hiÖn ®ang bÞ khãa, kh«ng thÓ tham gia vµo game.")
			SetTaskTemp(TASKTEMP_KICKOUT, GetCurServerTime());
			SetTimer(1*FRAME2TIME, TIMETASK_ID);
		end
		
		local nIsAccount = tonumber(self:FileSystem_GetData(TAB_LINKFILEDATA[2][1], TAB_LINKFILEDATA[2][2], GetAccount())) or 0;
		
		if (nIsAccount == 1) then
			Msg2Player("Tµi kho¶n nµy cña b¹n hiÖn ®ang bÞ khãa, kh«ng thÓ tham gia vµo game.")
			SetTaskTemp(TASKTEMP_KICKOUT, GetCurServerTime());
			SetTimer(1*FRAME2TIME, TIMETASK_ID);
		end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------
--															T×m hiÓu vÒ tÝnh n¨ng LBGM																		--
-----------------------------------------------------------------------------------------------------------------------------------------------------
function tbZidJx:GMHelp()
	Describe("GM muèn t×m hiÓu vÒ tÝnh n¨ng qu¶n trÞ nµo d­íi ®©y?", 8,
	"T×m hiÓu vÒ tÝnh n¨ng “LÊy vËt phÈm bÊt kú”/TakeSpecifiedItem",
	"T×m hiÓu vÒ tÝnh n¨ng “DÞch chuyÓn ®Õn vÞ trÝ…”/MoveToPosition",
	"§ãng./OnCancel")
end

-----------------------------------------------------------------------------------------------------------------------------------------------------
--														Thao t¸c víi ng­êi ch¬i ®ang online																	--
-----------------------------------------------------------------------------------------------------------------------------------------------------

function tbZidJx:ManipulationOnPlayer()
	g_AskClientStringEx("", 0, 200, "Tªn nh©n vËt:", {self.CheckName_Now, {self}})
end

function tbZidJx:CheckName_Now(szPlayer)
	local Keywk1 = strfind(szPlayer, "/")
	if FALSE(Keywk1) then
		return tbZidJx:SearchPlayerOnline(szPlayer)
	end
	local szPlayer = strsub(szPlayer, Keywk1 + 1)
	return tbZidJx:SearchPlayerOnline(szPlayer)
end

function tbZidJx:SearchPlayerOnline(szPlayer)
	local GMPlayer = PlayerIndex;
	local szName, szAccount, szIP;
	local nLevel, nCash;
	nPlayerIndex = SearchPlayer(szPlayer)
	if nPlayerIndex <= 0 then
		Talk(1, "", "Nh©n vËt nµy ®· rêi m¹ng hoÆc kh«ng tån t¹i!")
		return
	end
	
	local szFactionName = {
		["shaolin"] 		= "ThiÕu L©m ph¸i",
		["tianwang"] 	= "Thiªn V­¬ng bang",
		["tangmen"] 	= "§­êng M«n ph¸i",
		["wudu"] 			= "Ngò §éc gi¸o",
		["emei"] 			= "Nga My ph¸i",
		["cuiyan"] 		= "Thóy Yªn m«n",
		["gaibang"] 		= "C¸i Bang ph¸i",
		["tianren"] 		= "Thiªn NhÉn gi¸o",
		["wudang"] 		= "Vâ §ang ph¸i",
		["kunlun"] 		= "C«n L«n ph¸i",
	}
	
	PlayerIndex = nPlayerIndex;
		szName = GetName();
		szAccount = GetAccount();
		szFaction = GetFaction();
		nLevel = GetLevel();
		nCash = GetCash();
		szIP = self:GetIP();
		nRepute = GetRepute();
		nWorld, nPosX, nPosY = GetWorldPos();
		nLead = GetLeadLevel();
		nFight = GetFightState();
		nCamp = GetCamp();
		nFaction = GetLastFactionNumber();
		nPK = GetPK();
		nSex = GetSex();
		nFuYuan = GetTask(151);
		nBattle = GetTask(747);
		nLeague = GetTask(2501);
		nRespect = GetRespect();
		nCoin = GetExtPoint(1);
		
		nLife = GetLife(0);
		nMana = GetMana(0);
		nStamina = GetStamina(0);
		nDefend = GetDefend(0);
		nColdR = GetColdR(0);
		nLightR = GetLightR(0);
		nFireR = GetFireR(0);
		nPoisonR = GetPoisonR(0);
		nPhyR = GetPhyR(0);
		nLucky = GetLucky();
		
		nEng =  GetEng(0);
		nDex = GetDex(0);
		nStr = GetStrg(0);
		nVit = GetVit(0);
		nAP = GetRestAP();
		nSP = GetRestSP();
		PlayerIndex = GMPlayer;
		Describe(format(strfill_center(" Th«ng tin ng­êi ch¬i ", 50, "-").."\n"
		.."\n+ Tªn ng­êi ch¬i: %s"
		.."\n+ Tªn tµi kho¶n: %s"
		.."\n+ §Þa chØ IP: %s"
		.."\n+ VÞ trÝ hiÖn t¹i: B¶n ®å: %d - Täa ®é: %d,%d"
		.."\n+ M«n ph¸i: %s"
		.."\n+ §¼ng cÊp: %d"
		.."\n+ TiÒn v¹n: %d"
		.."\n+ TiÒn ®ång: %d"

		.."\n+ §iÓm danh väng: %d"
		.."\n+ §iÓm phóc duyªn: %d"
		.."\n+ §iÓm uy danh: %d"
		.."\n+ §iÓm tÝch lòy Tèng Kim: %d"
		.."\n+ §iÓm tÝch lòy Liªn §Êu: %d"
		
		.."\n------------------------------------------------"		
		.."\n+ Sinh lùc: %d"
		.."\n+ Néi lùc: %d"
		.."\n+ ThÓ lùc: %d"
		.."\n+ NÐ tr¸nh: %d"
		
		.."\n+ Kh¸ng b¨ng: %d"
		.."\n+ Kh¸ng l«i: %d"
		.."\n+ Kh¸ng háa: %d"
		.."\n+ Kh¸ng ®éc: %d"
		.."\n+ Phßng thñ vËt lý: %d"
		
		.."\n+ Søc m¹nh: %d"
		.."\n+ Sinh khÝ: %d"
		.."\n+ Th©n ph¸p: %d"
		.."\n+ Néi c«ng: %d"
		.."\n+ TiÒm n¨ng cßn l¹i: %d"
		.."\n+ Kü n¨ng cßn l¹i: %d"
		.."\n------------------------------------------------"
		
		, szName or ""
		, szAccount or ""
		, szIP or ""
		, nWorld or 0, nPosX or 0, nPosY or 0
		, szFactionName[szFaction] or "Ch­a gia nhËp"
		, nLevel or 0
		, nCash or 0
		, nCoin or 0
		
		, nRepute or 0
		, nFuYuan or 0
		, nRespect or 0
		, nBattle or 0
		, nLeague or 0
		-------------------------------------------------
		, nLife or 0
		, nMana or 0
		, nStamina or 0
		, nDefend or 0
		
		, nColdR or 0
		, nLightR or 0
		, nFireR or 0
		, nPoisonR or 0
		, nPhyR or 0
		, nStr or 0
		, nVit or 0
		, nDex or 0
		, nEng or 0
		, nAP or 0
		, nSP or 0
		-------------------------------------------------
		)
		,14,
		"GM di chuyÓn ®Õn ng­êi ch¬i nµy/#tbZidJx:GMMoveToPlayer("..nPlayerIndex..")",
		"GM Gäi Ng­êi Ch¬i §Õn §©y/#tbZidJx:PlayerMoveToGM("..nPlayerIndex..")",
		"GM §iÒu ChØnh Camp/#tbZidJx:SetCampPlayer("..nPlayerIndex..")",
		"GM §iÒu ChØnh Task/#tbZidJx:GetASetTaskPlayer("..nPlayerIndex..")",
		"GM §iÒu ChØnh Tr¹ng Th¸i ChiÕn §Êu/#tbZidJx:SetFightState4U("..nPlayerIndex..")",
		"GM Xãa Pass R­¬ng/#tbZidJx:DelPassBox("..nPlayerIndex..")",
		"GM Söa Lçi ThÇn Hµnh Phï/#tbZidJx:FixUseTownP("..nPlayerIndex..")",
		"GM TÆng ®iÓm cho ng­êi ch¬i nµy/#tbZidJx:GivePoints("..nPlayerIndex..")",
		"GM TÆng vËt phÈm, ®¹o cô, trang bÞ cho ng­êi ch¬i nµy/#tbZidJx:GiveItemForPlayer("..nPlayerIndex..")",
		"GM TÆng tiÒn v¹n cho ng­êi ch¬i nµy/#tbZidJx:GiveCash("..nPlayerIndex..")",
		"GM TÆng tiÒn ®ång cho ng­êi ch¬i nµy/#tbZidJx:GiveCoin("..nPlayerIndex..")",
		"GM TÆng KNB cho ng­êi ch¬i ngµy/#tbZidJx:GiveKNB("..nPlayerIndex..")",
		"§ãng./OnCancel")
		
end


function tbZidJx:SetFightState4U(nPlayerIndex)
	SetTaskTemp(245, nPlayerIndex);
	self.SetFightState4U_Now()
end


function tbZidJx:SetFightState4U_Now()
	local PlayerIndexGamer = GetTaskTemp(245);
	if PlayerIndexGamer == 0 then
		return Msg2Player("Lçi, Nh©n vËt ®ang Offline!");
	else
		AskClientForNumber("SetFightState4U_Sure",0,1,"<#>NhËp gi¸ trÞ!")	
	end
end

function SetFightState4U_Sure(Value)
	local PlayerIndexGamer = GetTaskTemp(245);
	local nValue = "";
	if Value == 0 then nValue = "Phi ChiÕn §Êu"
	elseif Value == 1 then nValue = "ChiÕn §Êu"
	end
	if PlayerIndexGamer == 0 then
		return Msg2Player("Lçi, Nh©n vËt ®ang Offline!");
	else
		CallPlayerFunction(PlayerIndexGamer, SetFightState, Value);
		CallPlayerFunction(PlayerIndexGamer, Msg2Player, "<color=yellow>Tr¹ng th¸i chiÕn ®Êu: "..nValue);
	end
end

function tbZidJx:TimViTriNguoiChoiAllGSV()
	w,x,y=GetWorldPos()
	SubWorld = SubWorldID2Idx(w)
	SubName=SubWorldName(SubWorld)
	local szTitle = "<VÞ TrÝ<color>:<color=orange>ID:<color><color=orange>"..w.."<color>-<color=red>"..SubName.."<color>-Täa ®é X/Y:<color=yellow> "..x.."<color>/<color=cyan>"..y.."<color>"
		local tbOpt =
	{
		{"T×m vÞ trÝ nh©n vËt", g_AskClientStringEx, {GetName(), 0, 300, "Tªn nh©n vËt", {self.CheckName_Now1, {self}} }}, 
		{"KÕt Thóc Hç Trî"}
	}
	CreateNewSayEx(szTitle, tbOpt)
end
function tbZidJx:NewWorld(szPos) 
local tbPos = lib:Split(szPos, ",") 
local nMapId = GetWorldPos()
local m = tonumber(tbPos[1]) 
local x =  tonumber(tbPos[2]) 
local y =  tonumber(tbPos[3]) 
if nMapId == m then 
SetPos(x, y) 
else 
NewWorld(m, x, y)
	SetProtectTime(18*3) --ÈýÃë±£»¤Ê±¼ä
	AddSkillState(963, 1, 0, 18*3)  
end 
end 

function tbZidJx:CheckName_Now1(szName)
	local Keywk1 = strfind(szName, "/")
	if FALSE(Keywk1) then
		return tbZidJx:FindRole(szName)
	end
	local szName = strsub(szName, Keywk1 + 1)
	return tbZidJx:FindRole(szName)
end

function tbZidJx:FindRole(szName) 
local nPlayerIndex = PlayerIndex 
local nPak = usepack(self.nPak) 
CallPlayerFunction(nPlayerIndex, QueryWiseManForSB, "tbGmRole_Finded", "tbGmRole_UnFind", 0, szName); 
usepack(nPak) 
end 

function tbZidJx:Finded(szTargetName, szMapName, nSubWorldID, nPosX, nPosY)
local toadox = nPosX/8
local toadoy = nPosY/16 
local szTitle = format("<color=yellow>%s<color>: §ang ë <color=yellow>%s<color>-<color=red>%d/%d<color>", szTargetName, szMapName,toadox,toadoy,nSubWorldID) 
local tbOpt = 
{ 
{"§­a ta ®Õn ng­êi ®ã",self.NewWorld, {self, format("%d,%d,%d",nSubWorldID, nPosX, nPosY)}},
{"KÕt thóc ®èi tho¹i"} 
} 
CreateNewSayEx(szTitle, tbOpt) 
end 


function tbGmRole_Finded(TargetName, MoneyToPay, LifeMax, ManaMax, PKValue, PlayerLevel, MapName, nPosX, nPosY, nSex, nWorldRank, nSubWorldID, nFightMode, bTargetProtect)
	tbZidJx:Finded(TargetName, MapName, nSubWorldID, nPosX, nPosY)
end

function tbGmRole_UnFind(TargetName, MoneyToPay)
	Talk(1, "", format("<#16082>%s", TargetName))
end

function tbZidJx:SetCampPlayer(nPlayerIndex)
	SetTaskTemp(245, nPlayerIndex);
	SetCamp4Player()
end

function SetCamp4Player(nCamp)
		local zCamp = ""
		if nCamp == 0 then zCamp = "LuyÖn C«ng" 
		elseif nCamp == 1 then zCamp = "ChÝnh Ph¸i"
		elseif nCamp == 2 then zCamp = "Trung LËp" 
		elseif nCamp == 3 then zCamp = "Tµ Ph¸i" 
		elseif nCamp == 4 then zCamp = "S¸t Thñ" 
		elseif nCamp == 5 then zCamp = "ADMIN" 
		end
	if nCamp then
		local PlayerIndexGamer = GetTaskTemp(245)
		CallPlayerFunction(PlayerIndexGamer, SetCamp, nCamp)
		CallPlayerFunction(PlayerIndexGamer, SetCurCamp, nCamp)
		CallPlayerFunction(PlayerIndexGamer, Msg2Player, "<color=yellow>B¹n §­îc GM ChuyÓn Sang Tr¹ng Th¸i : "..zCamp);
		return Msg2Player("Set Camp "..zCamp.." Cho Ng­êi Ch¬i Thµnh C«ng")
	end
	return AskClientForNumber("SetCamp4Player",0,999999,"Camp Value")
end

function FALSE(nValue)
	if (nValue == nil or nValue == 0 or nValue == "") then
		return 1
	else
		return nil
	end
end

function tbZidJx:GetASetTaskPlayer(nPlayerIndex)
	SetTaskTemp(245, nPlayerIndex);
	GetASetTask2Player()
end

function GetASetTask2Player()
	local PlayerIndexGamer = GetTaskTemp(245);
	if PlayerIndexGamer == 0 then
		return Msg2Player("Lçi, Nh©n vËt ®ang Offline!");
	else
		AskClientForString("GetASetTask2Player_Step2", "",0,500,"<#>NhËp Task,Value!")	
	end
end

function GetASetTask2Player_Step2(StringTaskID)
	local PlayerIndexGamer = GetTaskTemp(245);
	if PlayerIndexGamer == 0 then
		return Msg2Player("Lçi, Nh©n vËt ®ang Offline!");
	else
		local String1 = strfind(StringTaskID, ",")
		if(FALSE(String1)) then return Msg2Player("Khai b¸o lçi!") end
		local nTaskID = tonumber(strsub(StringTaskID, 1, String1 - 1))
		if(FALSE(nTaskID)) then return Msg2Player("Khai b¸o lçi TaskID!") end
		local nTaskValue = tonumber(strsub(StringTaskID, String1 + 1, strlen(StringTaskID)))
		if((nTaskValue == nil)) then return Msg2Player("Khai b¸o lçi Value!") end
		local PlayerTaksValueOld = CallPlayerFunction(PlayerIndexGamer, GetTask, nTaskID)
		return Say("ChØnh söa gi¸ trÞ Task cho ng­êi ch¬i.<enter>TaskID: <color=green>"..nTaskID.."<color><enter>Gi¸ trÞ cò: <color=green>"..PlayerTaksValueOld.."<color><enter>Gi¸ trÞ míi: <color=yellow>"..nTaskValue.."<color><enter>B¹n ch¾c ch¾n chØnh söa gi¸ trÞ chø?", 2, "Ch¾c råi!/#GetASetTask2Player_Step3("..nTaskID..","..nTaskValue..")", "Th«i ta nhÇm!/OnCancel")
	end
end

function GetASetTask2Player_Step3(nTaskID, nTaskValue)
	local PlayerIndexGamer = GetTaskTemp(245);
	CallPlayerFunction(PlayerIndexGamer, SetTask, nTaskID, nTaskValue)
	Msg2Player("<color=yellow>§· SetTask "..nTaskID..": "..nTaskValue.." - cho: "..CallPlayerFunction(PlayerIndexGamer, GetName))
end

function tbZidJx:DelPassBox(nPlayerIndex)
	SetTaskTemp(245, nPlayerIndex);
	AdminDelPassBox()
end

function AdminDelPassBox(_1)
	local a = GetTaskTemp(245)
	local b = CallPlayerFunction(a, GetName)
	local c = CallPlayerFunction(a, CheckStoreBoxState, 1)
	if c <= 0 then
		return Talk(1, "", "Nh©n vËt "..b.." vÉn <color=red>ch­a cã pass r­¬ng<color>, kh«ng thÓ tiÕn hµnh xãa!")
	end
	if _1 and _1 == 1 then
		CallPlayerFunction(a, GMCancleBoxPassword)
		return Msg2Player("§· xãa m· r­¬ng cho nh©n vËt: <color=yellow>"..b)
	end
	return Say("B¹n muèn xãa MËt khÈu r­¬ng cho nh©n vËt <color=yellow>"..b.."<color>", 2, "X¸c nhËn xãa!/#AdminDelPassBox(1)", "Th«i ta nhÇm./OnCancel")
end

function tbZidJx:GivePoints(nPlayerIndex)
	local szTitle = "GM muèn tÆng ®iÓm g× cho ng­êi ch¬i nµy?";
	local tbOpt = {}
		tinsert(tbOpt, {"Søc m¹nh", g_AskClientNumberEx, {0,9999999999, "NhËp sè ®iÓm:", {self.AddStrg, {self, nPlayerIndex}}}})
		tinsert(tbOpt, {"Sinh KhÝ", g_AskClientNumberEx, {0,9999999999, "NhËp sè ®iÓm:", {self.AddVit, {self, nPlayerIndex}}}})
		tinsert(tbOpt, {"Th©n Ph¸p", g_AskClientNumberEx, {0,9999999999, "NhËp sè ®iÓm:", {self.AddDex, {self, nPlayerIndex}}}})
		tinsert(tbOpt, {"Néi C«ng", g_AskClientNumberEx, {0,9999999999, "NhËp sè ®iÓm:", {self.AddEng, {self, nPlayerIndex}}}})
		tinsert(tbOpt, {"TiÒm N¨ng", g_AskClientNumberEx, {0,9999999999, "NhËp sè ®iÓm:", {self.AddPropPoint, {self, nPlayerIndex}}}})
		tinsert(tbOpt, {"Kü N¨ng", g_AskClientNumberEx, {0,9999999999, "NhËp sè ®iÓm:", {self.AddMagicPoint, {self, nPlayerIndex}}}})
		tinsert(tbOpt, {"CÊp ®é", g_AskClientNumberEx, {0,200, "NhËp cÊp ®é:", {self.SetLevelPlayer, {self, nPlayerIndex}}}})
		tinsert(tbOpt, {"Kinh nghiÖm", g_AskClientNumberEx, {0,9999999999, "NhËp sè ®iÓm:", {self.SetExpPlayer, {self, nPlayerIndex}}}})
		tinsert(tbOpt, {"Danh väng", g_AskClientNumberEx, {0,9999999999, "NhËp sè ®iÓm:", {self.SetReputePlayer, {self, nPlayerIndex}}}})
		tinsert(tbOpt, {"Phóc duyªn", g_AskClientNumberEx, {0,9999999999, "NhËp sè ®iÓm:", {self.SetFuYuanPlayer, {self, nPlayerIndex}}}})
		tinsert(tbOpt, {"Tèng kim", g_AskClientNumberEx, {0,9999999999, "NhËp sè ®iÓm:", {self.SetBattlePointPlayer, {self, nPlayerIndex}}}})
		tinsert(tbOpt, {"Liªn ®Êu", g_AskClientNumberEx, {0,9999999999, "NhËp sè ®iÓm:", {self.SetLeaguePointPlayer, {self, nPlayerIndex}}}})
		tinsert(tbOpt, {"§ãng."})
	CreateNewSayEx(szTitle, tbOpt)
end

function tbZidJx:AddVit(nPlayerIndex, nPoint)
	local szPlayerName, szGMName = "", "";
	local nGMPlayer = PlayerIndex;
		szGMName = GetName();
	PlayerIndex = nPlayerIndex;
		szPlayerName = GetName();
		AddVit(nPoint);
		AddProp(nPoint);
		Msg2Player(format("B¹n ®· nhËn ®­îc <color=yellow>%d<color> ®iÓm Sinh KhÝ bëi GM %s", nPoint, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("B¹n ®· tÆng cho ng­êi ch¬i %s <color=yellow>%d<color> ®iÓm Sinh KhÝ", szPlayerName, nPoint))
end


function tbZidJx:AddDex(nPlayerIndex, nPoint)
	local szPlayerName, szGMName = "", "";
	local nGMPlayer = PlayerIndex;
		szGMName = GetName();
	PlayerIndex = nPlayerIndex;
		szPlayerName = GetName();
		AddDex(nPoint);
		AddProp(nPoint);
		Msg2Player(format("B¹n ®· nhËn ®­îc <color=yellow>%d<color> ®iÓm Th©n Ph¸p bëi GM %s", nPoint, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("B¹n ®· tÆng cho ng­êi ch¬i %s <color=yellow>%d<color> ®iÓm Th©n Ph¸p", szPlayerName, nPoint))
end





function tbZidJx:AddEng(nPlayerIndex, nPoint)
	local szPlayerName, szGMName = "", "";
	local nGMPlayer = PlayerIndex;
		szGMName = GetName();
	PlayerIndex = nPlayerIndex;
		szPlayerName = GetName();
		AddEng(nPoint);
		AddProp(nPoint);
		Msg2Player(format("B¹n ®· nhËn ®­îc <color=yellow>%d<color> ®iÓm Néi C«ng bëi GM %s", nPoint, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("B¹n ®· tÆng cho ng­êi ch¬i %s <color=yellow>%d<color> ®iÓm Néi C«ng", szPlayerName, nPoint))
end


function tbZidJx:AddStrg(nPlayerIndex, nPoint)
	local szPlayerName, szGMName = "", "";
	local nGMPlayer = PlayerIndex;
		szGMName = GetName();
	PlayerIndex = nPlayerIndex;
		szPlayerName = GetName();
		AddStrg(nPoint);
		AddProp(nPoint);
		Msg2Player(format("B¹n ®· nhËn ®­îc <color=yellow>%d<color> ®iÓm Søc M¹nh bëi GM %s", nPoint, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("B¹n ®· tÆng cho ng­êi ch¬i %s <color=yellow>%d<color> ®iÓm Søc M¹nh", szPlayerName, nPoint))
end


function tbZidJx:AddPropPoint(nPlayerIndex, nPoint)
	local szPlayerName, szGMName = "", "";
	local nGMPlayer = PlayerIndex;
		szGMName = GetName();
	PlayerIndex = nPlayerIndex;
		szPlayerName = GetName();
		AddProp(nPoint);
		Msg2Player(format("B¹n ®· nhËn ®­îc <color=yellow>%d<color> ®iÓm TiÒm N¨ng bëi GM %s", nPoint, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("B¹n ®· tÆng cho ng­êi ch¬i %s <color=yellow>%d<color> ®iÓm TiÒm N¨ng", szPlayerName, nPoint))
end



function tbZidJx:AddMagicPoint(nPlayerIndex, nPoint)
	local szPlayerName, szGMName = "", "";
	local nGMPlayer = PlayerIndex;
		szGMName = GetName();
	PlayerIndex = nPlayerIndex;
		szPlayerName = GetName();
		AddMagicPoint(nPoint);
		Msg2Player(format("B¹n ®· nhËn ®­îc <color=yellow>%d<color> ®iÓm Kü N¨ng bëi GM %s", nPoint, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("B¹n ®· tÆng cho ng­êi ch¬i %s <color=yellow>%d<color> ®iÓm Kü N¨ng", szPlayerName, nPoint))
end


function tbZidJx:SetLevelPlayer(nPlayerIndex, nLevel)
	local szPlayerName, szGMName = "", "";
	local nGMPlayer = PlayerIndex;
		szGMName = GetName();
	PlayerIndex = nPlayerIndex;
		szPlayerName = GetName();
		ST_LevelUp(nLevel-GetLevel());
		Msg2Player(format("B¹n ®· nhËn ®­îc <color=yellow>%d<color> cÊp ®é bëi GM %s", nLevel, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("B¹n ®· tÆng cho ng­êi ch¬i %s <color=yellow>%d<color> cÊp ®é", szPlayerName, nLevel))
end

function tbZidJx:SetExpPlayer(nPlayerIndex, nExp)
	local szPlayerName, szGMName = "", "";
	local nGMPlayer = PlayerIndex;
		szGMName = GetName();
	PlayerIndex = nPlayerIndex;
		szPlayerName = GetName();
		tl_addPlayerExp(nExp);
		Msg2Player(format("B¹n ®· nhËn ®­îc <color=yellow>%d<color> ®iÓm kinh nghiÖm bëi GM %s", nExp, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("B¹n ®· tÆng cho ng­êi ch¬i %s <color=yellow>%d<color> ®iÓm kinh nghiÖm", szPlayerName, nExp))
end

function tbZidJx:SetReputePlayer(nPlayerIndex, nPoint)
	local szPlayerName, szGMName = "", "";
	local nGMPlayer = PlayerIndex;
		szGMName = GetName();
	PlayerIndex = nPlayerIndex;
		szPlayerName = GetName();
		AddRepute(nPoint);
		Msg2Player(format("B¹n ®· nhËn ®­îc <color=yellow>%d<color> danh väng bëi GM %s", nPoint, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("B¹n ®· tÆng cho ng­êi ch¬i %s <color=yellow>%d<color> danh väng", szPlayerName, nPoint))
end

function tbZidJx:SetFuYuanPlayer(nPlayerIndex, nPoint)
	local szPlayerName, szGMName = "", "";
	local nGMPlayer = PlayerIndex;
		szGMName = GetName();
	PlayerIndex = nPlayerIndex;
		szPlayerName = GetName();
		SetTask(151, GetTask(151)+nPoint)
		Msg2Player(format("B¹n ®· nhËn ®­îc <color=yellow>%d<color> phóc duyªn bëi GM %s", nPoint, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("B¹n ®· tÆng cho ng­êi ch¬i %s <color=yellow>%d<color> phóc duyªn", szPlayerName, nPoint))
end

function tbZidJx:SetBattlePointPlayer(nPlayerIndex, nPoint)
	local szPlayerName, szGMName = "", "";
	local nGMPlayer = PlayerIndex;
		szGMName = GetName();
	PlayerIndex = nPlayerIndex;
		szPlayerName = GetName();
		SetTask(747, GetTask(747)+nPoint);
		Msg2Player(format("B¹n ®· nhËn ®­îc <color=yellow>%d<color> ®iÓm Tèng Kim bëi GM %s", nPoint, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("B¹n ®· tÆng cho ng­êi ch¬i %s <color=yellow>%d<color> ®iÓm Tèng Kim", szPlayerName, nPoint))
end

function tbZidJx:SetLeaguePointPlayer(nPlayerIndex, nPoint)
	local szPlayerName, szGMName = "", "";
	local nGMPlayer = PlayerIndex;
		szGMName = GetName();
	PlayerIndex = nPlayerIndex;
		szPlayerName = GetName();
		SetTask(2501, GetTask(2501)+nPoint);
		Msg2Player(format("B¹n ®· nhËn ®­îc <color=yellow>%d<color> ®iÓm Liªn §Êu bëi GM %s", nPoint, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("B¹n ®· tÆng cho ng­êi ch¬i %s <color=yellow>%d<color> ®iÓm Liªn §Êu", szPlayerName, nPoint))
end

function tbZidJx:GiveCash(nPlayerIndex)
	g_AskClientNumberEx(1, 20000, "NhËp sè l­îng:", {self.GiveCashNow, {self, nPlayerIndex}})
end

function tbZidJx:GiveCashNow(nPlayerIndex, nCount)
	local szPlayer, szGMName = "", "";
	local szGMName = GetName();
	local nGMPlayer = PlayerIndex;
	PlayerIndex = nPlayerIndex;
		szPlayer = GetName();
		Earn(nCount*10000)
		Msg2Player(format("<color=green>B¹n nhËn ®­îc <color=yellow>%d<color> v¹n l­îng tõ GM %s<color>", nCount, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("<color=green>B¹n ®· tÆng ng­êi ch¬i %s <color=yellow>%d<color> v¹n l­îng<color>", szPlayer, nCount))
end

function tbZidJx:GiveCoin(nPlayerIndex)
	g_AskClientNumberEx(1, 1000000, "NhËp sè l­îng:", {self.GiveCoinNow, {self, nPlayerIndex}})
end

function tbZidJx:GiveCoinNow(nPlayerIndex, nCount)
	local szPlayer, szGMName = "", "";
	local szGMName = GetName();
	local nGMPlayer = PlayerIndex;
	PlayerIndex = nPlayerIndex;
		for i = 1, nCount do
			AddItem(4,417,1,0,0,0)
		end
		Msg2Player(format("<color=green>B¹n nhËn ®­îc <color=yellow>%d<color> TiÒn §ång tõ GM %s", nCount, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("<color=green>B¹n ®· tÆng ng­êi ch¬i %s <color=yellow>%d<color> TiÒn §ång.", szPlayer, nCount))
end

function tbZidJx:FixUseTownP(nPlayerIndex)
	local szPlayer, szGMName = "", "";
	local szGMName = GetName();
	local nGMPlayer = PlayerIndex;
		PlayerIndex = nPlayerIndex;
		DisabledUseTownP(0)
		Msg2Player("<color=green>B¹n ®­îc GM <color=yellow>"..szGMName.."<color> Söa Lçi ThÇn Hµnh Phï Thµnh C«ng")
		PlayerIndex = nGMPlayer;
		Msg2Player("<color=green>B¹n ®· Söa Lçi ThÇn Hµnh Phï Thµnh C«ng cho ng­êi ch¬i <color=yellow>"..szPlayer.."<color>.")
end



function tbZidJx:GiveKNB(nPlayerIndex)
	g_AskClientNumberEx(1, 1000000, "NhËp sè l­îng:", {self.GiveKNBNow, {self, nPlayerIndex}})
end

function tbZidJx:GiveKNBNow(nPlayerIndex, nCount)
	local szPlayer, szGMName = "", "";
	local szGMName = GetName();
	local nGMPlayer = PlayerIndex;
	PlayerIndex = nPlayerIndex;
		for i = 1, nCount do
			AddItem(4,343,1,0,0,0)
		end
		Msg2Player(format("<color=green>B¹n nhËn ®­îc <color=yellow>%d<color> KNB tõ GM %s", nCount, szGMName))
	PlayerIndex = nGMPlayer;
		Msg2Player(format("<color=green>B¹n ®· tÆng ng­êi ch¬i %s <color=yellow>%d<color> KNB.", szPlayer, nCount))
end

function tbZidJx:GiveItemForPlayer(nPlayerIndex)
	local GMPlayer = PlayerIndex;
		PlayerIndex = GMPlayer;
			self:TakeSpecifiedItem()
		PlayerIndex = nPlayerIndex;
end

function tbZidJx:GMMoveToPlayer(nPlayerIndex)
	local nWorld, nX, nY;
	local szName = "";
	local GMPlayer = PlayerIndex;
		PlayerIndex = nPlayerIndex;
			nWorld, nX, nY = GetWorldPos();
			szName = GetName();
		PlayerIndex = GMPlayer;
			local nWorldIdx = NewWorld(nWorld, nX, nY);
			if nWorldIdx ~= 1 then
				GMMsg2Player(szName, "DÞch chuyÓn ®Õn ng­êi ch¬i nµy thÊt b¹i!")
				return 0
			end
			GMMsg2Player(szName, "<color=yellow>DÞch chuyÓn ®Õn ng­êi ch¬i nµy thµnh c«ng!")
end

function tbZidJx:PlayerMoveToGM(nPlayerIndex)
	local nWorld, nX, nY;
	local szPlayerName = "";
	local szGMName = "";
	local GMPlayer = PlayerIndex;
			PlayerIndex = GMPlayer;
			szGMName = GetName();
			nWorld, nX, nY = GetWorldPos();
			PlayerIndex = nPlayerIndex;
			szPlayerName = GetName();
			local nWorldIdx = NewWorld(nWorld, nX, nY)
			if nWorldIdx ~= 1 then
				PlayerIndex = GMPlayer;
					GMMsg2Player(szPlayerName, "DÞch chuyÓn ®Õn ng­êi ch¬i nµy thÊt b¹i!")
				return 0
			end
			GMMsg2Player("Th«ng b¸o triÖu tËp", "B¹n ®­îc GM ra lÖnh triÖu tËp!")
			PlayerIndex = GMPlayer;
			GMMsg2Player(szPlayerName, "<color=yellow>B¹n ®· triÖu tËp ng­êi ch¬i nµy thµnh c«ng!")
end

-----------------------------------------------------------------------------------------------------------------------------------------------------
--																	LÊy vËt phÈm chØ ®Þnh																			--
-----------------------------------------------------------------------------------------------------------------------------------------------------
function tbZidJx:GMLoginInGame()
	if (self:CheckGameMaster() == 2) then
		if (CalcEquiproomItemCount(6,1,4850,-1) == 0) then
			local nItemIndex = AddItem(6,1,4850,1,0,0);
			SetItemBindState(nItemIndex, -1);
		end
		if (CalcEquiproomItemCount(6,1,1266,-1) == 0) then
			local nItemIndex = AddItem(6,1,1266,1,0,0);
			SetItemBindState(nItemIndex, -1);
		end
		if (GetLevel() < 200) then
			ST_LevelUp(200-GetLevel())
		end
		
		if (Title_GetActiveTitle() ~= 5000) then
			SetTask(1122, 5000)
			Title_AddTitle(5000, 1, 30*24*60*60*18);
			Title_ActiveTitle(5000);
		end
	end
end

function tbZidJx:Write()
	local data = "goldequip.txt";
	local str = "";
	for i = 5670, 5919 do
		local nItemIndex = NewItemEx(4,0,1,0,i-1,0,0,0,0,0,0,0,0,0,0,0)
		str = str..format("\t\t{\"%s\",%d},\n",GetItemName(nItemIndex),i)
	end
	-- for i = 4813, 4832 do
		-- local nItemIndex = NewItemEx(4,0,1,0,i-1,0,0,0,0,0,0,0,0,0,0,0)
		-- str = str..format("\t\t{\"%s\",%d},\n",GetItemName(nItemIndex),i)
	-- end
	local Data2 = openfile(""..data.."", "a+");
	write(Data2,tostring(str));
	closefile(Data2);
end

-- KiÓm tra GM (kiÓm tra xem tµi kho¶n, nh©n vËt nµy cã ph¶i lµ GM hay kh«ng?)
-- Gi¸ trÞ tr¶ vÒ: [-2]: Lçi table - [0]: kh«ng ph¶i GM - [1]: tµi kho¶n lµ GM - [2]: tªn tµi kho¶n vµ nh©n vËt lµ GM
--	Gi¸ trÞ thø 2: sè thø tù cña TK
function tbZidJx:CheckGameMaster()
	if not (TAB_LIST_GAMEMASTER) then
		print("Khong tim thay table!")
	return -2 end
	
	for i = 1, getn(TAB_LIST_GAMEMASTER) do
		if not (TAB_LIST_GAMEMASTER[i]["Account"]) then
			print("Khong tim thay string [Account] trong danh sach table!!!")
		return -2 end
		
		if not (TAB_LIST_GAMEMASTER[i]["Player"]) then
			print("Khong tim thay table [Player] trong danh sach table!!!")
		return -2 end
		
		if not (TAB_LIST_GAMEMASTER[i]["Password"]) then
			print("Khong tim thay string [Password] trong danh sach table!!!")
		return -2 end
		
		if not (TAB_LIST_GAMEMASTER[i]["Rank"]) then
			print("Khong tim thay string [Rank] trong danh sach table!!!")
		return -2 end
		
		if (TAB_LIST_GAMEMASTER[i]["Account"] == GetAccount()) then
			for k = 1, getn(TAB_LIST_GAMEMASTER[i]["Player"]) do
				if (TAB_LIST_GAMEMASTER[i]["Player"][k] == GetName()) then
				return 2, i end
			end
		return 1, i end
	end
return 0 end

function tbZidJx:StartGameServer()
	for i = 1, getn(TAB_LINKFILEDATA) do
		self:FileSystem_LoadFile(TAB_LINKFILEDATA[i][1])
	end
end

-- ThiÕt lËp d÷ liÖu
--		+ szLinkFile: ®­êng dÉn file d¹ng "\\data\\log.txt"
--		+ szSection: "SECTION"
--		+ szKey: Tõ khãa cÇn load
--		+ szValue: Gi¸ trÞ cña tõ khãa ®ã
function tbZidJx:FileSystem_SetData(szLinkFile, szSection, szKey, szValue)
	IniFile_SetData(szLinkFile, szSection, szKey, szValue)
end

function tbZidJx:FileSystem_SaveData(szLinkFile)
	IniFile_Save(szLinkFile, szLinkFile)
end

-- LÊy d÷ liÖu
--		+ szLinkFile: ®­êng dÉn file d¹ng "\\data\\log.txt"
--		+ szSection: "SECTION"
--		+ szKey: Tõ khãa cÇn load
function tbZidJx:FileSystem_GetData(szLinkFile, szSection, szKey)
	return IniFile_GetData(szLinkFile, szSection, szKey)
end

-- Load d÷ liÖu
--		+ szLinkFile: ®­êng dÉn file d¹ng "\\data\\log.txt"
function tbZidJx:FileSystem_LoadFile(szLinkFile)
	File_Create(szLinkFile)
	return IniFile_Load(szLinkFile, szLinkFile)
end

-- LÊy danh s¸ch trong file:
--		+ szLinkFile: ®­êng dÉn file d¹ng "\\data\\log.txt"
--		+ szSection = "TABLE"
--> Gi¸ trÞ tr¶ vÒ: Sè l­îng dßng, danh s¸ch table
function tbZidJx:FileSystem_GetCount(szLinkFile, szSection)
	local tbKey = {}
	local nFile = TabFile_Load(szLinkFile, szSection)
	if nFile ~= 1 then
		print("TÖp tin kh«ng tån t¹i hoÆc ch­a cã d÷ liÖu!")
		return 0
	end
	
	for i = 2, TabFile_GetRowCount(szSection) do
		local szKey = TabFile_GetCell(szSection, i, "["..szSection.."]")
		local strKey = split(szKey, "=")
		if strKey[2] then
			tbKey[getn(tbKey)+1] = strKey;
		end
	end
	
	return getn(tbKey), tbKey
end

function tbZidJx:GetIP()
	local tbIP = split(GetIP(), " : ")
	return tbIP[1], tbIP[2]
end

function OnTimer()
	-- SetFightState(0); --ThiÕt lËp tr¹ng th¸i chiÕn ®Êu
	-- ForbidChangePK(1); --CÊm chuyÓn PK
	-- SetPKFlag(2); --ThiÕt lËp PK
	-- SetChatFlag(1); --CÊm ch¸t
	-- DisabledStall(1); --CÊm bµy b¸n
	-- ForbitTrade(1); --CÊm giao dÞch
	-- DisabledUseTownP(1); --CÊm sö dông THP
	-- ForbidEnmity(1); --CÊm cõu s¸t
	-- SetCreateTeam(0); --ThiÕt lËp t¹o tæ ®éi
	local nPlayerIndex = PlayerIndex or 0;
	local szName = GetName() or "";
	local szAccount = GetAccount() or "";
	local nTimerOut = GetTaskTemp(TASKTEMP_KICKOUT);
	local nTime = GetCurServerTime();
	local nTimeNow = (nTimerOut - nTime) + TIMER_KICKOUT ;
	Msg2Player("<color=cyan>B¹n cßn "..nTimeNow.." gi©y nöa sÏ bÞ hÖ thèng kick ra khái game.")
	if (nTimeNow == 0) then
		SetTaskTemp(TASKTEMP_KICKOUT, 0)
		OfflineLive(nPlayerIndex);
		KickOutSelf(nPlayerIndex);
		print(format("[LOCKED] - Nguoi choi %s(%s) da bi kick ra khoi server!", szName, szAccount));
		StopTimer(TIMETASK_ID);
	end
end

tbZidJx:StartGameServer();