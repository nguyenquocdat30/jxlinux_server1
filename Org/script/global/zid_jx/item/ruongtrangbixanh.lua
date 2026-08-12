IncludeLib("SETTING")
IncludeLib("ITEM");
IncludeLib("FILESYS")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\global\\fuyuan.lua")

tbDoXanh =
{
[1]=
{
szName = "D©y ChuyÒn",
tbEquip =
{
{"Toµn th¹ch h¹ng liªn",0,4,0},
{"Lôc PhØ Thóy Hé Th©n phï ",0,4,1},
}
},
[2]=
{
szName = "¸o Gi¸p",
tbEquip =
{
{"ThÊt B¶o Cµ Sa",0,2,0},
{"Ch©n Vò Th¸nh Y",0,2,1},
{"Thiªn NhÉn MËt Trang",0,2,2},
{"Gi¸ng Sa Bµo",0,2,3},
{"§­êng Nghª gi¸p",0,2,4},
{"V¹n L­u Quy T«ng Y",0,2,5},
{"TuyÒn Long bµo",0,2,6},
{"Long Tiªu ®¹o Y",0,2,8},
{"Cöu VÜ B¹ch Hå trang",0,2,9},
{"TrÇm H­¬ng sam",0,2,10},
{"TÝch LÞch Kim Phông gi¸p",0,2,11},
{"V¹n Chóng TÒ T©m Y",0,2,12},
{"L­u Tiªn QuÇn",0,2,13},
}
},
[3]=
{
szName = "§ai L­ng",
tbEquip =
{
{"Thiªn Tµm Yªu §¸i",0,6,0},
{"B¹ch Kim Yªu §¸i",0,6,1},
}
},
[4]=
{
szName = "Giµy",
tbEquip =
{
{"Cöu TiÕt X­¬ng VÜ Ngoa",0,5,0},
{"Thiªn Tµm Ngoa",0,5,1},
{"Kim Lò hµi",0,5,2},
{"Phi Phông Ngoa",0,5,3},
}
},
[5]=
{
szName = "Bao Tay",
tbEquip =
{
{"Long Phông HuyÕt Ngäc Tr¹c",0,8,0},
{"Thiªn Tµm Hé UyÓn",0,8,1},
}
},
[6]=
{
szName = "Nãn",
tbEquip =
{
{"Tú L« m·o",0,7,0},
{"Ngò l·o qu¸n",0,7,1},
{"Tu La Ph¸t kÕt",0,7,2},
{"Th«ng Thiªn Ph¸t Qu¸n",0,7,3},
{"YÓm NhËt kh«i",0,7,4},
{"TrÝch Tinh hoµn",0,7,5},
{"¤ Tµm M·o",0,7,6},
{"Quan ¢m Ph¸t Qu¸n",0,7,7},
{"¢m D­¬ng V« Cùc qu¸n",0,7,8},
{"HuyÒn Tª DiÖn Tr¸o",0,7,9},
{"Long HuyÕt §Çu hoµn",0,7,10},
{"Long L©n Kh«i",0,7,11},
{"Thanh Tinh Thoa",0,7,12},
{"Kim Phông TriÓn SÝ ",0,7,13},
}
},

[7]=
{
szName = "Ngäc Béi",
tbEquip =
{
{"Long Tiªn H­¬ng Nang",0,9,0},
{"D­¬ng Chi B¹ch Ngäc",0,9,1},
}
},
[8]=
{
szName = "NhÉn",
tbEquip =
{
--{"Toµn Th¹ch Giíi ChØ ",0,3,0},
}
},
}
function main(nItemIndex)
dofile("script/global/zid_jx/item/ruongtrangbixanh.lua");
if CalcFreeItemCellCount() < 20 then
Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o ca 20 « trèng råi h·y më.",0);
return 1;
end
local tbOpt = {}
for i=1, getn(tbDoXanh) do
tinsert(tbOpt, {tbDoXanh[i].szName, laydoxanh1, {i}})
end

tinsert(tbOpt, {"Tho¸t."})
CreateNewSayEx("Xin mêi lùa chän trang bÞ:", tbOpt)
			return 1;
end

function laydoxanh1(nType)
local tbEquip = %tbDoXanh[nType]["tbEquip"]
local tbOpt = {}
for i=1, getn(tbEquip) do
tinsert(tbOpt, {tbEquip[i][1], laydoxanh2, {i, nType}})
end

tinsert(tbOpt, {"Tho¸t."})
local szTitle = format("Xin mêi lùa chän trang bÞ:")
CreateNewSayEx(szTitle, tbOpt)
end
function laydoxanh2(nIndex, nType)
local tbOpt = {}
tinsert(tbOpt, {"Kim", laydoxanh3, {nIndex, nType, 0}})
tinsert(tbOpt, {"Méc", laydoxanh3, {nIndex, nType, 1}})
tinsert(tbOpt, {"Thñy", laydoxanh3, {nIndex, nType, 2}})
tinsert(tbOpt, {"Háa", laydoxanh3, {nIndex, nType, 3}})
tinsert(tbOpt, {"Thæ ", laydoxanh3, {nIndex, nType, 4}})


tinsert(tbOpt, {"Tho¸t."})
local szTitle = format("Mêi chän hÖ:")
CreateNewSayEx(szTitle, tbOpt)
end

function laydoxanh3(nIndex, nType, nSeries)
if CalcFreeItemCellCount() < 20 then
Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o ca 20 « trèng råi h·y më.",0);
return 1;
end
local tbEquipSelect = %tbDoXanh[nType]["tbEquip"][nIndex]
			for j=1, 1 do
				xItem = AddVerItem(4,j, tbEquipSelect[2], tbEquipSelect[3], tbEquipSelect[4], 10,nSeries,100,10)
				ITEM_SetExpiredTime(xItem, 10080);
				SyncItem(xItem)
				SetItemBindState(xItem,-2)
				--ConsumeEquiproomItem(1,6,1,4392,-1)
			end
for i=1,nCount do 
xItem =AddItem(tbEquipSelect[2], tbEquipSelect[3], tbEquipSelect[4], 1, nSeries, 100, 10)
ITEM_SetExpiredTime(xItem,10080)
SyncItem(xItem)
SetItemBindState(xItem,-2)
--ConsumeEquiproomItem(1,6,1,4392,-1)
AddItem(tbEquipSelect[2], tbEquipSelect[3], tbEquipSelect[4], 10, nSeries, 250, 10)
AddItem(tbEquipSelect[2], tbEquipSelect[3], tbEquipSelect[4], 10, nSeries, 250, 10)
AddItem(tbEquipSelect[2], tbEquipSelect[3], tbEquipSelect[4], 10, nSeries, 250, 10)
AddItem(tbEquipSelect[2], tbEquipSelect[3], tbEquipSelect[4], 10, nSeries, 250, 10)
AddItem(tbEquipSelect[2], tbEquipSelect[3], tbEquipSelect[4], 10, nSeries, 250, 10)
AddItem(tbEquipSelect[2], tbEquipSelect[3], tbEquipSelect[4], 10, nSeries, 250, 10)
AddItem(tbEquipSelect[2], tbEquipSelect[3], tbEquipSelect[4], 10, nSeries, 250, 10)
AddItem(tbEquipSelect[2], tbEquipSelect[3], tbEquipSelect[4], 10, nSeries, 250, 10)
AddItem(tbEquipSelect[2], tbEquipSelect[3], tbEquipSelect[4], 10, nSeries, 250, 10)
end
end
--function laydoxanh3(nIndex, nType, nSeries)
--local tbOpt = {}
--tinsert(tbOpt, {"Ta NhËn Ngay", laydoxanh4, {nIndex, nType, nSeries}})
--tinsert(tbOpt, {"Kªt thóc ®èi tho¹i."})
--local szTitle = format("<npc>nhµ ng­¬i nhËn kh«ng:")
--CreateNewSayEx(szTitle, tbOpt)
--end
--function laydoxanh4(nIndex, nType, nSeries)
--local tbEquipSelect = %tbDoXanh[nType]["tbEquip"][nIndex]
--AddItem(tbEquipSelect[2], tbEquipSelect[3], tbEquipSelect[4], 10, nSeries, 250, 10)
--ConsumeEquiproomItem(1,6,1,4667,-1)
--end