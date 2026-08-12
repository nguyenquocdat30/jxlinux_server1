FixScriptNpc = {};

FixScriptNpc.FixByScriptAndMapList = {
	["\\script\\global\\特殊用地\\宋金报名点\\npc\\song_signup.lua|989"] = "\\script\\global\\zid_jx\\tinhnang\\thachdaubanghoi\\battlejoin1.lua",
	["\\script\\global\\特殊用地\\宋金报名点\\npc\\jin_signup.lua|989"] = "\\script\\global\\zid_jx\\tinhnang\\thachdaubanghoi\\battlejoin2.lua",
};


function FixScriptNpc:InitMain()
	for i = 1, GetNpcFreeCount() do
		local _,_,nW = GetNpcPos(i);
		local szScript = GetNpcScript(i);
		local szSearch = format("%s|%s",szScript,SubWorldIdx2ID(nW));
		if (self.FixByScriptAndMapList[szSearch]) then
			SetNpcScript(i,self.FixByScriptAndMapList[szSearch],i);
		end;
	end;
end;