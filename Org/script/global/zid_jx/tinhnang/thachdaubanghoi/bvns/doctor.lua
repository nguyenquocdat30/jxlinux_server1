Include("\\script\\global\\zid_jx\\tinhnang\\thachdaubanghoi\\battleinfo.lua")
--¾üÐè¹Ù
function main(sel)
	Say("HËu doanh do ta phô tr¸ch! Ng­¬i cã cÇn gióp ®ì g× kh«ng?",2,"Mua d­îc phÈm/salemedicine","Kh«ng cÇn ®©u! C¶m ¬n!/cancel")
end;

function salemedicine(sel)
Sale(99, 1)
end