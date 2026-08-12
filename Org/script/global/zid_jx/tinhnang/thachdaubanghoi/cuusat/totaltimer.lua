IncludeLib("BATTLE");
Include("\\script\\global\\zid_jx\\tinhnang\\thachdaubanghoi\\cuusat\\head.lua")

function OnTimer()
	State = GetMissionV(MS_STATE) ;
	if (State == 0) then
		return
	end
	CloseMission(MISSIONID)
end;