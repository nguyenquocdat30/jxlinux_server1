-------------------------------------------------***Create*By*Heart*Doldly***---------------------------------------------------------------
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\composeex.lua")
Include("\\script\\global\\zid_jx\\tinhnang\\hotonghuyetthu\\head.lua")

----------------------------------------------------------------
function main()
Say("<color=green>Nghe Nãi GÇn §©y Cã §oµn Ng­êi §ang §i Hé Tèng Bao L­¬ng Lªn Kinh Thµnh NÕu §Ó Hoµng Th­îng BiÕt VÒ VÊn N¹n Nµy Th× Nguy HiÓm Ng­¬i H·y Nhanh §i Tranh §o¹t Nã VÒ §©y Ta Ban Th­ëng HËu HÜnh",2,"Ta Muèn Giao Hé Tiªu LÖnh Cho §¹i Nh©n/GiaoBucHuyetThu","KÕt Thóc §èi Tho¹i/No")
end

function GiaoBucHuyetThu()
local BucHuyetThu = CalcEquiproomItemCount(6,1,30317,1)
	if (BucHuyetThu >= 1) then
		if (CalcFreeItemCellCount() >= 10) then
			ConsumeEquiproomItem(1,6,1,30317,-1)
			tbAwardTemplet:GiveAwardByList({tbProp={4,417,1,1,0,0},nCount=100},1)
		else
			Talk(1,"","<color=red>H·y §Ó Trèng 10 ¤ Råi NhËn Th­ëng")
		end
	else
		Talk(1,"","<color=yellow>Hé Tiªu LÖnh Mµ Ng­êi §· C­íp §­îc §©u Sao Ta Kh«ng ThÊy\n          H·y Mau §i Tranh §o¹t VÒ §©y Ta Ban Th­ëng")
	end
end