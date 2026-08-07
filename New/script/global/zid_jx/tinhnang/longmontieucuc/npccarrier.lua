
Include("\\script\\global\\zid_jx\\tinhnang\\longmontieucuc\\head.lua");

function OnTimer(nNpcIndex, nTimeOut)
	local szNpcName = GetNpcName(nNpcIndex);
	local nNpcSeries = GetNpcSeries(nNpcIndex);
	local nNpcCurCamp = GetNpcCurCamp(nNpcIndex);
	local szNpcScript = GetNpcScript(nNpcIndex);
	local nNpcPosX,nNpcPosY,nNpcPosW = GetNpcPos(nNpcIndex);
	local tbNpcParam = tbAloneShipped:GetNpcParam(szNpcName);
	local nTimer = tbAloneShipped:GetNpcTimer(szNpcName);
	local nMSState = GetGlbMissionV(MISSIONV_GLB_STATE);
	local nTask = tbAloneShipped:GetTask(tbNpcParam[3]);
	
	if (nMSState == 0) then
		Msg2Tong(tbNpcParam[4], "RÊt tiÕc! §· hÕt thêi gian lµm nhiÖm vô, nhiÖm vô ¸p tiªu bang héi lÇn nµy thÊt b¹i! LÇn sau h·y cè g¾ng thªm nöa nhÐ!");
		DelNpc(nNpcIndex);
	return end
	
	if (nTask == 2) and (nTimer > PARAM_TIMER_TIMEOUT) then
		tbAloneShipped:SetTask(tbNpcParam[3],0);
		Msg2Tong(tbNpcParam[4], "RÊt tiÕc! §· hÕt thêi gian lµm nhiÖm vô, nhiÖm vô ¸p tiªu bang héi lÇn nµy thÊt b¹i! LÇn sau h·y cè g¾ng thªm nöa nhÐ!");
		tbAloneShipped:SetNpcTimer(szNpcName,0);
		DelNpc(nNpcIndex);
	return end
	
	if (nTask == 4) and (nTimer > PARAM_TIMER_CHANGE) then
		DelNpc(nNpcIndex)
	end
	
	local nReTask = tbAloneShipped:GetPlaceReTask(nNpcIndex);
	if (nReTask == 1) then
		tbAloneShipped:SetTask(tbNpcParam[3],3);
		Msg2Tong(tbNpcParam[4], "Chóc mõng bang héi ta ®· ¸p tiªu thµnh c«ng! Bang chñ hoÆc tr­ìng l·o ®Õn tr¶ nhiÖm vô vµ nhËn th­ëng ®i nµo!");
		Msg2SubWorld(format("Chóc mõng bang héi <color=yellow>%s<color> ®· ¸p tiªu thµnh c«ng!", tbNpcParam[3]))
		DelNpc(nNpcIndex);
	return end
	
	local tbPlayer = tbAloneShipped:GetPlayerCarrier(nNpcIndex);
	local nPlayerPosW, nPlayerPosX, nPlayerPosY = tbPlayer[3],tbPlayer[4],tbPlayer[5];
	local nPlayerAround = tbPlayer[6];

	if (nPlayerAround == 0) then
		SetNpcCurCamp(nNpcIndex, tbNpcParam[2])
	else
		SetNpcCurCamp(nNpcIndex, 0)
	end
	
	if (nTask == 2) then
		if (nPlayerPosW == SubWorldIdx2ID(nNpcPosW)) and (nPlayerAround == 1) then
			NpcWalk(nNpcIndex,nPlayerPosX,nPlayerPosY);
		elseif (nPlayerPosW ~= SubWorldIdx2ID(nNpcPosW)) then
			local nPosX32,nPosY32,nPosW = nNpcPosX/32,nNpcPosY/32,SubWorldIdx2ID(nNpcPosW);
			local nNpc2Index = 0
			for i = 1, getn(TB_POSITION_LAG) do
				local tbCurGoPosition = TB_POSITION_LAG[i][1];
				local tbCurToPosition = TB_POSITION_LAG[i][2];
				if (nPosW == tbCurGoPosition[1]) and (nPlayerPosW == tbCurToPosition[1]) then
					if ((nPosX32 <= tbCurGoPosition[2]+10) and (nPosY32 <= tbCurGoPosition[3]+5)) and ((nPosX32 >= tbCurGoPosition[2]-10) and (nPosY32 >= tbCurGoPosition[3]-5)) then
						if (GetNpcParam(nNpcIndex, NPCPARAM_MOVE) == 0) then
							nPosW,nPosX32,nPosY32 = tbCurToPosition[1],tbCurToPosition[2],tbCurToPosition[3];
							DelNpc(nNpcIndex);
							nNpc2Index = AddNpcEx(1903,1,nNpcSeries,SubWorldID2Idx(nPosW),nPosX32*32,nPosY32*32,1,szNpcName,0);
							tbAloneShipped:SetNpcIndex(szNpcName, nNpc2Index);
							SetNpcActiveRegion(nNpc2Index,1);
							SetNpcAI(nNpc2Index,0);
							SetNpcCurCamp(nNpc2Index,nNpcCamp);
							SetNpcScript(nNpc2Index,szNpcScript);
							SetNpcParam(nNpc2Index, NPCPARAM_MOVE, 0);
							SetNpcParam(nNpcIndex, NPCPARAM_MOVE, 1);
							SetNpcTimer(nNpc2Index, 1);
						end
					end
				end
			end
		end
	end
	
	SetNpcTimer(nNpcIndex,1)
end

function OnDeath(nNpcIndex)
	local szNpcName = GetNpcName(nNpcIndex);
	local nNpcSeries = GetNpcSeries(nNpcIndex);
	local nNpcPosX, nNpcPosY, nNpcPosW = GetNpcPos(nNpcIndex);
	local szNpcScript = GetNpcScript(nNpcIndex);
	
	local nOldPlayer = PlayerIndex;
	local szName = GetName();
	local szTongName,nTongID = GetTongName();
	local tbNpcParam = tbAloneShipped:GetNpcParam(szNpcName);
	local tbPlayer = tbAloneShipped:GetPlayerCarrier(nNpcIndex);
	
	PlayerIndex = tbPlayer[2];
		local szP2Name = GetName();
		local szP2TongName,nP2TongID = GetTongName();
		tbAloneShipped:SetTask(szP2TongName, 4);
		if (nTongID ~= 0) then
			Msg2Tong(nP2TongID, format("§¹i hiÖp <color=fire>%s<color> bang %s ®· c­íp ®­îc tiªu xa cña bang héi ta. NhiÖm vô Long M«n Tiªu Côc cña bang héi thÊt b¹i, h·y ®Õn gÆp <color=yellow>Long M«n Tiªu S­<color> ë thµnh thÞ ®Ó nhËn phÇn th­ëng ¸p tiªu!", szName, szTongName))
			Msg2SubWorld(format("Chóc mõng ®¹i hiÖp <color=yellow>%s<color> bang <color=yellow>%s<color> ®· c­íp ®­îc tiªu xa cña bang <color=yellow>%s<color>",szName,szTongName,tbNpcParam[3]))
		else
			Msg2Tong(nP2TongID, format("§¹i hiÖp <color=fire>%s<color> ®· c­íp ®­îc tiªu xa cña bang héi ta. NhiÖm vô Long M«n Tiªu Côc cña bang héi thÊt b¹i, h·y ®Õn gÆp <color=yellow>Long M«n Tiªu S­<color> ë thµnh thÞ ®Ó nhËn phÇn th­ëng ¸p tiªu!", szName))
			Msg2SubWorld(format("Chóc mõng ®¹i hiÖp <color=yellow>%s<color> ®· c­íp ®­îc tiªu xa cña bang <color=yellow>%s<color>",szName,tbNpcParam[3]))
		end
		
		local nNpc2Index = AddNpcEx(1348,1,nNpcSeries,nNpcPosW,nNpcPosX,nNpcPosY,1,szNpcName,0);
		SetNpcScript(nNpc2Index,szNpcScript);
		tbAloneShipped:SetNpcTimer(szNpcName,0);
		SetNpcCurCamp(nNpc2Index,0);
		SetNpcTimer(nNpc2Index,1);
	PlayerIndex = nOldPlayer;
		local tbAward = {
			{szName="TiÒn §ång", tbProp={4,417,1,0,0,0}, nCount=10},
		};
		tbAwardTemplet:GiveAwardByList(tbAward, "PhÇn th­ëng c­íp tiªu!")
		Msg2Player("Chóc mõng b¹n nhËn ®­îc phÇn th­ëng c­íp tiªu bang héi!")
	tbAloneShipped:ClearNpcParam(nNpcIndex)
end