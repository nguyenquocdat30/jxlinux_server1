
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
		{G=6,D=1,P=23,L=0,nrate=0.25		,szname="<color=cyan>ThiÕt La H¸n<color>"},
		{G=6,D=1,P=124,L=0,nrate=0.14		,szname="<color=cyan>Phóc Duyªn Lé (§¹i)<color>"},
		{G=4,D=238,P=1,L=-1,nrate=0.12		,szname="<color=cyan>Lam Thuû Tinh<color>"},
		{G=4,D=239,P=1,L=-1,nrate=0.12		,szname="<color=cyan>Tö Thuû Tinh<color>"},
		{G=4,D=240,P=1,L=-1,nrate=0.12		,szname="<color=cyan>Lôc Thuû Tinh<color>"},
		{G=6,D=1,P=71,L=0,nrate=0.25		,szname="<color=cyan>Tiªn Th¶o Lé<color>"},
		
		}
}

function main( nItemIndex, nPlayerIndex )
		local a = CountFreeRoomByWH(2,3)
			if a <= 0 then
				Say("Vui lßng ®Ó trèng Ýt nhÊt 2x3 « hµnh trang míi cã thÓ sö dông vËt phÈm nµy", 1, "V©ng Ta SÏ S¾p XÕp L¹i/OnCancel")
			return 1
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
				return 0
			end
		end
		return 0;
end