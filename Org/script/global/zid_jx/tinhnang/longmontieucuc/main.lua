
Include("\\script\\global\\zid_jx\\tinhnang\\longmontieucuc\\head.lua")

function tbAloneShipped:BeginMission()
	local nHour = tonumber(date("%H"));
	local nMin = tonumber(date("%M"));
	if (nHour >= 11) and (nHour <= 23) then
		OpenGlbMission(MISSION_ID);
		AddGlobalNews("Ho¹t ®éng Long M«n Tiªu Cùc ®· chÝnh chøc khai më, c¸c nh©n sü cïng c¸c bang héi h·y tËp trung vÒ Long M«n TrÊn gÆp Lôc Tam C©n ®Ó nhËn nhiÖm vô ¸p tiªu dµnh cho c¸c bang héi!")
	end
end