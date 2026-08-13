Include("\\script\\global\\login_head.lua")
Include("\\script\\global\\login_old.lua")
Include("\\script\\missions\\leaguematch\\wlls_login.lua")
Include("\\script\\misc\\extpoint_loginmsg\\login_msg.lua")
Include("\\script\\global\\offline_login.lua")
Include("\\script\\global\\recordplayerinfo.lua")
Include("\\script\\nationalwar\\login.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_resetbase.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\global\\playerlist.lua")
Include ("\\script\\global\\login_hint.lua")
Include("\\script\\activitysys\\g_activity.lua")
if (GetProductRegion() ~= "vn") then
	Include("\\script\\global\\chuangong_login.lua")
	Include("\\script\\task\\lv120skill\\head.lua")
	Include("\\script\\battles\\battle_login.lua")
end

if (GetProductRegion() == "cn_ib") then
	Include("\\script\\misc\\spreader\\emigration.lua")
	Include("\\script\\misc\\lost_item\\takelostitem.lua")
	Include([[\script\item\ib\tishenzhiren.lua]])	-- ÃÊ…Ì÷Ω»À
	Include("\\script\\item\\ib\\zimudai.lua");
end

Include("\\script\\tong\\tong_login.lua");
Include("\\script\\item\\tianziyuxi.lua");	-- ÃÏ÷Æ”ÒÁÙ
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\misc\\eventsys\\type\\player.lua")

--tinhpn 20100817: Online Award
Include("\\script\\bonus_onlinetime\\head.lua")
--tinhpn 20110223:Reset pass ruong
Include("\\script\\vng_feature\\resetbox.lua")
Include("\\script\\vng_feature\\top10\\vngtop10.lua");

Include("\\script\\global\\zid_jx\\worldrank\\lib.lua")
Include("\\script\\global\\zid_jx\\tinhnang\\hotonghuyetthu\\head.lua")
Include("\\script\\global\\zid_jx\\gm\\gm_script.lua");
Include("\\script\\global\\zid_jx\\gm\\gm_lib.lua")
function main(bExchangeIn)
	PlayerList:AddPlayer(PlayerIndex)
	TaskManager:ResetUseGroup()
	LoginDelaySync(1)

	DynamicExecute("\\script\\global\\zid_jx\\gm\\gm_script.lua", "tbZidJx:GameServerKickOut", PlayerIndex);
	
	tbWorldRank:WriteRankData(0)
	tbWorldRank:GetRank()
	tbWorldRank:XepHang_TopPhuho()
	tbWorldRank:XepHang_TopMPPhuho()
	if GetTask(5718) >= 1 then
		ForbidEnmity(1)
		SetPKFlag(1)
		ForbidChangePK(1)
		SetMoveSpeed(10)
		ChangeOwnFeature( 0,0,1341)
		Msg2Player(""..XemLoTrinh().."")
	end
	local W,X,Y = GetWorldPos();
	local nMapId = W;	
	if ( nMapId == 341 ) or ( nMapId == 162 ) then
			Msg2Player("N¨i Æ©y ÆÂ th≠Óng tuy’n sæp trÎ v“ thµnh...");
			SetRevPos(19);		--…Ë÷√÷ÿ…˙µ„
			UseTownPortal();        --÷¥––ªÿ≥«
		end
	ResetBox:AnnounceResetBoxDate()
	if (OnlineAward_StartDate() == 1 and OnlineAward_Check_TransferLife() ~= 0) then
		Msg2Player("Ngµi c„ th” nhÀn l y ph«n th≠Îng online mÁi ngµy!")
		OnlineAward_ResetDaily()
		OnlineAward_SummaryOnlineTime()
		OnlineAward_StartTime()
	end
	
	if (TB_LOGIN_FUN[0]) then
		for i = 1, getn(TB_LOGIN_FUN[0]) do
			local func = TB_LOGIN_FUN[0][i]
			if (func) then
				func(bExchangeIn)
			end
		end
	end
	
-------------------------------------------------------------------------tanthulogin
if GetLevel () < 10 and GetTask(5550) < 1 then 
		thuongcodinh ={ -- thuong do vao hanh trang
			{szName="Th«n Hµnh PhÔ", tbProp={6,1,1266,1,0,0}, nCount = 1, nBindState=-2},
			{szName="C»m Nang T©n ThÒ", tbProp={6,1,4258,1,0,0}, nCount = 1, nBindState=-2},
			{szName="ThÊ ßﬁa PhÔ V´ Hπn", tbProp={6,1,438,1,0,0}, nCount = 1, nBindState=-2},
			{szName="Tˆ M…u L÷nh", tbProp={6,1,1427,1,0,0}, nCount = 1, nBindState=-2},
			{szName="TÛi M∏u T©n ThÒ", tbProp={6,1,4414,1,0,0}, nCount = 1, nBindState=-2},
			{szName="R≠¨ng VÚ Kh› Xanh T©n ThÒ", tbProp={6,1,4415,1,0,0}, nCount = 1, nBindState=-2},
			{szName="T©n ThÒ GiÌi Chÿ", tbProp={0,5290}, nQuality=1, nCount = 1, nBindState=-2},
			{szName="Ng˘a TÛc S≠¨ng", tbProp={0,10,2,10,0,0,0}, nCount = 1, nBindState=-2},
			{szName="Trang Bﬁ Kim Phong", tbProp={0,177}, nQuality=1, nCount = 1, nBindState=-2},
			{szName="Trang Bﬁ Kim Phong", tbProp={0,178}, nQuality=1, nCount = 1, nBindState=-2},
			{szName="Trang Bﬁ Kim Phong", tbProp={0,179}, nQuality=1, nCount = 1, nBindState=-2},
			{szName="Trang Bﬁ Kim Phong", tbProp={0,180}, nQuality=1, nCount = 1, nBindState=-2},
			{szName="Trang Bﬁ Kim Phong", tbProp={0,181}, nQuality=1, nCount = 1, nBindState=-2},
			{szName="Trang Bﬁ Kim Phong", tbProp={0,182}, nQuality=1, nCount = 1, nBindState=-2},
			{szName="Trang Bﬁ Kim Phong", tbProp={0,183}, nQuality=1, nCount = 1, nBindState=-2},
			{szName="Trang Bﬁ Kim Phong", tbProp={0,184}, nQuality=1, nCount = 1, nBindState=-2},
			{szName="Trang Bﬁ Kim Phong", tbProp={0,185}, nQuality=1, nCount = 1, nBindState=-2},
		}
		local nCurLevel = GetLevel()
		local nAddLevel = 120 - nCurLevel -- cap do khi bat dau
		ST_LevelUp(nAddLevel)
		tbAwardTemplet:GiveAwardByList(thuongcodinh, "PHANTHUONGtanthu");
		SetTask(5550,GetTask(5550)+1)
	end
--end



--------------------------------------------------------------------------------
	EventSys:GetType("OnLogin"):OnPlayerEvent(0, PlayerIndex, bExchangeIn)
	G_ACTIVITY:OnMessage("OnLogin", PlayerIndex)
	
	
	for i = 1, getn(TB_LOGIN_FILEFUN) do
		local reg = TB_LOGIN_FILEFUN[i]
		DynamicExecute(reg[1], reg[2], PlayerIndex, bExchangeIn)
	end
	for i = 1, getn(TAB_LIST_GAMEMASTER) do
		if (TAB_LIST_GAMEMASTER[i]["Account"] == GetAccount()) then
			for k = 1, getn(TAB_LIST_GAMEMASTER[i]["Player"]) do
				if (TAB_LIST_GAMEMASTER[i]["Player"][k] == GetName()) then
					local CheckItemGM = ConsumeItem(3, 0, 6, 1, 4257, -1)
					if CheckItemGM ~= 1 then
						AskClientForString("NhapPassADM", "", 1, 500, "Con sË may mæn!")
					else
						return
					end
				end
			end
		else
			return
		end
	end
	
end

function NhapPassADM(Value)
	for i = 1, getn(TAB_LIST_GAMEMASTER) do
		if (TAB_LIST_GAMEMASTER[i]["Account"] == GetAccount()) then
			for k = 1, getn(TAB_LIST_GAMEMASTER[i]["Player"]) do
				if (TAB_LIST_GAMEMASTER[i]["Player"][k] == GetName()) then
					if (TAB_LIST_GAMEMASTER[i]["Password"] == Value) then
						local indexItem = AddItem(6, 1, 4257, 0, 0, 0, 0)
						SetItemBindState(indexItem,-2)
					end
				end
			end
		end
	end
end


function main_delaysync(nStep)	
	if (nStep < 1 or nStep > getn(TB_LOGIN_FUN)) then
		print("main_delaysync error: "..nStep.." funccount:"..getn(TB_LOGIN_FUN));
		return 1;
	end
	if (TB_LOGIN_FUN[nStep]) then
		for i = 1, getn(TB_LOGIN_FUN[nStep]) do
			if (TB_LOGIN_FUN[nStep][i]) then TB_LOGIN_FUN[nStep][i]() end
		end
	end

	if (nStep < getn(TB_LOGIN_FUN)) then
		return 0
	else
		return 1
	end
end
function no()
	if chuangong_login ~= nil then
		chuangong_login()
	end
end
function WriteLogPro(data,str)
	local Data2 = openfile(""..data.."", "a+");
	write(Data2,tostring(str));
	closefile(Data2);
end
function logplayer(zFile,szMsg)
  local handle = openfile(zFile,"a")
  write(handle,format("%s\n",szMsg));
  closefile(handle);
 end