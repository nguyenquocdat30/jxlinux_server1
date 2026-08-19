Include("\\script\\zid_jx\\worldrank\\lib.lua")

function TaskShedule()
  TaskName("XÕp h¹ng giang hå")
  TaskInterval(1440)
  TaskTime(18, 00);
  TaskCountLimit(0)
  OutputMsg("=================XEP HANG GIANG HO 02:00 HANG NGAY REQUEST KHOI DONG==================");
end

function TaskContent()
  -- local day = tonumber(date("%w"))
  -- if day == 1 then
    tbWorldRank:RequestRankData();
    OutputMsg("=================XEP HANG GIANG HO 02:00 HANG NGAY REQUEST==================");
  -- end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
