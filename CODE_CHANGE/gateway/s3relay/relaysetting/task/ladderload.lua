function GameSvrConnected(dwGameSvrIP)
	SyncAllLadder(dwGameSvrIP)
end;
function GameSvrReady(dwGameSvrIP)
end

function TaskShedule()
TaskName( "Relay BANG XEP HANG" );
TaskInterval( 2440 );
TaskCountLimit( 0 );
OutputMsg( "=======================>Xoa thong tin Xep Hang<========================" );
	for i=10001, 10300 do 
		LoadLadder(i)
	end
	
end

function TaskContent()
	OutputMsg( "===>Xep Hang Khoi Dong Hoan Tat<===" );
end