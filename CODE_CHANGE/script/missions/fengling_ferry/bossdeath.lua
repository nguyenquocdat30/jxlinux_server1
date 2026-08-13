Include("\\script\\global\\signet_head.lua")
Include("\\script\\missions\\fengling_ferry\\fld_head.lua")
Include("\\script\\event\\jiefang_jieri\\200904\\shuizei\\shuizei.lua");
Include("\\script\\event\\change_destiny\\mission.lua");
Include("\\script\\global\\zid_jx\\lib\\config_phanthuong.lua");

function OnDeath( nNpcIndex )
	local x, y, world = GetNpcPos(nNpcIndex);
	Activity_DeathBossFengLingFerry(MapID, X, Y)
end
