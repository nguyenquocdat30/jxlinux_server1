Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\global\\zid_jx\\tinhnang\\nangcapthu\\lib.lua");
Include("\\script\\lib\\progressbar.lua")
UpgradeGoldHorse = {};
function main()
	local sex = GetSex();
	if sex == 0 then sex = "Nam" else sex = "N÷" end 
	
	local szTitle = "\nQuý <color=green>"..sex.." ®¹i hiÖp<color> cÇn g×? "
	local tbOp = {		
		{"Ta muèn n©ng cÊp thó c­ìi",nangcapchienma},
		{"Ta chØ ghÐ qua th«i! T¹m biÖt!"},	
	}
	CreateNewSayEx(szTitle, tbOp)
end

function nangcapchienma()
	UpgradeGoldHorse:DialogMain()
end

function UpgradeGoldHorse:DialogMain()
	local szTitle = "<color=gold>ThÇn binh<color> ph¶i ®i víi <color=yellow>ThÇn M·<color>, nh­ thÕ míi râ ®­îc dòng khÝ cña <color=green>§¹i hiÖp<color> khi hµnh tÈu giang hå. H·y mang ®Õn cho ta mét vµi nguyªn liÖu cÇn thiÕt, ta sÏ t¹o t¸c cho c¸c h¹ nh÷ng con <color=yellow>ThÇn thó<color> dòng m·nh v« song. <color=green> §¹i hiÖp chó ý: Toµn bé nguyªn liÖu sÏ mÊt khi n©ng cÊp thÊt b¹i!<color>";
	local tbOption = {};
	for szEquip, tbEquip in TB_UpgradeGoldHorse["Ngùa"] do
		tinsert(tbOption,{format("%s",szEquip),self.DialogRoute,{self,szEquip,tbEquip}});
	end;
		tinsert(tbOption,{"Trë l¹i",main});
		tinsert(tbOption,{"KÕt thóc ®èi tho¹i."});
	CreateNewSayEx(szTitle,tbOption);
end;

function UpgradeGoldHorse:DialogRoute(szEquip,tbEquip)
	local szTitle = "Ta ®©y sÏ gióp ng­¬i cã ®­îc 1 trong nh÷ng con <color=yellow>ThÇn Thó<color> uy m·nh v« song.\n<color=green>C¸c h¹ còng nªn l­u ý, toµn bé nguyªn liÖu sÏ mÊt ®i nÕu n©ng cÊp thÊt b¹i!<color>";
	local tbOption = {};
	for szRoute,tbRoute in tbEquip do
		tinsert(tbOption, {format("%s",szRoute), self.OpenUI,{self,szEquip,szRoute,tbRoute}});
	end;
		tinsert(tbOption,{"KÕt thóc ®èi tho¹i."});
	CreateNewSayEx(szTitle,tbOption);
end;

function UpgradeGoldHorse:OpenUI(szEquip,szRoute,tbRoute)
	local a = tbRoute.tbItem.nRate
	local szDesc = "* TØ LÖ Thµnh C«ng : "..a.."%";
	szDesc = szDesc.."\n----Nguyªn LiÖu Yªu CÇu----";
	local b = tbRoute.tbItem.nCash
		szDesc = szDesc.."\n+ "..b.." V¹n L­îng";
	for i = 1, getn(tbRoute.tbMaterial) do
		szDesc = szDesc..format("\n+ x%d %s",tbRoute.tbMaterial[i].nCount,tbRoute.tbMaterial[i].szName);
	end;
		Msg2Player"<color=yellow> L­u ý :<color><color=green>NÕu ChÕ T¹o ThÊt B¹i Toµn Bé Nguyªn LiÖu SÏ MÊt HÕt. ";
	g_GiveItemUI("N©ng CÊp Thó C­ìi",szDesc,{self.ConfirmUI,{self,szEquip,szRoute,tbRoute,tbRoute.tbMaterial}});
end;

function UpgradeGoldHorse:ConfirmUI(szEquip,szRoute,tbRoute,tbMaterial,nCount)
	local tbItem,tbData = self:GetUI(nCount);
	for i = 1, getn(tbMaterial) do
		if (tbMaterial[i].tbProp[4] == -1) then
			tbMaterial[i].tbProp[4] = 1;
		end;
		local szIdx = format("%s,%s,%s,%s",tbMaterial[i].tbProp[1],tbMaterial[i].tbProp[2],tbMaterial[i].tbProp[3],tbMaterial[i].tbProp[4]);
		local a = GetCash();
		local b = tbRoute.tbItem.nCash*10000;
		if (tbItem[szIdx]) and (tbItem[szIdx] < tbMaterial[i].nCount) then
			Say(format("RÊt tiÕc! B¹n kh«ng cã ®ñ %d <color=yellow>%s <color>!",tbMaterial[i].nCount,tbMaterial[i].szName));
			return
		elseif (tbItem[szIdx]) and (tbItem[szIdx] > tbMaterial[i].nCount) then
			Say(format("RÊt tiÕc! B¹n bá thõa %d <color=yellow>%s <color>!",(tbItem[szIdx]-tbMaterial[i].nCount),tbMaterial[i].szName));
			return
		elseif (not tbItem[szIdx]) then
			Say(format("RÊt tiÕc! B¹n cßn thiÕu %d <color=yellow>%s <color>!",tbMaterial[i].nCount,tbMaterial[i].szName));
			return
		elseif (a < b) then
			Say("RÊt tiÕc! B¹n Kh«ng §ñ \n"..tbRoute.tbItem.nCash.." <color=yellow>V¹n L­îng Kh«ng ThÓ N©ng CÊp <color>!");
			return
		end;
	end;
		local nCurRate = random(1,100);
		if (tbRoute.tbItem.nRate) and (tbRoute.tbItem.nRate < nCurRate) then
			local tbFail = self:Fail(tbData,tbMaterial);	
			tbProgressBar:OpenByConfig(15, self.ProgressBarLoadFail,{self,tbRoute,tbItem,tbFail}, OnBreakHorse)	

			
		elseif (tbRoute.tbItem.nRate) and (tbRoute.tbItem.nRate >= nCurRate) then
			tbProgressBar:OpenByConfig(15, self.ProgressBarLoad,{self,tbRoute,tbItem,tbData,nIdx}, OnBreakHorse)
			
		else
			tbProgressBar:OpenByConfig(15, self.ProgressBarLoad,{self,tbRoute,tbItem,tbData,nIdx}, OnBreakHorse)

		SaveNow();
		end;

end;

function UpgradeGoldHorse:ProgressBarLoadFail(tbRoute,tbItem,tbFail)
	for i = 1, getn(tbFail) do
		RemoveItemByIndex(tbFail[i]);
	end;
	Pay(tbRoute.tbItem.nCash*10000);
	Msg2Player(format("RÊt tiÕc, b¹n ®· N©ng CÊp <color=yellow>%s<color> thÊt b¹i, bÞ mÊt mét sè nguyªn liÖu!",tbRoute.tbItem.szName));
	SaveNow();
end

function UpgradeGoldHorse:ProgressBarLoad(tbRoute,tbItem,tbData,nIdx)
	local nIdx = 0;
	for i = 1, getn(tbData) do
		RemoveItemByIndex(tbData[i][1]);
	end;
	Pay(tbRoute.tbItem.nCash*10000);
	nIdx = AddItem(tbRoute.tbItem.tbProp[1],tbRoute.tbItem.tbProp[2],tbRoute.tbItem.tbProp[3],tbRoute.tbItem.tbProp[4],tbRoute.tbItem.tbProp[5],tbRoute.tbItem.tbProp[6])
	Msg2Player(format("Xin chóc mõng, b¹n ®· N©ng CÊp <color=yellow>%s<color> thµnh c«ng, nhËn ®­îc ThÇn Thó <color=yellow>%s<color>!",tbRoute.tbItem.szName,tbRoute.tbItem.szName));
	AddGlobalNews(format("Xin chóc mõng, "..GetName().." ®· N©ng CÊp <color=yellow>%s<color> thµnh c«ng, nhËn ®­îc ThÇn Thó <color=yellow>%s<color>!",tbRoute.tbItem.szName,tbRoute.tbItem.szName));
	SaveNow();
end

function UpgradeGoldHorse:Fail(tbData,tbMaterial)
	local tbTemp = {};
	for i = 1, getn(tbMaterial) do
		if (tbMaterial[i].tbProp[4] == -1) then
			tbMaterial[i].tbProp[4] = 1;
		end;
		local szIdx = format("%s,%s,%s,%s",tbMaterial[i].tbProp[1],tbMaterial[i].tbProp[2],tbMaterial[i].tbProp[3],tbMaterial[i].tbProp[4]);
		for k = 1, getn(tbData) do
			if (tbData[k][2] == szIdx) then
				if (tbMaterial[i].nFail ~= 0) then
					tinsert(tbTemp,tbData[k][1]);
				end;
			end;
		end;
	end;
	return tbTemp;
end;

function UpgradeGoldHorse:GetUI(nCount)
	local tbTemp = {};
	local tbData = {};
	for i = 1, nCount do
		local nItemIndex = GetGiveItemUnit(i);
		local nG,nD,nP,nL = GetItemProp(nItemIndex);
		local nStack = GetItemStackCount(nItemIndex) or 1;
		local szIdx = format("%s,%s,%s,%s",nG,nD,nP,nL);
		tbTemp[szIdx] = (tbTemp[szIdx] or 0)+nStack;
		tinsert(tbData,{nItemIndex,szIdx});
	end;
	return tbTemp,tbData;
end;
