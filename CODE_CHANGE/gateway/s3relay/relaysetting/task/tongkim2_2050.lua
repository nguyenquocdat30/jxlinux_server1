TIME_HOUR = "20";
TIME_MIN = "50";

function TaskShedule()
	TaskName( "Tèng kim chiÕn quèc  20:50" );
	TaskInterval( 1440 );
	TaskTime(tonumber(TIME_HOUR),tonumber(TIME_MIN));
	TaskCountLimit( 0 );
	OutputMsg("Run TK 21h00 -- Neu La Thu 2 Thi Run Thien Tu");
end

function TaskContent()
	local nWeekday = tonumber(date( "%w "));
	if nWeekday == 1 and (CW_GetCityStatus(4) == 0 and CW_GetOccupant(4) ~= nil) and (CW_GetCityStatus(7) == 0 and CW_GetOccupant(7) ~= nil) then
		if CW_GetOccupant(4) == CW_GetOccupant(7) then
			local szMsg = format( "ChiÕu c¸o thiªn h¹ \"%s\" ®ång thêi, chiÕm lÜnh l©m an vµ BiÖn Kinh, bang chñ kh¶ dÜ trùc tiÕp ®¨ng c¬ suèt ngµy tö", CW_GetOccupant(4));
			local szNews = format( "dw AddLocalCountNews([[%s]], 2)", szMsg);
			GlobalExecute(szNews);
			for i = 0,10 do
				NW_SetTask(i, 0);
			end
			NW_Abdicate();			-- nguyªn lai thiªn tö tho¸i vÞ
			NW_SetTask(0, 1);		-- tèng doanh
		return end
		local szMsg = format( "TiÒn tuyÕn mËt b¸o, tèng n­íc \"%s\" kim quèc \"%s\"Thiªn tö ghÕ tranh ®o¹t ®· b¾t ®Çu, thØnh c¸c vÞ t­íng sÜ ®¸o tèng kim chç ghi danh tham chiÕn!", CW_GetOccupant(7), CW_GetOccupant(4));
		local szNews = format( "dw AddLocalCountNews([[%s]], 2)", szMsg);
		GlobalExecute(szNews);
		Battle_StartNewRound( 2, 3 );	-- GM chØ lÖnh, khëi ®éng n­íc chiÕn tèng kim
	else
		-- Battle_StartNewRound( 1, 1 );	-- S¬ CÊp
		-- Battle_StartNewRound( 1, 2 );	-- Trung CÊp
		Battle_StartNewRound( 1, 3 );	-- Cao CÊp
	end;
end;

function GameSvrConnected(dwGameSvrIP)
end;

function GameSvrReady(dwGameSvrIP)
end;
