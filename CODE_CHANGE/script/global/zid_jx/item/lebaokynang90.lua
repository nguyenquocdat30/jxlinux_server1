Include("\\script\\global\\zid_jx\\log\\log.lua")

function main()
	if CountFreeRoomByWH(1, 1) <= 0 then
		Talk(1,"","Vui lßng ®Ó trèng Ýt nhÊt 1 « hµnh trang míi cã thÓ sö dông vËt phÈm nµy!")
		return 1
	end
	
	local a = {56, 57,58,37,38,39,27,28,45,46,47,48,49,59,42,43,40,41,54,55,35,36,53,33,34,50,51,52}
	
	local i = AddItem(6, 1, a[random(1, getn(a))], 1, 0,0,0)
	local e = GetItemName(i)
	Msg2Player("§· nhËn ®­îc 1 cuèn <color=yellow>"..e.."<color> tõ BÝ KÝp LÔ Bao!")
	SaveLogs("lebaobikip9x", format("[%s] | Nh©n VËt : %s | Tµi Kho¶n :(%s) | NhËn §­îc ("..e..") Tõ LÔ Bao BÝ KÝp 90!",date("%H:%M:%S - %d/%m/%Y"),GetName(),GetAccount()));
	return 0
end