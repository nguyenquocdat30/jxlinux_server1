

function GetNextTime()
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	local nTotalMin = nMin+5;
	local nMod = mod(nTotalMin,5);
	if (nMod ~= 0) then
		nTotalMin = nTotalMin+(5-nMod);
	end;
	
	if (nTotalMin >= 60) then
		nHour = nHour + 1;
		nMin = 0;
		if (nHour >= 24) then
			nHour = 0;
		end;
	else
		nMin = nTotalMin;
	end;
	return nHour,nMin;
end;

function TaskShedule()
	TaskName("Vﬂng l∆p - 5 phÛt chπy 1 l«n");
	local nHour, nMin = GetNextTime();
	TaskTime(nHour, nMin);
	TaskCountLimit(0);
	TaskInterval(5);

end

function TaskContent()
	GlobalExecute("dwf \\script\\global\\zid_jx\\global\\loop5m.lua Loop5Minutes()");
end

function GameSvrConnected(dwGameSvrIP)
end;
function GameSvrReady(dwGameSvrIP)
end;