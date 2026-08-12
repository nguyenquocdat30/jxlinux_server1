-- ¼ì²éÊÇ·ñÔÚËÎ½ðµØÍ¼
-- LiuKuo
-- 2004.12.22
IncludeLib("BATTLE");
Include("\\script\\global\\zid_jx\\tinhnang\\thachdaubanghoi\\battlehead.lua");
tbCD_MAP = {516, 517, 580, 581};	--·é»ðÁ¬³ÇÊØ³ÇµØÍ¼

function UseItemTong(nItemIdx)
	nMapId = SubWorldIdx2MapCopy(SubWorld)
	for i = 1, getn(tbBATTLEMAP) do 
		if ( nMapId == tbBATTLEMAP[i]) then
			if (BT_GetGameData(GAME_BATTLEID) == 2) then
				Msg2Player("§¹o cô nµy kh«ng thÓ sö dông t¹i chiÕn tr­êng quèc chiÕn Tèng Kim");
				return 1;
			elseif (BT_GetGameData(GAME_BATTLEID) == 3) then
				local nType = BattleTong:GetBattleType();
				local tbMatchTypeList = BattleTong.MatchTypeList;
				if (nType == 1) then
					local nUseItem = BattleTong:CheckItem(nItemIdx);
					if (nUseItem == 0) then
					Msg2Player(format("H×nh thøc cña chiÕn tr­êng Th¸ch §Êu Bang Héi lÇn nµy lµ <color=yellow>%s<color>, kh«ng thÓ sö dông ®­îc ®¹o cô nµy!",tbMatchTypeList[nType][1]));
					return 1; end;
				elseif (nType == 2) then
					Msg2Player(format("H×nh thøc cña chiÕn tr­êng Th¸ch §Êu Bang Héi lÇn nµy lµ <color=yellow>%s<color>, kh«ng thÓ sö dông ®­îc ®¹o cô nµy!",tbMatchTypeList[nType][1]));
				return 1; end;
			end;
			
			local nRomve = EatMedicine(nItemIdx);
			if (nRomve == -1) then
				return 1;
			else
				return 0;
			end;
		end;
	end;
	
	for i = 1, getn(tbCD_MAP) do
		if (nMapId == tbCD_MAP[i]) then
			if (EatMedicine(nItemIdx) == -1) then
				return 1;
			else
				return 0;
			end;
		end;
	end;
	
	Msg2Player("VËt phÈm nµy chØ cã thÓ sö dông ë ChiÕn tr­êng Tèng Kim");
	return 1;
end;