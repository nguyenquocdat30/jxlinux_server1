Include("\\script\\global\\zid_jx\\log\\log.lua")

function main()
	if CountFreeRoomByWH(2, 3) <= 0 then
		Talk(1,"","Vui lﬂng Æ” trËng ›t nh t 2x3 ´ hµnh trang mÌi c„ th” sˆ dÙng vÀt ph»m nµy!")
		return 1
	end
	
	local a = {186,187,188,189}
	
	local i = AddGoldItem(0, a[random(1, getn(a))])
	local e = GetItemName(i)
	Msg2Player("Bπn nhÀn Æ≠Óc  <color=yellow>"..e.."<color> tı B∂o R≠¨ng Hi÷p CËt!")
	SaveLogs("baoruonghiepcot", format("[%s] | Nh©n VÀt : %s | Tµi Kho∂n :(%s) | NhÀn ß≠Óc ("..e..") Tı B∂o R≠¨ng Hi÷p CËt!",date("%H:%M:%S - %d/%m/%Y"),GetName(),GetAccount()));
	return 0
end