Include("\\RelaySetting\\Task\\call_big_boss_head.lua")

function TaskShedule()
	TaskName( "BOSS Dai HOANG KIM XUAT HIEN" );
	TaskInterval( 1440 );
	TaskTime( 19, 30 );
	TaskCountLimit( 0 );
	OutputMsg( "                      Boss Dai Hoang Kim " );
	OutputMsg( "                          xuat hien vao 19h hang ngay" );
	OutputMsg( "" );
	
end

function TaskContent()
	local soluongboss = 10;
	MAKE_NEW_BIG_BOSS(soluongboss)
	OutputMsg( " ========================================================================================" );
	OutputMsg( "                               Boss Dai Hoang Kim " );
	OutputMsg( "                          xuat hien vao 19h30 hang ngay" );
	OutputMsg( " ========================================================================================" );
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
