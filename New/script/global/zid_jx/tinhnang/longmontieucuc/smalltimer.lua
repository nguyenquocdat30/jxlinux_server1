
Include("\\script\\global\\zid_jx\\tinhnang\\longmontieucuc\\head.lua")

function OnTimer()
	local tbNpcTimer = tbAloneShipped:GetAllNpcTimer();
	for x,y in tbNpcTimer do
		if (type(y) ~= "table") or (y ~= nil) or (y < 0) then
			tbAloneShipped:SetNpcTimer(x,y+1);
			tbAloneShipped:SetTimeNotice(x, y+1);
		end
	end
	
	local tbNpcIndex = tbAloneShipped:GetAllNpcIndex();
	for x,y in tbNpcIndex do
		if (type(y) ~= "table") or (y ~= nil) then
			local szNpcName = GetNpcName(y);
			local nNpcPosX,nNpcPosY,nNpcPosW = GetNpcPos(y);
			local tbNpcParam = tbAloneShipped:GetNpcParam(x);
			local nNotice = tbAloneShipped:GetTimeNotice(x);
			local nTimer = tbAloneShipped:GetNpcTimer(x);
			local nWait = tbAloneShipped:GetTimeWait(x);
			local nTask = tbAloneShipped:GetTask(tbNpcParam[3]);
			local nRestMin = floor((PARAM_TIMER_TIMEOUT - nNotice)/60);
			local nPosX = floor((nNpcPosX/32)/8);
			local nPosY = floor((nNpcPosY/32)/16);
			local nRestMWait = floor((PARAM_TIMER_BEGIN-nWait)/60)+1;
			print(nRestMin)
			if (nWait < PARAM_TIMER_BEGIN) then
				tbAloneShipped:SetTimeWait(x,nWait+1)
				if (mod(nWait,60) == 1) and (nTask == 2) then
					Msg2Tong(tbNpcParam[4], format("Tiªu xa cña bang héi ta cßn %d phót nöa sÏ xuÊt ph¸t t¹i %s (%d,%d).", nRestMWait,SubWorldName(nNpcPosW), nPosX,nPosY))
				end
			elseif (nWait == PARAM_TIMER_BEGIN) then
				tbAloneShipped:SetTimeWait(x,nWait+1)
					Msg2SubWorld(format("<color=green>Tiªu xa cña bang %s ®· b¾t ®Çu xuÊt ph¸t t¹i %s (%d,%d), c¸c nh©n sü chó ý!", tbNpcParam[3],SubWorldName(nNpcPosW), nPosX,nPosY))
					SetNpcTimer(y,1);
			elseif (nWait > PARAM_TIMER_BEGIN) then
				if (mod(nNotice,60) == 0) and (nTask == 2) then
					NpcChat(y, format("<color=green>Thêi gian cßn <color=yellow>%d<color> phót", nRestMin))
					Msg2Tong(tbNpcParam[4], format("Tiªu xa cña bang héi hiÖn t¹i ®ang di chuyÓn t¹i <color=fire>%s<color> (%d,%d).", SubWorldName(nNpcPosW), nPosX,nPosY));
				end
			end
		end
	end
end
