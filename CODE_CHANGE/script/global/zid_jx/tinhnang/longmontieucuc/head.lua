

IncludeLib("TONG");
IncludeLib("TASKSYS");
Include("\\script\\lib\\gb_taskfuncs.lua");
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\dailogsys\\dailogsay.lua");

MISSION_ID = 72;
MISSION_ID_TIMER1 = 123;
MISSION_ID_TIMER2 = 124;

MISSIONV_GLB_STATE = 2;

FRAMETIME = 18;
TIMER1 = 10*FRAMETIME;
TIMER2 = 50*60*FRAMETIME;

NPCPARAM_MOVE = 1;
NPCPARAM_TIMER = 2;
NPCPARAM_BEGIN = 3;

PARAM_TIMER_BEGIN = 0;
PARAM_TIMER_TIMEOUT = 30*60+PARAM_TIMER_BEGIN;
PARAM_TIMER_CHANGE = 10*60;

TB_TONG_FIGURE_NAME = {
	[0]	=	"Bang chñ ",
	[1]	=	"Tr­ëng L·o",
}

TB_POSITION_LAG = {
	{{100,1509,2854}, {37,1948,3848}},
}

SCRIPT_GIVETASK = "\\script\\global\\zid_jx\\tinhnang\\longmontieucuc\\npctask.lua";
SCRIPT_RETASK = "\\script\\global\\zid_jx\\tinhnang\\longmontieucuc\\npcretask.lua";
SCRIPT_DIALOG = "\\script\\global\\zid_jx\\tinhnang\\longmontieucuc\\npcdialog.lua";
SCRIPT_CARRIER = "\\script\\global\\zid_jx\\tinhnang\\longmontieucuc\\npccarrier.lua";

TASKTONG_COUNT = 10;
TASKTONG_DATE = 11;
TONG_COUNT = 2;
TASK_STRING = "Long M«n Tiªu Côc";

TB_NPCTASK_DIALOG = {
	{187,37,1631,3174,"¤ng chñ Tiªu Côc Lôc Tam C©n", SCRIPT_DIALOG},
	{376,100,1597,3114,"Long M«n Tiªu S­", SCRIPT_GIVETASK},
	{376,37,1713,3221,"Long M«n Tiªu S­", SCRIPT_RETASK},
}

if not tbAloneShipped then tbAloneShipped = {}; end

function tbAloneShipped:AddNpcDialog()
	local tbNpcTask = TB_NPCTASK_DIALOG;
	for i = 1, getn(tbNpcTask) do
		local nNpcIndex = AddNpc(tbNpcTask[i][1],1,SubWorldID2Idx(tbNpcTask[i][2]),tbNpcTask[i][3]*32,tbNpcTask[i][4]*32,1,tbNpcTask[i][5])
		SetNpcScript(nNpcIndex, tbNpcTask[i][6]);
	end
end

function tbAloneShipped:GetPlaceReTask(nNpcIndex)
	local tbNpcTask = TB_NPCTASK_DIALOG;
	local nNpcPosX, nNpcPosY, nNpcPosW = GetNpcPos(nNpcIndex);
	local nPosX32, nPosY32, nPosW = nNpcPosX/32, nNpcPosY/32, SubWorldIdx2ID(nNpcPosW);
	for i = 1, getn(tbNpcTask) do
		if (tbNpcTask[i][6] == SCRIPT_RETASK) then
			if (tbNpcTask[i][2] == nPosW) then
				if ((nPosX32 <= tbNpcTask[i][3]+3) and (nPosY32 <= tbNpcTask[i][4]+3)) and ((nPosX32 >= tbNpcTask[i][3]-3) and (nPosY32 >= tbNpcTask[i][4]-3)) then
					return 1
				end
			end
		end
	end
return 0; end

function tbAloneShipped:GetPlayerCarrier(nNpcIndex)
	local tbParam = {};
	local nPosX,nPosY,nPosW, nAround;
	local tbPlayer = self:GetAllNpcParam();
	local szNpcName = GetNpcName(nNpcIndex);
	if (tbPlayer[szNpcName]) then
		local nPlayerIndex = SearchPlayer(tbPlayer[szNpcName][1]);
			PlayerIndex = nPlayerIndex;
				nPosW,nPosX,nPosY = GetWorldPos();
				nAround = self:GetAroundPlayer(nNpcIndex,nPlayerIndex);
			tbParam = {tbPlayer[szNpcName][1],nPlayerIndex,nPosW,nPosX,nPosY,nAround};
	end
return tbParam; end

function tbAloneShipped:GetAroundPlayer(nNpcIndex, nPlayerIndex)
	local tbAllPlayer, nPlayerCount = GetNpcAroundPlayerList(nNpcIndex,15);
	for i = 1, nPlayerCount do
		if (nPlayerIndex == tbAllPlayer[i]) then
			return 1;
		end
	end
return 0; end

function tbAloneShipped:GetAllNpcParam()
	return self.Param;
end

function tbAloneShipped:GetNpcParam(szName)
	local tbParam = self.Param[szName];
return tbParam end

function tbAloneShipped:SetNpcParam(szName, tbParam)
	self.Param[szName] = tbParam;
end

function tbAloneShipped:GetAllNpcTimer()
	return self.Time;
end

function tbAloneShipped:GetNpcTimer(szName)
	local nTask = self.Time[szName];
	if (type(nTask) == "table") or (nTask == nil) then
		nTask = -1;
	end
return nTask end

function tbAloneShipped:SetNpcTimer(szName, nValue)
	self.Time[szName] = nValue;
end

function tbAloneShipped:GetAllTask()
	return self.Task;
end

function tbAloneShipped:GetTask(szName)
	local nTask = self.Task[szName];
	if (type(nTask) == "table") or (nTask == nil) then
		nTask = -1;
	end
return nTask end

function tbAloneShipped:SetTask(szName, nValue)
	self.Task[szName] = nValue;
end

function tbAloneShipped:ClearNpcParam(nNpcIndex)
	for i = 1, 100 do
		SetNpcParam(nNpcIndex, i, 0)
	end
end

function tbAloneShipped:ClearAllNpcParam()
	local tbAllTask = tbAloneShipped:GetAllTask()
	for x, y in tbAllTask do
		tbAloneShipped:SetTask(x, 0);
	end
	
	local tbAllTimer = tbAloneShipped:GetAllNpcTimer();
	for x,y in tbAllTimer do
		tbAloneShipped:SetNpcTimer(x, 0);
	end
	
	local tbAllParam = tbAloneShipped:GetAllNpcParam();
	for x,y in tbAllParam do
		tbAloneShipped:SetNpcParam(x, {})
	end
	
	local tbAllNotice = tbAloneShipped:GetAllTimeNotice();
	for x,y in tbAllNotice do
		tbAloneShipped:SetTimeNotice(x, 0)
	end
	
	local tbAllWait = tbAloneShipped:GetAllTimeNotice();
	for x,y in tbAllWait do
		tbAloneShipped:SetTimeWait(x, 0)
	end
end

function tbAloneShipped:GetAllTimeNotice()
	return self.Notice
end

function tbAloneShipped:GetTimeNotice(szNpcName)
	local nValue = self.Notice[szNpcName] or 0;
	if (type(nValue) == "table") or (nValue == nil) then
		nValue = 0;
	end
return nValue; end

function tbAloneShipped:SetTimeNotice(szNpcName,nValue)
	self.Notice[szNpcName] = nValue;
end

function tbAloneShipped:GetAllTimeWait()
	return self.Wait
end

function tbAloneShipped:GetTimeWait(szNpcName)
	local nValue = self.Wait[szNpcName];
	if (type(nValue) == "table") or (nValue == nil) then
		nValue = 0;
	end
return nValue; end

function tbAloneShipped:SetTimeWait(szNpcName,nValue)
	self.Wait[szNpcName] = nValue;
end

function tbAloneShipped:GetAllNpcIndex()
	return self.Index;
end

function tbAloneShipped:GetNpcIndex(szNpcName)
	local nIndex = self.Index[szNpcName] or 0;
return nIndex; end

function tbAloneShipped:SetNpcIndex(szNpcName,nValue)
	self.Index[szNpcName] = nValue;
end

function tbAloneShipped:RemoveAllCarrier()
	local tbCarrier = self:GetAllNpcIndex()
	local tb = {};
	for x,y in tbCarrier do
		DelNpc(y) 
	end
	self.Index = tb;
end

function tbAloneShipped:ResetMission()
	SetGlbMissionV(MISSIONV_GLB_STATE,0);
end

function tbAloneShipped:GetTongTask(szTongName, nTask)
	local nDateCur = tonumber(date("%d"));
	local nDateNow = gb_GetTask(szTongName, TASKTONG_DATE);
	if (nDateNow ~= nDateCur) then
		gb_SetTask(szTongName,TASKTONG_DATE,nDateCur);
		gb_SetTask(szTongName,nTask,0);
	end
	return gb_GetTask(szTongName,nTask)
end

function tbAloneShipped:SetTongTask(szTongName,nTask,nValue)
	gb_SetTask(szTongName,nTask,nValue)
end

function tbAloneShipped:InitMain()
	if not self.Task then self.Task = {}; end;
	if not self.Time then self.Time = {}; end;
	if not self.Param then self.Param = {}; end;
	if not self.Notice then self.Notice = {}; end;
	if not self.Index then self.Index = {}; end;
	if not self.Wait then self.Wait = {}; end;
end;

tbAloneShipped:InitMain()