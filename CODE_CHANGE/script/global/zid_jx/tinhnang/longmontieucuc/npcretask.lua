
Include("\\script\\global\\zid_jx\\tinhnang\\longmontieucuc\\head.lua");

function main()
	
	dofile("script/global/zid_jx/tinhnang/longmontieucuc/npcretask.lua");
	local szTitle = "Xin chµo";
	local tbOption = {};
		tinsert(tbOption, {"NhiÖm vô ¸p tiªu bang héi", tbAloneShipped.NpcReTaskMain, {tbAloneShipped}})
		tinsert(tbOption, {"KÕt thóc ®èi tho¹i."})
	CreateNewSayEx(szTitle, tbOption)
end

function tbAloneShipped:NpcReTaskMain()
	local szTitle = "Xin chµo";
	local tbOption = {};
		tinsert(tbOption, {"Tr¶ nhiÖm vô ¸p tiªu bang héi", self.ReTask, {self}})
		tinsert(tbOption, {"KÕt thóc ®èi tho¹i."})
	CreateNewSayEx(szTitle, tbOption)
end

function tbAloneShipped:ReTask()
	local szName = GetName();
	local nCurCamp = GetCamp();
	local szTongName, nTongID = GetTongName();
	local nFigure = TONGM_GetFigure(nTongID,szName);
	local nTask = self:GetTask(szTongName);
	local nPosW,nPosX,nPosY = GetWorldPos();
	local nMSState = GetGlbMissionV(MISSIONV_GLB_STATE);
	local nTongTask = self:GetTongTask(TASKTONG_COUNT);
	
	if (nMSState == 0) then
		Talk(1,"","HiÖn t¹i ch­a ®Õn lóc ph¶i tham gia, ng­¬i h·y d­ìng søc vµ chê ®îi ®Õn khi nµo cã th«ng b¸o.");
	return end
	
	if (nCurCamp == 0) or (nTongID == 0) then
		Talk(1,"","§iÒu kiÖn hiÖn t¹i cña b¹n ch­a ®ñ ®Ó tr¶ nhiÖm vô.");
	return end
	
	if not (TB_TONG_FIGURE_NAME[nFigure]) then
		Talk(1,"","Ph¶i lµ <color=red>bang chñ<color> hoÆc <color=red>tr­ìng l·o<color> míi cã thÓ tr¶ ®­îc nhiÖm vô nµy.");
	return end
	
	if (nTask ~= 3) and (nTask ~= 4) then
		if (nTask == -1) or (nTask == 0) then
			Talk(1,"","Ng­¬i ch­a nhËn nhiÖm vô, ®Þnh g¹t ta µ?")
		return end
		
		if (nTask == 2) then
			Talk(1,"","Ng­¬i ch­a ¸p tiªu ®Õn chç ta mµ ®· ®ßi tr¶ nhiÖm vô råi sao?")
		return end
	else
		if (nTask == 3) then
			local tbAwardSuccess = {
				{szName="TiÒn §ång", tbProp={4,417,1,0,0,0}, nCount=20},
			};
			tbAwardTemplet:GiveAwardByList(tbAwardSuccess, "PhÇn th­ëng cho bang héi ¸p tiªu thµnh c«ng!")
			self:SetTask(szTongName,-1);
			self:SetTongTask(szTongName,TASKTONG_COUNT,nTongTask+1);
			Msg2Player("Bang héi cña b¹n ®· hoµn thµnh nhiÖm vô ¸p tiªu, nhËn ®­îc phÇn th­ëng giµnh cho bang ¸p tiªu thµnh c«ng.");
		elseif (nTask == 4) then
			local tbAwardFailed = {
				{szName="TiÒn §ång", tbProp={4,417,1,0,0,0}, nCount=10},
			};
			tbAwardTemplet:GiveAwardByList(tbAwardFailed, "PhÇn th­ëng cho bang héi ¸p tiªu thÊt b¹i!")
			self:SetTask(szTongName,0);
			self:SetTongTask(szTongName,TASKTONG_COUNT,nTongTask+1);
			Msg2Player("Bang héi cña b¹n ®· bÞ ng­êi kh¸c c­íp tiªu, nhËn ®­îc phÇn th­ëng giµnh cho bang ¸p tiªu thÊt b¹i.");
		end
	end
end