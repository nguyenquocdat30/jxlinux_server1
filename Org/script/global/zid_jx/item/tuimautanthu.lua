--»ØÌìÀñ°ü
Include("\\script\\item\\ib\\headshenxingfu.lua")
Include("\\script\\battles\\battlehead.lua")
IncludeLib("RELAYLADDER")
Include("\\script\\lib\\basic.lua");
IncludeLib("TASKSYS")
Include("\\script\\global\\signet_head.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("LEAGUE")
Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
TASK_GAME = 1216
function main(sel)
add_mauhotro()
	return 1	
end;
function add_mauhotro()
local tbProp = {1,2,0,4,0,0,0,0};
						local totalnguhoa = CalcEquiproomItemCount(1,2,0,1);
						local totalcount =CalcFreeItemCellCount();
m = 3
	local nLastTime = GetTask(TASK_GAME)
	local nDifTime =  GetCurServerTime() - nLastTime
	if nDifTime < m then
--	Say("Sau <color=green>"..m-nDifTime.." gi©y<color> míi sö dông tiÕp .")
Msg2Player("<color=cyan>Vui lßng chê sau <color=yellow>"..m - nDifTime.."<color> gi©y n÷a.")
		return
	end
						if totalcount > 0  then  
							--if CalcEquiproomItemCount(1,2,0,4) <= 2 then 
								for k=1,totalcount do 
									local ItemIndex = AddItem(unpack(tbProp));
									SetItemBindState(ItemIndex,-2)
                                                               SetTask(TASK_GAME, GetCurServerTime())
								end
							--end
						end
end