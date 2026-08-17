IncludeLib("LEAGUE");
Include("\\script\\global\\skills_table.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\composeex.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\global\\translife.lua")

IncludeLib("SETTING")
IncludeLib("FILESYS")
IncludeLib("TASKSYS")
Include("\\script\\lib\\awardtemplet.lua")
-------------------------------------------------------------------------
TinVatMonPhai			 = 5989	--Dieu Kien Chuyen Mon Phai
KyNangThatTruyen		 = 5988	--Kiem Tra Skill 180
TSK_ZHENPAILINGDAN_USECNT	 = 5987	--Yeu Cau Chuyen Phai Moi Duoc Su Dung Tran Phai Linh Duoc
NhanLinhDuoc			 = 5986	--Gioi Han Nhan Linh Duoc Toi Da 15 Lan Khi Chuyen Phai
skill21 = 3000
--------------------------------------------------------------
function myplayersex()
	if GetSex() == 1 then 
		return "N÷ HiÖp";
	else
		return "§¹i HiÖp";
	end
end
---------------------------------------------------------------------------
function chuyenmonphai()
dofile("script/misc/daiyitoushi/toushi_function.lua")
	local tbOpt = {

		{"ChuyÓn Giíi TÝnh", chuyen_gt},
		{"§¸i NghÖ §Çu S­ Gia NhËp M«n Ph¸i",ChonMonPhai},
		{"Th«i §Ó Ta Suy NghÜ Thªm",No},
	}
	CreateNewSayEx("<bclr=violet>Xin Chµo C¸c H¹ T×m Ta Cã ViÖc G×<bclr>", tbOpt)
end
function ChonMonPhai()
if CalcFreeItemCellCount() < 10 then
	Talk(1,"",""..myplayersex().."Vui Lßng Chõa 10 Chç Trèng")
	return 1
 end
Say(""..myplayersex().." H·y Lùa Chän M«n Ph¸i Muèn Gia NhËp",
11,
	"ThiÕu L©m/ThieuLam",
	"Thiªn V­¬ng/ThienVuong",
	"§­êng M«n/DuongMon",
	"Ngò §éc/NguDoc",
	"Nga My/NgaMy",
	"Thóy Yªn/ThuyYen",
	"C¸i Bang/CaiBang",
	"Thiªn NhÉn/ThienNhan",
	"Vâ §ang/VoDang",
	"C«n L«n/ConLon",
	"Th«i §Ó Ta Suy NghÜ/No")
end
----------------------------------------------------------Ph¸i ThiÕu L©m----------------------------------------------------------------------------------------------------------------------------
function ThieuLam()
	if GetLastFactionNumber() == 0 then
		Talk(1,"","Ta Cho PhÐp Ng­¬i Xuèng Nói T×m §­êng Häc NghÖ Míi\nKhi Nµo Muèn Quay L¹i Bæn M«n Th× L¹i T×m Ta..!")
		return 0;
	end
	--if (GetSex() == 0) then
		if (CalcItemCount(2,0,-1,-1,-1) == 0) then
			do_clear_skill()
			SetFaction("shaolin")
			SetLastFactionNumber(0)
			SetTask(7,10*256) rollback_prop()
			SetCamp(1) SetCurCamp(1)
			SetRank(72) SetSeries(0)
			del_all_skill() add_sl(GetLevel())
			addskill()
			--KickOutSelf() 
			do_clear_skill()
			 
		else
			Talk(1,"","Muèn Gia NhËp Bæn Ph¸i CÇn Ph¶i Cëi HÕt Trang BÞ Trªn Ng­êi Xuèng")
		end
	--else
		--Talk(1,"","Ph¸i ThiÕu L©m Tõ X­a §Õn Nay ChØ Thu NhËn Nam §Ö Tö Kh«ng Bao Giê Thu NhËn N÷ §Ö Tö")
	--end
end
---------------------------------------------------------Ph¸i Thiªn V­¬ng--------------------------------------------------------------------------------------------------------------------	
function ThienVuong()
	
	if GetLastFactionNumber() == 1 then
		Talk(1,"","Ta Cho PhÐp Ng­¬i Xuèng Nói T×m §­êng Häc NghÖ Míi\nKhi Nµo Muèn Quay L¹i Bæn M«n Th× L¹i T×m Ta..!")
		return 0;
	end
	--if (GetSex() == 0) then
		if (CalcItemCount(2,0,-1,-1,-1) == 0) then
			do_clear_skill()
			SetFaction("tianwang")
			SetLastFactionNumber(1)
			SetTask(3,10*256) rollback_prop()
			SetCamp(3) SetCurCamp(3)
			SetRank(69) SetSeries(0)
			del_all_skill() add_tw(GetLevel())
			SetTask(TinVatMonPhai,0)
			 addskill() 
			 do_clear_skill()
		else
			Talk(1,"","Muèn Gia NhËp Bæn Ph¸i CÇn Ph¶i Cëi HÕt Trang BÞ Trªn Ng­êi Xuèng")
		end
	--else
		--Talk(1,"","Ph¸i ThiÕu L©m Tõ X­a §Õn Nay ChØ Thu NhËn Nam §Ö Tö Kh«ng Bao Giê Thu NhËn N÷ §Ö Tö")
	--end
end

----------------------------------------------------------------Ph¸i §­êng M«n------------------------------------------------------------------------------------------------------------------------------
function DuongMon()
	
	if GetLastFactionNumber() == 2 then
		Talk(1,"","Ta Cho PhÐp Ng­¬i Xuèng Nói T×m §­êng Häc NghÖ Míi\nKhi Nµo Muèn Quay L¹i Bæn M«n Th× L¹i T×m Ta..!")
		return 0;
	end
	if (CalcItemCount(2,0,-1,-1,-1) == 0) then
		do_clear_skill()
		SetFaction("tangmen")
		SetLastFactionNumber(2)
		SetTask(2,10*256) rollback_prop()
		SetCamp(3) SetCurCamp(3)
		SetRank(76) SetSeries(1)
		del_all_skill() add_tm(GetLevel())
		SetTask(TinVatMonPhai,0)
		addskill() 
		do_clear_skill() 
	else
		Talk(1,"","Muèn Gia NhËp Bæn Ph¸i CÇn Ph¶i Cëi HÕt Trang BÞ Trªn Ng­êi Xuèng")
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function NguDoc()
	
	if GetLastFactionNumber() == 3 then
		Talk(1,"","Ta Cho PhÐp Ng­¬i Xuèng Nói T×m §­êng Häc NghÖ Míi\nKhi Nµo Muèn Quay L¹i Bæn M«n Th× L¹i T×m Ta..!")
		return 0;
	end
	if (CalcItemCount(2,0,-1,-1,-1) == 0) then
		do_clear_skill()
		SetFaction("wudu")
		SetLastFactionNumber(3)
		SetTask(10,10*256) rollback_prop()
		SetCamp(2) SetCurCamp(2)
		SetRank(80) SetSeries(1)
		del_all_skill() add_wu(GetLevel())
		SetTask(TinVatMonPhai,0)
		addskill() 
		do_clear_skill()
	else
		Talk(1,"","Muèn Gia NhËp Bæn Ph¸i CÇn Ph¶i Cëi HÕt Trang BÞ Trªn Ng­êi Xuèng")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function NgaMy()
	
	if GetLastFactionNumber() == 4 then
		Talk(1,"","Ta Cho PhÐp Ng­¬i Xuèng Nói T×m §­êng Häc NghÖ Míi\nKhi Nµo Muèn Quay L¹i Bæn M«n Th× L¹i T×m Ta..!")
		return 0;
	end
	--if (GetSex() == 1) then
		if (CalcItemCount(2,0,-1,-1,-1) == 0) then
			do_clear_skill()
			SetFaction("emei")
			SetLastFactionNumber(4)
			SetTask(1,10*256) rollback_prop()
			SetCamp(1) SetCurCamp(1)
			SetRank(64) SetSeries(2)
			del_all_skill() add_em(GetLevel())
			SetTask(TinVatMonPhai,0)
			addskill() 
			do_clear_skill()
		else
			Talk(1,"","Muèn Gia NhËp Bæn Ph¸i CÇn Ph¶i Cëi HÕt Trang BÞ Trªn Ng­êi Xuèng")
		end
	--else
		--Talk(1,"","Ph¸i Nga My Tõ X­a §Õn Nay ChØ Thu NhËn N÷ §Ö Tö Kh«ng Bao Giê Thu NhËn Nam §Ö Tö")
	--end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ThuyYen()
	
	if GetLastFactionNumber() == 5 then
		Talk(1,"","Ta Cho PhÐp Ng­¬i Xuèng Nói T×m §­êng Häc NghÖ Míi\nKhi Nµo Muèn Quay L¹i Bæn M«n Th× L¹i T×m Ta..!")
		return 0;
	end
	--if (GetSex() == 1) then
		if (CalcItemCount(2,0,-1,-1,-1) == 0) then
			do_clear_skill()
			SetFaction("cuiyan")
			SetLastFactionNumber(5)
			SetTask(6,10*256) rollback_prop()
			SetCamp(3) SetCurCamp(3)
			SetRank(67) SetSeries(2)
			del_all_skill() add_cy(GetLevel())
			SetTask(TinVatMonPhai,0)
			 addskill() 
			 do_clear_skill()
		else
			Talk(1,"","Muèn Gia NhËp Bæn Ph¸i CÇn Ph¶i Cëi HÕt Trang BÞ Trªn Ng­êi Xuèng")
		end
	--else
	--	Talk(1,"","Ph¸i Thóy Yªn YÓu §iÖu Thôc N÷ Tõ X­a §Õn Nay ChØ Thu NhËn N÷ §Ö Tö Kh«ng Bao Giê Thu NhËn Nam §Ö Tö")
	--end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function CaiBang()
	
	if GetLastFactionNumber() == 6 then
		Talk(1,"","Ta Cho PhÐp Ng­¬i Xuèng Nói T×m §­êng Häc NghÖ Míi\nKhi Nµo Muèn Quay L¹i Bæn M«n Th× L¹i T×m Ta..!")
		return 0;
	end
	if (CalcItemCount(2,0,-1,-1,-1) == 0) then
		do_clear_skill()
		SetFaction("gaibang")
		SetLastFactionNumber(6)
		SetTask(8,10*256) rollback_prop()
		SetCamp(1) SetCurCamp(1)
		SetRank(78) SetSeries(3)
		del_all_skill() add_gb(GetLevel())
		SetTask(TinVatMonPhai,0)
		addskill() 
		do_clear_skill()
	else
		Talk(1,"","Muèn Gia NhËp Bæn Ph¸i CÇn Ph¶i Cëi HÕt Trang BÞ Trªn Ng­êi Xuèng")
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ThienNhan()
	
	if GetLastFactionNumber() == 7 then
		Talk(1,"","Ta Cho PhÐp Ng­¬i Xuèng Nói T×m §­êng Häc NghÖ Míi\nKhi Nµo Muèn Quay L¹i Bæn M«n Th× L¹i T×m Ta..!")
		return 0;
	end
	if (CalcItemCount(2,0,-1,-1,-1) == 0) then
		do_clear_skill()
		SetFaction("tianren")
		SetLastFactionNumber(7)
		SetTask(4,10*256) rollback_prop()
		SetCamp(2) SetCurCamp(2)
		SetRank(81) SetSeries(3)
		del_all_skill() add_tr(GetLevel())
		SetTask(TinVatMonPhai,0)
		 addskill() 
		do_clear_skill()
	else
		Talk(1,"","Muèn Gia NhËp Bæn Ph¸i CÇn Ph¶i Cëi HÕt Trang BÞ Trªn Ng­êi Xuèng")
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function VoDang()
	
	if GetLastFactionNumber() == 8 then
		Talk(1,"","Ta Cho PhÐp Ng­¬i Xuèng Nói T×m §­êng Häc NghÖ Míi\nKhi Nµo Muèn Quay L¹i Bæn M«n Th× L¹i T×m Ta..!")
		return 0;
	end
	if (CalcItemCount(2,0,-1,-1,-1) == 0) then
		do_clear_skill()
		SetFaction("wudang")
		SetLastFactionNumber(8)
		SetTask(5,10*256) rollback_prop()
		SetCamp(1) SetCurCamp(1)
		SetRank(73) SetSeries(4)
		del_all_skill() add_wd(GetLevel())
		SetTask(TinVatMonPhai,0)
		 addskill() 
		do_clear_skill()
	else
		Talk(1,"","Muèn Gia NhËp Bæn Ph¸i CÇn Ph¶i Cëi HÕt Trang BÞ Trªn Ng­êi Xuèng")
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ConLon()
	
	if GetLastFactionNumber() == 9 then
		Talk(1,"","Ta Cho PhÐp Ng­¬i Xuèng Nói T×m §­êng Häc NghÖ Míi\nKhi Nµo Muèn Quay L¹i Bæn M«n Th× L¹i T×m Ta..!")
		return 0;
	end
	if (CalcItemCount(2,0,-1,-1,-1) == 0) then
		do_clear_skill()
		SetFaction("kunlun")
		SetLastFactionNumber(9)
		SetTask(9,10*256) rollback_prop()
		SetCamp(3) SetCurCamp(3)
		SetRank(5) SetSeries(4)
		del_all_skill() add_kl(GetLevel())
		SetTask(TinVatMonPhai,0)
		addskill() 
		do_clear_skill()
	else
		Talk(1,"","Muèn Gia NhËp Bæn Ph¸i CÇn Ph¶i Cëi HÕt Trang BÞ Trªn Ng­êi Xuèng")
	end
end
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
function addskill()
	if GetTask(skill21) == 1 then
 	tbAwardTemplet:GiveAwardByList({{szName="kslii",tbProp={6,1,4386,1,0,0},nCount=1,},}, "test", 1);
	SetTask(skill21,0)
	end
	
	if GetTask(skill21) ==2  then
 	tbAwardTemplet:GiveAwardByList({{szName="kslii",tbProp={6,1,4387,1,0,0},nCount=1,},}, "test", 1);
 	tbAwardTemplet:GiveAwardByList({{szName="kslii",tbProp={6,1,4386,1,0,0},nCount=1,},}, "test", 1);
	SetTask(skill21,0)
	end

	if GetTask(skill21) == 3 then
	
 	tbAwardTemplet:GiveAwardByList({{szName="kslii",tbProp={6,1,4387,1,0,0},nCount=1,},}, "test", 1);
 	tbAwardTemplet:GiveAwardByList({{szName="kslii",tbProp={6,1,4386,1,0,0},nCount=1,},}, "test", 1);
 	tbAwardTemplet:GiveAwardByList({{szName="kslii",tbProp={6,1,4388,1,0,0},nCount=1,},}, "test", 1);
	SetTask(skill21,0)
	end
	if GetTask(skill21) ==4  then
	
 	tbAwardTemplet:GiveAwardByList({{szName="kslii",tbProp={6,1,4387,1,0,0},nCount=1,},}, "test", 1);
 	tbAwardTemplet:GiveAwardByList({{szName="kslii",tbProp={6,1,4386,1,0,0},nCount=1,},}, "test", 1);
 	tbAwardTemplet:GiveAwardByList({{szName="kslii",tbProp={6,1,4388,1,0,0},nCount=1,},}, "test", 1);
 	tbAwardTemplet:GiveAwardByList({{szName="kslii",tbProp={6,1,4389,1,0,0},nCount=1,},}, "test", 1);
	SetTask(skill21,0)
	end
        	if GetTask(skill21) == 5  then
	
 	tbAwardTemplet:GiveAwardByList({{szName="kslii",tbProp={6,1,4387,1,0,0},nCount=1,},}, "test", 1);
 	tbAwardTemplet:GiveAwardByList({{szName="kslii",tbProp={6,1,4386,1,0,0},nCount=1,},}, "test", 1);
 	tbAwardTemplet:GiveAwardByList({{szName="kslii",tbProp={6,1,4388,1,0,0},nCount=1,},}, "test", 1);
 	tbAwardTemplet:GiveAwardByList({{szName="kslii",tbProp={6,1,4389,1,0,0},nCount=1,},}, "test", 1);
 	tbAwardTemplet:GiveAwardByList({{szName="kslii",tbProp={6,1,4390,1,0,0},nCount=1,},}, "test", 1);
	SetTask(skill21,0)
	end

end
----------------------------------------------------------------------------------
function add_sach()

end



sbook_150skill_list = {
		[0] = {318 ,319 ,321, 1055, 1056, 1057},
		[1] = {322 ,323 ,325, 1058, 1059, 1060},
		[2] = {339 ,302 ,342, 1069, 1070, 1071, 1110},
		[3] = {1066, 1067},
		[4] = {1061, 1062, 1114},
		[5] = {1063, 1065},
		[6] = {1073, 1074},
		[7] = {1075, 1076},
		[8] = {1078, 1079},
		[9] = {1080, 1081},
		[10] = {1369, 1384},
                [11] = {1969, 1985},
                [12] = {1775, 1760},
}

sbook_factstep_list = {
		[5] = 6,
		[2] = 7,
		[4] = 7,
		[3] = 5,
		[6] = 9,
		[7] = 9,
		[0] = 6,
		[8] = 5,
		[1] = 4,
		[9] = 5,
		[10] = 5,
                [11] = 5,
               [12] = 5,
	}

function fixskill150()
	
	local nFact = GetLastFactionNumber()
	if nFact == -1 then	
		Msg2Player("<color=yellow>Ng­¬i vÉn ch­a gia nhËp m«n ph¸i nµo, kh«ng thÓ häc yÕu quyÕt nµy! <color>");
		return 1
	end
	
	if GetLevel() < 150 then
		Msg2Player("<color=yellow>§¼ng cÊp cña ng­¬i thÊp h¬n 150, kh«ng thÓ häc yÕu quyÕt nµy! <color>");
		return 1
	end
	
	local tb150Skill = sbook_150skill_list[nFact]
	
	for i = 1, getn(tb150Skill) do
		local nSkillId = tb150Skill[i]
		if (HaveMagic(nSkillId) == 21) then
			SetTask(3000,2)
		end
		if (HaveMagic(nSkillId) == 22) then
			SetTask(3000,4)
		end
		if (HaveMagic(nSkillId) == 23) then
			SetTask(3000,6)
		end
		if (HaveMagic(nSkillId) == 24) then
			SetTask(3000,8)
		end
                if (HaveMagic(nSkillId) == 25) then
			SetTask(3000,10)
		end


	end
end
-----------------------------------------------------------------------------------------------------------
function chuyen_gt()
	local szTitle = "<npc><color=Pink>Nam<color> => Nga My hoÆc Thóy Yªn <color=Green>N÷ <color> => ThiÕu L©m hoÆc Thiªn V­¬ng<enter> Sau khi gia nhËp m«n ph¸i cã thÓ ®Õn gÆp ta ®Ó ®æi giíi tÝnh "
	local tbOpt =
	{
		{"ChuyÓn Nam Thµnh N÷", NamNu},
		{"ChuyÓn N÷ Thµnh Nam", NuNam},
		{"Tho¸t/no"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function NamNu()
local nFaction = GetLastFactionNumber()
if nFaction == 0 then
Talk(1,"no","<color=red>M«n Ph¸i ThiÕu L©m Kh«ng ThÓ ChuyÓn Giíi.")
				return 			
			end
		if CalcEquiproomItemCount(4,417,1,-1)<1000 then 
			Talk(1,"no","<color=red>B¹n kh«ng ®ñ 1000 Xu.")
				return 			
			end
	
		if (CalcItemCount(2,0,-1,-1,-1) > 0) then
			return Say("Muèn ®æi giíi tÝnh cÇn ph¶i c­ëi bá hÕt trang bÞ trªn ng­êi .",0);

		end
if GetCurCamp() == 0 then
		Talk(1, "", "<color=green>"..myplayersex().."<color> vÉn ch­a gia nhËp m«n ph¸i ?")
return end
if GetSex() == 1 then
Talk(1, "", "<color=green>"..myplayersex().."<color> ®ang lµ <color=red>G¸i §Ñp<color> mµ?\n Cã ph¶i "..myplayersex().." thuéc thÕ giíi thø 3 kh«ng?")
else
SetSex(1) ---nu 1
ConsumeEquiproomItem(1000,4,417,1,-1);
KickOutSelf()
Msg2SubWorld("<color=cyan>Chóc mõng nam ®¹i hiÖp <color=green>"..GetName().."<color=cyan> chuyÓn ®æi giíi tÝnh thµnh c«ng thµnh N÷ Giai Nh©n T¹i NPC ChuyÓn Ph¸i")
end
end

function NuNam()
local nFaction = GetLastFactionNumber()
if nFaction == 4 then
Talk(1,"no","<color=red>M«n Ph¸i - Nga My Kh«ng ThÓ ChuyÓn Giíi.")
return 			
end
if nFaction == 10 then
Talk(1,"no","<color=red>M«n Ph¸i - Hoa S¬n Kh«ng ThÓ ChuyÓn Giíi.")
return 			
end
if nFaction == 5 then
Talk(1,"no","<color=red>M«n Ph¸i - THuy yen Kh«ng ThÓ ChuyÓn Giíi.")
return 			
end
	
		if CalcEquiproomItemCount(4,417,1,-1)<1000 then 
			Talk(1,"no","<color=red>B¹n kh«ng ®ñ 1000 Xu.")
				return 			
			end
		if (CalcItemCount(2,0,-1,-1,-1) > 0) then
			return Say("Muèn ®æi giíi tÝnh cÇn ph¶i c­ëi bá hÕt trang bÞ trªn ng­êi .",0);

		end
if GetCurCamp() == 0 then
		Talk(1, "", "<color=green>"..myplayersex().."<color> vÉn ch­a gia nhËp m«n ph¸i ?")
return end
if GetSex() == 0 then
Talk(1, "", "<color=green>"..myplayersex().."<color> ®ang lµ <color=red>Trai Xinh<color> mµ?\n Cã ph¶i "..myplayersex().." thuéc thÕ giíi thø 3 kh«ng?")
else
SetSex(0)---nam 0
ConsumeEquiproomItem(1000,4,417,1,-1);
KickOutSelf()
Msg2SubWorld("<color=cyan>Chóc mõng n÷ ®¹i hiÖp <color=green>"..GetName().."<color=cyan> chuyÓn ®æi giíi tÝnh thµnh c«ng thµnh Nam Mü Nh©n T¹i NPC ChuyÓn Ph¸i")
end
end
function WriteLogPro(data,str)
	local Data2 = openfile(""..data.."", "a+");
	write(Data2,tostring(str));
	closefile(Data2);
end
function do_clear_skill()
	local i = HaveMagic(210)		
	local j = HaveMagic(400)		
	local n = RollbackSkill()		
	local x = 0
	if (i ~= -1) then i = 1; x = x + i end		
	if (j ~= -1) then x = x + j end
	local rollback_point = n - x			
	if (rollback_point + GetMagicPoint() < 0) then		
		 rollback_point = -1 * GetMagicPoint()
	end
	AddMagicPoint(rollback_point)
	if (i ~= -1) then AddMagic(210, i) end			
	if (j ~= -1) then AddMagic(400, j) end			
	Msg2Player("TÈy tñy thµnh c«ng! Ng­¬i ca "..rollback_point.." ®iÓm kü n¨ng ®Ó ph©n phèi l¹i.")
	KickOutSelf()
end

function do_clear_prop()
	local base_str = {35,20,25,30,20}			
	local base_dex = {25,35,25,20,15}
	local base_vit = {25,20,25,30,25}
	local base_eng = {15,25,25,20,40}
	local player_series = GetSeries() + 1

	local Utask88 = GetTask(88)
	AddStrg(base_str[player_series] - GetStrg(1) + GetByte(Utask88, 1))			
	AddDex(base_dex[player_series] - GetDex(1) + GetByte(Utask88, 2))
	AddVit(base_vit[player_series] - GetVit(1) + GetByte(Utask88, 3))
	AddEng(base_eng[player_series] - GetEng(1) + GetByte(Utask88, 4))
end
