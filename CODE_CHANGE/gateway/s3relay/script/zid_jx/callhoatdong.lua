Include("\\script\\mission\\sevencity\\war.lua")
Include("\\relaysetting\\task\\call_big_boss_head.lua")
Include("\\relaysetting\\task\\call_small_boss_head.lua")
Include("\\script\\zid_jx\\worldrank\\lib.lua")	
function Gm_Call_Big_Boss_(nNumBoss)
MAKE_NEW_BIG_BOSS(nNumBoss)
end	



function Gm_Call_small_Boss_()
SmallBossHK:Call()
end	

function Gm_Call_LMTC()
GlobalExecute("dwf \\script\\global\\zid_jx\\tinhnang\\longmontieucuc\\main.lua tbAloneShipped:BeginMission()");
OutputMsg("=================Goi Long Mon Tieu Cuc==================");
end

function Gm_SaveRankAll()
tbWorldRank:RequestRankData();
OutputMsg("=================XEP HANG GIANG HO 02:00 HANG NGAY REQUEST==================");
end

function Gm_UpdateRank()
	tbWorldRank:UpdateRankData();

    LoadLadder(tbWorldRank.WorldRankLadder)

    local count = getn(tbWorldRank.FactionLadders)

    for i = 1, count do
      LoadLadder(tbWorldRank.FactionLadders[i])
    end

    OutputMsg("=================XEP HANG GIANG HO 02:10 HANG NGAY==================");
end

function Gm_Call_ydbz()
GlobalExecute("dwf \\script\\missions\\yandibaozang\\yandibaozang_trigger.lua YDBZ_OnTrigger()");
szMsg = "Viªm ®Õ b¶o tµng ho¹t ®éng ®· më vµ b¾t ®Çu b¸o danh, c¸c §¹i HiÖp nhanh ch©n ®i BiÖn Kinh gÆp B×nh B×nh C« N­¬ng ®Ó ghi danh, thêi gian ghi danh lµ 5 phót."
GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", szMsg))
end
function Gm_Call_LCAH()
local szMsg = "<color=yellow>Lo¹n ChiÕn Anh Hïng <color>®· ®Õn giê b¸o danh, mäi ng­êi nhanh ch©n ®Õn <color=yellow>T­¬ng D­¬ng(198/200)<color> gÆp <color=yellow>Lo¹n ChiÕn Anh Hïng <color>®Ó ghi danh , Thêi B¸o Danh lµ 10 Phót."
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 1)", szMsg))
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
		OutputMsg("=====> BAT DAU BAO DANH LOAN CHIEN ANH HUNG")
			
		RemoteExecute("\\script\\global\\zid_jx\\tinhnang\\loandauanhhung\\head.lua", "NewGame:Open", 0)
end

function Gm_Call_Va()
	OutputMsg( " =========================Khieu chien thoi gian (Vuot ai) bat dau bao danh  ---> ");
	GlobalExecute("dwf \\settings\\trigger_challengeoftime.lua OnTrigger()");
	szMsg = "NhiÖm vô th¸ch thøc thêi gian ®· b¾t ®Çu, ®éi tr­ëng nhanh ®i ®Õn NhiÕp ThÝ TrÇn b¸o danh. Thêi gian b¸o danh lµ 10 phót."
	zMsg2SubWorld = "<color=0xa9ffe0>NhiÖm vô <color=yellow>th¸ch thøc thêi gian     (V­ît ¶i)<color> ®· b¾t ®Çu, ®éi tr­ëng nhanh ®i ®Õn <color=pink>NhiÕp ThÝ TrÇn<color> b¸o danh. Thêi gian b¸o danh lµ <color=pink>10<color> phót."
	GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)",szMsg))
	GlobalExecute(format("dw Msg2SubWorld([[%s]], 2)",zMsg2SubWorld))
end

function Gm_Call_PLD()
    GlobalExecute("dwf \\script\\missions\\fengling_ferry\\fldmap_boat1.lua fenglingdu_main()")
	szMsg = "NhiÖm vô Phong L¨ng §é ®· b¾t ®Çu råi nha,H·y ®Õn Phong L¨ng §é GÆp ThuyÒn Phu Êt/Gi¸p/BÝnh §Ó B¸o Danh b¸o danh. Thêi gian b¸o danh lµ 10 phót."
	GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)",szMsg))
	GlobalExecute(format("dw Msg2SubWorld([[%s]], 2)",szMsg))
	OutputMsg("=====> [phonglangdo] Phong Lang Do");
end

function Gm_Call_Battles(nNum)
Battle_StartNewRound( 1, nNum );
OutputMsg("=====> [TongKim] Chien Truong Tong Kim BAT DAU")
	if nNum == 1 then 
		zMsg2SubWorld  = "<color=yellow>ChiÕn tr­êng Tèng - Kim<color> <color=0xa9ffe0>S¬ cÊp ®· ®Õn giê b¸o danh, c¸c nh©n sÜ giang hå nhanh ch©n tham gia ®Çu qu©n, Thêi gian b¸o danh lµ 10 phót."
		zAddLocalCountNews = "ChiÕn tr­êng Tèng Kim S¬ cÊp ®· b¾t ®Çu b¸o danh, c¸c nh©n sÜ giang hå mau ®Õn khu vùc b¸o danh ®Ó tham gia chiÕn tr­êng."
		GlobalExecute(format("dw Msg2SubWorld([[%s]])",zMsg2SubWorld))
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 1)",zAddLocalCountNews))
	elseif nNum == 2 then 
		zMsg2SubWorld  = "<color=yellow>ChiÕn tr­êng Tèng - Kim<color> <color=0xa9ffe0>Trung cÊp ®· ®Õn giê b¸o danh, c¸c nh©n sÜ giang hå nhanh ch©n tham gia ®Çu qu©n, Thêi gian b¸o danh lµ 10 phót."
		zAddLocalCountNews = "ChiÕn tr­êng Tèng Kim Trung cÊp ®· b¾t ®Çu b¸o danh, c¸c nh©n sÜ giang hå mau ®Õn khu vùc b¸o danh ®Ó tham gia chiÕn tr­êng."
		GlobalExecute(format("dw Msg2SubWorld([[%s]])",zMsg2SubWorld))
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 1)",zAddLocalCountNews))
	elseif nNum == 3 then 
		zMsg2SubWorld  = "<color=yellow>ChiÕn tr­êng Tèng - Kim<color> <color=0xa9ffe0>Cao cÊp ®· ®Õn giê b¸o danh, c¸c nh©n sÜ giang hå nhanh ch©n tham gia ®Çu qu©n, Thêi gian b¸o danh lµ 10 phót."
		zAddLocalCountNews = "ChiÕn tr­êng Tèng Kim Cao cÊp ®· b¾t ®Çu b¸o danh, c¸c nh©n sÜ giang hå mau ®Õn khu vùc b¸o danh ®Ó tham gia chiÕn tr­êng."
		GlobalExecute(format("dw Msg2SubWorld([[%s]])",zMsg2SubWorld))
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 1)",zAddLocalCountNews))
	end
	
end

function Gm_Call_Tong_Battles()
Battle_StartNewRound( 3, 3 );
zMsg2SubWorld  = "<color=yellow>ChiÕn tr­êng Bang Héi<color> <color=0xa9ffe0>®· ®Õn giê b¸o danh, c¸c nh©n sÜ giang hå nhanh ch©n tham gia ®Çu qu©n, Thêi gian b¸o danh lµ 10 phót."
		zAddLocalCountNews = "ChiÕn tr­êng Bang Hé ®· b¾t ®Çu b¸o danh, c¸c nh©n sÜ giang hå mau ®Õn khu vùc b¸o danh ®Ó tham gia chiÕn tr­êng."
		GlobalExecute(format("dw Msg2SubWorld([[%s]])",zMsg2SubWorld))
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 1)",zAddLocalCountNews))
end

function Gm_Call_Start_Register_CTC()
RemoteExecute(REMOTE_SCRIPT,"RelayProtocol:StartSignup",0)
end

function Gm_Call_End_Register_CTC()
RemoteExecute(REMOTE_SCRIPT,"RelayProtocol:CloseSignup",0)
end

function Gm_Call_Start_OpenMap_CTC()
RemoteExecute(REMOTE_SCRIPT,"RelayProtocol:Prepare",0)
end

function Gm_Call_Start_CTC()
RemoteExecute(REMOTE_SCRIPT,"RelayProtocol:Start",0)
end
function Gm_Call_ClearMap_CTC()
BattleWorld:Clear()
end

function Gm_Call_Hoa_Son()
		GlobalExecute("dwf \\script\\missions\\huashanqunzhan\\missionctrl.lua startHuaShanQunZhanMission()")
		GlobalExecute(format( "dw AddLocalCountNews([[%s]], 2)", "Hoa S¬n §¹i ChiÕn ®· b¾t ®Çu b¸o danh, <color=red>ng­êi th¾ng cuéc sÏ nhËn ®­îc sè phÇn th­ëng v« cïng gi¸ trÞ, h·y mau chãng tham gia."))
		GlobalExecute(format( "dw Msg2SubWorld([[%s]])", "<color=0xa9ffe0><color=yellow>Hoa S¬n §¹i ChiÕn<color> ®· b¾t ®Çu b¸o  danh, cã thÓ ®Õn chç <color=Orange>Hoa S¬n L·o TÈu<color> ë <color=earth>Hoa s¬n c¶nh kü tr­êng<color> ®Ó tiÕn hµnh b¸o danh!, thêi  gian b¸o danh lµ 15 phót!"))
		OutputMsg(" ================= Hoa Son Dai Chien => Start Hour: 10 - Start Min: 15");
end

