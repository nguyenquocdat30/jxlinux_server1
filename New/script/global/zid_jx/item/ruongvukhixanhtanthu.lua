IncludeLib("SETTING")
IncludeLib("ITEM");
IncludeLib("FILESYS")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\global\\fuyuan.lua")
function main()
dofile("script/global/zid_jx/item/ruongvukhixanhtanthu.lua");
tbAccountGM = 
{ 
	["1"] = 
	{ 
		"hugolina" 
	}, 
	[""] = 
	{ 
		"" 
	}, 
	[""] = 
	{ 
		"" 
	}, 
	[""] = 
	{ 
		"" 
	}, 
}
function CheckAccountGM()	
	local szAccount = GetAccount() 
	local szName = GetName() 
	local tbRoleList = tbAccountGM[szAccount] 
	if tbRoleList then 
		for i=1, getn(tbRoleList) do 
			if tbRoleList[i] == szName then 
				return 1
			end 
		end 
	end 
end
			if CalcFreeItemCellCount() <= 10 then
				Msg2Player("B¹n kh«ng §ñ 10 ¤ Trèng , h·y dän r­¬ng råi h·y sö dông")
				return 1;
			end
			local szTitle = "B¹n Muèn Lµm G× nµo?<enter>Muèn NhËn §­îc <color=yellow>Trang BÞ Xanh ¦<color> CÇn Gia NhËp Ph¸i"
			if CheckAccountGM() then
			local tbOpt =
				{
				}
					if GetFaction() == "shaolin" then
						tinsert(tbOpt,{"§ang cËp nhËt11", laydoxanh})
						tinsert(tbOpt,{"Tho¸t."})
					end	
				CreateNewSayEx(szTitle, tbOpt)
			return 1;
			else
			local tbOpt =
				{
				}
						tinsert(tbOpt,{"Xin mêi chän trang bÞ", laydoxanh})
						tinsert(tbOpt,{"Tho¸t."})	
				CreateNewSayEx(szTitle, tbOpt)
			return 1;
			end

end
function thieulam2()
laydoxanh()
--layvkxanh()
--AddItemEx(4,10,2,0,0,0,10,0,0,80,0,0,0,0,0)
--AddVerItem(4,10,,0,0,10,3,100,1,2,1,1,1,6) --½£
--AddVerItem(4,0,0,1,0,10,2,30,2,0,0,0,0,0) --½£
--AddItem(0,0,0,10,0,0,11,11,0,0,0,0)
end

function thieulam()
	local szTitle = "Ng­¬i Muèn NhËn Trang BÞ Hoµng Kim Nµo ?..."
	local tbOpt =
		{
			{"ThiÕu L©m QuyÒn", TLQ},
			{"ThiÕu L©m §ao.", TLD},
			{"ThiÕu L©m Bæng", TLB},
			{"Tho¸t."},
		}
	CreateNewSayEx(szTitle, tbOpt)
end
function TLQ()
	local szTitle = "Ng­¬i Muèn NhËn Trang BÞ Hoµng Kim Nµo ?..."
	local tbOpt =
		{
			{"Méng Long ChÝnh Hång T¨ng M·o", TLQ1},
			{"Méng Long Kim Ti ChÝnh Hång Cµ Sa", TLQ2},
			{"Méng Long PhËt Ph¸p HuyÒn Béi", TLQ3},
			{"Méng Long §¹t Ma T¨ng hµi", TLQ4},
			{"Tho¸t."},
		}
	CreateNewSayEx(szTitle, tbOpt)
end
function TLQ1()
	if CalcFreeItemCellCount() <= 10 then
		return Msg2Player("B¹n kh«ng §ñ 10 ¤ Trèng , h·y dän r­¬ng råi h·y sö dông")
	end
	local indexitem = AddGoldItem(0,220)
	--ITEM_SetExpiredTime(indexitem, 10080)
	Msg2Player("B¹n NhËn §­îc Méng Long HuyÒn Ti Ph¸t ®¸i")
	ConsumeEquiproomItem(1,6,1,4709,-1)
end
tbVKXanh =
{
[1]=
{
szName = "Vò khÝ cËn chiÕn",
tbEquip =
{
{"HuyÒn ThiÕt KiÕm",0,0,0},
{"§¹i Phong §ao",0,0,1},
{"Kim C« Bæng",0,0,2},
{"Ph¸ Thiªn KÝch",0,0,3},
{"Ph¸ Thiªn chïy",0,0,4},
{"Th«n NhËt Tr·m",0,0,5},
{"MËt V©n TriÒn Thñ ",0,0,6},
}
},
[2]=
{
szName = "Vò khÝ tÇm xa",
tbEquip =
{
{"B¸ V­¬ng Tiªu",0,1,0},
{"To¸i NguyÖt §ao",0,1,1},
{"Khæng T­íc Linh",0,1,2},
}
},
}


	function layvkxanh()
		local ItemGenre,DetailType,ParticularType,Level,nSeries,Luck
		local magictype,p1,p2,p3
		local xItem
			local tbOpt = {}
				for i=1, getn(tbVKXanh) do
					tinsert(tbOpt, {tbVKXanh[i].szName, layvkxanh1, {i}})
				end
				tinsert(tbOpt, {"Tho¸t."})
				CreateNewSayEx("<npc>Xin mêi lùa chän trang bÞ:", tbOpt)
	end
	function layvkxanh1(nType)
		local tbEquip = %tbVKXanh[nType]["tbEquip"]
		local tbOpt = {}
		for i=1, getn(tbEquip) do
			tinsert(tbOpt, {tbEquip[i][1], layvkxanh2, {i, nType}})
		end
		tinsert(tbOpt, {"Tho¸t."})
		local szTitle = format("<npc>Xin mêi lùa chän trang bÞ:")
		CreateNewSayEx(szTitle, tbOpt)
	end
	function layvkxanh2(nIndex, nType)
		g_AskClientNumberEx(0, 10, "CÊp trang bÞ:", {layvkxanh3, {nIndex, nType}})
	end

	function layvkxanh3(nIndex, nType, nLevel)
		local tbEquipSelect = %tbVKXanh[nType]["tbEquip"][nIndex]
			for j=1, 10 do
				xItem = AddVerItem(4,j, tbEquipSelect[2], tbEquipSelect[3], tbEquipSelect[4], nLevel,2,250,10)
				for i=1,6 do
					magictype, p1, p2, p3 = GetItemMagicAttrib(xItem, i)
					if(i==1) then
						if(magictype ~=115) then
							RemoveItemByIndex(xItem)
						end
						if(p1<30) then
							RemoveItemByIndex(xItem)
						end
					end
					if(i==2) then
						if(magictype ~=123) then
							RemoveItemByIndex(xItem)
						end
						if(p1<50) then
							RemoveItemByIndex(xItem)
						end
					end
					if(i==3) then
						if(magictype ==136 or magictype ==137) then
						else
							RemoveItemByIndex(xItem)
						end
						if(p1<4) then
							RemoveItemByIndex(xItem)
						end
					end
					if(i==5) then
						if(magictype ~=136) then
							RemoveItemByIndex(xItem)
						end
						if(p1<4) then
							RemoveItemByIndex(xItem)
						end
					end
				end
			end 
			Msg2Player(nTask)
	end
----------LÊy §å Xanh------------------
tbDoXanh =
{
[1]=
{
szName = "Vò KhÝ CËn ChiÕn",
tbEquip =
{
{"HuyÒn ThiÕt KiÕm",0,0,0},
{"§¹i Phong §ao",0,0,1},
{"Kim C« Bæng",0,0,2},
{"Ph¸ Thiªn KÝch",0,0,3},
{"Ph¸ Thiªn chïy",0,0,4},
{"Th«n NhËt Tr·m",0,0,5},
{"TriÒn Thñ",0,0,6},
{"Vò Hån §ao",0,0,7},
{"Vò Hån ThuÉn",0,0,8},
}
},
[2]=
{
szName = "Vò KhÝ TÇm Xa",
tbEquip =
{
{"B¸ V­¬ng Tiªu",0,1,0},
{"To¸i NguyÖt §ao",0,1,1},
{"Khæng T­íc Linh",0,1,2},
{"Thiªn CÇm",0,1,3},
}
},
}

function laydoxanh()
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
--g_AskClientNumberEx(0, 60, "Sè L­îng:", {laydoxanh4, {nIndex, nType, nSeries}})
local tbOpt = {}
tinsert(tbOpt, {"Ta NhËn Ngay", laydoxanh4, {nIndex, nType, nSeries}})
tinsert(tbOpt, {"Kªt thóc ®èi tho¹i."})
local szTitle = format("<npc>nhµ ng­¬i nhËn kh«ng:")
CreateNewSayEx(szTitle, tbOpt)
end
function laydoxanh4(nIndex, nType, nSeries)
if CalcFreeItemCellCount() < 20 then
Say("H·y cÊt bít vËt phÈm ®Ó ®¶m b¶o ca 20 « trèng råi h·y më.",0);
return 1;
end
local tbEquipSelect = %tbDoXanh[nType]["tbEquip"][nIndex]
			for j=1, 1 do
				xItem = AddVerItem(4,j, tbEquipSelect[2], tbEquipSelect[3], tbEquipSelect[4], 10,nSeries,100,10)
				ITEM_SetExpiredTime(xItem, 4320);
				SyncItem(xItem)
				SetItemBindState(xItem,-2)
				ConsumeEquiproomItem(1,6,1,4392,-1)
			end
for i=1,nCount do 
xItem =AddItem(tbEquipSelect[2], tbEquipSelect[3], tbEquipSelect[4], 1, nSeries, 100, 10)
ITEM_SetExpiredTime(xItem,4320)
SyncItem(xItem)
SetItemBindState(xItem,-2)
ConsumeEquiproomItem(1,6,1,4392,-1)
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