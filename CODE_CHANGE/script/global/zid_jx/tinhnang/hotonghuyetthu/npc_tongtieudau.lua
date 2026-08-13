-------------------------------------------------***Create*By*Heart*Doldly***---------------------------------------------------------------
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\composeex.lua")
Include("\\script\\global\\zid_jx\\tinhnang\\hotonghuyetthu\\head.lua")
------------------------------------------------------------------
function myplayersex()
	if (GetSex() == 0) then
		return "§¹i HiÖp"
	else
		return "N÷ HiÖp"
	end
end
------------------------------------------------------------------------
function main()
local nDate = tonumber(GetLocalDate("%d"))
	if (GetTask(TASKTIMEDATE) ~= nDate) then
		SetTask(TASKTIMEDATE, nDate)
		SetTask(TASKLIMITDATE, 0)
		if (ClearAll() == 1) then end
	end
	Say("<color=green>Xin Chµo "..myplayersex().." ë §©y Ta NhiÖm Vô Giao Cho Ng­¬i Cã Muèn Lµm Kh«ng",3,"NhiÖm Vô VËn Tiªu/NhanNhiemVu","KÕt Thóc §èi Tho¹i/No")
end
-----------------------------------------------------------------------------------------------------------------------
function NhanNhiemVu()
local nTime = tonumber(GetLocalDate("%H%M"))
	if (GetTask(TASKLIMITDATE) < TASKMAXCOUNT) then
		if (nTime >= TIMESTART and nTime < TIMEEND) then
			if (GetTask(TASKHUYETTHU) == 0) then
				local x = random(1,28)
				if (x == 1) then
					SetTask(TASKHUYETTHU,1); SetTask(BIENKINH,1); SetTask(CHUTIENTRAN,1); NewWorld(37,1687,3149) --BiÖn Kinh > Chu Tiªn TrÊn
				elseif (x == 2) then
					SetTask(TASKHUYETTHU,2); SetTask(CHUTIENTRAN,1); SetTask(BIENKINH,1); NewWorld(100,1655,3144) --Chu Tiªn TrÊn > BiÖn Kinh
				elseif (x == 3) then
					SetTask(TASKHUYETTHU,3); SetTask(TUONGDUONG,1); SetTask(DAOHUONGTHON,1); NewWorld(78,1601,3228) --T­¬ng D­¬ng > §¹o H­¬ng Th«n
				elseif (x == 4) then
					SetTask(TASKHUYETTHU,4); SetTask(DAOHUONGTHON,1); SetTask(TUONGDUONG,1); NewWorld(101,1634,3208) --§¹o H­¬ng Th«n > T­¬ng D­¬ng
				elseif (x == 5) then
					SetTask(TASKHUYETTHU,5); SetTask(THANHDO,1); SetTask(GIANGTANTHON,1); NewWorld(11,3058,4992) --Thµnh §« > Giang T©n Th«n
				elseif (x == 6) then
					SetTask(TASKHUYETTHU,6); SetTask(GIANGTANTHON,1); SetTask(THANHDO,1); NewWorld(20,3515,6160) --Giang T©n Th«n > Thµnh §«
				elseif (x == 7) then
					SetTask(TASKHUYETTHU,7); SetTask(PHUONGTUONG,1); SetTask(VINHLACTRAN,1); NewWorld(1,1597,3094) --Ph­îng T­êng > VÜnh L¹c TrÊn
				elseif (x == 8) then
					SetTask(TASKHUYETTHU,8); SetTask(VINHLACTRAN,1); SetTask(PHUONGTUONG,1); NewWorld(99,1667,3227) --VÜnh L¹c TrÊn > Ph­îng T­êng
				elseif (x == 9) then
					SetTask(TASKHUYETTHU,9); SetTask(DAILY,1); SetTask(THACHCOTRAN,1); NewWorld(162,1637,3216) --§¹i Lý > Th¹ch Cæ TrÊn
				elseif (x == 10) then
					SetTask(TASKHUYETTHU,10); SetTask(THACHCOTRAN,1); SetTask(DAILY,1); NewWorld(153,1621,3199) --Th¹ch Cæ TrÊn > §¹i Lý
				elseif (x == 11) then
					SetTask(TASKHUYETTHU,11); SetTask(DUONGCHAU,1); SetTask(DAOHUONGTHON,1); NewWorld(80,1782,3035) --D­¬ng Ch©u > §¹o H­¬ng Th«n
				elseif (x == 12) then
					SetTask(TASKHUYETTHU,12); SetTask(DAOHUONGTHON,1); SetTask(DUONGCHAU,1); NewWorld(101,1634,3208) --§¹o H­¬ng Th«n > D­¬ng Ch©u
				elseif (x == 13) then
					SetTask(TASKHUYETTHU,13); SetTask(LAMAN,1); SetTask(LONGTUYENTHON,1); NewWorld(176,1418,3310) --L©m An > Long TuyÒn Th«n
				elseif (x == 14) then
					SetTask(TASKHUYETTHU,14); SetTask(LONGTUYENTHON,1); SetTask(LAMAN,1); NewWorld(174,1595,3267) --Long TuyÒn Th«n > L©m An
				elseif (x == 15) then
					SetTask(TASKHUYETTHU,15); SetTask(THANHDO,1); SetTask(VINHLACTRAN,1); NewWorld(11,3059,4993) --Thµnh §« > VÜnh L¹c TrÊn
				elseif (x == 16) then
					SetTask(TASKHUYETTHU,16); SetTask(VINHLACTRAN,1); SetTask(THANHDO,1); NewWorld(99,1667,3227) --VÜnh L¹c TrÊn > Thµnh §«
				elseif (x == 17) then
					SetTask(TASKHUYETTHU,17); SetTask(THANHDO,1); SetTask(PHUONGTUONG,1); NewWorld(11,3059,4993) --Thµnh §« > Ph­îng T­êng
				elseif (x == 18) then
					SetTask(TASKHUYETTHU,18); SetTask(PHUONGTUONG,1); SetTask(THANHDO,1); NewWorld(1,1597,3094) --Ph­îng T­êng > Thµnh §«
				elseif (x == 19) then
					SetTask(TASKHUYETTHU,19); SetTask(TUONGDUONG,1); SetTask(CHUTIENTRAN,1); NewWorld(78,1603,3228) --T­¬ng D­¬ng > Chu Tiªn TrÊn
				elseif (x == 20) then
					SetTask(TASKHUYETTHU,20); SetTask(CHUTIENTRAN,1); SetTask(TUONGDUONG,1); NewWorld(100,1655,3145) --Chu Tiªn TrÊn > T­¬ng D­¬ng
				elseif (x == 21) then
					SetTask(TASKHUYETTHU,21); SetTask(TUONGDUONG,1); SetTask(BIENKINH,1); NewWorld(78,1603,3228) --T­¬ng D­¬ng > BiÖn Kinh
				elseif (x == 22) then
					SetTask(TASKHUYETTHU,22); SetTask(BIENKINH,1); SetTask(TUONGDUONG,1); NewWorld(37,1687,3149) --BiÖn Kinh > T­¬ng D­¬ng
				elseif (x == 23) then
					SetTask(TASKHUYETTHU,23); SetTask(PHUONGTUONG,1); SetTask(GIANGTANTHON,1); NewWorld(1,1597,3094) --Ph­îng T­êng > Giang Tan Thon
				elseif (x == 24) then
					SetTask(TASKHUYETTHU,24); SetTask(GIANGTANTHON,1); SetTask(PHUONGTUONG,1); NewWorld(20,3514,6158) --Giang Tan Thon > Ph­îng T­êng
				elseif (x == 25) then
					SetTask(TASKHUYETTHU,25); SetTask(BIENKINH,1); SetTask(DAOHUONGTHON,1); NewWorld(37,1687,3149) --BiÖn Kinh > §¹o H­¬ng Th«n
				elseif (x == 26) then
					SetTask(TASKHUYETTHU,26); SetTask(DAOHUONGTHON,1); SetTask(BIENKINH,1); NewWorld(101,1635,3209) --§¹o H­¬ng Th«n > BiÖn Kinh
				elseif (x == 27) then
					SetTask(TASKHUYETTHU,27); SetTask(BIENKINH,1); SetTask(DUONGCHAU,1); NewWorld(37,1687,3149) --BiÖn Kinh > D­¬ng Ch©u
				elseif (x == 28) then
					SetTask(TASKHUYETTHU,28); SetTask(DUONGCHAU,1); SetTask(BIENKINH,1); NewWorld(80,1781,3034) --D­¬ng Ch©u > BiÖn Kinh
				end
				SetTask(TASKLIMITDATE,GetTask(TASKLIMITDATE)+1)
			else
				Say("<color=yellow>Ng­¬i §· NhËn NhiÖm Nµy Råi H·y Mau §i Hoµn Thµnh §i",2,"§­a Ta §Õn N¬i Lµm NhiÖm Vô/MoveApThu","Th«i Ta Tù §i/No")
			end
		else
			Talk(1,"","<color=yellow>Thêi Gian B¾t §Çu Tõ <color=red>"..BATDAU.."<color> §Õn <color=red>"..KETTHUC.."<color> Hµng Ngµy Vui Lßng Quay L¹i Sau")
		end
	else
		Talk(1,"","<color=yellow>H«m Nay Ng­¬i §· Hoµn Thµnh <color=red>"..TASKMAXCOUNT.."<color> LÇn Råi\n                         Ngµy Mai H·y TiÕp Tôc")
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------