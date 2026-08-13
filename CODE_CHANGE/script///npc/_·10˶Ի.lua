Include("\\script\\global\\zid_jx\\lib\\config.lua")

ruong1 = CoinRuong1;
ruong2 = CoinRuong2;
ruong3 = CoinRuong3;

function main()
	UTask_world20 = GetTask(48)
	if ((CheckStoreBoxState(1) == 0 or CheckStoreBoxState(2) == 0 or CheckStoreBoxState(3) == 0) and  UTask_world20 == 1 and  NPCThamCuu_BaLang ~= 1) then			-- ·ûºÏ¢òÏä×ÓµÄÌõ¼þ£¬ÔÊÐí¹º¢ò¸½¼Ó´¢ÎïÏä
		Say("Ta cã 1 r­¬ng thÇn kú, kh«ng nh÷ng gi÷ ®­îc nhiÒu vËt phÈm mµ cßn cã thÓ khãa l¹i an toµn. C¶ trung nguyªn chØ m×nh ta cã. Cã muèn xem thö kh«ng?",2, "Hái th¨m mét chót/task_ring", "Kh«ng høng thó/no")
	elseif ((CheckStoreBoxState(1) == 0 or CheckStoreBoxState(2) == 0 or CheckStoreBoxState(3) == 0) and  UTask_world20 == 1 and  NPCThamCuu_BaLang == 1) then			-- ·ûºÏ¢òÏä×ÓµÄÌõ¼þ£¬ÔÊÐí¹º¢ò¸½¼Ó´¢ÎïÏä
		Say("Ta cã 1 r­¬ng thÇn kú, kh«ng nh÷ng gi÷ ®­îc nhiÒu vËt phÈm mµ cßn cã thÓ khãa l¹i an toµn. C¶ trung nguyªn chØ m×nh ta cã. Cã muèn xem thö kh«ng?",4,"§Ó ta thö xem/buy_addibox", "Hái th¨m mét chót/task_ring","VÒ viÖc më réng r­¬ng/box_help", "Kh«ng høng thó/no")
	elseif (UTask_world20 == 1) then
		task_ring()
	elseif (CheckStoreBoxState(1) == 0 or CheckStoreBoxState(2) == 0 or CheckStoreBoxState(3) == 0) then
		Say("Ta cã 1 r­¬ng thÇn kú, kh«ng nh÷ng gi÷ ®­îc nhiÒu vËt phÈm mµ cßn cã thÓ khãa l¹i an toµn. C¶ trung nguyªn chØ m×nh ta cã. Cã muèn xem thö kh«ng?",3,"§Ó ta xem thö/buy_addibox", "VÒ viÖc më réng r­¬ng/box_help", "Kh«ng høng thó/no")
	else
		other_chat()
	end
end;

function task_ring()
	UTask_world20 = GetTask(48);
	if (UTask_world20 == 1) then
		Say("Muèn mua giïm c« n­¬ng Êy cña håi m«n ­? Hµng hãa cßn l¹i cña ta kh«ng nhiÒu, chØ cßn l¹i ®«i b«ng tai vµng nµy lµ kh¸ rÎ, chØ cã 200 l­îng th«i. ",2,"Mua/yes", "T¸n gÉu/other_chat","Kh«ng mua/no")
	end
end

function other_chat()
	Talk(3,"", "Ta tõ Tø Xuyªn ®Õn, trªn ®­êng cã rÊt nhiÒu thæ ph×, thËt lµ nguy hiÓm! ","ThËt kh«ng thÓ ngê ®­îc ta cã thÓ ®Õn khu vùc §éng §×nh hå nµy mµ kh«ng hÒ bÞ c­íp! Ng­¬i thÊy cã l¹ kh«ng? ","Ta nghe ng­êi ta nãi míi biÕt, ë ®©y kh«ng chÞu sù qu¶n lý cña quan phñ, mµ tõ mét ph¸i tªn Thiªn V­¬ng Bang g× ®ã, hÌn g× ë ®©y thËt yªn b×nh! ")
end

function yes()
	if(GetCash() >= 200)then
		Talk(1,"","Khuyªn tai ®· gãi l¹i råi! Xin gi÷ lÊy")
		Pay(200);
		AddEventItem(181);
		Msg2Player("B¹n nhËn ®­îc mét ®«i b«ng tai");
		AddNote("B¹n mua ®­îc mét ®«i b«ng tai ë chç Th­¬ng Nh©n ®em vÒ giao cho A Ph­¬ng")
--		SetTask(48, 2);
	else
		Talk(1,"","Kh¸ch quan kh«ng ®ñ tiÒn, khi nµo ®ñ h·y quay l¹i")
	end
end;

function buy_addibox()
		local szMsg = 
		{
				"ThÈm Cöu: §©y lµ chiÕc r­¬ng ®­îc lµm tõ ®¸ san h« xanh, cã thÓ cho ng­¬i bá thªm vËt phÈm, cßn cã thÓ khãa l¹i mét c¸c an toµn",	--1
				"Ta muèn më thªm r­¬ng thø 2/#buy_addibox_yes(ruong1)",	--2
				"Ta muèn më thªm r­¬ng thø 3/#zid_iWantOpenStoreBox(2)",			--4
				"Ta muèn më thªm r­¬ng thø 4/#zid_iWantOpenStoreBox(3)",				--5
				"§¾t qu¸! LÇn sau sÏ mua/no",			--3
		};
		Say(szMsg[1], 4, szMsg[2], szMsg[3], szMsg[4], szMsg[5]);
end

function zid_iWantOpenStoreBox(BoxNum)
	local biCoin = 0
	if BoxNum == 2 then
		biCoin = ruong2
	elseif BoxNum == 3 then
		biCoin = ruong3
	else
		print("False! zid_iWantOpenStoreBox - "..BoxNum)
		return
	end
	if CheckStoreBoxState(BoxNum) ~= 0 then
		return Talk(1,"","Ch¼ng ph¶i huynh ®Ö ®· nhê ta më r­¬ng thø "..(BoxNum+1).." råi sao?")
	else
		if CheckStoreBoxState(BoxNum - 1) == 0 then
			return Talk(1, "", "§Ó më ®­îc r­¬ng thø "..(BoxNum+1).." ®¹i hiÖp cÇn ph¶i më r­¬ng thø "..BoxNum.." tr­íc!")
		end
	end
	
	local nMyCoinCount = CalcEquiproomItemCount(4,417,1,-1)
	if (nMyCoinCount < biCoin) then
		return Talk(1,"","Trªn ng­êi cña quan kh¸ch kh«ng cã ®ñ "..biCoin.." TiÒn §ång, khi nµo thu thËp ®ñ h·y ®Õn t×m tiÓu ®Ö ®Ó më thªm r­¬ng!")
	else
		if (biCoin ~= 0 and nMyCoinCount >= biCoin) then
			Say("§Ó më r­¬ng thø <color=yellow>"..(BoxNum+1).."<color> chi phÝ lµm r­¬ng rÊt tèn kÐm, cÇn ®Õn <color=Orange>"..biCoin.."<color> TiÒn ®ång, ®¹i hiÖp ch¾c ch¾n muèn më r­¬ng chø!", 2, "Ta c©n nh¾c kü råi!/#zid_iWantOpenStoreBox_Sure("..biCoin..", "..BoxNum..")", "Trêi! ®¾t vËy sao, ®Ó ta suy nghÜ l¹i/no")
		else
			print("False! BoxNum: "..BoxNum..", nMyCoinCount: "..nMyCoinCount.."")
		end
	end
end

function zid_iWantOpenStoreBox_Sure(biCoin, BoxNum)
	local nMyCoinCount = CalcEquiproomItemCount(4,417,1,-1)
	if nMyCoinCount < biCoin then
		return
	end
	ConsumeEquiproomItem(biCoin,4,417,1,-1)
	OpenStoreBox(BoxNum)
	SaveNow(); 
	Talk(1,"","Xin chóc mõng! <color=yellow>r­¬ng chøa ®å cña b¹n ®· ®­îc më réng.<color>")
	Msg2Player("Xin chóc mõng! <color=yellow>r­¬ng chøa ®å cña b¹n ®· ®­îc më réng.<color> R­¬ng <color=yellow> "..(BoxNum+1).."")
end

function buy_addibox_yes(nNedCount)
	if (nNedCount == 0 or nNedCount == nil) then
		return
	end;
	if CheckStoreBoxState(1) ~= 0 then
		return Talk(1,"","Ch¼ng ph¶i huynh ®Ö ®· nhê ta më r­¬ng thø 2 råi sao?")
	end
	local nCount = CalcEquiproomItemCount(4,417,1,-1)
	
	if (nCount < nNedCount) then
		Talk(1,"","VÞ kh¸ch quan nµy l¹i kh«ng ®em theo TiÒn §ång råi!, khi nµo cã th× h·y tíi ®©y t¹i h¹ sÏ lµm cho v× c¶ trung nguyªn nµy chØ cã ta míi lµm ®­îc th«i!")
		return 1;
	end
	
	-- DelItemEx( 343 );
	ConsumeEquiproomItem(nNedCount,4,417,1,-1)

	OpenStoreBox(1)
	
	SaveNow(); -- ¸¢¼´´æÅÌ
	  	
	Talk(1,"","Xin chóc mõng! <color=yellow>r­¬ng chøa ®å cña b¹n ®· ®­îc më réng.<color>")
	Msg2Player("Xin chóc mõng! <color=yellow>r­¬ng chøa ®å cña b¹n ®· ®­îc më réng.<color>")
end


function box_help()
	str=
	{
	"<#>Mçi nh©n vËt chØ mua ®­îc mét chøc n¨ng më réng r­¬ng th«i. Nã sÏ theo b¹n suèt, gåm cã 60 «, chøc n¨ng vµ nguyªn lý sö dông gièng nh­ r­¬ng ban ®Çu chØ kh«ng thÓ cÊt gi÷ tiÒn b¹c. ",
	"<#>Sau khi mua chøc n¨ng më réng r­¬ng, b¹n nhËn ®­îc mét mËt m· dïng ®Ó b¶o vÖ c¸c trang bÞ trªn ng­êi còng nh­ trong r­¬ng",
	"<#>Sau khi nhÊn vµo mËt m· sÏ khãa l¹i, cßn trong t×nh tr¹ng khãa, trang bÞ trªn ng­êi kh«ng ®­îc mÆc lªn còng nh­ cëi bá, nh­ng nã sÏ kh«ng ¶nh h­ëng ®Õn chøc n¨ng s½n cã (Nh­ ®iÓm sè PK qu¸ cao th× sÏ r¬i c¸c trang bÞ trªn ng­êi). ",
	"<#>ViÖc thiÕt lËp mËt m·: nhÊn vµo giao diÖn r­¬ng chøa ®å n¬i thiÕt lËp mËt m·, sÏ hiÖn ra mét « nhá, trªn ®ã cã tõ 0-9 sè ®Ó nhËp vµo. ",
	"<#>LÇn ®Çu tiªn thiÕt lËp mËt m· ta nhÊn vµo hµng ®ã, cßn nÕu b¹n ®· thiÕt lËp qua khi nhÊn vµo sÏ lµ chØnh söa mËt m·. ",
	"<#>Ta ®· h­íng dÉn xong råi, nÕu cÇn g× trî gióp th× h·y quay l¹i t×m ta nhÐ. ",
	};
	Talk(6,"",str[1],str[2], str[3], str[4], str[5], str[6]);
end
	
	
function no()
end;