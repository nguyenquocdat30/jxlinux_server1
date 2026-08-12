
IncludeLib("SETTING")
IncludeLib("ITEM");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\task\\task_addplayerexp.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\global\\zid_jx\\log\\log.lua")




tb_Mareial = 
{
	100000,
		{
			{G=0,D=10,P=5,L=6,nrate=0.22		,szname="¤ V©n §¹p TuyÕt"},
			{G=0,D=10,P=5,L=7,nrate=0.19		,szname="XÝch Thè"},
			{G=0,D=10,P=5,L=8,nrate=0.22		,szname="TuyÖt ¶nh"},
			{G=0,D=10,P=5,L=9,nrate=0.22		,szname="§Ých L«"},
			{G=0,D=10,P=5,L=10,nrate=0.15		,szname="ChiÕu D¹ Ngäc S­ Tö"},
		}
}

function main()
	local a = CountFreeRoomByWH(2,3)
		if a <= 0 then
			Say("Vui lßng ®Ó trèng Ýt nhÊt 2x3 « hµnh trang míi cã thÓ sö dông vËt phÈm nµy", 1, "V©ng Ta SÏ S¾p XÕp L¹i/OnCancel")
			return 1
		end
	Say("VËt PhÈm Sau Khi Sö Dông SÏ NhËn §­îc .\n <color=green>¤ V©n §¹p TuyÕt = 22% \n XÝch Thè = 19% \n TuyÖt ¶nh = 22% \n §Ých L« = 22% \n ChiÕu D¹ Ngäc S­ Tö = 15%<color>\n Ng­¬i Ch¾c Ch¾n Sö Dông Chø ?", 2, "Ch¾c råi/xacnhan", "Ta nhÇm/OnCancel")
	return 1;
end

function xacnhan( nItemIndex, nPlayerIndex )
	local a = CountFreeRoomByWH(2,3)
		if a <= 0 then
		Say("Vui lßng ®Ó trèng Ýt nhÊt 2x3 « hµnh trang míi cã thÓ sö dông vËt phÈm nµy", 1, "V©ng Ta SÏ S¾p XÕp L¹i/OnCancel")
		return 1
		end
	if CalcEquiproomItemCount( 6, 1, 4383, 0 ) < 1 then
	return Say("Ng­¬i Kh«ng Cã ChiÕn M· 80 LÔ Bao trong hµnh trang", 1, "Ta nhÇm/OnCancel")
	end
	local nrate = random(1,tb_Mareial[1]);
		local nsum = 0
		for nkey,nitem in tb_Mareial[2] do
			nsum = nsum + (nitem["nrate"] * tb_Mareial[1])
			if (nsum > nrate) then
				local g = nitem["G"];
				local d = nitem["D"];
				local p = nitem["P"];
				local l = nitem["L"];
				local nidx = AddItem(g,d,p,l,0,0)
				local szitemname = nitem["szname"]

				Msg2Player(format("B¹n NhËn §­îc 1 <color=yellow>%s<color>",szitemname))
				SaveLogs("chienmalebao", format("[%s] | Nh©n VËt : %s | Tµi Kho¶n :(%s) | NhËn §­îc ("..szitemname..") Tõ ChiÕn M· LÔ Bao !",date("%H:%M:%S - %d/%m/%Y"),GetName(),GetAccount()));
				ConsumeEquiproomItem(1,6,1,4383,-1)
				return 0
			end
		end
		return 0;
end