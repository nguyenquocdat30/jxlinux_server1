Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\global\\zid_jx\\log\\log.lua")
IncludeLib("ITEM")
function main(nItemIndex)
	for i = 1,15 do
		AddItem(6,1,4394,0,0,0)
		AddItem(6,1,4395,0,0,0)
	end
	for i = 1,3 do
		AddItem(6,1,4396,0,0,0)
	end
	
	Msg2Player("<color=yellow>B¹n nhËn ®­îc \n<color=green>15 D©y C­¬ng\n15 Cá T­¬i\n3 B¾c §Èu ThuÇn M· ThuËt<color><color>")
	SaveLogs("camnangchienma", format("[%s] | Nh©n VËt : %s | Tµi Kho¶n :(%s) | Më Thµnh C«ng ChiÕn M· LÔ Bao!",date("%H:%M:%S - %d/%m/%Y"),GetName(),GetAccount()));
end

