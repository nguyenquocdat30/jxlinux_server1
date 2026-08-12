Include("\\script\\global\\zid_jx\\tinhnang\\baucua\\main.lua");

function Loop5Minutes()
	GameFeast:StartTime();
	print("----- # Run Loop 5 Minutes! -----");
	local gmrole = PlayerIndex;
	local count = GetPlayerCount();
	local MemberNowDate = tonumber(GetLocalDate("%y%m%d"));
	if count > 0 then 
		for i=1,count do 
			PlayerIndex = i;
			if PlayerIndex > 0 then 
				SaveNow();
			end
		end
	end
	print("[=====> Luu Du Lieu Gamer Dang Online Toan Server Hoan Tat<=====]")
end;
