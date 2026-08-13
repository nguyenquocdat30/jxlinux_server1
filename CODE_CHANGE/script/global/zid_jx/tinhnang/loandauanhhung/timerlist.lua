Include("\\script\\lib\\baseclass.lua")
LDAHTimerList = {}
LDAHTimer = tbBaseClass:new()

function LDAHTimer:_init()
	self.nId = getn(LDAHTimerList) + 1
	LDAHTimerList[self.nId] = {}
end

function LDAHTimer:Add(nFrame, fn, tbParam)
	local nTimerId = AddTimer(nFrame, "LDAHTimer:OnTime", self.nId)
	LDAHTimerList[self.nId][nTimerId] = 
	{
		fn = fn,
		tbParam = tbParam
	}
end

function LDAHTimer:Clear(nFrame, fn, tbParam)
	for nTimerId, pData in LDAHTimerList[self.nId] do
		if pData then
			DelTimer(nTimerId)
		end
	end
	LDAHTimerList[self.nId] = nil
end

function LDAHTimer:OnTime(nParam, nTimerId)
	if not LDAHTimerList[nParam] then
		return 0,0
	end
	local pData = LDAHTimerList[nParam][nTimerId]
	if not pData then
		return 0, 0
	end
	local nFrame = call(pData.fn, pData.tbParam)
	if nFrame and nFrame > 0 then
		return nFrame ,nParam
	else
		if LDAHTimerList[nParam] then
			LDAHTimerList[nParam][nTimerId] = nil
		end
		return 0,0
	end
end
