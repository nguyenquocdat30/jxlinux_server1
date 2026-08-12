Include("\\script\\global\\zid_jx\\log\\log.lua")

function main()
	if CountFreeRoomByWH(2, 3) <= 0 then
		Talk(1,"","Vui lßng ®Ó trèng Ýt nhÊt 2x3 « hµnh trang míi cã thÓ sö dông vËt phÈm nµy!")
		return 1
	end
	
	local a = {164,165,166,167}
	
	local i = AddGoldItem(0, a[random(1, getn(a))])
	local e = GetItemName(i)
	Msg2Player("B¹n nhËn ®­îc  <color=yellow>"..e.."<color> tõ B¶o R­¬ng An Bang!")
	SaveLogs("baoruonganbang", format("[%s] | Nh©n VËt : %s | Tµi Kho¶n :(%s) | NhËn §­îc ("..e..") Tõ B¶o R­¬ng An Bang!",date("%H:%M:%S - %d/%m/%Y"),GetName(),GetAccount()));
	return 0
end