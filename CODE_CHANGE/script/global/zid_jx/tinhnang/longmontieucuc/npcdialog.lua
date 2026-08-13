
Include("\\script\\global\\zid_jx\\tinhnang\\longmontieucuc\\head.lua")

function main()
	dofile("script/global/zid_jx/tinhnang/longmontieucuc/npcdialog.lua");
	local szTitle = "Xin chµo";
	local tbOption = {};
		tinsert(tbOption, {"NhiÖm vô ¸p tiªu bang héi", tbAloneShipped.NpcDialogMain, {tbAloneShipped}})
		tinsert(tbOption, {"KÕt thóc ®èi tho¹i."})
	CreateNewSayEx(szTitle, tbOption)
end;

function tbAloneShipped:NpcDialogMain()
	local szTongName, _ = GetTongName();
	local nTask = self:GetTask(szTongName);
	local szTitle = "Xin chµo";
	local tbOption = {};
		tinsert(tbOption, {"NhËn nhiÖm vô ¸p tiªu bang héi", self.GiveTaskTong, {self}})
	if (nTask == 1) then
		tinsert(tbOption, {"§Õn n¬i lµm nhiÖm vô", self.GoMap, {self}})
	end
		tinsert(tbOption, {"KÕt thóc ®èi tho¹i."})
	CreateNewSayEx(szTitle, tbOption)
end;

function StartMS()
	OpenGlbMission(MISSION_ID);
	Msg2Player(format("B¾t ®Çu "..MISSION_ID))
end

function EndMS()
	CloseGlbMission(MISSION_ID);
end

function tbAloneShipped:GiveTaskTong()
	local szName = GetName();
	local nCurCamp = GetCamp();
	local szTongName, nTongID = GetTongName();
	local nFigure = TONGM_GetFigure(nTongID,szName);
	local nTask = self:GetTask(szTongName);
	local nMSState =GetGlbMissionV(MISSIONV_GLB_STATE);
	local nTongTask = self:GetTongTask(szTongName,TASKTONG_COUNT);
	if (nMSState == 0) then
		Talk(1,"","HiÖn t¹i ch­a ®Õn lóc ph¶i tham gia, ng­¬i h·y d­ìng søc vµ chê ®îi ®Õn khi nµo cã th«ng b¸o.");
	return end
	
	if (nCurCamp == 0) then
		Talk(1,"","Nh©n vËt ch÷ tr¾ng kh«ng thÓ tham gia ¸p tiªu bang héi, nÕu ch­a gia nhËp m«n ph¸i th× h·y ®Õn gÆp ch­ëng m«n cña c¸c ph¸i ®Ó gia nhËp m«n ph¸i.");
	return end
	
	if (nTongID == 0) then
		Talk(1,"","Ng­¬i ch­a cã bang héi, kh«ng thÓ tham gia ¸p tiªu lÇn nµy! H·y gia nhËp bang héi ®Ó cïng tr·i nghiÖm tÝnh n¨ng nµy.");
	return end
	
	if not (TB_TONG_FIGURE_NAME[nFigure]) then
		Talk(1,"","Ph¶i lµ <color=red>bang chñ<color> hoÆc <color=red>tr­ìng l·o<color> míi cã thÓ nhËn ®­îc nhiÖm vô nµy.");
	return end
	
	if (nTongTask >= TONG_COUNT) then
		Talk(1,"","H«m nay bang héi cña b¹n ®· vËn tiªu ®ñ råi, ngµy mai hay quay l¹i.")
	return end
	
	if (nTask > 0) then
		Talk(1,"","Ng­¬i ®· nhËn nhiÖm vô lÇn nµy råi, h·y cïng bang héi cña m×nh ®i ¸p tiªu ®i.")
	return end
	
	self:SetTask(szTongName,1);
	Msg2Player("B¹n ®· nhËn nhiÖm vô ¸p tiªu <color=yellow>Long M«n Tiªu Côc<color> thµnh c«ng, h·y kªu gäi mäi ng­êi trong bang héi cïng nhau chuÈn bÞ ¸p tiªu ®i nµo!");
	Msg2Tong(nTongID, format("%s <color=fire>%s<color> ®· nhËn nhiÖm vô ¸p tiªu Long M«n Tiªu Côc, mäi ng­êi h·y cïng nhau tËp trung l¹i ®Ó chuÈn bÞ ¸p tiªu ®i nµo!", TB_TONG_FIGURE_NAME[nFigure], GetName()))
end

function tbAloneShipped:GoMap()
	NewWorld(100,1597,3114);
end