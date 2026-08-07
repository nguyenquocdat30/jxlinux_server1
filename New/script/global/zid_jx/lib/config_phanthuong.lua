IncludeLib("BATTLE")
Include("\\script\\global\\zid_jx\\lib\\lib.lua")
Include("\\script\\lib\\awardtemplet.lua")

/*[[ File l­u tr÷ hµm nhËn phÇn th­ëng khi tham gia c¸c ho¹t ®éng trong game ]]*/
--===============================================================================================-
	/*[[   Tèng Kim   ]]*/
	
function Activity_EnBattle_(nBattleLevel, tbPlayerAll, tbPlayerWin, tbPlayerLos, nWinLos)
	local a = PlayerIndex
	local b, c, d, e = 0, tonumber(GetLocalDate("%H")), 0, 1773
	local Tdate = floor(FormatTime2Number(GetCurServerTime()+24*60*60)/10000)
	
	for _i = 1, getn(tbPlayerWin) do
		PlayerIndex = tbPlayerWin[_i]
		b = BT_GetData(1)
		
		if c >= 21 and c < 23 and nBattleLevel >= 2 then
			e = 4318
			
			if b >= 5000 and nBattleLevel >= 2 then
				AddItem(5,4,417,1,1,0,0,0)
				Msg2Player("B¹n thÓ hiÖn b¶n lÜnh qu¸ næi bËt trong trËn th¾ng nµy, b¹n nhËn ®­îc 5 TiÒn §ång !")
			end
		end
		
		if b >= 1000 then
			d = AddItem(6,1,e,1,0,0)
			SetSpecItemParam(d, 1,floor(Tdate/10000)+2000);
			SetSpecItemParam(d, 2,floor(mod(Tdate,10000)));
			SyncItem(d)
			SetItemBindState(d, -2);
			Msg2Player("B¹n nhËn ®­îc 1 TiÒn §ång")
		end
	end
	
	if c >= 21 and c < 23 and nBattleLevel >= 2 then
		for _i = 1, getn(tbPlayerLos) do
			PlayerIndex = tbPlayerLos[_i]
			b = BT_GetData(1)
			
			if b >= 3000 then
				d = AddItem(6,1,e,1,0,0)
				SetSpecItemParam(d, 1,floor(Tdate/10000)+2000);
				SetSpecItemParam(d, 2,floor(mod(Tdate,10000)));
				SyncItem(d)
				SetItemBindState(d, -2);
				Msg2Player("B¹n nhËn ®­îc 5 TiÒn §ång")
			end
		end
	end
	
	PlayerIndex = a

end

--===============================================================================================-

	/*[[   Viªm ®Õ b¶o tµng   ]]*/

-- KÕt thóc Viªm ®Õ b¶o tµng
function Activity_EnYandiBaozang()
	local nexp = 500000
	AddOwnExp(nexp)
	Msg2Player(format("<color=yellow>Chóc mõng hoµn thµnh v­ît ¶i viªm ®Õ, thu ®­îc <color>%s kinh nghiÖm<color=yellow>.<color>",nexp))
	AddItem(6,1,2805,1,0,0)
	Msg2Player("NhËn ®­îc 1 <color=yellow>Viªm §Õ BÝ B¶o<color>")
end
-- Qu¸i cuèi cïng cña ¶i chÕt, chuyÓn tiÕp ¶i tiÕp theo
function Activity_DeathLastNpcAiYandiBaozang(MapID, X, Y, PlayerIndex)
	DropKyTranDiBao(MapID, X, Y, -1, 1, 79, 80)
end
--===============================================================================================-
	/*[[   V­ît ¶i (NhÝp ThÝ TrÇn)   ]]*/

-- Hoµn thµnh v­ît ¶i 
function Activity_EnChallengeOfTime()
	local nexp = 100000
	AddOwnExp(nexp)
	AddItem(6,1,1392,1,0,0)
	Msg2Player(format("<color=yellow>Chóc mõng hoµn thµnh v­ît ¶i, thu ®­îc <color>%s kinh nghiÖm<color=yellow> vµ 1 LÔ VËt V­ît ¶i<color>",nexp))
end
-- Qu¸i cuèi cïng cña ¶i chÕt, chuyÓn tiÕp ¶i tiÕp theo
function Activity_DeathLastNpcChallengeOfTime(MapID, X, Y)
	DropKyTranDiBao(MapID, X, Y, -1, 1, 79, 80)
end
--===============================================================================================-

	/*[[   Phong l¨ng ®é   ]]*/
	
-- KÕt thóc Phong L¨ng §é (®i ®Õn bê b¾c thµnh c«ng)
function Activity_EnFengLingFerry()
	local nexp = 5000000
	AddOwnExp(nexp)
	Msg2Player(format("<color=yellow>Chóc mõng hoµn thµnh Phong L¨ng §é, thu ®­îc %s kinh nghiÖm<color>",nexp))
end

-- H¹ gôc ®­îc Boss
function Activity_DeathBossFengLingFerry(MapID, X, Y)
	local nexp = 5000000
	AddOwnExp(nexp)
	DropKyTranDiBao(MapID, X, Y, -1, 1, 79, 85)
	
	local a = {
		{{6, 1, 71, 1, 0,0,0}, "Tiªn th¶o lé"},
		{{6, 1, 12, 1, 0,0,0}, "Bµn Nh­îc T©m Kinh"},
		{{4, 238, 1, 1, 0,0,0}, "Lam thñy tinh"},
		{{4, 239, 1, 1, 0,0,0}, "Tö thñy tinh"},
		{{4, 240, 1, 1, 0,0,0}, "Lôc thñy tinh"},
		{{4, 353, 1, 1, 0,0,0}, "Tinh hång b¶o th¹ch"},
		{{6, 1, 122, 1, 0,0,0}, "Phóc duyªn tiÓu"},
		{{6, 1, 123, 1, 0,0,0}, "Phóc duyªn trung"},
	}
	
	for _i = 1, getn(a) do
		if random(1, 100) <= 4 then
			DropItem(MapID, X, Y, (PlayerIndex or -1), a[_i][1][1], a[_i][1][2], a[_i][1][3], 1, random(0,4), 0, 0, 0, 0, 0, 0, 0)
		end
	end
	Msg2Player(format("<color=yellow>H¹ Gôc Boss Thuû TÆc §Çu LÜnh, thu ®­îc %s kinh nghiÖm<color>",nexp))
end

--===============================================================================================-

	/*[[   Hoa S¬n §¹i ChiÕn   ]]*/
	
-- Ng­êi chiÕn th¾ng trong Hoa S¬n §¹i ChiÕn
function Activity_EnHuaShanqunzhan()
	if CalcFreeItemCellCount() < 20 then
		return Say("Tói hµnh trang ®· ®Çy, h·y dän dÑp hµnh trang ®Ó b¶o ®¶m an toµn cho vËt phÈm.",0)
	end
		local tbAward = 
		{
			{szName="Lam Thñy Tinh", tbProp={4, 238, 1, 1, 0, 0}, nCount = 2},
			{szName="Lôc Thñy Tinh", tbProp={4, 240, 1, 1, 0, 0}, nCount = 2},
			{szName="Tö Thñy Tinh", tbProp={4, 239, 1, 1, 0, 0}, nCount = 2},
			{szName="Tinh Hång B¶o Th¹ch", tbProp={4, 353, 1, 1, 0, 0}, nCount = 12},
			{szName="Vâ L©m MËt TÞch", tbProp={6, 1, 26, 1, 0, 0}},
			{szName="TÈy Tñy Kinh", tbProp={6, 1, 22, 1, 0, 0}},
		}
		local nCount = GetTask(huashanqunzhan.TSK_Winer)
		
		tinsert(tbAward, { nJxb = 90000 * nCount})
		
		tbAwardTemplet:GiveAwardByList(tbAward, "L«i §µi Hoa S¬n §¹i ChiÕn")
	return 1
end
--===============================================================================================-

