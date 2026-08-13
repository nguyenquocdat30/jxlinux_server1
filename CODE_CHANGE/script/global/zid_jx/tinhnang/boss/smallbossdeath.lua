IncludeLib("TASKSYS")
Include("\\script\\global\\signet_head.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("LEAGUE")
Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\misc\\eventsys\\type\\npcdeath.lua")
Include("\\script\\lib\\awardtemplet.lua")

Include("\\script\\global\\zid_jx\\lib\\itembluedrop.lua")



local tbVnNewItemDropAward = {
	{{szName="§¹i lùc hoµn lÔ bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=60},},
	{{szName="Phi tèc hoµn lÔ bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=60},},
	{{szName="T©m T©m T­¬ng ¸nh phï",tbProp={6,1,18,1,0,0},nCount=1,nRate=60},},
	{{szName="Tö Thñy Tinh",tbProp={4,239,1,1,0,0},nCount=1,nRate=80},},
	{{szName="Thiªn s¬n  B¶o Lé",tbProp={6,1,72,1,0,0},nCount=3,nRate=60},},
	{{szName="Lam Thñy Tinh",tbProp={4,238,1,1,0,0},nCount=1,nRate=80},},
	{{szName="Lôc Thñy Tinh",tbProp={4,240,1,1,0,0},nCount=1,nRate=80},},
	{{szName="Bµn Nh­îc T©m Kinh",tbProp={6,1,12,1,0,0},nCount=2,nRate=80},},
	{{szName="Tinh Hång B¶o Th¹ch",tbProp={4,353,1,1,0,0},nCount=2,nRate=80},},
	{{szName="Tiªn Th¶o Lé ®Æc biÖt",tbProp={6,1,1181,1,0,0},nCount=2,nRate=50},},
	{{szName="Tiªn Th¶o Lé ",tbProp={6,1,71,1,0,0},nCount=1,nRate=50},},
	{{szName="ThiÕt La H¸n",tbProp={6,1,23,1,0,0},nCount=5,nExpiredTime=20160,		nRate=5},},
	{{szName="TÈy Tñy Kinh",tbProp={6,1,22,1,0,0},nCount=2,nExpiredTime=20160,					nRate=1},},
	{{szName="Vâ L©m MËt TÞch",tbProp={6,1,26,1,0,0},nCount=2,nExpiredTime=20160,					nRate=1},},

	-- {{szName = "An Bang B¨ng Tinh Th¹ch H¹ng Liªn",tbProp = {164,167},nCount = 1,				nRate =0.1,nQuality = 1,},},
	{{szName = "HiÖp Cèt ThiÕt HuyÕt Sam",tbProp = {0,186},nCount = 1, 					nRate = 0.3,nQuality = 1, },},
	{{szName = "HiÖp Cèt §a T×nh Hoµn",tbProp = {0,187},nCount = 1, 					nRate = 0.3,nQuality = 1, },},
	{{szName = "HiÖp Cèt §an T©m Giíi",tbProp = {0,188},nCount = 1, 					nRate = 0.3,nQuality = 1, },},
	{{szName = "HiÖp Cèt T×nh ý KÕt",tbProp = {0,189},nCount = 1, 						nRate = 0.3,nQuality = 1, },},
	{{szName = "Nhu T×nh C©n Quèc NghÖ Th­êng",tbProp = {0,190},nCount = 1,					nRate = 0.3,nQuality = 1, },},
	{{szName = "Nhu T×nh Thôc N÷ H¹ng Liªn",tbProp = {0,191},nCount = 1, 					nRate = 0.3,nQuality = 1, },},
	{{szName = "Nhu T×nh Phông Nghi Gi íi ChØ",tbProp = {0,192},nCount = 1, 					nRate = 0.3,nQuality = 1, },},
	{{szName = "Nhu T×nh TuÖ T©m Ngäc Béi",tbProp = {0,193},nCount = 1, 					nRate = 0.3,nQuality = 1, },},

	-- {{szName = "§Þnh Quèc",tbProp = {0,random(159,163)},nCount = 1,					nRate = 0.8,nQuality = 1, },},


}
	

--====================================-----
	/*[[   Tæng Sè §å Xanh R¬i   ]]*/
	Award_ItemBlue_Drop = random(10,20);
	/*[[   §¼ng CÊp §å Xanh R¬i   ]]*/
	Lever_ItemBlue_Drop = random(8,10);
	/*[[   Th­ëng Exp GiÕt Boss   ]]*/
	KILLER_AWARDEXP_PERSON = 50000;
	/*[[   Th­ëng Exp GÇn Boss   ]]*/
	KILLER_AWARDEXP_NEARBY = 100000;
	/*[[   Th­ëng VËt phÈm Khi Boss ChÕt   ]]*/

--====================================-----	
function OnDeath(nNpcIndex, nPlayerIndex)
	local szNpcName = GetNpcName(nNpcIndex)
	local x, y, world = GetNpcPos(nNpcIndex);
	local totaldrop = Award_ItemBlue_Drop;
	local leverdrop = Lever_ItemBlue_Drop;
	local nNpcSeries = GetNpcSeries(nNpcIndex);
	AddDropItemBlue(nNpcIndex,totaldrop,nNpcSeries,leverdrop,random(40,70));
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbVnNewItemDropAward,format("killed_%s",GetNpcName(nNpcIndex)))	
	local tbAwardExp = {
		["Killer"] = {nExp = KILLER_AWARDEXP_PERSON, szName = "§iÓm kinh nghiÖm"},
		["Around"] = {nExp = KILLER_AWARDEXP_NEARBY, szName = "§iÓm kinh nghiÖm"},
	}
	nOldPlayer = PlayerIndex	
	local nTeamSize = GetTeamSize();	
	if (nTeamSize > 1) then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i)
			tbAwardTemplet:Give(tbAwardExp["Killer"], 1, {"DCPhanThuongBoss", "PhÇn th­ëng exp cho tæ ®éi tiªu diÖt "..szNpcName})
		end
	else		
		tbAwardTemplet:Give(tbAwardExp["Killer"], 1, {"DCPhanThuongBoss", "PhÇn th­ëng exp cho ng­êi tiªu diÖt "..szNpcName})
	end
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 20);	
	for i=1,nCount do	
		PlayerIndex = tbRoundPlayer[i]
		tbAwardTemplet:Give(tbAwardExp["Around"], 1, {"DCPhanThuongBoss", "PhÇn th­ëng exp cho ng­êi ®øng gÇn "..szNpcName})
	end
	PlayerIndex = nOldPlayer
	local szNews = format("<color=green>§¹i hiÖp <color=yellow>%s<color> t¹i <color=yellow>%s<color> ®· tiªu diÖt thµnh c«ng <color=yellow>%s<color>!<color>", GetName(),SubWorldName(SubWorld),GetNpcName(nNpcIndex));
	Msg2AllWorld(szNews)
end

function OnTimer(nNpcIndex)
	DelNpc(nNpcIndex)
end
