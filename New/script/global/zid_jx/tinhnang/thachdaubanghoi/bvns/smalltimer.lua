IncludeLib("BATTLE");
Include("\\script\\global\\zid_jx\\tinhnang\\thachdaubanghoi\\battlehead.lua")
Include("\\script\\global\\zid_jx\\tinhnang\\thachdaubanghoi\\bvns\\head.lua")
Include("\\script\\event\\jiefang_jieri\\200904\\qianqiu_yinglie\\sj_announce.lua")		-- ½â·Å»î¶¯Ö®Ç§ÇïÓ¢ÁÒ
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\config\\32\\talkdailytask.lua")

tbIndex = {}	-- Ñ¡ÖÐµÄ×ø±êµÄIndex
tbPoint = {}	-- µ±Ç°±»Ñ¡ÔñµÄ×ø±ê¼¯ºÏ
tbNpc = 
{
	[1] = 
	{
		nNpcId = 1685,  --npc Id
		nLevel = 95,		-- µÈ¼¶
--		nSeries = 1,		-- ÎåÐÐ
		bNoRevive = 1,			-- ²»ÖØÉú
		szName = "§Æc Th¸m",		-- Ãû×Ö
		nIsboss = 1,
		nCurCamp = 1,	--ÕóÓª 1ËÎ 2½ð
	},
	[2] = 
	{
		nNpcId = 1686,  --npc Id
		nLevel = 95,		-- µÈ¼¶
--		nSeries = 1,		-- ÎåÐÐ
		bNoRevive = 1,			-- ²»ÖØÉú
		szName = "§Æc Th¸m",		-- Ãû×Ö
		nIsboss = 1,
		nCurCamp = 2,	--ÕóÓª 1ËÎ 2½ð
	}
}  


function SelectPosition(nRandomCount)
	for i=1,4 do
		tbIndex[i] = random(1,nRandomCount)
		local bFlag = 1
		for j=1,i-1 do
			if tbIndex[j] == tbIndex[i] then
				bFlag = 0
				break
			end
		end
		if bFlag == 0 then
			i = i - 1
		end
	end
end

function OnTimer()
	t = GetMissionV(MS_TIMER1) + 1;--¼ÆÊýÆ÷£¬Í³¼Æµ±Ç°¶¨Ê±Æ÷´¥·¢ÁË¶àÉÙ´ÎÁË
	SetMissionV(MS_TIMER1, t)
	
	-- PhÇn th­ëng thêi gian tÝch lòy khi kÕt thóc tèng kim - Author by AloneScript
	BattleAward:AddTime(MISSIONID,TIMER_1);
	
	--Storm ¼Ó½±Àø»ý·Ö
	local add_time = 60 * FRAME2TIME / TIMER_1
	storm_addm_mspointex(1, MISSIONID, (t - RUNGAME_TIME) / add_time)

	local lsf_level = BT_GetGameData(GAME_LEVEL)
	if (lsf_level == 1) then
		resultstr = "[Th¸ch §Êu Bang Héi] "
	elseif (lsf_level == 2) then
		resultstr = "[Th¸ch §Êu Bang Héi] "
	elseif (lsf_level == 3) then
		resultstr = "[Th¸ch §Êu Bang Héi] "
	end
	
	if (t == RUNGAME_TIME) then --Èç¹ûµ½ÁËÕýÊ½¿ªÕ½Ê±¿Ì£¬ÔòÍ£Ö¹±¨Ãû£¬ÕýÊ½½øÈëÕ½¶·½×¶Î
		RunMission(MISSIONID)
		AddGlobalCountNews(resultstr.."Thêi gian b¸o danh Tèng Kim (ph­¬ng thøc b¶o vÖ Nguyªn So¸i) ®· kÕt thóc. ChiÕn ®Êu chÝnh thøc b¾t ®Çu", 2);
		Msg2MSAll(MISSIONID, "Tèng Kim chÝnh thøc khai chiÕn! C¸c chiÕn sÜ! X«ng lªn!");
		WriteLog("bvns battle is entering fight state. now member count="..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
		-- ÈÕ³£ÈÎÎñË¢ÐÂ¶Ô»°NPC
		%tbTalkDailyTask:AddTalkNpc(BT_GetGameData(GAME_MAPID), BT_GetGameData(GAME_MAPID));
	end

	if (t < RUNGAME_TIME and mod(t, 18) == 0) then
		RestTime = (RUNGAME_TIME - t) * TIMER_1 / FRAME2TIME
		RestMin, RestSec = GetMinAndSec(RestTime);
		if (RestSec == 0) then
			str1 = resultstr.."ChiÕn dÞch Tèng Kim (Ph­¬ng thøc B¶o vÖ Nguyªn so¸i) ®ang trong giai ®o¹n b¸o danh. C¸c bang héi muèn tham gia th× h·y cö bang chñ cña m×nh ®Õn lËp tæ ®éi víi bang chñ cña bang héi cña ®èi thñ ®Ó ®¨ng ký tham gia. Thêi gian b¸o danh cßn l¹i lµ:"..RestMin.." phót!";
			str2 = "<#>C¸ch thêi gian khai chiÕn chØ cßn: "..RestMin.." phót"
		else
			str1 = resultstr.."ChiÕn dÞch Tèng Kim (Ph­¬ng thøc B¶o vÖ Nguyªn so¸i) ®ang trong giai ®o¹n b¸o danh. C¸c bang héi muèn tham gia th× h·y cö bang chñ cña m×nh ®Õn lËp tæ ®éi víi bang chñ cña bang héi cña ®èi thñ ®Ó ®¨ng ký tham gia. Thêi gian b¸o danh cßn l¹i lµ:"..RestMin.." phót!";
			str2 = "<#>C¸ch thêi gian khai chiÕn chØ cßn: "..RestMin.." phót "..RestSec.." gi©y"
		end
		AddGlobalCountNews(str1, 2);
		Msg2MSAll(MISSIONID,str2);		--Í¨Öª³¡ÄÚÍæ¼Ò¿ªÕ½Ê£ÓàÊ±¼ä
	end
	
	if (t >= RUNGAME_TIME) then
		
		if (t == RUNGAME_TIME) then --ÕýÊ½¿ªÕ½µÄµÚÒ»´Î´¥·¢Ê±£¬²úÉúÕ½¶·NpcµÄÉú³É¹æÔòÊý¾Ý
			sf_buildfightnpcdata()
		else
			--µ½¿ªÕ½ºó°ëÐ¡Ê±¿´Ë«·½×Ü»ý·Ö£¬»ý·ÖÐ¡µÄÒ»·½²úÉúÔªË§
			if (t == BOSS_TIME) then
				if (GetMissionV(MS_TOTALPOINT_S) < GetMissionV(MS_TOTALPOINT_J)) then
					bvns_down(1)
					SetMissionV(MS_MARSHAL, 1)
				elseif(GetMissionV(MS_TOTALPOINT_S) > GetMissionV(MS_TOTALPOINT_J)) then
					bvns_down(2)
					SetMissionV(MS_MARSHAL, 2)
				elseif(GetMissionV(MS_TOTALPOINT_S) == GetMissionV(MS_TOTALPOINT_J)) then
					bvns_down(2)
					bvns_down(1)
					SetMissionV(MS_MARSHAL, 3)
				end
			end

			if (t == VANISHGAME_TIME) then	--µ½×îºó20·ÖÖÓÊ±½«ÁíÒ»·½µÄÔªË§²úÉú
				mar = GetMissionV(MS_MARSHAL)
				if (mar == 1) then
					bvns_down(2)
				elseif (mar == 2) then
					bvns_down(1)
				end
			end
			
			bt_pop2signmap()	--½«ÔÚºóÓª£¨fight=0£©µÄÍæ¼ÒËÍ»Ø±¨Ãûµã
			
			--Ã¿Ò»·ÖÖÓÍ¨¸æµ±Ç°Ë«·½»ý·Ö£¬ºÍnpc
			if (mod(t, 3) == 0 ) then
				sf_callfightnpc(t - RUNGAME_TIME, VANISHGAME_TIME - RUNGAME_TIME)	-- ²úÉúÕ½¶·Npc				
				msstr = "C«ng c¸o: hiÖn giê tæng tÝch lòy cña 2 phe lµ "..GetMissionV(MS_TOTALPOINT_S)..":"..GetMissionV(MS_TOTALPOINT_J);
				Msg2MSAll(MISSIONID, msstr)
			end
			
			bt_announce(lsf_level, t);
			TB_QIANQIU_YINGLIE0904:announce(lsf_level, t);
		end
	end
end

function sf_callfightnpc(usedtime, totaltime)
	if (usedtime > totaltime) then
		return
	end
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	s_area = BT_GetGameData(GAME_CAMP1AREA);
	j_area = BT_GetGameData(GAME_CAMP2AREA);
	for i = 2, 5 do
		if (GetMissionV(MS_NPCCOUNT1_S + i - 1) > 0) then
			prenpccount = floor((usedtime - 1) / totaltime * GetMissionV(MS_NPCCOUNT1_S + i - 1))
			npccount = floor(usedtime / totaltime * GetMissionV(MS_NPCCOUNT1_S + i - 1))
			nowadd = npccount - prenpccount;
			if (nowadd > 0) then
				print("call song npc count= "..nowadd.."rank="..i)
				npcfile = GetIniFileData(mapfile, "Area_"..s_area, tbNPCPOS[random(2)]);
				bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_S + i - 1), GetMissionV(MS_RANK1LVL_S + i - 1), 1, nowadd, tabFILE_NPCDEATH[i], 1)
			end
		end
	end
	
	for i = 2, 5 do 
		if (GetMissionV(MS_NPCCOUNT1_J + i - 1) > 0) then
			prenpccount = floor((usedtime - 1) / totaltime * GetMissionV(MS_NPCCOUNT1_J + i - 1))
			npccount = floor(usedtime / totaltime * GetMissionV(MS_NPCCOUNT1_J + i - 1))
			nowadd = npccount - prenpccount
			if (nowadd > 0) then
				print("call jing npc count= "..nowadd.."rank="..i)
				npcfile = GetIniFileData(mapfile, "Area_"..j_area, tbNPCPOS[random(2)]);
				bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_J + i - 1), GetMissionV(MS_RANK1LVL_J + i - 1), 2, nowadd, tabFILE_NPCDEATH[i], 1)
			end
		end
	end
end

function bvns_down(camp)
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	s_area = BT_GetGameData(GAME_CAMP1AREA);
	j_area = BT_GetGameData(GAME_CAMP2AREA);
	if (camp == 1) then
		enterpos = GetIniFileData(mapfile, "Area_"..s_area, "generalpos");
		x,y = bt_str2xydata(enterpos)	
		npcidx_s = AddNpc(GetMissionV(MS_TRANK1_S + 6 - 1), GetMissionV(MS_RANK1LVL_S + 6 - 1), SubWorld, x*32, y*32, 1, "Nguyªn So¸i", 1)
		SetNpcCurCamp(npcidx_s, 1)
		SetNpcDeathScript(npcidx_s, tabFILE_NPCDEATH[6])
		Msg2MSAll(MISSIONID, "<color=0x00FFFF>Tèng Kim chiÕn b¸o: Nguyªn So¸i ®· xuÊt hiÖn")
	else
		enterpos = GetIniFileData(mapfile, "Area_"..j_area, "generalpos");
		x,y = bt_str2xydata(enterpos)	
		npcidx_j = AddNpc(GetMissionV(MS_TRANK1_J + 6 - 1), GetMissionV(MS_RANK1LVL_J + 6 - 1), SubWorld, x*32, y*32, 1, "Nguyªn So¸i", 1)
		SetNpcCurCamp(npcidx_j, 2)
		SetNpcDeathScript(npcidx_j, tabFILE_NPCDEATH[6])
		Msg2MSAll(MISSIONID, "<color=0x9BFF9B>Tèng Kim chiÕn b¸o: Nguyªn So¸i ®· xuÊt hiÖn")
	end		
end