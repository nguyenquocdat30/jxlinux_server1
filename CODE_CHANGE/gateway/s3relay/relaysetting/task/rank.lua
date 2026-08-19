Include("\\script\\zid_jx\\worldrank\\lib.lua")

function TaskShedule()
  TaskName("XÕp h¹ng giang hå")
  TaskInterval(1440)
  TaskTime(18, 05);
  TaskCountLimit(0)
  OutputMsg("=================XEP HANG GIANG HO 02:10 HANG NGAY KHOI DONG==================");
end

function TaskContent()
  -- local day = tonumber(date("%w"))
  -- if day == 1 then
    tbWorldRank:UpdateRankData();

    LoadLadder(tbWorldRank.WorldRankLadder)

    local count = getn(tbWorldRank.FactionLadders)

    for i = 1, count do
      LoadLadder(tbWorldRank.FactionLadders[i])
    end

    OutputMsg("=================XEP HANG GIANG HO 02:10 HANG NGAY==================");
  -- end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
