Include("\\script\\global\\zid_jx\\lib\\config.lua")
Include("\\script\\global\\zid_jx\\tinhnang\\loidaicacuoc\\head.lua")


TanThuQuanTab = 
{
	{1442,	20,		3545,	6196,	"\\script\\global\\zid_jx\\global\\npc_hotrotanthu.lua",	"T©n Thñ Quan"}, 
	{1442,	53,		1622,	3193,	"\\script\\global\\zid_jx\\global\\npc_hotrotanthu.lua",	"T©n Thñ Quan"}, 
	{1442,	101,	1673,	3179,	"\\script\\global\\zid_jx\\global\\npc_hotrotanthu.lua",	"T©n Thñ Quan"},
	{1442,	174,	1628,	3209,	"\\script\\global\\zid_jx\\global\\npc_hotrotanthu.lua",	"T©n Thñ Quan"},
	{1442,	121,	1950,	4516,	"\\script\\global\\zid_jx\\global\\npc_hotrotanthu.lua",	"T©n Thñ Quan"}, 
	{1442,	99,		1610,	3183,	"\\script\\global\\zid_jx\\global\\npc_hotrotanthu.lua",	"T©n Thñ Quan"}, 
	{1442,	100,	1628,	3188,	"\\script\\global\\zid_jx\\global\\npc_hotrotanthu.lua",	"T©n Thñ Quan"}, 
	{1442,	153,	1603,	3234,	"\\script\\global\\zid_jx\\global\\npc_hotrotanthu.lua",	"T©n Thñ Quan"},
}

NpcThuNghiemTab = 
{
	{1443,	20,		3545,	6196,	"\\script\\global\\zid_jx\\global\\npc_hotrotanthu.lua",	"NPC Thö NghiÖm"}, 
	{1443,	53,		1622,	3193,	"\\script\\global\\zid_jx\\global\\npc_hotrotanthu.lua",	"NPC Thö NghiÖm"}, 
	{1443,	101,	1673,	3179,	"\\script\\global\\zid_jx\\global\\npc_hotrotanthu.lua",	"NPC Thö NghiÖm"},
	{1443,	174,	1628,	3209,	"\\script\\global\\zid_jx\\global\\npc_hotrotanthu.lua",	"NPC Thö NghiÖm"},
	{1443,	121,	1950,	4516,	"\\script\\global\\zid_jx\\global\\npc_hotrotanthu.lua",	"NPC Thö NghiÖm"}, 
	{1443,	99,		1610,	3183,	"\\script\\global\\zid_jx\\global\\npc_hotrotanthu.lua",	"NPC Thö NghiÖm"}, 
	{1443,	100,	1628,	3188,	"\\script\\global\\zid_jx\\global\\npc_hotrotanthu.lua",	"NPC Thö NghiÖm"}, 
	{1443,	153,	1603,	3234,	"\\script\\global\\zid_jx\\global\\npc_hotrotanthu.lua",	"NPC Thö NghiÖm"},
}




function AddNpc_Zid(Tab)
	AddNpc_LoiDai_Dialog()
	AddNpc_loandau_Dialog()
	for i = 1 , getn(Tab) do 
		local itemlist = Tab[i]
		local SId = SubWorldID2Idx(itemlist[2]);
		if (SId >= 0) then
			
			local npcindex = AddNpc(itemlist[1], 1, SId, itemlist[3] * 32, itemlist[4] * 32, 1, itemlist[6]);
			SetNpcTimer(npcindex,random(10, 20)*18)
			SetNpcScript(npcindex, itemlist[5]);
		else
			if itemlist[1] == 1454 then
				print(itemlist[6], itemlist[2])
			end
		end;
	end	
end;

function AddNpc_loandau_Dialog() 
	local nNpcIndex = AddNpc(1571,1,SubWorldID2Idx(78),1585*32,3210*32,0,"Lo¹n §Êu Anh Hïng");
	SetNpcScript(nNpcIndex, "\\script\\global\\zid_jx\\tinhnang\\loandauanhhung\\dialog.lua");
	
	local nNpcIndex1 = AddNpc(229,1,SubWorldID2Idx(78),1590*32,3217*32,0,"BËt M· ¤n");
	SetNpcScript(nNpcIndex1, "\\script\\global\\zid_jx\\tinhnang\\nangcapthu\\main.lua");
	
	local nNpcIndex1 = AddNpc(87,1,SubWorldID2Idx(53),1624*32,3200*32,0,"Hoµng Ba Tiªn Tö");
	SetNpcScript(nNpcIndex1, "\\script\\global\\zid_jx\\tinhnang\\phutro\\dialog.lua");
	
	local nNpcIndex1 = AddNpc(87,1,SubWorldID2Idx(989),1550*32,3168*32,0,"Th¸ch §Êu Bang Héi Ghi Danh");
	SetNpcScript(nNpcIndex1, "\\script\\global\\zid_jx\\tinhnang\\thachdaubanghoi\\tongmain.lua");
	
	
end;