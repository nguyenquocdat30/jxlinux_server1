
Include("\\script\\global\\zid_jx\\tinhnang\\longmontieucuc\\head.lua");

function main()
	dofile("script/global/zid_jx/tinhnang/longmontieucuc/npctask.lua");
	local szTitle = "Xin chµo";
	local tbOption = {};
		tinsert(tbOption, {"NhiÖm vô ¸p tiªu bang héi", tbAloneShipped.NpcTaskMain, {tbAloneShipped}})
		tinsert(tbOption, {"KÕt thóc ®èi tho¹i."})
	CreateNewSayEx(szTitle, tbOption)
end

function tbAloneShipped:NpcTaskMain()
	local szTitle = "Xin chµo";
	local tbOption = {};
		tinsert(tbOption, {"B¾t ®Çu ¸p tiªu bang héi", self.GiveTask, {self}})
		tinsert(tbOption, {"KÕt thóc ®èi tho¹i."})
	CreateNewSayEx(szTitle, tbOption)
end

function tbAloneShipped:GiveTask()
	local szName = GetName();
	local nCurCamp = GetCamp();
	local szTongName, nTongID = GetTongName();
	local nTask = self:GetTask(szTongName);
	local nPosW,nPosX,nPosY = GetWorldPos();
	local nMSState = GetGlbMissionV(MISSIONV_GLB_STATE);
	if (nMSState == 0) then
		Talk(1,"","HiÖn t¹i ch­a ®Õn lóc ph¶i tham gia, ng­¬i h·y d­ìng søc vµ chê ®îi ®Õn khi nµo cã th«ng b¸o.");
	return end
	
	if (nTask ~= 1) then
		if (nTask == 0) or (nTask == -1) then
			Talk(1,"","Ng­¬i vÉn ch­a nhËn nhiÖm ¸p tiªu <color=yellow>Long M«n Tiªu Côc<color>, nÕu lµ bang chñ hoÆc tr­ìng l·o th× h·y quay vÒ Long M«n TrÊn gÆp Lôc Tam C©n ®Ó nhËn nhiÖm vô.");
		return end

		if (nTask == 2) then
			Talk(1,"","Mçi lÇn ¸p tiªu chØ ®­îc 1 tiªu xa mµ th«i, lÇn sau h·y ®Õn nhÐ.");
		return end

		if (nTask == 3) or (nTask == 4) then
			Talk(1,"","Ng­¬i ch­a nhËn th­ëng ¸p tiªu, h·y ®i nhËn th­ëng ®i.")
		return end
		
		Talk(1,"","B¹n ch­a ®ñ ®iÒu kiÖn ®Ó ¸p tiªu.");
	return end
	
	local nNpcIndex = AddNpcEx(1903,1,random(0,4),SubWorld,nPosX*32,nPosY*32,1,format("Tiªu Xa bang %s",szTongName),0)
	local szNpcName = GetNpcName(nNpcIndex);
	if (nNpcIndex > 0) then
		self:SetNpcParam(szNpcName, {szName,nCurCamp,szTongName,nTongID});
		self:SetNpcIndex(szNpcName, nNpcIndex);
		self:SetNpcTimer(szNpcName, 0);
		self:SetTimeWait(szNpcName, 0);
		self:SetTask(szTongName,2);
		SetNpcAI(nNpcIndex, 0)
		SetNpcCurCamp(nNpcIndex, 0)
		SetNpcActiveRegion(nNpcIndex,1);
		SetNpcParam(nNpcIndex, NPCPARAM_MOVE, 0);
		SetNpcParam(nNpcIndex, NPCPARAM_TIMER, 0);
		SetNpcScript(nNpcIndex, SCRIPT_CARRIER);
		SetNpcDeathScript(nNpcIndex, SCRIPT_CARRIER);
		Msg2Tong(nTongID, format("Tiªu xa cña bang héi chuÈn bÞ b¾t ®Çu xuÊt ph¸t t¹i %s (%d,%d), mäi ng­êi trong bang héi h·y cïng ®Õn n¬i tiªu xa ®Ó cïng nhau ¸p tiªu nµo!",SubWorldName(SubWorld),floor(nPosX/8), floor(nPosY/16)));
		Msg2SubWorld(format("<color=green>Tiªu xa cña bang <color=yellow>%s<color> b¾t ®Çu xuÊt ph¸t t¹i <color=yellow>%s (%d,%d)<color>, c¸c bang héi kh¸c h·y tËp trung vÒ ®ã ®Ó c­íp xe tiªu ®i nµo!", szTongName,SubWorldName(SubWorld),floor(nPosX/8), floor(nPosY/16)));
	end
end