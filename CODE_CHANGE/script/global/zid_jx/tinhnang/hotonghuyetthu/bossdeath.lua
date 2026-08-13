-------------------------------------------------***Create*By*Heart*Doldly***---------------------------------------------------------------
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\composeex.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\global\\zid_jx\\tinhnang\\hotonghuyetthu\\head.lua")
Include("\\script\\global\\zid_jx\\gm\\gm_support.lua")

--------------------------------------------------------------

function OnDeath(nPlayerIndex)
	tbVnFFBigBossDrop = {
		[1]={{szName="Hé Tiªu LÖnh",tbProp={6,1,30317,1,0,0},nCount=1,nExpiredTime=120,nRate=100},},
	}	
	tbDropTemplet:GiveAwardByList(nPlayerIndex, -1, tbVnFFBigBossDrop, "PhÇn th­ëng C­íp Tiªu", 1)
	local i = GetCurCamp();
	SetCamp(i)
	DisabledUseTownP(0)
	SetDeathScript()
	SetMoveSpeed(-10)
	ForbidChangePK(0)
	SetPKFlag(0)
	ForbidEnmity(0)
	SetTask(TASKXAPHU,0)
	RestoreOwnFeature();
	ConsumeEquiproomItem(1,6,1,30317,-1)
	if (ClearData() == 1) then end
	Msg2Player("Bao L­¬ng cña b¹n ®· bÞ c­íp! NhiÖm vu thÊt b¹i");
	local szNewsBL = (format("<color=fire>Cao thñ <color=gold>"..GetNpcName(nPlayerIndex).."<color> võa c­íp thµnh c«ng Bao L­¬ng cña <color=gold>"..GetName().."<color>"))
	Msg2Sub(szNewsBL);
end