
Include("\\script\\task\\system\\task_string.lua")

function main(nItemIdx)
	local n_fac = GetLastFactionNumber();
	if (n_fac < 0) then
		Talk(1, "", "H×nh nh­ quyÓn s¸ch nµy miªu t¶ vâ c«ng cao cÊp cña c¸c ®¹i m«n ph¸i, ng­¬i kh«ng thÓ hiÓu sù huyÒn c¬ cña nã.");
		return 1;
	end
	
	local tb_90skill = {
		[0] = {318, 319, 321},
		[1] = {322, 325, 323},
		[2] = {339, 302, 342},
		[3] = {353, 355},
		[4] = {380, 328},
		[5] = {336, 337},
		[6] = {357, 359},
		[7] = {361, 362},
		[8] = {365, 368},
		[9] = {372, 375},
		[10] = {1364, 1382},
				[11] = {1967, 1983},
		[12] ={1891, 1910},
	};
	
	local tb_Desc = {};
	for i = 1, getn(tb_90skill[n_fac]) do
		local skill = HaveMagic(tb_90skill[n_fac][i]);
		if (skill ~= -1 and skill ~= 25) then
			tinsert(tb_Desc, format("N©ng cÊp".."%s/#upgrade_skilllevel(%d)", GetSkillName(tb_90skill[n_fac][i]), tb_90skill[n_fac][i]));
		end
	end
	
	if (getn(tb_Desc) == 0) then
		Talk(1, "", "Kü n¨ng ®¹t ®Õn cÊp cao nhÊt hoÆc vÉn ch­a häc.");
		return 1;
	end
	
	tinsert(tb_Desc, 1, "Chän kü n¨ng cÇn n©ng cÊp:");
	tinsert(tb_Desc, "KÕt thóc ®èi tho¹i/OnCancel");
	CreateTaskSay(tb_Desc);
	return 1;
end

function upgrade_skilllevel(n_skillid)
	if (HaveMagic(n_skillid) <  24 or HaveMagic(n_skillid) >= 25) then
		Talk(1, "", "Kü n¨ng ®¹t ®Õn cÊp cao nhÊt hoÆc vÉn ch­a häc Kü N¨ng Bªn D­íi.");
		return 1;
	end
	
	if (ConsumeItem(3, 1, 6, 1, 4390, -1) == 1) then
		AddMagic(n_skillid, 25);
		SetTask(3000,5)
		WriteLog(format("[%s]\t%s\tAccount:%s\tName:%s\tUpGrade Skill:%d", 
				"§¹i Thµnh BÝ KÝp 90", 
				GetLocalDate("%Y-%m-%d %X"),
				GetAccount(),
				GetName(),
				n_skillid	));
	end
end


function OnCancel()
end
