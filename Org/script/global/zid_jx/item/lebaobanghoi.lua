Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\global\\zid_jx\\log\\log.lua")
IncludeLib("ITEM")
function main(nItemIndex)
	SetCamp(4)
	SetCurCamp(4)
	AddRepute(500)
	AddLeadExp(100000000)
	AddEventItem(195)
	Earn(1000000)
	Msg2Player("<color=yellow>Ng­êi ®· héi ®ñ tÊt c¶ ®iªu kiÖn ®Ó t¹o Bang Héi! H·y ®Õn Hoa S¬n C¶nh Tñy Tr­êng, t×m ch­ëng m«n Hoa S¬n LËp Bang<color>")
	SaveLogs("lebaobanghoi", format("[%s] | Nh©n VËt : %s | Tµi Kho¶n :(%s) | Më Thµnh C«ng LÔ Bao Bang Héi !",date("%H:%M:%S - %d/%m/%Y"),GetName(),GetAccount()));
end

