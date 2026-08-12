Include("\\script\\global\\zid_jx\\item\\book_head.lua");

function main(nItemIndex)
	
	local nTimeDate = tonumber(date("%d"));
	if (GetTask(TASKID_BOOKPROP_USEDATE) ~= nTimeDate) then
		SetTask(TASKID_BOOKPROP_USEDATE, nTimeDate);
		SetTask(TASKID_BOOKPROP_USECOUNT, 0);
	end;
	
	if (GetTask(TASKID_BOOKPROP_USECOUNT) >= BookProp.UseCountEveryDate) then
		Talk(1,"",format("Mçi ngµy chØ cã thÓ sö dông tèi ®a %d quyÓn s¸ch! H«m nay b¹n ®· sö dông ®ñ %d quyÓn råi.",BookProp.UseCountEveryDate,GetTask(TASKID_BOOKPROP_USECOUNT)));
	return (1) end;
	
	local nPoint = 0;
	local nRandom = random(1,100);
	if (nRandom > 0) and (nRandom < 10) then
		nPoint = 3;
	elseif (nRandom >= 10) and (nRandom <= 30) then
		nPoint = 2;
	elseif (nRandom > 30) and (nRandom <= 100) then
		nPoint = 1;
	end;
	
	SetTask(TASKID_BASEMORE_ENG,GetTask(TASKID_BASEMORE_ENG)+nPoint);
	AddEng(nPoint);
	AddProp(nPoint);
	Msg2Player(format("<color=green>B¹n ®· nhËn thªm %d ®iÓm <color=yellow>néi c«ng<color>!<color>",nPoint));
	SetTask(TASKID_BOOKPROP_USECOUNT, GetTask(TASKID_BOOKPROP_USECOUNT)+1);
	SaveNow();
	return 0;
end;
