
Include("\\script\\global\\zid_jx\\lib\\config.lua");

FootNewbie = {};


function FootNewbie:DialogMain()
	if FootNewbie_Support ~= 1 then
		Talk(1,"","Tİnh n¨ng nµy ®· ®­îc ®ãng!");
		return
	end;
	local nLimitLevel = FootNewbie_LimitLevel_Max;
	if (GetLevel() > nLimitLevel) then
		Talk(1,"",format("§¼ng cÊp hiÖn t¹i cña b¹n kh«ng thÓ nhËn vßng s¸ng hç trî nµy, yªu cÇu ng­êi ch¬i ph¶i cÊp %d trë xuèng   míi cã thÓ nhËn vßng s¸ng nµy.",nLimitLevel));
	return end;
	
	if (self:On() == 1) then
		Msg2Player(format("<color=yellow>Tin tøc<color>\n<color=green>Chóc mõng b¹n ®· nhËn ®­îc hç trî vßng s¸ng \nt©n thñ ®Õn cÊp <color=yellow>%d <color>!<color>",nLimitLevel));
	else
		Talk(1,"","B¹n ®· nhËn hç trî vßng s¸ng nµy råi, khi nµo mÊt th× l¹i ®Õn gÆp ta ®Ó nhËn l¹i vßng s¸ng nhĞ!");
	end;
end;

function FootNewbie:IsActivity()
	local nLimitLevel = FootNewbie_LimitLevel_Max;
	if (GetLevel() > nLimitLevel) then
		if (self:Off() == 1) then
			Msg2Player(format("<color=yellow>Tin tøc<color>\n<color=yellow>§¼ng cÊp cña b¹n ®· v­ît qu¸ giíi h¹n cÊp %d, \nv× thÕ hÖ thèng sÏ tù ®éng xãa hiÖu øng vßng \ns¸ng t©n thñ hiÖn t¹i cña b¹n!<color>",nLimitLevel));
		end;
	else
		if (self:On() == 1) then
			Msg2Player(format("<color=yellow>Tin tøc<color>\n<color=green>Chóc mõng b¹n ®· nhËn ®­îc hç trî vßng s¸ng t©n thñ ®Õn cÊp %d!<color>",nLimitLevel));
		end;
	end;
end;

function FootNewbie:On()
		if (GetSkillState(314) <= 0) then
			AddSkillState(314,12,2,0);
			AddSkillState(546,1,2,0);
			AddSkillState(512,20,2,0);
			AddSkillState(527,5,2,0);
			AddSkillState(313,5,2,0);
			return 1;
		else
			return 0;
		end;
end;

function FootNewbie:Off()
	if (GetSkillState(314) > 0) then
		RemoveSkillState(314);
		RemoveSkillState(546);
		RemoveSkillState(512);
		RemoveSkillState(527);
		RemoveSkillState(313);
		return 1;
	else
		return 0;
	end;
end;