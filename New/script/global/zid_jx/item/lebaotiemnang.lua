
IncludeLib("SETTING")
IncludeLib("ITEM");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\task\\task_addplayerexp.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
tb_Mareial = 
{
	100000,
	{
		{G=6,D=1,P=4261,L=0,nrate=0.25		,szname="<color=cyan>S¸ch tiÒm n¨ng (søc m¹nh)<color>"},
		{G=6,D=1,P=4262,L=0,nrate=0.25		,szname="<color=cyan>S¸ch tiÒm n¨ng (sinh khÝ)<color>"},
		{G=6,D=1,P=4263,L=0,nrate=0.25		,szname="<color=cyan>S¸ch tiÒm n¨ng (th©n ph¸p)<color>"},
		{G=6,D=1,P=4264,L=0,nrate=0.25		,szname="<color=cyan>S¸ch tiÒm n¨ng (néi c«ng)<color>"},
		}
}

function main()
		local a = CountFreeRoomByWH(2,3)
			if a <= 0 then
			Say("Vui lßng ®Ó trèng Ýt nhÊt 2x3 « hµnh trang míi cã thÓ sö dông vËt phÈm nµy", 1, "V©ng Ta SÏ S¾p XÕp L¹i/OnCancel")
			return 1
		end
Say("VËt PhÈm Sau Khi Sö Dông SÏ NhËn §­îc, NgÉu Nhiªn C¸c VËt PhÈm Sau.<enter><color=cyan>S¸ch tiÒm n¨ng (søc m¹nh)<enter>S¸ch tiÒm n¨ng (sinh khÝ)<enter>S¸ch tiÒm n¨ng (Th©n Ph¸p)<enter>S¸ch tiÒm n¨ng (Néi C«ng)<color>\nNg­¬i Ch¾c Ch¾n Sö Dông Chø ?", 2, "Ch¾c råi/xacnhan", "Ta nhÇm/OnCancel")
return 1;
end

function xacnhan( nItemIndex, nPlayerIndex )
	local a = CountFreeRoomByWH(2,3)
		if a <= 0 then
		Say("Vui lßng ®Ó trèng Ýt nhÊt 2x3 « hµnh trang míi cã thÓ sö dông vËt phÈm nµy", 1, "V©ng Ta SÏ S¾p XÕp L¹i/OnCancel")
		return 1
		end
	if CalcEquiproomItemCount( 6, 1, 4380, 0 ) < 1 then
	return Say("Ng­¬i Kh«ng Cã <color=yellow>Tói S¸ch TiÒm N¨ng<color> trong hµnh trang", 1, "Ta nhÇm/OnCancel")
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
				AddItem(g,d,p,l,0,0)
				local szitemname = nitem["szname"]
				Msg2Player(format("B¹n NhËn §­îc 1 <color=yellow>%s<color>",szitemname))
				ConsumeEquiproomItem(1,6,1,4380,-1)
				return 0
			end
		end
		return 0;
end