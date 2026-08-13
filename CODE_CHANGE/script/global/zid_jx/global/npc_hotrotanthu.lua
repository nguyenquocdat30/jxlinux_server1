IncludeLib("SETTING")
IncludeLib("TONG")
IncludeLib("RELAYLADDER");
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\global\\fuyuan.lua")

--========== Zid Lib ==========--
Include("\\script\\global\\zid_jx\\lib\\config.lua")
Include("\\script\\global\\zid_jx\\gm\\gm_support_tb_blue.lua")
Include("\\script\\global\\zid_jx\\gm\\gm_support_tbhk.lua")
Include("\\script\\global\\zid_jx\\gm\\gm_support.lua")
Include("\\script\\global\\zid_jx\\gm\\gm_lib.lua")
Include("\\script\\global\\zid_jx\\global\\vongsangtanthu.lua")
Include("\\script\\global\\zid_jx\\lib\\hockynangmonphai.lua")


--========== End Zid Lib ==========--

	szPlayer = "§¹i HiÖp"
if GetSex() == 1 then
	szPlayer = "N÷ HiÖp"
end


function main()
   dofile("script/global/zid_jx/global/npc_hotrotanthu.lua");

	if Server_Open_Test == 1 then
		local tbSay = {}
			if GetLevel() < 200 then
				tinsert(tbSay,"Ta muèn nhËn 200 cÊp ®é Vµ c¸c lo¹i ®iÓm/#Test_Main(1)")
			end
			if (ConsumeItem(3, 0, 6, 1, 4258, -1) < 1) then
				tinsert(tbSay, "Gióp t¹i h¹ nhËn l¹i CÈm Nang §ång Hµnh/#Test_Main(9)")
			end
			tinsert(tbSay,"Ta Muèn NhËn Hç Trî Full Skill M«n Ph¸i/#Test_Main(12)")
			--tinsert(tbSay,"Ta Muèn Kho¸ng Th¹ch & HuyÒn Tinh/#TestKhoangThach(13)")
			tinsert(tbSay,"Ta Muèn NhËn Trang BÞ Xanh/#Test_Main(2)")
			tinsert(tbSay,"Ta Muèn NhËn Trang BÞ Hoµng Kim/#Test_Main(3)")
			tinsert(tbSay,"Ta Muèn NhËn Event vµ b¶o r­¬ng ®å xanh/#Test_Main(16)")
			tinsert(tbSay,"Ta Muèn NhËn s¸ch Skill/#Test_Main(15)")
			tinsert(tbSay,"Ta Muèn NhËn C¸c Lo¹i Ngùa/#Test_Main(4)")
			tinsert(tbSay,"Ta Muèn NhËn Ng©n L­îng/#Test_Main(5)")
			tinsert(tbSay,"Ta Muèn NhËn TiÒn §ång/#Test_Main(6)")
			tinsert(tbSay,"Ta Muèn Thö Chøc N¨ng Bang Béi/#Test_Main(7)")
			tinsert(tbSay,"Ta Muèn Thay §æi Tr¹ng Th¸i/#Test_Main(8)")
			tinsert(tbSay,"Gióp t¹i h¹ huû vËt phÈm/#Test_Main(10)")
			tinsert(tbSay,"GÆp L¹i Ng­¬i Sau/Quit")
		Say("<color=orange>NPC Thö NghiÖm:<color> Xin Chµo "..szPlayer.." "..GetName().." , "..szPlayer.." Muèn Thö NghiÖm Chøc N¨ng Nµo ?", getn(tbSay), tbSay)
	else
		local tbSay1 = {}
			if (ConsumeItem(3, 0, 6, 1, 4258, -1) < 1) then
				tinsert(tbSay1, "Gióp t¹i h¹ nhËn l¹i CÈm Nang §ång Hµnh/#Test_Main(9)")
			end
			tinsert(tbSay1,"Gióp t¹i h¹ huû vËt phÈm/#Test_Main(10)")
			--tinsert(tbSay1,"Gióp t¹i h¹ nhËn vßng s¸ng t©n thñ./#Test_Main(11)")
			tinsert(tbSay1,"GÆp L¹i Ng­¬i Sau/Quit")
		Say("<color=orange>T©n Thñ Quan:<color> Xin Chµo "..szPlayer.." "..GetName().." ,Ta Cã ThÓ Gióp G× Cho "..szPlayer.." ?", getn(tbSay1), tbSay1)
	end
	

end

function Test_Main(sel)
	if (sel == 1) then
		while GetLevel() <199 do
			local nAddLevel = 200 - GetLevel()
			ST_LevelUp(nAddLevel)
		end
		Msg2Player("<color=cyan>CÊp §é T¨ng 150!");
		AddRepute(10000)
		Msg2Player("<color=cyan>NhËn §­îc 10000 ®iÓm danh väng!");
		SetTask(151, 10000)
		Msg2Player("<color=cyan>NhËn §­îc 10000 ®iÓm phóc duyªn!");
		SetTask(747, 1000000)
		Msg2Player("<color=cyan>NhËn §­îc 10000 ®iÓm Tèng Kim!");
		AddLeadExp(100000000)
		return Msg2Player("<color=cyan>NhËn §­îc 10 triÖu ®iÓm tµi l·nh ®¹o!");
	elseif (sel == 2) then
		Gm_Support_TB_Blue()
		return 
	elseif (sel == 3) then
		local tbSay1 = {}
		--tinsert(tbSay1,"Ta Muèn NhËn Trang BÞ Hoµng Kim Th­êng/#MakeGoldItem(1)")
		--tinsert(tbSay1,"Ta Muèn NhËn Trang BÞ Hoµng Kim M«n Ph¸i/#MakeGoldItem(2)")
		tinsert(tbSay1,"Ta Muèn NhËn SÐt Trang BÞ Nguyªn So¸i/#MakeGoldItem(3)")
		tinsert(tbSay1,"GÆp L¹i Ng­¬i Sau/Quit")
		Say("<color=orange>NPC Thö NghiÖm:<color> Xin Chµo "..szPlayer.." "..GetName().." ,Ta Cã ThÓ Gióp G× Cho "..szPlayer.." ?", getn(tbSay1), tbSay1)
		return 
	elseif (sel == 4) then
		Gm_Support_GiveHouse()
		return 	
	elseif (sel == 5) then
		Earn(100000000)
		Msg2Player("<color=cyan>NhËn §­îc 10 Ngµn V¹n L­îng!")
		return 
	elseif (sel == 6) then
		AddStackItem(100,4,417,1,1,0,0,0)
		AddStackItem(100,4,417,1,1,0,0,0)
		AddStackItem(100,4,417,1,1,0,0,0)
		AddStackItem(100,4,417,1,1,0,0,0)
		AddStackItem(100,4,417,1,1,0,0,0)
		Msg2Player("<color=cyan>NhËn ®­îc 500 tiÒn ®ång!")
		return 
	elseif (sel == 7) then
		dmcreattongtest()
		return 
	elseif (sel == 8) then
		changeCamp()
		return 
	elseif (sel == 9 and ConsumeItem(3, 0, 6, 1, 4258, -1) < 1) then
		local indexItem = AddItem(6, 1, 4258, 0, 0, 0, 0)
		SetItemBindState(indexItem,-2)
	return 
	elseif (sel == 10) then
		Say("B¹n cã ch¾c muèn <color=red>hñy vËt phÈm<color> chø, h·y suy nghÜ kü!<enter><color=0xffff5f>TÊt c¶ c¸c vËt phÈm ®­îc yªu cÇu hñy sÏ bÞ hñy bá <enter>hoµn toµn bëi hÖ thèng, bÊt kÓ lµ vËt phÈm nµo!", 2, "Ta nghÜ kü råi!/DelItem_Sure", "Th«i, ta nhÇm!/Quit")
	return 	
	elseif (sel == 11) then
		FootNewbie:DialogMain()
	return 	
	elseif (sel == 12) then
		HoTroKyNang()
	return 	
	elseif (sel == 13) then
		TestKhoangThach()
	return 	
	elseif (sel == 15) then
		AddStackItem(1,6,1,4386,1,0,0)
		AddStackItem(1,6,1,4387,1,0,0)
		AddStackItem(1,6,1,4388,1,0,0)
		AddStackItem(1,6,1,4389,1,0,0)
		AddStackItem(1,6,1,4390,1,0,0)
	return 
	elseif (sel == 16) then
		AddStackItem(999,6,1,4413,1,0,0)
		AddStackItem(999,6,1,4412,1,0,0)
		AddStackItem(999,6,1,4406,1,0,0)
	return 
	end
end

function DelItem_Sure()
	GiveItemUI("Hñy vËt phÈm", "§¹i hiÖp h·y cÈn träng trong   viÖc hñy vËt phÈm!", "DisposeConfirm", "Quit", 1);
end

function DisposeConfirm(nCount)
	local DelItemFileName = openfile("script/global/zid_jx/log/delete_item/del_item_"..date("%d_%m_%Y")..".log", "a");
	local G, D, P, L, S
	local Count_ItemRemove = 0
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		local strItem = GetItemName(nItemIndex)
		G, D, P, L, S = GetItemProp(nItemIndex)
		if G ~= 4 and D ~= 417 then
			RemoveItemByIndex(nItemIndex)
			Msg2Player("§· hñy vËt phÈm [<color=green>"..strItem.."<color>]")
			Count_ItemRemove = Count_ItemRemove + 1
		else
			Msg2Player("vËt phÈm [<color=green>"..strItem.."<color>] Kh«ng ThÓ Huû Bá.")
		end
		if strItem ~= "TiÒn ®ång" then
		write(DelItemFileName, date("%H:%M:%S").."\t Account: "..GetAccount().."\tName: "..GetName().."\t DelItem: "..strItem, "\n")
		end
	end
	closefile(DelItemFileName)
	Msg2Player("Thao t¸c hñy vËt phÈm thµnh c«ng")
	Talk(1, "", "Thao t¸c thµnh c«ng, kiÓm tra l¹i!<enter>§· hñy<color=yellow> "..Count_ItemRemove.."<color> vËt phÈm!");	
end

function Quit() end

function MakeGoldItem(sel)
	if (sel == 1) then
	Gm_Support_TBHK()
	return
	elseif (sel == 2) then
	Gm_Support_TBHKMP()
	return
	elseif (sel == 3) then
	Gm_Support_TBHKNS()
	return
	end
end

--==========================================================================================

Include("\\script\\global\\repute_head.lua")
Include("\\script\\misc\\league_cityinfo.lua")

function dmcreattongtest()
local strTongName = GetTongName()
local tszTitle = "Chµo mõng b¹n ®· tham gia hÖ thèng <color=yellow>Bang Héi<color>"
if (strTongName == nil or strTongName == "") then
	Say(tszTitle,4,"NhËn ®iÒu kiÖn t¹o bang héi/dmcreatetong","T¹o bang héi/dmcreateit","KÕt thóc ®èi tho¹i/quit")
else
	Say(tszTitle,0)
end	
end

function dmcreatetong()	
	if  GetCamp() ~= 4 then
			SetCamp(4)
			SetCurCamp(4)
			AddRepute(100000)
			AddLeadExp(1000000)
			AddLeadExp(1000000)

			AddLeadExp(1000000)

			AddEventItem(195)
			Earn(1000000)
			if GetLevel() <= 100 then
				for i=1,100 do
					AddOwnExp(100000000)
				end
			end
		Msg2Player("<color=yellow>Ng­êi ®· héi ®ñ tÊt c¶ ®iªu kiÖn ®Ó t¹o Bang Héi!<color>")
	end
end

function dmcreateit()
	Tong_name,oper = GetTong()
	if (oper == 0) and (GetTask(99) == 1) then
		Say("KiÕm hiÖp ch­ëng m«n nh©n:Khai s¸ng bang héi, më réng b¸ nghiÖp." ,2,"B¾t ®Çu dùng bang/Direct_CreateTong","§îi ta mét chót/wait_a_moment")
	elseif (oper == 0) and (GetCamp() == 4) and (GetLevel() >= 50) and (GetReputeLevel(GetRepute()) >= 6) and (GetLeadLevel() >= 30) and (HaveItem(195) == 1) then
		Talk(6,"create_pay", "Ng­êi ch¬i: KiÕm hiÖp ch­ëng m«n nh©n, xin hái ta ph¶i lµm nh­ thÕ nµo míi ca thÓ khai t«ng lËp ph¸i trë thµnh Bang chñ ®©y?", "KiÕm hiÖp ch­ëng m«n nh©n: §Çu tiªn ng­¬i ph¶i ca ®ñ n¨ng lùc l·nh ®¹o, ca 16 ng­êi cïng chÝ h­íng cïng ng­¬i lËp bang, tr¶i qua 16 ngµy Kh¶o NghiÖm Kú ", "Ch­ëng m«n nh©n:  NÕu trong 16 ngµy ca ng­êi rêi bang th× néi trong 16 ngµy ®a ng­êi ph¶i t×m ng­êi kh¸c thay thÕ.", "Ch­ëng m«n nh©n:  Ng­¬i ph¶i ca ®ñ tµi l·nh ®¹o vµ tin vËt ®a lµ Nh¹c V­¬ng KiÕm", "Ng­êi ch¬i: Nh¹c V­¬ng Kiªm ? Ng­êi nai lµ thanh kiªm nµy µ ? ", "KiÕm hiÖp ch­ëng m«n nh©n : Th× ra lµ ng­¬i ®· ca na... Kh«ng tÖ, qu¶ nhiªn tuæi trÎ tµi cao!!! ")
	else	
		i = random(0,1)
		if (i == 0) then
			Talk(1,"", "Kiªm hiÖp ch­ëng m«n nh©n: Nªu nh­ muèn thµnh lËp bang héi, ng­¬i v× na bá ra 1 l­îng lín thêi gian, søc lùc cïng t©m huyÕt, kh«ng thÓ nöa ®­êng hñy bá." )
		else
			Talk(6,"", "Kiªm hiÖp ch­ëng m«n nh©n:  Ng­¬i muèn hái ®iªu kiÖn lËp bang µ? §Ó ta nai cho ng­¬i râ.", "Kiªm hiÖp ch­ëng m«n nh©n: ®Çu tiªn ph¶i xuÊt ; tiªp theo ng­¬i kh«ng thÓ ë bÊt kú bang héi nµo kh¸c ; ng­¬i nhÊt ®inh ph¶i danh väng giang hå ; cuèi cïng lµ tµi l·nh ®¹o ph¶i h¬n 30 cÊp.", "Kiªm hiÖp ch­ëng m«n nh©n: Sau ®a ®i chiªn tr­êng t×m mét thanh Nh¹c V­¬ng Kiªm lµm bang chñ tin vËt lµ ®­îc råi.")
		end
	end
end

function create_pay()
	Say("Kiªm hiÖp ch­ëng m«n nh©n: Ng­¬i cÇn lÖ phi lµ 100 v¹n l­îng b¹c." ,2,"Kh«ng thµnh vÊn ®ª, ta ca ®em 100v l­îng ®©y! /create_pay_yes","H©y dµ, ta kh«ng ®em ®ñ tiªn råi. /create_pay_no")
end
function create_pay_yes()

	if (GetCash() >= 1000000) then
		Pay(1000000)
		DelItem(195)
		SetTask(99,1)
		Direct_CreateTong()
		
	else
		Talk(1,"", "Kiªm hiÖp ch­ëng m«n nh©n: ViÖc duy tr× bang héi rÊt tèn tiÒn, ng­êi ph¶i cè g¾ng cïng mäi ng­êi tÝch gãp ®Ó bang ®­îc giµu m¹nh. ")	end
end


function Direct_CreateTong()
	CreateTong(1)
end
--==========================================================================================