
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
		{G=6,D=1,P=150,L=0,S=0,nrate=0.08		,szname="<color=cyan>§¸ Èn 1 HÖ <color=yellow>Kim<color><color>"},
		{G=6,D=1,P=150,L=0,S=1,nrate=0.08		,szname="<color=cyan>§¸ Èn 1 HÖ <color=wood>Méc<color><color>"},
		{G=6,D=1,P=150,L=0,S=2,nrate=0.07		,szname="<color=cyan>§¸ Èn 1 HÖ <color=blue>Thuû<color><color>"},
		{G=6,D=1,P=150,L=0,S=3,nrate=0.03		,szname="<color=cyan>§¸ Èn 1 HÖ <color=fire>Ho¶<color><color>"},
		{G=6,D=1,P=150,L=0,S=4,nrate=0.07		,szname="<color=cyan>§¸ Èn 1 HÖ <color=white>Thæ<color><color>"},
		{G=6,D=1,P=152,L=0,S=0,nrate=0.08		,szname="<color=cyan>§¸ Èn 2 HÖ <color=yellow>Kim<color><color>"},
		{G=6,D=1,P=152,L=0,S=1,nrate=0.08		,szname="<color=cyan>§¸ Èn 2 HÖ <color=wood>Méc<color><color>"},
		{G=6,D=1,P=152,L=0,S=2,nrate=0.07		,szname="<color=cyan>§¸ Èn 2 HÖ <color=blue>Thuû<color><color>"},
		{G=6,D=1,P=152,L=0,S=3,nrate=0.03		,szname="<color=cyan>§¸ Èn 2 HÖ <color=fire>Ho¶<color><color>"},
		{G=6,D=1,P=152,L=0,S=4,nrate=0.07		,szname="<color=cyan>§¸ Èn 2 HÖ <color=white>Thæ<color><color>"},
		{G=6,D=1,P=154,L=0,S=0,nrate=0.08		,szname="<color=cyan>§¸ Èn 3 HÖ <color=yellow>Kim<color><color>"},
		{G=6,D=1,P=154,L=0,S=1,nrate=0.08		,szname="<color=cyan>§¸ Èn 3 HÖ <color=wood>Méc<color><color>"},
		{G=6,D=1,P=154,L=0,S=2,nrate=0.07		,szname="<color=cyan>§¸ Èn 3 HÖ <color=blue>Thuû<color><color>"},
		{G=6,D=1,P=154,L=0,S=3,nrate=0.04		,szname="<color=cyan>§¸ Èn 3 HÖ <color=fire>Ho¶<color><color>"},
		{G=6,D=1,P=154,L=0,S=4,nrate=0.07		,szname="<color=cyan>§¸ Èn 3 HÖ <color=white>Thæ<color><color>"},
		
		}
}

function main( nItemIndex, nPlayerIndex )
	local a = CountFreeRoomByWH(2,3)
		if a <= 0 then
		Say("Vui lßng ®Ó trèng Ýt nhÊt 2x3 « hµnh trang míi cã thÓ sö dông vËt phÈm nµy", 1, "V©ng Ta SÏ S¾p XÕp L¹i/OnCancel")
		return 1
		end
	if CalcEquiproomItemCount( 6, 1, 4392, 0 ) < 1 then
	return Say("Ng­¬i Kh«ng Cã <color=yellow>B¶o R­¬ng §¸ Èn<color> trong hµnh trang", 1, "Ta nhÇm/OnCancel")
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
				local s = nitem["S"];
				local szitemname = nitem["szname"]
				AddItem(g,d,p,l,s,0)
				return_()
				Msg2Player(format("B¹n NhËn §­îc 1 <color=yellow>%s<color>",szitemname))
				SaveLogs("ruongdaan", format("[%s] | Nh©n VËt : %s | Tµi Kho¶n :(%s) | NhËn §­îc ("..szitemname..") Tõ B¶o R­¬ng §¸ Èn!",date("%H:%M:%S - %d/%m/%Y"),GetName(),GetAccount()));
				return 0
			end
		end
		return 0;
end

function return_(nItemIndex, nPlayerIndex)

	local nrate = random(1,tb_Mareial[1]);
		local nsum = 0
		for nkey,nitem in tb_Mareial[2] do
			nsum = nsum + (nitem["nrate"] * tb_Mareial[1])
			if (nsum > nrate) then
				local g = nitem["G"];
				local d = nitem["D"];
				local p = nitem["P"];
				local l = nitem["L"];
				local s = nitem["S"];
				local szitemname = nitem["szname"]
				AddItem(g,d,p,l,s,0)
				Msg2Player(format("B¹n NhËn §­îc 1 <color=yellow>%s<color>",szitemname))
				SaveLogs("ruongdaan", format("[%s] | Nh©n VËt : %s | Tµi Kho¶n :(%s) | NhËn §­îc ("..szitemname..") Tõ B¶o R­¬ng §¸ Èn!",date("%H:%M:%S - %d/%m/%Y"),GetName(),GetAccount()));
				return 1
			end
		end
end