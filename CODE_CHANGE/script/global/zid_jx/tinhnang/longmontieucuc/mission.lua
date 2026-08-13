
Include("\\script\\global\\zid_jx\\tinhnang\\longmontieucuc\\head.lua");

function InitMission()
	tbAloneShipped:ClearAllNpcParam()
	StartGlbMSTimer(MISSION_ID,MISSION_ID_TIMER1,TIMER1);
	StartGlbMSTimer(MISSION_ID,MISSION_ID_TIMER2,TIMER2);
	RunGlbMission(MISSION_ID);
end

function RunMission()
	SetGlbMissionV(MISSIONV_GLB_STATE,1);
end

function EndMission()	
	StopGlbMSTimer(MISSION_ID,MISSION_ID_TIMER1)
	StopGlbMSTimer(MISSION_ID,MISSION_ID_TIMER2)
	tbAloneShipped:ResetMission()
	tbAloneShipped:ClearAllNpcParam()
	tbAloneShipped:RemoveAllCarrier()
end