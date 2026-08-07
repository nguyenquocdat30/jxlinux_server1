Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua");

ChangeFaction = {};

T9_FACTION = {
	[0] = "ThiÕu L©m",
	[1] = "Thiªn V­¬ng",
	[2] = "§­êng M«n",
	[3] = "Ngò §éc",
	[4] = "Nga My",
	[5] = "Thóy Yªn",
	[6] = "C¸i Bang",
	[7] = "Thiªn NhÉn",
	[8] = "Vâ §ang",
	[9] = "C«n L«n",
}

function ChangeFaction:DialogMain()
	local tbFaction = T9_FACTION;
	local num_faction = GetLastFactionNumber();
	local flag_faction = GetTask(TSK_TOUSHI_FLAG);
	if (num_faction == -1) then
		Talk(1,"","B¹n ch­a gia nhËp m«n ph¸i!");
	return end
	local tbSay = {"Ng­¬i t×m ta cã chuyÖn g×?"};
	if (flag_faction == 0) then
		tinsert(tbSay, format("Giao tÝn vËt m«n ph¸i/#daiyitoushi_main(%d)",num_faction));
	else
		for i = 0, getn(tbFaction) do
			if (i ~= num_faction) then
				if (tbFaction[i]) then
					tinsert(tbSay, format("Gia nhËp %s/#daiyitoushi_main(%s)",tbFaction[i],i));
				end
			end
		end
	end
		tinsert(tbSay, "KÕt thóc ®èi tho¹i./no")
	CreateTaskSay(tbSay)
end