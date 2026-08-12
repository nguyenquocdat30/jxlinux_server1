Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\global\\zid_jx\\lib\\file.lua");
Include("\\script\\global\\zid_jx\\tinhnang\\baucua\\head.lua");

function main()
	GameFeast:DialogMain();
end;

function GameFeast:DialogMain()
	-- if (self.st == 0) then
		-- Talk(1,"","Ch­a ®Õn giê më BÇu Cua, vui lßng ®îi th«ng b¸o råi h·y ®Õn ®Æt c­îc nhÐ!")
	-- return end;
	-- if (self.st == 2) then
		-- Talk(1,"","§· hÕt thêi gian ®Ó ®Æt c­îc, vui lßng ®îi v¸n sau!")
	-- return end;
	
	local op = {"Ng­¬i t×m ta cã viÖc g×?"};
		if (self.st == 0 or self.st == 2 ) then
		tinsert(op, "<#> NhËn tiÒn th­ëng!/#GameFeast:DialogAward()");
		end
		tinsert(op, "<#> §Æt c­îc/#GameFeast:DialogPay()");
		tinsert(op, "KÕt thóc ®èi tho¹i./no");
	CreateTaskSay(op);
end;

function GameFeast:SetupResult(bu)
	if (self.st == 0) then
		Talk(1,"","Khi trß ch¬i ®ang b¾t ®Çu míi cã thÓ thiÕt lËp ®­îc kÕt qu¶");
		return
	end;
	bu = bu or 1;
	local op = {format("Mêi GM chän kÕt qu¶ cho xóc s¾c sè %d",bu)};
	for i = 1, getn(self.anml) do
		tinsert(op, format("<#> ThiÕt lËp %s/#GameFeast:ConfirmSetupResult(%d,%d)",self.anml[i].tp,bu,self.anml[i].nValue));
	end;
		tinsert(op, "KÕt thóc ®èi tho¹i./no");
	CreateTaskSay(op);
end;

function GameFeast:ConfirmSetupResult(bu,anm)
	if (self.st == 0) then
		Talk(1,"","Khi trß ch¬i ®ang b¾t ®Çu míi cã thÓ thiÕt lËp ®­îc kÕt qu¶");
		return
	end;
	
	local stams = self:GetAnimal(anm);
	if (bu > 0) and (bu < 3) then
		self.srs[bu] = anm;
		Msg2Player(format("<color=yellow>ThiÕt lËp thµnh c«ng xóc s¾c sè %d: %s<color>",bu,stams));
		
		self:SetupResult(bu+1);
	else
		self.srs[bu] = anm;
		Msg2Player(format("<color=yellow>ThiÕt lËp thµnh c«ng xóc s¾c sè %d: %s<color>",bu,stams));
		local staml = "";
		for i = 1, getn(self.srs) do
			if (self.srs[i]) then
				if (i ~= getn(self.srs)) then
					local stams = self:GetAnimal(self.srs[i]);
					staml = staml..format("%s, ",stams);
				else
					local stams = self:GetAnimal(self.srs[i]);
					staml = staml..format("%s",stams);
				end;
			end;
		end;
		Msg2Player(format("<color=yellow>ThiÕt lËp thµnh c«ng kÕt qu¶ BÇu Cua ®ît nµy lµ %s<color>",staml));
	end;
end;
--------------------------------------------- THIET LAP KET QUA -------------------------------------------------


function GameFeast:DialogAward()
	if (self.st ~= 0) then
		Talk(1,"","§ang trong thêi gian ®Æt c­îc, kh«ng thÓ nhËn th­ëng! Vui lßng ®îi ®Õn lóc kÕt thóc míi cã thÓ ®Õn nhËn phÇn th­ëng!")
		return
	end;
	
	local staml,tbawl = self:GetHistoryAward();
	if (staml == "") then
		Talk(1,"","B¹n kh«ng ®Æt c­îc, kh«ng thÓ nhËn th­ëng!");
	return end;
	
	local op = {};
	tinsert(op, {"Ta muèn nhËn ngay!", self.GiveAward, {self,tbawl}});
	tinsert(op, {"KÕt thóc ®èi tho¹i."});
	CreateNewSayEx("<npc>"..staml,op);
end;

function GameFeast:GiveAward(tbawl)
	local tnaw = "<color=green>Chóc mõng b¹n nhËn ®­îc ";
	for i = 1, getn(tbawl) do
		local sp, spv = self:GetPay(tbawl[i][3]);
		if (tonumber(tbawl[i][3]) == 1) then
			Earn(tonumber(tbawl[i][7])*10000);
			tnaw = tnaw..format("%d %s!", tonumber(tbawl[i][7]),spv);
		elseif (tonumber(tbawl[i][3]) == 2) then
			tbAwardTemplet:GiveAwardByList({tbProp={4,417,1,0,0,0},nCount=tonumber(tbawl[i][7])},"AWARD");
			tnaw = tnaw..format("%d %s!", tonumber(tbawl[i][7]),spv);
		elseif (tonumber(tbawl[i][3]) == 3) then
			tbAwardTemplet:GiveAwardByList({tbProp={4,343,1,0,0,0},nCount=tonumber(tbawl[i][7])},"AWARD");
			tnaw = tnaw..format("%d %s!", tonumber(tbawl[i][7]),spv);
		end;
		Msg2Player(format("<color=green>Chóc mõng b¹n ®Æt c­îc %s (%d %s), ra x%d %s, nhËn ®­îc %d %s vµo lóc <color=yellow>%s<color>!<color>",tbawl[i][4],tbawl[i][6],spv,tbawl[i][5],tbawl[i][4],tbawl[i][7],spv,tbawl[i][8]));
		self:LogPlayer("logbaucua", format("PLAYER %s(%s) ®Æt c­îc %s (%d %s), ra x%d %s, nhËn ®­îc %d %s vµo lóc %s!",GetAccount(),GetName(),tbawl[i][4],tbawl[i][6],spv,tbawl[i][5],tbawl[i][4],tbawl[i][7],spv,tbawl[i][8]));

	end;

	SaveNow();

	local tp = GetName();
	local tbtd = File:Load(self.fg,self.faw);
	local tbtaw = {};
	tinsert(tbtaw, self.tlaw);
	
	local sawpl = "";
	for i = 1, getn(tbtd) do
		if (tbtd[i][2] ~= tp) then
			tinsert(tbtaw,tbtd[i]);
		end;
	end;
	File:Save(self.fg,self.faw,tbtaw);
end;

function GameFeast:DialogPay()
	if (self.st ~= 1) then
		Talk(1,"","§· hÕt thêi gian ®Ó ®Æt c­îc, vui lßng ®îi v¸n sau!")
		return
	end;
	
	local op = {"Mêi b¹n chän ph­¬ng thøc thanh to¸n:"};
	for i = 1, getn(self.pl) do
		tinsert(op,format("C­îc b»ng %s/#GameFeast:DialogBet(%d)",self.pl[i].tp,self.pl[i].nValue));
	end;
		tinsert(op,"KÕt thóc ®èi tho¹i./no");
	CreateTaskSay(op);
end;

function GameFeast:DialogBet(pnu)
	if (self.st ~= 1) then
		Talk(1,"","§· hÕt thêi gian ®Ó ®Æt c­îc, vui lßng ®îi v¸n sau!")
		return
	end;
	
	local sp = self:GetPay(pnu);
	if (sp == "") then
		Talk(1,"","ThÊt b¹i khi chän ph­¬ng thøc thanh to¸n nµy!");
	return end;
	
	if (pnu == 1) then
		if (GetCash() <= 0) then
			Talk(1,"", format("B¹n kh«ng mang theo <color=red>%s<color> trªn ng­êi, kh«ng thÓ ch¬i!", sp));
		return end;
	elseif (pnu == 2) then
		if (CalcEquiproomItemCount(4,417,1,-1) <= 0) then
			Talk(1,"", format("B¹n kh«ng mang theo <color=red>%s<color> trªn ng­êi, kh«ng thÓ ch¬i!", sp));
		return end;
	elseif (pnu == 3) then
		if (CalcEquiproomItemCount(4,343,1,-1) <= 0) then
			Talk(1,"", format("B¹n kh«ng mang theo <color=red>%s<color> trªn ng­êi, kh«ng thÓ ch¬i!", sp));
		return end;
	end;
	
	local amc = self:GetCount(pnu);
	if (amc >= self.mc) then
		Talk(1,"",format("Mçi v¸n chØ ®Æt c­îc tèi ®a %d lÇn!",self.mc));
	return end;
	
	local anmhst = self:GetHistory(pnu);
	local tlh = "";
	if (anmhst ~= "") then
		tlh = "<#> <color=yellow>* V¸n nµy b¹n ®· ®Æt c­îc:<color>";
		tlh = tlh..anmhst;
	end;
	
	local tld = format("<#> <color=yellow>* Ph­¬ng thøc thanh to¸n:<color> %s",sp);
	tld = tld.."<enter>"..tlh;
	local op = {tld};
	for i = 1, getn(self.anml) do
		tinsert(op, format("<#> §Æt c­îc %s/#GameFeast:ConfirmGateBet(%d,%d)",self.anml[i].tp,pnu,self.anml[i].nValue));
	end;
	CreateTaskSay(op);
end;

function GameFeast:ConfirmGateBet(pnu,anm)
	if (self.st ~= 1) then
		Talk(1,"","§· hÕt thêi gian ®Ó ®Æt c­îc, vui lßng ®îi v¸n sau!")
		return
	end;
	
	local lp = self:GetLoop(pnu,anm);
	local stams = self:GetAnimal(anm);
	if (lp == 1) then
		Talk(1,"",format("V¸n nµy b¹n ®· ®Æt c­îc vµo <color=green>%s<color> råi, kh«ng thÓ ®Æt thªm lÇn n÷a!",stams));
	return end;

	local cp = self:CalcPay(pnu,self.mp);
	local sp, spv = self:GetPay(pnu);
	if (cp == 0) then
		Talk(1,"",format("Hµnh trang kh«ng cã ®ñ <color=red>%d %s<color> ®Ó ®Æt c­îc!",self.mp,spv));
	return end;
	g_AskClientNumberEx(1,cp*self.mp,"TiÒn c­îc:", {self.ConfirmBetPay,{self,pnu,anm}});
end;

function GameFeast:ConfirmBetPay(pnu,anm,mc)
	if (self.st ~= 1) then
		Talk(1,"","§· hÕt thêi gian ®Ó ®Æt c­îc, vui lßng ®îi v¸n sau!")
		return
	end;
	
	local ev = self:CheckEven(mc);
	if (ev == 0) then
		Talk(1,"", format("Mçi lÇn ®Æt c­îc chØ cho phÐp ®Æt c­îc %d,%d,%d,...\nKh«ng ®­îc phÐp ®Æt c­îc %d,%d,%d,...",(self.mp*1),(self.mp*2),(self.mp*3), (self.mp+1),(self.mp+2),(self.mp+3)))
	return end;
	
	local sp, spv = self:GetPay(pnu);
	local cps = self:CheckPay(pnu,mc);
	if (cps == 0) then
		Talk(1,"",format("Hµnh trang kh«ng ®ñ %d %s ®Ó ®Æt c­îc v¸n nµy!",mc,spv));
	return end;
	
	local stams = self:GetAnimal(anm);
	if (not stams) or (stams == "") then
		Talk(1,"","Cöa ®Æt kh«ng hîp lÖ, vui lßng liªn hÖ víi GM ngay lËp tøc!");
	return end;
	
	local pv = self:Pay(pnu,mc);
	if (pv == 0) then
		Msg2Player("KhÊu trõ thÊt b¹i, ®Æt c­îc lÇn nµy bÞ hñy bá!");
	return end;
	
	self:AddAnimal(pnu,anm,mc);
	-- Msg2SubWorld(format("<color=green>%s ®Æt vµo BÇu Cua <color=yellow>%d %s<color><color>",GetName(),mc,spv));
	self:LogPlayer("logbaucuadatcuoc", format("PLAYER %s(%s) ®Æt vµo %s %d %s!",GetAccount(),GetName(),stams,mc,spv));

	SaveNow();
return end;

function GameFeast:StartTime()
	if (self:CheckTime() == 0) then
		return
	end;
	
	if (self.st == 0) then
		self.st = 1;
		-- Msg2SubWorld(format("<color=green>Trß ch¬i <color=yellow>BÇu Cua<color> chÝnh thøc b¾t ®Çu më, mêi c¸c quý nh©n sü ®Õn gÆp NPC BÇu Cua T«m C¸ ®Ó ®Æt c­îc, thêi gian ®Æt c­îc lµ %d phót!<color>",floor((self.tb/60)/18)));
		AddTimer(self.tb,"GameFeast:StartGame",1);
	end;
end;

function GameFeast:StartGame(...)
	DelNpc(arg[2]);
	if (arg[1] == 1) then
		self.st = 2;
		-- Msg2SubWorld("<color=green>Trß ch¬i <color=yellow>BÇu Cua<color> ®· hÕt thêi gian ®Æt c­îc, kh«ng thÓ  ®Æt c­îc, chuÈn bÞ cã kÕt qu¶!<color>");
		AddTimer(self.trs,"GameFeast:StartGame",2);
	elseif (arg[1] == 2) then
		self.st = 0;
		GameFeast:Result();
		-- Msg2SubWorld("<color=green>Trß ch¬i <color=yellow>BÇu Cua<color> lÇn nµy ®· kÕt thóc, chê ®îi ®ît kÕ tiÕp!<color>");
	end;
end;