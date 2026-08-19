local _GetNexStartTime = function(nStartHour, nStartMinute, nInterval)
	local nNextHour = nStartHour
	local nNextMinute = nInterval * ceil(nStartMinute / nInterval)
	if nNextMinute >= 60 then	
		nNextHour = nNextHour + floor(nNextMinute / 60)
		nNextMinute = mod(nNextMinute, 60) 
	end
	if (nNextHour >= 24) then
		nNextHour = mod(nNextHour, 24);
	end;
	return nNextHour, nNextMinute
end



function TaskShedule()
	TaskName("LOAN CHIEN ANH HUNG")
	local  nInterval = 60
	local nStartHour = tonumber(date("%H")) ;
	local nStartMinute = tonumber(date("%M"));
	local nNextHour, nNextMinute = %_GetNexStartTime(nStartHour, nStartMinute, nInterval)
	TaskTime(nNextHour, nNextMinute);
	TaskInterval(nInterval)
	TaskCountLimit(0)
	OutputMsg( " ========================================================================================" );
	OutputMsg( "          	   	     LOAN CHIEN ANH HUNG VAO LUC 19h00 . 23h00" );
	OutputMsg( "           	  XOA BANG XEP HANG LOAN CHIEN ANH HUNG LUC 00h00 Hang Ngay" );
end

function TaskContent()
	local nTime = tonumber(date("%H%M"))
	local nWeek	= tonumber(date("%w"))
	local nDate	= tonumber(date("%y%m%d"))
	local nTaskState = tonumber(date("%y%m%d%H"))
	if nTime >= 0000 and nTime <= 0010 then
		Ladder_ClearLadder(10269);
		OutputMsg("XOA XEP HANG LOAN CHIEN ANH HUNG HANG NGAY")
	end
	local zidane = 0
	if (nTime >= 2000 and nTime < 2100) then	
		zidane = 1

	elseif (nTime >= 2200 and nTime < 2259) then
		zidane = 1
	end
	if zidane == 1 then
		local szMsg = "<color=yellow>Loπn Chi’n Anh HÔng <color>Æ∑ Æ’n giÍ b∏o danh, m‰i ng≠Íi nhanh ch©n Æ’n <color=yellow>T≠¨ng D≠¨ng(199/200)<color> g∆p <color=yellow>Thi’t MÈc Ch©n <color>Æ” ghi danh , ThÍi B∏o Danh lµ 10 PhÛt."
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 1)", szMsg))
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
		OutputMsg("=====> BAT DAU BAO DANH LOAN CHIEN ANH HUNG")
			
		RemoteExecute("\\script\\global\\zid_jx\\tinhnang\\loandauanhhung\\head.lua", "NewGame:Open", 0)
	end
end


function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
