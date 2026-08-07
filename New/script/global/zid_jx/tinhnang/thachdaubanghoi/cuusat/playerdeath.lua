--Íæ¼ÒËÀÍö½Å±¾

IncludeLib("BATTLE")
Include("\\script\\global\\zid_jx\\tinhnang\\thachdaubanghoi\\battlehead.lua")
Include("\\script\\global\\zid_jx\\tinhnang\\thachdaubanghoi\\cuusat\\head.lua")

function OnDeath(Launcher)
	
	State = GetMissionV(MS_STATE) ;
	if (State ~= 2) then
		return
	end;
	if (bt_CheckDeathValid() == 0) then
		return
	end

	PlayerIndex1 = NpcIdx2PIdx(Launcher);
	OrgPlayer  = PlayerIndex;
	DeathName = GetName();
	deathcamp = GetCurCamp();
	currank = BT_GetData(PL_CURRANK)
	szIPDeath = AntiPoint:GetIP();
	

	if (PlayerIndex1 > 0) then
		PlayerIndex = PlayerIndex1;
		launchrank = BT_GetData(PL_CURRANK)
		szIPKiller = AntiPoint:GetIP();
		local nIPState, szIPMsg = AntiPoint:Check(szIPDeath,szIPKiller);
		if (nIPState == 0) then
			if (GetCurCamp() ~= deathcamp) then
				LaunName = GetName();
				--¸üÐÂÉ±NpcÊýÄ¿ºÍÅÅÐÐ°ñ
				BT_SetData(PL_KILLPLAYER, BT_GetData(PL_KILLPLAYER) + 1); --¼ÇÂ¼Íæ¼ÒÉ±ÆäËüÍæ¼ÒµÄ×ÜÊý
				serieskill = BT_GetData(PL_SERIESKILL) + 1;
				BT_SetData(PL_SERIESKILL, serieskill); --¼ÇÂ¼Íæ¼Òµ±Ç°µÄÁ¬Õ¶Êý
			
			if (TAB_SERIESKILL[launchrank][currank] == 1) then
				serieskill_r = GetTask(TV_SERIESKILL_REALY) 
				serieskill_r = serieskill_r + 1
				SetTask(TV_SERIESKILL_REALY,serieskill_r)
				if (mod(serieskill_r, 3) == 0) then
					if (deathcamp == 1) then
						local npoint = bt_addtotalpoint(BT_GetTypeBonus(PL_MAXSERIESKILL, 2))
						but_addmissionpoint(BT_GetTypeBonus(PL_MAXSERIESKILL, 2))
						Msg2Player("<color=yellow>B¹n nhËn ®­îc ®iÓm tÝch lòy liªn tr¶m "..npoint)
					else
						local npoint = bt_addtotalpoint(BT_GetTypeBonus(PL_MAXSERIESKILL, 1))
						but_addmissionpoint(BT_GetTypeBonus(PL_MAXSERIESKILL, 1))
						Msg2Player("<color=yellow>B¹n nhËn ®­îc ®iÓm tÝch lòy liªn tr¶m "..npoint)
					end
				end
			end
				
			if (BT_GetData(PL_MAXSERIESKILL) < serieskill) then 
					BT_SetData(PL_MAXSERIESKILL, serieskill) -- Í³¼ÆÍæ¼ÒµÄ×î´óÁ¬Õ¶Êý
			end
				
			local rankradio = 1;
				
			if ( RANK_PKBONUS[launchrank] == nil or RANK_PKBONUS[launchrank][currank] == nil) then
				rankradio = 1
				print("battle rank tab error!!!please check it !")
			else
				rankradio = RANK_PKBONUS[launchrank][currank]
			end
			local earnbonus = 0
			if (deathcamp == 1) then
				earnbonus = floor(BT_GetTypeBonus(PL_KILLPLAYER, 2) * rankradio)
			else
				earnbonus = floor(BT_GetTypeBonus(PL_KILLPLAYER, 1) * rankradio)
			end
			pointplayer = bt_addtotalpoint(earnbonus)
			but_addmissionpoint(earnbonus)
			
				local rankname = "";
				rankname = tbRANKNAME[currank]
				launchrank = BT_GetData(PL_CURRANK);
				launrankname = tbRANKNAME[launchrank]
				BT_SortLadder();
				BT_BroadSelf();
				
				Msg2Player("<color=yellow>Chóc mõng b¹n ®· h¹ ®­îc "..rankname.." <color=green>"..DeathName.."<color>, Tæng PK lµ "..BT_GetData(PL_KILLPLAYER));
			end
		else
			Msg2Player(szIPMsg);
		end;
		PlayerIndex = OrgPlayer;
	end;

	Msg2Player("<color=yellow>B¹n ®· bÞ "..launrankname.." <color=green>"..LaunName.."<color> giÕt chÕt!");
	
	BT_SetData(PL_BEKILLED, BT_GetData(PL_BEKILLED) + 1)
	BT_SetData(PL_SERIESKILL, 0)
	SetTask(TV_SERIESKILL_REALY,0)
	
	BT_SortLadder();
	BT_BroadSelf();
	sf_onplayerleave()
	BT_SetData(PL_LASTDEATHTIME, GetGameTime())
end
