IL("LEAGUE")
IncludeLib("RELAYLADDER");
IncludeLib("TONG")
IncludeLib("FILESYS");
Include("\\script\\vng_lib\\files_lib.lua")
Include("\\script\\lib\\common.lua")
Include("\\script\\lib\\remoteexc.lua")
Include("\\script\\global\\zid_jx\\worldrank\\head.lua")

function tbWorldRank:Debug(szMsg)
  if self.DebugMode then
    print("WORLDRANK DEBUG: " .. szMsg)
  end
end

function tbWorldRank:FALSE(value)
  if (value == 0 or value == nil or value == "") then
    return 1
  else
    return nil
  end
end

function tbWorldRank:GetRankValue()
  local nTranLife = ST_GetTransLifeCount()
  local nLevel = GetLevel();
  local nExp = GetExp()/ 1e12;
  return nLevel + self.TRANSLIFE[nTranLife] +nExp;
end

function tbWorldRank:WriteRankData(SaveRank)
  if self.MinLavel > GetLevel() then
    return
  end

  local szRoleName = GetName()
  local nLevel = GetLevel()
  local nTranLife = ST_GetTransLifeCount();
  local nExp = GetExp()
  local nExpPercent = GetExpPercent() * 100;

  
  szFactionNumber = GetLastFactionNumber()

  if self.FALSE(LG_GetLeagueObj(self.LGID, szRoleName)) then
    local LGHandle = LG_CreateLeagueObj()
    LG_SetLeagueInfo(LGHandle, self.LGID, szRoleName)
    LG_ApplyAddLeague(LGHandle, "", "")
    LG_FreeLeagueObj(LGHandle)
  end

  LG_ApplySetLeagueTask(self.LGID, szRoleName, self.TaskLevel, nLevel)
  LG_ApplySetLeagueTask(self.LGID, szRoleName, self.TaskTrans, nTranLife)
  LG_ApplySetLeagueTask(self.LGID, szRoleName, self.TaskExp, nExp)
  LG_ApplySetLeagueTask(self.LGID, szRoleName, self.TaskFaction, szFactionNumber)

  if SaveRank then
    LG_ApplySetLeagueTask(self.LGID, szRoleName, self.TaskRank, GetEnergy())
  else
    SaveNow()
  end
end

function tbWorldRank:GetRank()
  local szRoleName = GetName()
  local nRank = LG_GetLeagueTask(self.LGID, szRoleName, self.TaskRank)

  self:Debug('RANK HIEN TAI: '.. nRank)
  if self:FALSE(nRank) then
    nRank = 0
  end

  if(nRank <= self.MaxRank) then
    SetEnergy(nRank)
  else
    SetEnergy(0)
  end
end

function tbWorldRank:UpdateRankData()
  self:Debug("Update WorldRank Start")
  
  local LGHandle = LG_GetFirstLeague(self.LGID)

  if self:FALSE(LGHandle) then
    self:Debug('Chua co xep hang')
    return
  end

  while not self:FALSE(LGHandle) do
    szRoleName = LG_GetLeagueInfo(LGHandle)
    
    local nPlayerIndex, oldPlayerIndex = SearchPlayer(szRoleName), PlayerIndex
    if nPlayerIndex > 0 then
      PlayerIndex = nPlayerIndex
      self:GetRank()
      PlayerIndex = oldPlayerIndex
    end

    LGHandle = LG_GetNextLeague(self.LGID, LGHandle)

  end

  Msg2SubWorld("<color=yellow>HÖ thèng xÕp h¹ng giang hå ®· ®­îc cËp nhËt.");

  self:Debug("Update WorldRank End")
end

function tbWorldRank:SaveAllRankData()
  self:Debug("Save All RankData Start")
  -- self:TopList2File()
  local LGHandle = LG_GetFirstLeague(self.LGID)

  if self:FALSE(LGHandle) then
    return
  end

  while not self:FALSE(LGHandle) do
    szRoleName = LG_GetLeagueInfo(LGHandle)
    
    local nPlayerIndex, oldPlayerIndex = SearchPlayer(szRoleName), PlayerIndex
    if nPlayerIndex > 0 then
      PlayerIndex = nPlayerIndex
      self:WriteRankData(0)
      PlayerIndex = oldPlayerIndex
    end

    LGHandle = LG_GetNextLeague(self.LGID, LGHandle)

  end
  self:Debug("Save All RankData End")
end

function tbWorldRank:XepHang_TopPhuho()
	nMoney = GetBoxMoney()+ GetCash()
	sMoney = nMoney/10000
	if sMoney < 1 then
		return
	end
	Ladder_NewLadder(10283,GetName(),sMoney,0,GetLastFactionNumber());
end
function tbWorldRank:XepHang_TopMPPhuho()
	local player_Faction = GetFaction()
	nMoney = GetBoxMoney()+ GetCash()
	sMoney = nMoney/10000
		if sMoney < 1 then
			return
		end
		if (player_Faction == "cuiyan") then	
			Ladder_NewLadder(10290, GetName(),sMoney,0,GetLastFactionNumber());

		elseif (player_Faction == "emei") then				
			Ladder_NewLadder(10289, GetName(),sMoney,0,GetLastFactionNumber());

		elseif (player_Faction == "tangmen") then
			Ladder_NewLadder(10287, GetName(),sMoney,0,GetLastFactionNumber());

		elseif (player_Faction == "wudu") then
			Ladder_NewLadder(10288, GetName(),sMoney,0,GetLastFactionNumber());

		elseif (player_Faction == "tianwang") then
			Ladder_NewLadder(10286, GetName(),sMoney,0,GetLastFactionNumber());

		elseif (player_Faction == "shaolin") then
			Ladder_NewLadder(10285, GetName(),sMoney,0,GetLastFactionNumber());

		elseif (player_Faction == "wudang") then
			Ladder_NewLadder(10293, GetName(),sMoney,0,GetLastFactionNumber());

		elseif (player_Faction == "kunlun") then
			Ladder_NewLadder(10294, GetName(),sMoney,0,GetLastFactionNumber());

		elseif (player_Faction == "tianren") then
			Ladder_NewLadder(10292, GetName(),sMoney,0,GetLastFactionNumber());

		elseif (player_Faction == "gaibang") then
			Ladder_NewLadder(10291, GetName(),sMoney,0,GetLastFactionNumber());

		elseif (GetLastFactionNumber() == 10) then
			Ladder_NewLadder(10295, GetName(),sMoney,0,GetLastFactionNumber());
	end
end
