-------------------------------------------------***Create*By*Heart*Doldly***---------------------------------------------------------------
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\composeex.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\global\\zid_jx\\tinhnang\\hotonghuyetthu\\head.lua")
-------------------------------------------------
function main()
local BucHuyetThu = CalcEquiproomItemCount(6,1,30317,1)
local _, _, nMapIndex = GetPos()
local MapId = SubWorldIdx2ID(nMapIndex)
Msg2Player(""..XemLoTrinh().."")
	--Npc Thµnh §«
	if (MapId == 11) then
		if (GetTask(TASKHUYETTHU) == 5) then
			if (GetTask(THANHDO) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 6) then
			if (GetTask(THANHDO) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 15) then
			if (GetTask(THANHDO) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 16) then
			if (GetTask(THANHDO) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 17) then
			if (GetTask(THANHDO) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 18) then
			if (GetTask(THANHDO) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		else
			Say(""..XemLoTrinh().."",2,"Th«i §­îc PhiÒn Ng­¬i §­a Ta §i 1 ChuyÕn/MoveApThu","KÕt Thóc §èi Tho¹i/No")
		end
	end

	--Npc T­¬ng Duong
	if (MapId == 78) then
		if (GetTask(TASKHUYETTHU) == 3) then
			if (GetTask(TUONGDUONG) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 4) then
			if (GetTask(TUONGDUONG) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 19) then
			if (GetTask(TUONGDUONG) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 20) then
			if (GetTask(TUONGDUONG) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 21) then
			if (GetTask(TUONGDUONG) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 22) then
			if (GetTask(TUONGDUONG) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		else
			Say(""..XemLoTrinh().."",2,"Th«i §­îc PhiÒn Ng­¬i §­a Ta §i 1 ChuyÕn/MoveApThu","KÕt Thóc §èi Tho¹i/No")
		end
	end

	--Npc Ph­îng T­êng
	if (MapId == 1) then
		if (GetTask(TASKHUYETTHU) == 7) then
			if (GetTask(PHUONGTUONG) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 8) then
			if (GetTask(PHUONGTUONG) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 17) then
			if (GetTask(PHUONGTUONG) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 18) then
			if (GetTask(PHUONGTUONG) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 23) then
			if (GetTask(PHUONGTUONG) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 24) then
			if (GetTask(PHUONGTUONG) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		else
			Say(""..XemLoTrinh().."",2,"Th«i §­îc PhiÒn Ng­¬i §­a Ta §i 1 ChuyÕn/MoveApThu","KÕt Thóc §èi Tho¹i/No")
		end
	end

	--Npc §¹i Lý
	if (MapId == 162) then
		if (GetTask(TASKHUYETTHU) == 9) then
			if (GetTask(DAILY) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 10) then
			if (GetTask(DAILY) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		else
			Say(""..XemLoTrinh().."",2,"Th«i §­îc PhiÒn Ng­¬i §­a Ta §i 1 ChuyÕn/MoveApThu","KÕt Thóc §èi Tho¹i/No")
		end
	end

	--Npc BiÖn Kinh
	if (MapId == 37) then
		if (GetTask(TASKHUYETTHU) == 1) then
			if (GetTask(BIENKINH) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 2) then
			if (GetTask(BIENKINH) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 21) then
			if (GetTask(BIENKINH) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 22) then
			if (GetTask(BIENKINH) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 25) then
			if (GetTask(BIENKINH) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 26) then
			if (GetTask(BIENKINH) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 27) then
			if (GetTask(BIENKINH) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 28) then
			if (GetTask(BIENKINH) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		else
			Say(""..XemLoTrinh().."",2,"Th«i §­îc PhiÒn Ng­¬i §­a Ta §i 1 ChuyÕn/MoveApThu","KÕt Thóc §èi Tho¹i/No")
		end
	end

	--Npc D­¬ng Ch©u
	if (MapId == 80) then
		if (GetTask(TASKHUYETTHU) == 11) then
			if (GetTask(DUONGCHAU) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 12) then
			if (GetTask(DUONGCHAU) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 27) then
			if (GetTask(DUONGCHAU) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 28) then
			if (GetTask(DUONGCHAU) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		else
			Say(""..XemLoTrinh().."",2,"Th«i §­îc PhiÒn Ng­¬i §­a Ta §i 1 ChuyÕn/MoveApThu","KÕt Thóc §èi Tho¹i/No")
		end
	end

	--Npc L©m An
	if (MapId == 176) then
		if (GetTask(TASKHUYETTHU) == 13) then
			if (GetTask(LAMAN) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 14) then
			if (GetTask(LAMAN) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		else
			Say(""..XemLoTrinh().."",2,"Th«i §­îc PhiÒn Ng­¬i §­a Ta §i 1 ChuyÕn/MoveApThu","KÕt Thóc §èi Tho¹i/No")
		end
	end

	--Npc Giang T©n Th«n
	if (MapId == 20) then
		if (GetTask(TASKHUYETTHU) == 5) then
			if (GetTask(GIANGTANTHON) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 6) then
			if (GetTask(GIANGTANTHON) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 23) then
			if (GetTask(GIANGTANTHON) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 24) then
			if (GetTask(GIANGTANTHON) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		else
			Say(""..XemLoTrinh().."",2,"Th«i §­îc PhiÒn Ng­¬i §­a Ta §i 1 ChuyÕn/MoveApThu","KÕt Thóc §èi Tho¹i/No")
		end
	end

	--Npc VÜnh L¹c TrÊn
	if (MapId == 99) then
		if (GetTask(TASKHUYETTHU) == 7) then
			if (GetTask(VINHLACTRAN) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 8) then
			if (GetTask(VINHLACTRAN) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 15) then
			if (GetTask(VINHLACTRAN) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 16) then
			if (GetTask(VINHLACTRAN) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		else
			Say(""..XemLoTrinh().."",2,"Th«i §­îc PhiÒn Ng­¬i §­a Ta §i 1 ChuyÕn/MoveApThu","KÕt Thóc §èi Tho¹i/No")
		end
	end

	--Npc Chu Tiªn TrÊn
	if (MapId == 100) then
		if (GetTask(TASKHUYETTHU) == 1) then
			if (GetTask(CHUTIENTRAN) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 2) then
			if (GetTask(CHUTIENTRAN) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 19) then
			if (GetTask(CHUTIENTRAN) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 20) then
			if (GetTask(CHUTIENTRAN) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		else
			Say(""..XemLoTrinh().."",2,"Th«i §­îc PhiÒn Ng­¬i §­a Ta §i 1 ChuyÕn/MoveApThu","KÕt Thóc §èi Tho¹i/No")
		end
	end

	--Npc §¹o H­¬ng Th«n
	if (MapId == 101) then
		if (GetTask(TASKHUYETTHU) == 3) then
			if (GetTask(DAOHUONGTHON) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 4) then
			if (GetTask(DAOHUONGTHON) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 11) then
			if (GetTask(DAOHUONGTHON) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 12) then
			if (GetTask(DAOHUONGTHON) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 25) then
			if (GetTask(DAOHUONGTHON) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 26) then
			if (GetTask(DAOHUONGTHON) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		else
			Say(""..XemLoTrinh().."",2,"Th«i §­îc PhiÒn Ng­¬i §­a Ta §i 1 ChuyÕn/MoveApThu","KÕt Thóc §èi Tho¹i/No")
		end
	end

	--Npc Th¹ch Cæ TrÊn
	if (MapId == 153) then
		if (GetTask(TASKHUYETTHU) == 9) then
			if (GetTask(THACHCOTRAN) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 10) then
			if (GetTask(THACHCOTRAN) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		else
			Say(""..XemLoTrinh().."",2,"Th«i §­îc PhiÒn Ng­¬i §­a Ta §i 1 ChuyÕn/MoveApThu","KÕt Thóc §èi Tho¹i/No")
		end
	end

	--Npc Long TuyÒn Th«n
	if (MapId == 174) then
		if (GetTask(TASKHUYETTHU) == 13) then
			if (GetTask(LONGTUYENTHON) == 1) then
				if (BucHuyetThu >= 1) then
					Say("<color=green>Chóc Mõng Ng­¬i §· Hoµn Thµnh ChuyÕn §i LÇn Nµy §· §æ Bao X­¬ng M¸u Míi §­a §­îc Bøc HuyÕt Thö Giao Cho Ta ë §©y Ta Cã Chót LÔ VËt H·y Mau NhËn LÊy",2,"NhËn PhÇn Th­ëng/TraHuyetThu","KÕt Thóc §èi Tho¹i/No")
				else
					Talk(1,"","<color=red>Bao L­¬ng §©u Sao Ta Kh«ng ThÊy\n                                 §Þnh Lõa G¹t Ta H¶")
				end
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		elseif (GetTask(TASKHUYETTHU) == 14) then
			if (GetTask(LONGTUYENTHON) == 1) then
				Say(""..XemLoTrinh().."",2,"NhËn Hé Tèng Bao L­¬ng/NhanApHuyetThu","KÕt Thóc §èi Tho¹i/No")
			else
				Talk(1,"","Ng­¬i T×m Ta Cã ViÖc G× Cã NhÇm Ng­¬i Kh«ng")
			end
		else
			Say(""..XemLoTrinh().."",2,"Th«i §­îc PhiÒn Ng­¬i §­a Ta §i 1 ChuyÕn/MoveApThu","KÕt Thóc §èi Tho¹i/No")
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function NhanApHuyetThu()
local nBucHuyetThu = CalcEquiproomItemCount(6,1,30317,1)
local nTienDong = CalcEquiproomItemCount(4,417,1,1)
	if (GetTask(TASKAPTHU) == 0) then
		if (nBucHuyetThu == 0) then
			if (nTienDong >= TIENDATCUOC) then
				SetCamp(4);
				ForbidEnmity(1)
				SetPKFlag(1)
				ForbidChangePK(1)
				SetMoveSpeed(10)
				DisabledUseTownP(1)
				ChangeOwnFeature( 0,0,1341)
				ConsumeEquiproomItem(TIENDATCUOC,4,417,1,-1) SetTask(TASKAPTHU,1)
				tbAwardTemplet:GiveAwardByList({tbProp={6,1,30317,1,0,0},nExpiredTime=120,nBindState = -2},1)
				SetTask(5938,GetTask(5938)+1)
			    SetTask(TASKXAPHU,1)
			    SaveNow()
				SetDeathScript("\\script\\global\\zid_jx\\tinhnang\\hotonghuyetthu\\bossdeath.lua");
				Msg2SubWorld("<color=green>Chóc Mõng <color=yellow>"..GetName().."<color> §· NhËn §­îc "..XemLoTrinh().."\nH·y Mau §i Hoµn Thµnh §i...!<color>")
			else
				Talk(1,"","<color=yellow>LÇn Hé Tèng Nµy CÇn §Æt C­îc Tèi ThiÓu Lµ <color=red>"..TIENDATCUOC.."<color> Xu\n              Khi Hoµn Thµnh Ta SÏ SÏ Tr¶ L¹i Ng­¬i")
			end
		else
			Talk(1,"","<color=yellow>Ch¼ng Ph¶i Ng­¬i §· NhËn Bao L­¬ng Råi Sao H·y Mau Hoµn Thµnh §i")
		end
	else
		if (nBucHuyetThu == 0) then
			SetCamp(4);
			ForbidEnmity(1)
			SetPKFlag(1)
			ForbidChangePK(1)
			SetMoveSpeed(10)
			DisabledUseTownP(1)
			ChangeOwnFeature( 0,0,1341)
			tbAwardTemplet:GiveAwardByList({tbProp={6,1,30317,1,0,0},nExpiredTime=120,nBindState = -2},1)
			SetTask(TASKXAPHU,1)
			SaveNow()
			SetDeathScript("\\script\\global\\zid_jx\\tinhnang\\hotonghuyetthu\\bossdeath.lua");
			Msg2SubWorld("§¹i HiÖp "..GetName().." §· NhËn §­îc NhiÖm Vô VËn Tiªu Cã Lé Tr×nh "..XemLoTrinh().."")
		else
			Talk(1,"","<color=yellow>Ch¼ng Ph¶i Ng­¬i §· NhËn Bao L­¬ng Råi Sao H·y Mau Hoµn Thµnh §i")
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function TraHuyetThu()
local i = GetCurCamp();
SetCamp(i)
ForbidEnmity(0)
SetPKFlag(0)
ForbidChangePK(0)
SetMoveSpeed(-10)
DisabledUseTownP(0)
SetTask(TASKXAPHU,0)
RestoreOwnFeature();
SaveNow()	
ConsumeEquiproomItem(1,6,1,30317,-1)
if (ClearData() == 1) then end
tbAwardTemplet:GiveAwardByList(tbAward,"VËn L­¬ng")
DynamicExecuteByPlayer(PlayerIndex,"\\script\\huoyuedu\\huoyuedu.lua","tbHuoYueDu:AddHuoYueDu","HoTongHuyetThu")
Msg2SubWorld("Chóc Mõng "..GetName().." §· Hoµn Thµnh NhiÖm Vô Giao Bao L­¬ng Thµnh C«ng")

	--Truy Tim Bao Vat------------------------------------
	if (GetTask(5942) >= 1) then
		if (GetTask(5938) < 1) then
			SetTask(5938,GetTask(5938)+1)
			SetTask(5938,GetTask(5938)+1)
	
		end
	end
	---------------------------------------------------------
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------