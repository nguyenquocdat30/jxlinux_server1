Include("\\script\\global\\zid_jx\\log\\log.lua")

function main()
	if CountFreeRoomByWH(2, 2) <= 0 then
		Talk(1,"","Vui lﬂng Æ” trËng ›t nh t 2x2 ´ hµnh trang mÌi c„ th” sˆ dÙng vÀt ph»m nµy!")
		return 1
	end
	
	local a = {149, 151,153}
	
	local i = AddItem(6, 1, a[random(1, getn(a))], 1, 0,0,0)
	local e = GetItemName(i)
	Msg2Player("ß∑ nhÀn Æ≠Óc  <color=yellow>"..e.."<color> tı B∂o R≠¨ng ß∏ Hi÷n!")
	SaveLogs("baoruongdahien", format("[%s] | Nh©n VÀt : %s | Tµi Kho∂n :(%s) | NhÀn ß≠Óc ("..e..") Tı B∂o R≠¨ng ß∏ Hi÷n!",date("%H:%M:%S - %d/%m/%Y"),GetName(),GetAccount()));
	return 0
end