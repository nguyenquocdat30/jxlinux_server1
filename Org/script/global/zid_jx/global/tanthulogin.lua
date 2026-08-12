IncludeLib("TIMER")
Include("\\script\\script_protocol\\protocol_def_gs.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\remoteexc.lua")

function loginzidjx()
	--FootNewbie:IsActivity();	
		thuongcodinh ={ -- thuong do day
			{szName="ThÇn Hµnh Phï", tbProp={6,1,1266,1,0,0}, nCount = 1,nExpiredTime = 14400, nBindState=-2},
			{szName="CÈm Nang §ång Hµnh", tbProp={6,1,4518,1,0,0}, nCount = 1, nBindState=-2},
			{szName="Ng?a Túc Suong", tbProp={0,10,2,10,0,0}, nCount = 1, nBindState=-2},
			{szName="Tân Th? Gi?i Ch?", tbProp={0,5290}, nCount = 1, nBindState=-2},
			{szName="Thæ §Þa Phï V« H¹n", tbProp={6,1,438,1,0,0}, nCount = 1,nExpiredTime = 14400, nBindState=-2},
		}
	if GetTask(5550) >= 1  then
		return
	else
		local nCurLevel = GetLevel()
		local nAddLevel = 10 - nCurLevel -- cap day
		ST_LevelUp(nAddLevel)
		tbAwardTemplet:GiveAwardByList(thuongcodinh, "PHANTHUONGtanthu");
		SetTask(5550,GetTask(5550)+1)
	end
end

 
 