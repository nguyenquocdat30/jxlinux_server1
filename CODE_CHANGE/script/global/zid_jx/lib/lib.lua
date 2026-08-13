KyTranDiBao = {
	{{6, 1, 23}, "ThiÕt la h¸n"},
	{{6, 1, 15}, "Phi phong"},
	{{4, 353, 1}, "Tinh hång b¶o th¹ch"},
	{{4, 238, 1}, "Lam thñy tinh"},
	{{4, 239, 1}, "Tö thñy tinh"},
	{{4, 240, 1}, "Lôc thñy tinh"},
	{{6, 1, 122}, "Phóc duyªn tiÓu"},
	{{6, 1, 123}, "Phóc duyªn trung"},
	{{6, 1, 124}, "Phóc duyªn ®¹i"},
	{{6, 1, 71}, "Tiªn th¶o lé"},
	{{6, 1, 72}, "Thiªn s¬n th¶o lé"},
	{{6, 1, 73}, "B¸ch qu¶ lé"},
	{{6, 1, 440}, "M¶nh s¬n hµ x· t¾c x100"},
}
function DropKyTranDiBao(MapID, X, Y, PlayerIndex, nTimes, Rs, RE)
		local nRate
		for ji = 1, nTimes do
			for i = 1, getn(KyTranDiBao) do
				nRate = random(0, 200)
				if (nRate >= Rs) and (nRate <= RE) then
					DropItem(MapID, X, Y, PlayerIndex, 
							KyTranDiBao[i][1][1], 
							KyTranDiBao[i][1][2], 
							KyTranDiBao[i][1][3], 1, random(0,4), 0, 0, 0, 0, 0, 0, 0)
				end
			end
		end
end