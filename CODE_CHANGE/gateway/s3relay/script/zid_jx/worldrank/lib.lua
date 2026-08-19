Include("\\script\\lib\\common.lua")
Include("\\script\\lib\\remoteexc.lua")
Include("\\script\\zid_jx\\worldrank\\head.lua")

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

function tbWorldRank:GetRankValue(szRoleName)
  local nLevel = LG_GetLeagueTask(self.LGID, szRoleName, self.TaskLevel)
  local nExp = LG_GetLeagueTask(self.LGID, szRoleName, self.TaskExp);
  local nTranLife = LG_GetLeagueTask(self.LGID, szRoleName, self.TaskTrans)

  if not nTranLife then
    nTranLife = 0
  end

  if not nLevel then
    nLevel = 0
  end

  if not nExp then
    nExp = 0
  else
    nExp = nExp / 1e12
  end

  local nRankValue = nLevel + self.TRANSLIFE[nTranLife] + nExp;

  self:Debug("szRoleName: " .. szRoleName)
  self:Debug("nTranLife: " .. nTranLife)
  self:Debug("nLevel: " .. nLevel)
  self:Debug("nExp: " .. nExp)
  self:Debug('nRankValue: ' .. nRankValue)
  self:Debug( '================================================================')
  return nLevel, nRankValue;
end

function tbWorldRank:UpdateRankData()
  local LGHandle = LG_GetFirstLeague(self.LGID)

  if self:FALSE(LGHandle) then
    self:Debug('Chua co xep hang')
    return
  end

  local tbRankData = {}

  while not self:FALSE(LGHandle) do
    local szRoleName = LG_GetLeagueInfo(LGHandle)
    local nLevel, nRankValue = self:GetRankValue(szRoleName)
    local nFactionNumber = LG_GetLeagueTask(self.LGID, szRoleName, self.TaskFaction)

    tinsert(tbRankData, {szRoleName, nRankValue, nFactionNumber, nLevel})

    LGHandle = LG_GetNextLeague(self.LGID, LGHandle)
  end

  local totalRank = getn(tbRankData)

  if totalRank <= 0 then
    self:Debug('Tong rank = 0')
    return
  end

  sort(tbRankData, function (a, b)
    return (a[2] > b[2])
  end)

  Ladder_ClearLadder(self.WorldRankLadder)
  for i=1, 11 do
    Ladder_ClearLadder(self.FactionLadders[i])
  end

  for i = 1, totalRank do
    self:Debug('Apply rank')
    LG_ApplySetLeagueTask(self.LGID, tbRankData[i][1], self.TaskRank, i)

    Ladder_NewLadder(self.WorldRankLadder, tbRankData[i][1], tbRankData[i][4],0)

    local nFactionNumber = tbRankData[i][3]
    if nFactionNumber > -1 then
      Ladder_NewLadder(self.FactionLadders[nFactionNumber + 1], tbRankData[i][1], tbRankData[i][4], 0, nFactionNumber)
    end

  end
  self:Debug('Gui yeu cau cap nhat rank sang GS')
  RemoteExc("\\script\\global\\zid_jx\\worldrank\\lib.lua", "tbWorldRank:UpdateRankData");
end

function tbWorldRank:RequestRankData()
  self:Debug('Gui yeu cau cap nhat rank data')
  RemoteExc("\\script\\global\\zid_jx\\worldrank\\lib.lua", "tbWorldRank:SaveAllRankData");
end