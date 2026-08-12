Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\file.lua");
Include("\\script\\lib\\string.lua");
Include("\\script\\global\\forbidmap.lua");
Include("\\script\\global\\playerlist.lua")
Include("\\script\\item\\ib\\headshenxingfu.lua")
Include("\\script\\battles\\battlehead.lua")
IncludeLib("RELAYLADDER")
Include("\\script\\lib\\basic.lua");
IncludeLib("TASKSYS")
Include("\\script\\global\\signet_head.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("LEAGUE")
Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
function main()
dofile("script/global/zid_jx/item/baoruongdoxanh.lua")
	if (CalcFreeItemCellCount() < 10) then
		Talk(1,"","Hµnh trang kh«ng ®ñ 10 « trèng, vui lßng s¾p xÕp l¹i hµnh trang!");
	return 1 end;
	local DetailType = random(0,9)
	local ParticualrType = 0
	local Level = random(10,10)
	local Series = random(0,4)
	local Lucky = random(100,250)
	
	if DetailType == 0 then ParticualrType = random(0,5)
	elseif DetailType == 1 then ParticualrType = random(0,2)
	elseif DetailType == 2  then ParticualrType = random(0,13)
	elseif DetailType == 3 then ParticualrType = 0
	elseif DetailType == 4 then ParticualrType = random(0,1)
	elseif DetailType == 5 then ParticualrType = random(0,3)
	elseif DetailType == 6 then ParticualrType = random(0,1)
	elseif DetailType == 7 then ParticualrType = random(0,13)
	elseif DetailType == 8 then ParticualrType = random(0,1)
	elseif DetailType == 9 then ParticualrType = random(0,1)
	end
	
		AddItem(0, DetailType, ParticualrType, Level, Series, Lucky, 10)
		ConsumeEquiproomItem(1,6,1,4413,-1)
	return 1;
end