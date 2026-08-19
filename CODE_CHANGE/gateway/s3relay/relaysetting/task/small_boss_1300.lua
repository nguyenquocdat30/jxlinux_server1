Include("\\RelaySetting\\Task\\call_small_boss_head.lua")

function TaskShedule()
	TaskName( "CALLBOSS_MINI_12H00" );
	TaskInterval( 1440 );
	TaskTime( 13, 00 );
	TaskCountLimit( 0 );
	OutputMsg( "                       Boss tieu Hoang Kim phien ban cu" );
	OutputMsg( "                          xuat hien vao 13h00 hang ngay" );
	OutputMsg( "" );
end

function TaskContent()
	SmallBossHK:Call()
	OutputMsg( " ========================================================================================" );
	OutputMsg( "                          Boss tieu Hoang Kim phien ban cu " );
	OutputMsg( "                          xuat hien vao 13h00 hang ngay" );
	OutputMsg( " ========================================================================================" );
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
