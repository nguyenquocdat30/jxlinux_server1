Include("\\script\\global\\zid_jx\\tinhnang\\thachdaubanghoi\\battlehead.lua");

function PickUp( nItemIndex, nPlayerIndex )
	if( IsMyItem( nItemIndex ) ) then
		if (BT_GetGameData(GAME_BATTLEID) == 3) then
			local nType = BattleTong:GetBattleType();
			local tbMatchTypeList = BattleTong.MatchTypeList;
			if (nType == 1) then
				local nUseItem = BattleTong:CheckItem(nItemIndex);
				if (nUseItem == 0) then
					Msg2Player(format("H×nh thøc cña chiÕn tr­êng Th¸ch §Êu Bang Héi lÇn nµy lµ <color=yellow>%s<color>, kh«ng thÓ sö dông ®­îc ®¹o cô nµy!",tbMatchTypeList[nType][1]));
				return 0; end;
			elseif (nType == 2) then
					Msg2Player(format("H×nh thøc cña chiÕn tr­êng Th¸ch §Êu Bang Héi lÇn nµy lµ <color=yellow>%s<color>, kh«ng thÓ sö dông ®­îc ®¹o cô nµy!",tbMatchTypeList[nType][1]));
			return 0; end;
		end;
		
		i = random(getn(Tab))
		Tab[i]();
		BT_SetData(PL_GETITEM, BT_GetData(PL_GETITEM) + 1);
		bt_addtotalpoint(BT_GetTypeBonus(PL_GETITEM, GetCurCamp()))
		checkbattlerule(BT_GetTypeBonus(PL_GETITEM, GetCurCamp()))
		BT_SortLadder();
		BT_BroadSelf();
		return 0;	-- É¾³ýÎïÆ·
	end
end