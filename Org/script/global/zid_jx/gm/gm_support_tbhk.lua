Include("\\script\\dailogsys\\dailogsay.lua");

SupportEquipGold = {};

SUPPORT_EQUIPGOLD_BASE = {
	["V« Danh"] 		= 	{141, 142},
	["§éng S¸t"] 		= 	{143, 146},
	["§Þnh Quèc"] 		= 	{159, 163},
	["An Bang"] 		= 	{164, 167},
	["Thiªn Hoµng"] 		= 	{168, 176},
	["Kim Phong"] 		= 	{177, 185},
	["HiÖp Cèt"] 		= 	{186, 189},
	["Nh­ T×nh"] 		= 	{190, 193},
	["Kim Quang"] 		= 	{194, 203},
	["Hång ¶nh"] 		= 	{204, 207},
	
};


SUPPORT_EQUIPGOLD_BASE1 = {
	["chiÕn m·"] 		= 	{5321, 5330},
	["quan Ên"] 		= 	{5291, 5300},
	["trang søc"] 		= 	{5301, 5310},
	["phi phong"] 		= 	{5311, 5320},
	["mÆt n¹"] 			= 	{5331, 5340},
	
};


SUPPORT_HOUSE = {
	["XÝch Thè"] 			= 	{0,10,5,7,0,0},
	["§Ých L«"] 			= 	{0,10,5,9,0,0},
	["TuyÖt ¶nh"] 			= 	{0,10,5,8,0,0},
	["¤ V©n §¹p TuyÕt"] 		= 	{0,10,5,6,0,0},
	["ChiÕu D¹ Ngäc S­ Tö"] 		= 	{0,10,5,10,0,0},
	["Phi V©n"] 			= 	{0,10,8,10,0,0},
	["B«n Tiªu"] 			= 	{0,10,6,10,0,0},
	["Phiªn Vò"] 			= 	{0,10,7,10,0,0},
};






SUPPORT_EQUIPGOLD_HKMP = {
	[0] = {
		["ThiÕu L©m (quyÒn)"]		= 		{1, 5},
		["ThiÕu L©m (c«n)"]			= 		{6, 10},
		["ThiÕu L©m (®ao)"]			= 		{11, 15},
	},
	
	[1] = {
		["Thiªn V­¬ng (chïy)"] 		=	 	{16, 20},
		["Thiªn V­¬ng (th­¬ng)"]		=		{21, 25},
		["Thiªn V­¬ng (®ao)"] 		= 		{26, 30},
	},
	
	[2] = {
		["§­êng M«n (phi ®ao)"] 	= 		{71, 75},
		["§­êng M«n (tô tiÔn)"] 	= 		{76, 80},
		["§­êng M«n (phi tiªu)"] 	= 		{81, 85},
		["§­êng M«n (bÉy)"] 	= 		{86, 90},
	},
	
	[3] = {
		["Ngò §éc (ch­ëng)"] 		= 		{56, 60},
		["Ngò §éc (®ao)"] 			= 		{61, 65},
		["Ngò §éc (bïa)"] 			= 		{66, 70},
	},
	
	[4] = {
		["Nga My (kiÕm)"] 			= 		{31, 35},
		["Nga My (ch­ëng)"]	 		= 		{36, 40},
		["Nga My (hç trî)"] 			= 		{41, 45},
	},
	
	[5] = {
		["Thóy Yªn (®ao)"] 				= 		{46, 50},
		["Thóy Yªn (song ®ao)"] 			= 		{51, 55},
	},
	
	[6] = {
		["C¸i Bang (ch­ëng)"] 			= 		{91, 95},
		["C¸i Bang (bæng)"] 				= 		{96, 100},
	},
	
	[7] = {
		["Thiªn NhÉn (kÝch)"] 			= 		{101, 105},
		["Thiªn NhÉn (®ao)"] 			= 		{106, 110},
		["Thiªn NhÉn (bïa)"] 			= 		{111, 115},
	},
	
	[8] = {
		["Vâ §ang (quyÒn)"] 				= 		{116, 120},
		["Vâ §ang (kiÕm)"] 				= 		{121, 125},
	},
	
	[9] = {
		["C«n L«n (®ao)"] 					= 		{126, 130},
		["C«n L«n (sÐt)"] 					= 		{131, 135},
		["C«n L«n (bïa)"] 					= 		{136, 140},
	},
};
SUPPORT_EQUIPGOLD_HKMP2 = {
	[0] = {
		["ThiÕu L©m (quyÒn)"]			= 		{769},
		["ThiÕu L©m (c«n)"]				= 		{771},
		["ThiÕu L©m (®ao)"]				= 		{776},
	},
	
	[1] = {
		["Thiªn V­¬ng (®ao)"] 		= 		{793},
		["Thiªn V­¬ng (chïy)"] 		=	 	{},
		["Thiªn V­¬ng (th­¬ng)"]		=		{},
	},
	
	[2] = {
		["§­êng M«n (tô tiÔn)"] 		= 		{843},
		["§­êng M«n (bÉy)"] 		= 		{854},
		["§­êng M«n (phi ®ao)"] 		= 		{},
		["§­êng M«n (phi tiªu)"] 		= 		{},
	},
	
	[3] = {
		["Ngò §éc (ch­ëng)"] 				= 		{},
		["Ngò §éc (®ao)"] 					= 		{829},
		["Ngò §éc (bïa)"] 					= 		{834},
	},
	
	[4] = {
		["Nga My (kiÕm)"] 				= 		{796},
		["Nga My (ch­ëng)"]	 			= 		{801},
		["Nga My (hç trî)"] 				= 		{808},
	},
	
	[5] = {
		["Thóy Yªn (®ao)"] 			= 		{811},
		["Thóy Yªn (song ®ao)"] 		= 		{816},
	},
	
	[6] = {
		["C¸i Bang (ch­ëng)"] 			= 		{855},
		["C¸i Bang (bæng)"] 				= 		{},
	},
	
	[7] = {
		["Thiªn NhÉn (kÝch)"] 			= 		{868},
		["Thiªn NhÉn (®ao)"] 			= 		{874},
		["Thiªn NhÉn (bïa)"] 			= 		{876},
	},
	
	[8] = {
		["Vâ §ang (quyÒn)"] 				= 		{881},
		["Vâ §ang (kiÕm)"] 				= 		{888},
	},
	
	[9] = {
		["C«n L«n (®ao)"] 					= 		{891},
		["C«n L«n (sÐt)"] 					= 		{898},
		["C«n L«n (bïa)"] 					= 		{901},
	},
};

SUPPORT_EQUIPGOLD_FACTION = {
	[0] = "ThiÕu L©m",
	[1] = "Thiªn V­¬ng",
	[2] = "§­êng M«n",
	[3] = "Ngò §éc",
	[4] = "Nga My",
	[5] = "Thóy Yªn",
	[6] = "C¸i Bang",
	[7] = "Thiªn NhÉn",
	[8] = "Vâ §ang",
	[9] = "C«n L«n",
};

function Gm_Support_TBHK()
SupportEquipGold:GiveBase();
end

function Gm_Support_TBHKMP()
SupportEquipGold:GiveHKMP()
end

function Gm_Support_TBHKNS()
SupportEquipGold:GiveBase1();
end

function Gm_Support_GiveHouse()
SupportEquipGold:GiveHouse()
end



function SupportEquipGold:GiveHouse()
	if (CalcFreeItemCellCount() < 20) then
		Talk(1, "", "Hµnh trang kh«ng ®ñ 20 « trèng ®Ó nhËn.")
	return end
	
	local tb_Equip = SUPPORT_HOUSE;
	local szTitle = "<dec><npc>B¹n muèn nhËn trang bÞ cña m«n ph¸i nµo?";
	local tbOption = {}
	for x, y in tb_Equip do
		tinsert(tbOption, {format("Ngùa %s", x), self.ConfirmGiveHouse,{self,tb_Equip,x}})
	end
		tinsert(tbOption, {"KÕt thóc ®èi tho¹i."})
	CreateNewSayEx(szTitle, tbOption)
end

function SupportEquipGold:ConfirmGiveHouse(tbKind,szKind)
	ItemGenre = tbKind[szKind][1];
	DetailType = tbKind[szKind][2];
	ParticularType = tbKind[szKind][3];
	Lever = tbKind[szKind][4];
	Series = tbKind[szKind][5];
	AddItem(ItemGenre,DetailType,ParticularType,Lever,Series,0);
	Msg2Player(format("B¹n nhËn ®­îc<color=yellow> %s<color>",szKind))
end


function SupportEquipGold:GiveBase()
	if (CalcFreeItemCellCount() < 20) then
		Talk(1, "", "Hµnh trang kh«ng ®ñ 20 « trèng ®Ó nhËn.")
	return end
	
	local tb_Equip = SUPPORT_EQUIPGOLD_BASE;
	local szTitle = "<dec><npc>B¹n muèn nhËn trang bÞ cña m«n ph¸i nµo?";
	local tbOption = {}
	for x, y in tb_Equip do
		tinsert(tbOption, {format("Trang bÞ %s", x), self.ConfirmGiveBase,{self,tb_Equip,x}})
	end
		tinsert(tbOption, {"KÕt thóc ®èi tho¹i."})
	CreateNewSayEx(szTitle, tbOption)
end

function SupportEquipGold:ConfirmGiveBase(tbKind,szKind)
	for nID = tbKind[szKind][1], tbKind[szKind][2] do
		AddGoldItem(0, nID);
	end
	Msg2Player(format("B¹n nhËn ®­îc bé trang bÞ %s",szKind))
end



function SupportEquipGold:GiveBase1()
	if (CalcFreeItemCellCount() < 20) then
		Talk(1, "", "Hµnh trang kh«ng ®ñ 20 « trèng ®Ó nhËn.")
	return end
	
	local tb_Equip = SUPPORT_EQUIPGOLD_BASE1;
	local szTitle = "<dec><npc>B¹n muèn nhËn trang bÞ cña m«n ph¸i nµo?";
	local tbOption = {}
	for x, y in tb_Equip do
		tinsert(tbOption, {format("Trang bÞ %s", x), self.ConfirmGiveBase1,{self,tb_Equip,x}})
	end
		tinsert(tbOption, {"KÕt thóc ®èi tho¹i."})
	CreateNewSayEx(szTitle, tbOption)
end

function SupportEquipGold:ConfirmGiveBase1(tbKind,szKind)
	for nID = tbKind[szKind][1], tbKind[szKind][2] do
		AddGoldItem(0, nID);
	end
	Msg2Player(format("B¹n nhËn ®­îc bé trang bÞ %s",szKind))
end



function SupportEquipGold:GiveHKMP()
	if (CalcFreeItemCellCount() < 20) then
		Talk(1, "", "Hµnh trang kh«ng ®ñ 20 « trèng ®Ó nhËn.")
	return end
	
	local n_Faction = GetLastFactionNumber();
	if (n_Faction < 0) then
		Talk(1, "", "B¹n ch­a gia nhËp m«n ph¸i, kh«ng thÓ nhËn trang bÞ nµy")
	return end
	
	if (n_Faction > 9) then
		Talk(1, "", "HiÖn t¹i ch­a cã trang bÞ hoµng kim m«n ph¸i nµo nµo cho <color=red>Hoa S¬n ph¸i<color> c¶!")
	return end
	
	local szTitle = "<dec><npc>B¹n muèn nhËn trang bÞ cña m«n ph¸i nµo?";
	local tbOption = {};
	local tb_Equip = SUPPORT_EQUIPGOLD_HKMP;
	local tb_Equip2 = SUPPORT_EQUIPGOLD_HKMP2;
	local tb_Faction = SUPPORT_EQUIPGOLD_FACTION;
	for i = 0, getn(tb_Equip) do
		tinsert(tbOption, {format("Trang bÞ ph¸i %s", tb_Faction[i]), self.ListFactionOfEquip, {self,tb_Equip[i],tb_Equip2[i]}})
	end
		tinsert(tbOption, {"KÕt thóc ®èi tho¹i."})
	CreateNewSayEx(szTitle, tbOption)
end

function SupportEquipGold:ListFactionOfEquip(tb_EquipFaction,tb_Equip2)
	local tb_Equip = tb_EquipFaction;
	local tb_Faction = SUPPORT_EQUIPGOLD_FACTION;
	local tbOption = {};
	local szTitle = "<dec><npc>Mêi b¹n chän ®­êng tÊn c«ng c¬ b¶n?";
	for x, y in tb_Equip do
		tinsert(tbOption, {format("%s", x), self.AddEquipOfFaction, {self,tb_Equip[x],tb_Equip2[x]}})
	end
		tinsert(tbOption, {"KÕt thóc ®èi tho¹i."})
	CreateNewSayEx(szTitle, tbOption)
end

function SupportEquipGold:AddEquipOfFaction(tb_EquipKind,tb_Equip2Kind)
	for nID = tb_EquipKind[1], tb_EquipKind[2] do
		AddGoldItem(0, nID)
	end
	if (getn(tb_Equip2Kind) > 1) then
		if (tb_Equip2Kind[1] ~= 0) then
			for nID = tb_Equip2Kind[1], tb_Equip2Kind[2] do
				AddGoldItem(0, nID)
			end
		end;
	else
		if (tb_Equip2Kind[1] ~= 0) then
			AddGoldItem(0, tb_Equip2Kind[1])
		end;
	end;
end