IncludeLib("SETTING");
DamagePlayer = { nMissionID = 71, tbDamageGroup = { [1] = {nDamage=0}, [2] = {nDamage=0}}, nMaxMissionGroup = 500, };

function DamagePlayer:StartPersonalStat(nPlayerIndex)
	CallPlayerFunction(nPlayerIndex, ST_StartDamageCounter);
end;

function DamagePlayer:FinishPersonalStat(nPlayerIndex)
	CallPlayerFunction(nPlayerIndex, ST_StopDamageCounter);
end;

function DamagePlayer:FetchPersonalDamage(nPlayerIndex) 
	local nDamage = CallPlayerFunction(nPlayerIndex, ST_GetDamageCounter);
	self:ClearPersonalDamage(nPlayerIndex);
	return nDamage;
end;

function DamagePlayer:ClearPersonalDamage(nPlayerIndex) 
	CallPlayerFunction(nPlayerIndex, ST_StopDamageCounter);
	CallPlayerFunction(nPlayerIndex, ST_StartDamageCounter);
end;

function DamagePlayer:BeginDamage(nGroupID)
	if not self.tbDamageGroup[nGroupID] then 
		return 
	end;
	local nIdx = 0;
	local nPlayerIndex = 0;
		for i = 1, self.nMaxMissionGroup do
			nIdx, nPlayerIndex = GetNextPlayer(self.nMissionID, nIdx, nGroupID);
				if nPlayerIndex > 0 then 
					self:StartPersonalStat(nPlayerIndex);
				end;
				if nIdx == 0 then
					break 
				end;
		end;
end;
 
 
function DamagePlayer:FinishStat(nGroupID)
	if not self.tbDamageGroup[nGroupID] then
		return
	end;
	local nIdx = 0;
	local nPlayerIndex = 0;
		for i = 1, self.nMaxMissionGroup do
			nIdx, nPlayerIndex = GetNextPlayer(self.nMissionID, nIdx, nGroupID);
				if nPlayerIndex > 0 then
					self:FinishPersonalStat(nPlayerIndex);
				end;
			if nIdx == 0 then
				break
			end;
		end;
end;
 
 
function DamagePlayer:FetchDamageToGroup(nPlayerIndex, nGroupID)
	if not self.tbDamageGroup[nGroupID] then
		return
	end;
	if nPlayerIndex > 0 then
		local nPersonalDamage = self:FetchPersonalDamage(nPlayerIndex);
			self.tbDamageGroup[nGroupID].nDamage = self.tbDamageGroup[nGroupID].nDamage + nPersonalDamage;
	end;
end;
 
 
function DamagePlayer:GetGroupDamage(nGroupID)
	if not self.tbDamageGroup[nGroupID] then
		return
	end;
	local nIdx = 0;
	local nPlayerIndex = 0;
	local nReceivedDamage = 0;
	for i = 1, self.nMaxMissionGroup do
		nIdx, nPlayerIndex = GetNextPlayer(self.nMissionID, nIdx, nGroupID);
		self:FetchDamageToGroup(nPlayerIndex, nGroupID);
			if nIdx == 0 then
				break
			end;
	end;
	return self.tbDamageGroup[nGroupID].nDamage;
end;
 
 
function DamagePlayer:ClearStat()
	for k, v in self.tbDamageGroup do
		v.nDamage = 0;
	end;
end;
 