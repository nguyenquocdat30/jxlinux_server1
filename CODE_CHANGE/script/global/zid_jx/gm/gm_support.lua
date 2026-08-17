Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\global\\zid_jx\\gm\\gm_lib.lua");
Include("\\script\\lib\\remoteexc.lua")

LENHBAI_QTV = "<#><link=image[0]:\\spr\item\script\yupai_haozhao.spr>LÖnh Bµi GM: <link>"

-----------------------------------------------------------------------------------------------------------------------------------------------------
--																	GM - NhËn C¸c Lo¹i §iÓm														   --
-----------------------------------------------------------------------------------------------------------------------------------------------------
function changeCamp()
if GetLevel() < 10 then
	Talk(1,"",""..myplayersex().."kh«ng ®ñ cÊp, h·y luyÖn tËp thªm")
	return 1
end
local szTitle = "muèn ®æi sang mµu tr¹ng th¸i nµo d­íi ®©y?";
	local tbOption = {};
		for i = 1, getn(TAB_LIST_GAMEMASTER) do
			if (TAB_LIST_GAMEMASTER[i]["Account"] == GetAccount()) then
				for k = 1, getn(TAB_LIST_GAMEMASTER[i]["Player"]) do
					if (TAB_LIST_GAMEMASTER[i]["Player"][k] == GetName()) then
						tinsert(tbOption, {"LuyÖn c«ng (ch÷ tr¾ng)", GMChangeCampOK, {0}})
						tinsert(tbOption, {"GM (ch÷ hång)", GMChangeCampOK, {5}})
					end
				end
			end
		end
		tinsert(tbOption, {"ChÝnh ph¸i (ch÷ vµng)", GMChangeCampOK, {1}})
		tinsert(tbOption, {"Tµ ph¸i (ch÷ tÝm)", GMChangeCampOK, {2}})
		tinsert(tbOption, {"Trung lËp (ch÷ xanh)", GMChangeCampOK, {3}})
		tinsert(tbOption, {"S¸t thñ (ch÷ ®á)", GMChangeCampOK, {4}})
		
		tinsert(tbOption, {"§ãng."})
	CreateNewSayEx(szTitle, tbOption)
end



function GMChangeCampOK(nCamp)
	if not (TAB_LISTCAMP[nCamp]) then
		print("Thieu du lieu nCamp trong table TAB_LISTCAMP!")
	return 0 end
	SetCamp(nCamp)
	SetCurCamp(nCamp)
	Msg2Player(TAB_LISTCAMP[nCamp])
end

function AddAllPoint()
	local szTitle = ""..LENHBAI_QTV.."HÖ thèng Hç Trî C¸c Lo¹i §iÓm , Ng­êi Muèn G×?"
	local tbOpt = {}
		tinsert(tbOpt, {"§¼ng CÊp (NhËp Sè Nµo SÏ VÒ CÊp §ã)", g_AskClientStringEx, {"", 0,200,"Néi dung th«ng b¸o:", {AddLever, {nNum}}}})
		tinsert(tbOpt, {"§iÓm Kinh NghiÖm Céng Dån", g_AskClientStringEx, {"", 0,9999999999,"Néi dung th«ng b¸o:", {AddExpCongDon, {nNum}}}})
		tinsert(tbOpt, {"§iÓm Kinh NghiÖm Kh«ng Céng Dån", g_AskClientStringEx, {"", 0,256,"Néi dung th«ng b¸o:", {AddExpkoCongDon, {nNum}}}})
		tinsert(tbOpt, {"§iÓm kü n¨ng", g_AskClientStringEx, {"", 0,256,"Néi dung th«ng b¸o:", {AddKyNang, {nNum}}}})
		tinsert(tbOpt, {"§iÓm tiÒm n¨ng", g_AskClientStringEx, {"", 0,256,"Néi dung th«ng b¸o:", {AddTiemNang, {nNum}}}})
		tinsert(tbOpt, {"§iÓm tèng kim", g_AskClientStringEx, {"", 0,256,"Néi dung th«ng b¸o:", {AddTongKim, {nNum}}}})
		tinsert(tbOpt, {"§iÓm liªn ®Êu", g_AskClientStringEx, {"", 0,256,"Néi dung th«ng b¸o:", {AddLienDau, {nNum}}}})
		tinsert(tbOpt, {"§iÓm danh väng", g_AskClientStringEx, {"", 0,256,"Néi dung th«ng b¸o:", {AddDanhVong, {nNum}}}})
		tinsert(tbOpt, {"§iÓm l·nh ®¹o", g_AskClientStringEx, {"", 0,256,"Néi dung th«ng b¸o:", {AddLanhDao, {nNum}}}})
		tinsert(tbOpt, {"§iÓm phóc duyªn", g_AskClientStringEx, {"", 0,256,"Néi dung th«ng b¸o:", {AddPhucDuyen, {nNum}}}})
		tinsert(tbOpt, {"TiÒn V¹n(NhËp 1 Tøc Lµ 1 V¹n)", g_AskClientStringEx, {"", 0,256,"Néi dung th«ng b¸o:", {AddTienVan, {nNum}}}})
		tinsert(tbOpt, {"TiÒn §ång", g_AskClientStringEx, {"", 0,256,"Néi dung th«ng b¸o:", {AddTienDong, {nNum}}}})
		tinsert(tbOpt, {"§ãng."})
	CreateNewSayEx(szTitle, tbOpt)
end


function AddLever(nLevel)
	if (GetLevel() == nLevel) then
		Talk(1,"",format("HiÖn t¹i b¹n ®ang ë cÊp ®é %d",nLevel));
		return
	end;
	ST_LevelUp(nLevel-GetLevel()); -- CÊp cÇn Thªm
	Msg2Player("B¹n §· Set CÊp <color=yellow>"..nLevel.."<color> Thµnh C«ng.")
end



function AddExpCongDon(nNum)
	StackExp(nNum); ---NhËn ®iÓm Kinh NghiÖm Céng Dån
	Msg2Player("B¹n nhËn ®­îc <color=yellow>"..nNum.."<color> ®iÓm Kinh NghiÖm Céng Dån.")
end

function AddExpkoCongDon(nNum)
	AddOwnExp(nNum); ---NhËn ®iÓm Kinh NghiÖm Céng Dån
	Msg2Player("B¹n nhËn ®­îc <color=yellow>"..nNum.."<color> ®iÓm Kinh NghiÖm Kh«ng Céng Dån.")
end


function AddKyNang(nNum)
	AddMagicPoint(nNum)---NhËn ®iÓm kü n¨ng
	Msg2Player("B¹n nhËn ®­îc <color=yellow>"..nNum.."<color> ®iÓm Kü N¨ng.")
end


function AddTiemNang(nNum)
	AddProp(nNum)		---NhËn ®iÓm tiÒm n¨ng
	Msg2Player("B¹n nhËn ®­îc <color=yellow>"..nNum.."<color> ®iÓm TiÒm N¨ng.")
end

function AddTongKim(nNum)
	local i = GetTask(747)
	SetTask(747, i+nNum)    -- §iÓm Tèng Kim
	Msg2Player("B¹n nhËn ®­îc <color=yellow>"..nNum.."<color> ®iÓm Tèng Kim.")
	Msg2Player("HiÖn T¹i B¹n §ang Cã <color=yellow>"..GetTask(747).."<color> ®iÓm Tèng Kim.")
end

function AddLienDau(nNum)
	local i = GetTask(2501)
	SetTask(2501, i+nNum) -- §iÓm Liªn §Êu
	Msg2Player("B¹n nhËn ®­îc <color=yellow>"..nNum.."<color> ®iÓm Liªn §Êu.")
	Msg2Player("HiÖn T¹i B¹n §ang Cã <color=yellow>"..GetTask(2501).."<color> §iÓm Liªn §Êu.")
end


function AddDanhVong(nNum)
	AddRepute(nNum) -- §iÓm Danh Väng
	Msg2Player("B¹n nhËn ®­îc <color=yellow>"..nNum.."<color> ®iÓm Danh Väng.")
end


function AddLanhDao(nNum)
	AddLeadExp(nNum) -- §iÓm L·nh §¹o
	Msg2Player("B¹n nhËn ®­îc <color=yellow>"..nNum.."<color> ®iÓm L·nh §¹o.")
end

function AddPhucDuyen(nNum)
	local i = GetTask(151)
	SetTask(151, i+nNum) -- §iÓm Phóc Duyªn
	Msg2Player("B¹n nhËn ®­îc <color=yellow>"..nNum.."<color> ®iÓm Phóc Duyªn.")
	Msg2Player("HiÖn T¹i B¹n §ang Cã <color=yellow>"..GetTask(151).."<color> §iÓm Phóc Duyªn.")
end

function AddTienVan(nNum)
	local i = nNum*10000;
	Earn(i) -- TiÒn V¹n
	Msg2Player("B¹n nhËn ®­îc <color=yellow>"..nNum.."<color> V¹n L­îng.")
end

function AddTienDong(nNum)
	for i = 1,nNum do
		AddStackItem(1,4,417,1,1,0,0,0)
	end
	Msg2Player("B¹n nhËn ®­îc <color=yellow>"..nNum.."<color> TiÒn §ång.")
end

-----------------------------------------------------------------------------------------------------------------------------------------------------
--																	GM - NhËn C¸c Ngùa														   --
-----------------------------------------------------------------------------------------------------------------------------------------------------

function AddThuCuoi()
	local tbContent = {""..LENHBAI_QTV.."<color=green>HÖ thèng Hç Trî C¸c Lo¹i ChiÕn M· , Ng­êi Muèn G×?<color>"};
		tinsert(tbContent, "ChiÕn M· - ¤ V©n §¹p TuyÕt/AddOvan");
		tinsert(tbContent, "ChiÕn M· - XÝch Thè/AddXichTho");
		tinsert(tbContent, "ChiÕn M· - TuyÖt ¶nh/AddTuyetAnh");
		tinsert(tbContent, "ChiÕn M· - §Ých L«/AddDichLo");
		tinsert(tbContent, "ChiÕn M· - ChiÕu D¹ Ngäc S­ Tö/AddChieuDa");
		tinsert(tbContent, "ChiÕn M· - Phi V©n/AddPhiVan");
		tinsert(tbContent, "ChiÕn M· - B«n Tiªu/AddBonTieu");
		tinsert(tbContent, "ChiÕn M· - Phiªn Vò/AddPhienVu");
		tinsert(tbContent, "§ãng");
	CreateTaskSay(tbContent)
end

function AddOvan()
	AddItem(0,10,5,6,0,0,0)
	Msg2Player("B¹n nhËn ®­îc <color=yellow>¤ V©n §¹p TuyÕt.")
end

function AddXichTho()
	AddItem(0,10,5,7,0,0,0)
	Msg2Player("B¹n nhËn ®­îc <color=yellow>XÝch Thè.")
end

function AddTuyetAnh()
	AddItem(0,10,5,8,0,0,0)
	Msg2Player("B¹n nhËn ®­îc <color=yellow>TuyÖt ¶nh.")
end

function AddDichLo()
	AddItem(0,10,5,9,0,0,0)
	Msg2Player("B¹n nhËn ®­îc <color=yellow>§Ých L«.")
end

function AddChieuDa()
	AddItem(0,10,5,10,0,0,0)
	Msg2Player("B¹n nhËn ®­îc <color=yellow>ChiÕu D¹ Ngäc S­ Tö.")
end

function AddPhiVan()
	AddItem(0,10,8,10,0,0,0)
	Msg2Player("B¹n nhËn ®­îc <color=yellow>Phi V©n.")
end

function AddBonTieu()
	AddItem(0,10,6,10,0,0,0)
	Msg2Player("B¹n nhËn ®­îc <color=yellow>B«n Tiªu.")
end

function AddPhienVu()
	AddItem(0,10,7,10,0,0,0)
	Msg2Player("B¹n nhËn ®­îc <color=yellow>Phiªn Vò.")
end

-----------------------------------------------------------------------------------------------------------------------------------------------------
--																	GM - LÊy §å TÝm															   --
-----------------------------------------------------------------------------------------------------------------------------------------------------


function Gm_Support_TB_Violet()
local szTitle = ""..LENHBAI_QTV.."<color=green>HÖ thèng Hç Trî §å TÝm , Ng­êi Muèn G×?<color>"
local tbOpt =
	{
		{"Vò KhÝ", weapon},
		{"Y Phôc", shirt},
		{"§inh M·o", hat},
		{"Hé UyÓn", glove},
		{"Yªu §¸i", belt},
		{"Hµi Tö", shoe},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function weapon()
local szTitle = ""..LENHBAI_QTV.."<color=green>HÖ thèng Hç Trî §å TÝm , Ng­êi Muèn G×?<color>"
local tbOpt =
	{
		{"KiÕm", kiem},
		{"§ao", dao},
		{"Bçng", bong},
		{"KÝch", KichTim},
		{"Chïy", chuy},
		{"Song §ao", songdao},
		{"Phi Tiªu", phitieu},
		{"Phi §ao", phidao},
		{"Tô TiÔn", tutien},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function kiem()
AddQualityItem(2,0,0,0,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,0,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,0,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,0,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,0,10,4,0,-1,-1,-1,-1,-1,-1) 
end


function dao()
AddQualityItem(2,0,0,1,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,1,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,1,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,1,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,1,10,4,0,-1,-1,-1,-1,-1,-1) 
end


function bong()
AddQualityItem(2,0,0,2,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,2,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,2,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,2,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,2,10,4,0,-1,-1,-1,-1,-1,-1) 
end


function KichTim()
AddQualityItem(2,0,0,3,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,3,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,3,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,3,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,3,10,4,0,-1,-1,-1,-1,-1,-1) 
end


function chuy()
AddQualityItem(2,0,0,4,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,4,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,4,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,4,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,4,10,4,0,-1,-1,-1,-1,-1,-1) 
end


function songdao()
AddQualityItem(2,0,0,5,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,5,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,5,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,5,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,0,5,10,4,0,-1,-1,-1,-1,-1,-1) 
end


function phitieu()
AddQualityItem(2,0,1,0,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,1,0,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,1,0,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,1,0,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,1,0,10,4,0,-1,-1,-1,-1,-1,-1) 
end


function phidao()
AddQualityItem(2,0,1,1,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,1,1,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,1,1,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,1,1,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,1,1,10,4,0,-1,-1,-1,-1,-1,-1) 
end


function tutien()
AddQualityItem(2,0,1,2,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,1,2,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,1,2,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,1,2,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,1,2,10,4,0,-1,-1,-1,-1,-1,-1) 
end

function shirt()
local szTitle = ""..LENHBAI_QTV.."<color=green>HÖ thèng Hç Trî §å TÝm , Ng­êi Muèn G×?<color>"
local tbOpt =
	{
		{"ThÊt B¶o Cµ Sa", aothieulam},
		{"Ch©n Vò Th¸nh Y", aovodang},
		{"Thiªn NhÉn MËt Trang", aothiennhan},
		{"Gi¸ng Sa Bµo", sabao},
		{"§­êng Nghª Gi¸p", dng},
		{"V¹n L­u Quy T«ng Y", aocaibang},
		{"TuyÒn Long Bµo", longbao},
		{"Long Tiªu §¹o Y", daoy},
		{"Cöu VÜ B¹ch Hå Trang", hotrang},
		{"TrÇm H­¬ng Sam", huongsam},
		{"TÝch LÞch Kim Phông Gi¸p", kimphung},
		{"V¹n Chóng TÒ T©m Y", tamy},
		{"L­u Tiªn QuÇn", tienquan},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function aothieulam()
AddQualityItem(2,0,2,0,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,0,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,0,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,0,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,0,10,4,0,-1,-1,-1,-1,-1,-1)
end


function aovodang()
AddQualityItem(2,0,2,1,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,1,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,1,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,1,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,1,10,4,0,-1,-1,-1,-1,-1,-1)
end


function aothiennhan()
AddQualityItem(2,0,2,2,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,2,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,2,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,2,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,2,10,4,0,-1,-1,-1,-1,-1,-1)
end


function sabao()
AddQualityItem(2,0,2,3,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,3,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,3,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,3,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,3,10,4,0,-1,-1,-1,-1,-1,-1)
end


function dng()
AddQualityItem(2,0,2,4,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,4,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,4,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,4,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,4,10,4,0,-1,-1,-1,-1,-1,-1)
end


function aocaibang()
AddQualityItem(2,0,2,5,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,5,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,5,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,5,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,5,10,4,0,-1,-1,-1,-1,-1,-1)
end


function longbao()
AddQualityItem(2,0,2,6,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,6,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,6,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,6,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,6,10,4,0,-1,-1,-1,-1,-1,-1)
end


function daoy()
AddQualityItem(2,0,2,8,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,8,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,8,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,8,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,8,10,4,0,-1,-1,-1,-1,-1,-1)
end


function hotrang()
AddQualityItem(2,0,2,9,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,9,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,9,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,9,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,9,10,4,0,-1,-1,-1,-1,-1,-1)
end


function huongsam()
AddQualityItem(2,0,2,10,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,10,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,10,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,10,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,10,10,4,0,-1,-1,-1,-1,-1,-1)
end


function kimphung()
AddQualityItem(2,0,2,11,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,11,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,11,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,11,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,11,10,4,0,-1,-1,-1,-1,-1,-1)
end


function tamy()
AddQualityItem(2,0,2,12,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,12,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,12,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,12,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,12,10,4,0,-1,-1,-1,-1,-1,-1)
end


function tienquan()
AddQualityItem(2,0,2,13,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,13,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,13,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,13,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,2,13,10,4,0,-1,-1,-1,-1,-1,-1)
end

function hat()
local szTitle = ""..LENHBAI_QTV.."<color=green>HÖ thèng Hç Trî §å TÝm , Ng­êi Muèn G×?<color>"
local tbOpt =
	{
		{"Tú L« M·o", lomao},
		{"Ngò L·o Qu¸n", laoquan},
		{"Tu La Ph¸t KÕ", phatket},
		{"Th«ng Thiªn Ph¸t Qu¸n", phatquan},
		{"YÓm NhËt Kh«i", nhatkhoi},
		{"TrÝch Tinh Hoµn", tinhhoan},
		{"¤ Tµm M·o", tammao},
		{"Quan ¢m Ph¸t Qu¸n", quanam},
		{"¢m D­¬ng V« Cùc Qu¸n", amduong},
		{"HuyÒn Tª DiÖn Tr¸o", dientrao},
		{"Long HuyÕt §Çu Hoµn", longhuyet},
		{"Long L©n Kh«i", lankhoi},
		{"Thanh Tinh Thoa", tinhthoa},
		{"Kim Phông TriÓn SÝ", triensi},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function lomao()
AddQualityItem(2,0,7,0,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,0,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,0,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,0,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,0,10,4,0,-1,-1,-1,-1,-1,-1)
end


function laoquan()
AddQualityItem(2,0,7,1,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,1,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,1,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,1,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,1,10,4,0,-1,-1,-1,-1,-1,-1)
end


function phatket()
AddQualityItem(2,0,7,2,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,2,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,2,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,2,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,2,10,4,0,-1,-1,-1,-1,-1,-1)
end


function phatquan()
AddQualityItem(2,0,7,3,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,3,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,3,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,3,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,3,10,4,0,-1,-1,-1,-1,-1,-1)
end


function nhatkhoi()
AddQualityItem(2,0,7,4,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,4,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,4,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,4,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,4,10,4,0,-1,-1,-1,-1,-1,-1)
end


function tinhhoan()
AddQualityItem(2,0,7,5,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,5,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,5,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,5,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,5,10,4,0,-1,-1,-1,-1,-1,-1)
end


function tammao()
AddQualityItem(2,0,7,6,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,6,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,6,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,6,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,6,10,4,0,-1,-1,-1,-1,-1,-1)
end


function quanam()
AddQualityItem(2,0,7,7,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,7,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,7,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,7,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,7,10,4,0,-1,-1,-1,-1,-1,-1)
end


function amduong()
AddQualityItem(2,0,7,8,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,8,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,8,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,8,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,8,10,4,0,-1,-1,-1,-1,-1,-1)
end


function dientrao()
AddQualityItem(2,0,7,9,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,9,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,9,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,9,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,9,10,4,0,-1,-1,-1,-1,-1,-1)
end


function longhuyet()
AddQualityItem(2,0,7,10,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,10,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,10,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,10,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,10,10,4,0,-1,-1,-1,-1,-1,-1)
end


function lankhoi()
AddQualityItem(2,0,7,11,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,11,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,11,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,11,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,11,10,4,0,-1,-1,-1,-1,-1,-1)
end


function tinhthoa()
AddQualityItem(2,0,7,12,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,12,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,12,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,12,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,12,10,4,0,-1,-1,-1,-1,-1,-1)
end


function triensi()
AddQualityItem(2,0,7,13,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,13,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,13,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,13,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,7,13,10,4,0,-1,-1,-1,-1,-1,-1)
end

function glove()
local szTitle = ""..LENHBAI_QTV.."<color=green>HÖ thèng Hç Trî §å TÝm , Ng­êi Muèn G×?<color>"
local tbOpt =
	{
		{"Long Phông HuyÕt Ngäc Tr¹c", ngoctrac},
		{"Thiªn Tµm Hé UyÓn", houyen},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function ngoctrac()
AddQualityItem(2,0,8,0,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,8,0,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,8,0,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,8,0,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,8,0,10,4,0,-1,-1,-1,-1,-1,-1)
end


function houyen()
AddQualityItem(2,0,8,1,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,8,1,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,8,1,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,8,1,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,8,1,10,4,0,-1,-1,-1,-1,-1,-1)
end

function belt()
local szTitle = ""..LENHBAI_QTV.."<color=green>HÖ thèng Hç Trî §å TÝm , Ng­êi Muèn G×?<color>"
local tbOpt =
	{
		{"Thiªn Tµm Yªu §¸i", thientamyeu},
		{"B¹ch Kim Yªu §¸i", bachkimyeudai},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function thientamyeu()
AddQualityItem(2,0,6,0,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,6,0,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,6,0,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,6,0,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,6,0,10,4,0,-1,-1,-1,-1,-1,-1)
end


function bachkimyeudai()
AddQualityItem(2,0,6,1,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,6,1,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,6,1,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,6,1,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,6,1,10,4,0,-1,-1,-1,-1,-1,-1)
end

function shoe()
local szTitle = ""..LENHBAI_QTV.."<color=green>HÖ thèng Hç Trî §å TÝm , Ng­êi Muèn G×?<color>"
local tbOpt =
	{
		{"Cöu TiÕt X­¬ng VÜ Ngoa", cuutien},
		{"Thiªn Tµm Ngoa", thientam},
		{"Kim Lò Hµi", kimlu},
		{"Phi Phông Ngoa", phiphung},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function cuutien()
AddQualityItem(2,0,5,0,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,0,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,0,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,0,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,0,10,4,0,-1,-1,-1,-1,-1,-1)
end


function thientam()
AddQualityItem(2,0,5,1,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,1,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,1,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,1,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,1,10,4,0,-1,-1,-1,-1,-1,-1)
end


function kimlu()
AddQualityItem(2,0,5,2,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,2,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,2,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,2,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,2,10,4,0,-1,-1,-1,-1,-1,-1)
end


function phiphung()
AddQualityItem(2,0,5,3,10,0,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,3,10,1,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,3,10,2,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,3,10,3,0,-1,-1,-1,-1,-1,-1)
AddQualityItem(2,0,5,3,10,4,0,-1,-1,-1,-1,-1,-1)
end


-----------------------------------------------------------------------------------------------------------------------------------------------------
--																Chøc N¨ng - Bang Héi															   --
-----------------------------------------------------------------------------------------------------------------------------------------------------

Include("\\script\\global\\repute_head.lua")
Include("\\script\\misc\\league_cityinfo.lua")
function DMcreattongtest()
local strTongName = GetTongName()
if (strTongName == nil or strTongName == "") then
local szTitle = ""..LENHBAI_QTV.."<color=green>HÖ thèng Bang Héi , Ng­êi Muèn G×?<color>"
local tbOpt =
	{
		{"NhËn §iÒu KiÖn T¹o Bang Héi",dmcreatetong},
		{"Gia NhËp Bang Héi",dmjointong},
		{"T¹o Bang Héi",dmcreateit},
		{"Trë L¹i",main},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
	else
	Say(szTitle,0)
end
end
function dmcreatetong()	
		SetCamp(4)
		SetCurCamp(4)
		AddRepute(1000);
		FuYuan_Start();
		FuYuan_Add(1000);
		AddLeadExp(20000)
		AddEventItem(195)
		if GetLevel() <= 100 then
			for i=1,100 do
				AddOwnExp(100000000)
			end
		end
Msg2Player("<color=yellow>Ng­¬i ®· héi ®ñ tÊt c¶ ®iªu kiÖn ®Ó t¹o Bang Héi!<color>")
end
function dmjointong()
if  GetCamp() ~= 4 then
		if GetLevel() <= 100 then
			for i=1,100 do
				AddOwnExp(100000000)
			end
		end
		SetCamp(4)
		SetCurCamp(4)
Msg2Player("<color=yellow>Gia nhËp Bang héi thµnh c«ng!<color>")
else
end
end
function dmcreateit()
	Tong_name,oper = GetTong()
	if (oper == 0) and (GetTask(99) == 1) then
		Say("Kiªm hiÖp ch­ëng m«n nh©n:Khai s¸ng bang héi, më réng b¸ nghiÖp." ,2,"B¾t ®Çu dùng bang/Direct_CreateTong","§îi ta mét chót/wait_a_moment")
	elseif (oper == 0) and (GetCamp() == 4) and (GetLevel() >= 50) and (GetReputeLevel(GetRepute()) >= 6) and (GetLeadLevel() >= 30) and (HaveItem(195) == 1) then
		Talk(6,"create_pay", "Ng­êi ch¬i: Kiªm hiÖp ch­ëng m«n nh©n, xin hái ta ph¶i lµm nh­ thÕ nµo míi ca thÓ khai t«ng lËp ph¸i trë thµnh Bang chñ ®©y?", "Kiªm hiÖp ch­ëng m«n nh©n: §Çu tiªn ng­¬i ph¶i cã ®ñ n¨ng lùc l·nh ®¹o, cã 16 ng­êi cïng chÝ h­íng cïng ng­¬i lËp bang, tr¶i qua 3 ngµy Kh¶o NghiÖm Kú ", "Ch­ëng m«n nh©n:  NÕu trong 3 ngµy cã ng­êi rêi bang th× néi trong 3 ngµy ®ã ng­¬i ph¶i t×m ng­êi kh¸c thay thÕ.", "Ch­ëng m«n nh©n:  Ng­¬i ph¶i cã ®ñ tµi l·nh ®¹o vµ tÝn vËt ®ã lµ Nh¹c V­¬ng KiÕm", "Ng­êi ch¬i: Nh¹c V­¬ng Kiªm ? Ng­êi nãi lµ thanh kiªm nµy µ ? ", "Kiªm hiÖp ch­ëng m«n nh©n : Th× ra lµ ng­¬i ®· cã nã... Kh«ng tÖ, qu¶ nhiªn tuæi trÎ tµi cao!!! ")
	else	
		i = random(0,1)
		if (i == 0) then
			Talk(1,"", "Kiªm hiÖp ch­ëng m«n nh©n: Nªu nh­ muèn thµnh lËp bang héi, ng­¬i cã thÓ v× nã bá ra 1 l­îng lín thêi gian, søc lùc cïng t©m huyÕt, kh«ng thÓ n÷a ®­êng hñy bá." )
		else
			Talk(6,"", "Kiªm hiÖp ch­ëng m«n nh©n:  Ng­¬i muèn hái ®iÒu kiÖn lËp bang µ? §Ó ta nãi cho ng­¬i râ.", "Kiªm hiÖp ch­ëng m«n nh©n: ®Çu tiªn ph¶i xuÊt x­,  tiªp theo ng­¬i kh«ng thÓ ë bÊt kú bang héi nµo kh¸c, ng­¬i nhÊt ®inh ph¶i cã danh väng giang hå, cuèi cïng lµ tµi l·nh ®¹o ph¶i h¬n 30 cÊp.", "Kiªm hiÖp ch­ëng m«n nh©n: Sau ®ã ®i chiÕn tr­êng t×m mét thanh Nh¹c V­¬ng Kiªm lµm bang chñ tÝn vËt lµ ®­îc råi.")
		end
	end
end

function create_pay()
	Say(""..LENHBAI_QTV.."Kiªm hiÖp ch­ëng m«n nh©n: Ng­¬i cÇn lÖ phi lµ 100 v¹n l­îng b¹c." ,2,"Kh«ng thµnh vÊn ®ª, ta cã ®em 100v l­îng ®©y! /create_pay_yes","Ta kh«ng ®em ®ñ tiªn råi. /create_pay_no")
end
function create_pay_yes()
	if (GetCash() >= 1000000) then
		Pay(1000000)		
		DelItem(195)		
		SetTask(99,1)				
		Direct_CreateTong()		
	else
		Talk(1,"", ""..LENHBAI_QTV.."Kiªm hiÖp ch­ëng m«n nh©n: ViÖc duy tr× bang héi rÊt tèn kÐm, ng­êi ph¶i cè g¾ng cïng mäi ng­êi tÝch gãp ®Ó Bang Héi ®­îc giµu m¹nh. ")	end
end

function Direct_CreateTong()
	CreateTong(1)				
end

-----------------------------------------------------------------------------------------------------------------------------------------------------
																/*[[ GM - TÈy Tuû ]]*/																   --
-----------------------------------------------------------------------------------------------------------------------------------------------------
function clear_attibute_point()
local szTitle = ""..LENHBAI_QTV.."Xin chµo <color=red>"..GetName().."<color>. B¹n cÇn tÈy ®iÓm TiÒm N¨ng hay Kü N¨ng?"
local tbOpt =
{
{"TÈy §iÓm Kü N¨ng.", do_clear_skill},
{"TÈy §iÓm TiÒm N¨ng.", do_clear_prop},
{"Tho¸t."},
}
CreateNewSayEx(szTitle, tbOpt)
end
function do_clear_skill()
local i = HaveMagic(210) 
local j = HaveMagic(400) 
local n = RollbackSkill() 
local x = 0
if (i ~= -1) then i = 1; x = x + i end 
if (j ~= -1) then x = x + j end
local rollback_point = n - x 
if (rollback_point + GetMagicPoint() < 0) then 
rollback_point = -1 * GetMagicPoint()
end
AddMagicPoint(rollback_point)
if (i ~= -1) then AddMagic(210, i) end 
if (j ~= -1) then AddMagic(400, j) end
Msg2Player("TÈy tñy thµnh c«ng! Ng­¬i cã "..rollback_point.." ®iÓm kü n¨ng ®Ó ph©n phèi l¹i.")
KickOutSelf()
end
function do_clear_prop()
local base_str = {35,20,25,30,20} 
local base_dex = {25,35,25,20,15}
local base_vit = {25,20,25,30,25}
local base_eng = {15,25,25,20,40}
local player_series = GetSeries() + 1

local Utask88 = GetTask(88)
AddStrg(base_str[player_series] - GetStrg(1) + GetByte(Utask88, 1))
AddDex(base_dex[player_series] - GetDex(1) + GetByte(Utask88, 2))
AddVit(base_vit[player_series] - GetVit(1) + GetByte(Utask88, 3))
AddEng(base_eng[player_series] - GetEng(1) + GetByte(Utask88, 4))
end


-----------------------------------------------------------------------------------------------------------------------------------------------------
--																GM - Reload Script																	   --
-----------------------------------------------------------------------------------------------------------------------------------------------------

function reloadfileconfig()
ReloadScript_mutigsv("/script/global/zid_jx/lib/config.lua")
Msg2Player("§· göi yªu cÇu ®Õn S3Relay!\n <color=cyan>Reload File ConfigSystem Thµnh C«ng!")
end

function reloadscript()
local szTitle = ""..LENHBAI_QTV.." Xin chµo, Ng­êi Muèn Reload Script Lo¹i Nµo ?"
local tbOpt =
	{
		{"GM - ReLoad Script In MutiGsv", ReloadScript_mutigsv},
		{"GM - Reload Script S3Relay", ReloadScriptReloadS3Relay},
		{"GM - Reload Task S3Relay", ReloadTaskReloadS3Relay},
		{"GM - Reload System Config", reloadfileconfig},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function ReloadScript_mutigsv(zidLinkReload)
	if type(zidLinkReload) == "string" then
		local zidLinkReload = zidLinkReload
		local Keywk1 = strfind(zidLinkReload, "\script")
		zidLinkReload = strsub(zidLinkReload, Keywk1-1, strlen(zidLinkReload))
		RemoteExc("\\script\\zid_jx\\funs3reloadscript.lua", "ReloadScriptMultiGamesv", {zidLinkReload})
		return Msg2Player("§· göi yªu cÇu ®Õn S3Relay!")
	end
	return AskClientForString("ReloadScript_mutigsv", "", 1, 500, "<#>NhËp ®­êng dÉn")
end


function ReloadScriptReloadS3Relay(zidData, zidScriptS3Relay)
	if type(zidData) == "string" then
		Msg2Player("Sent data to S3Relay!")
		return RemoteExc("\\script\\zid_jx\\funs3reloadscript.lua", "ReloadScriptS3Relay", {zidData}, "\\script\\global\\zid_jx\\gm\\gm_support.lua", "ReloadScriptReloadS3Relay", {})
	elseif type(zidData) == "number" then
		if (zidData == 0) then
			return Msg2Player("\nError,False to ReLoading S3Relay Script!<enter><color=yellow>"..zidScriptS3Relay);
		else
			return Msg2Player("\n<color=green>Script S3Relay has been reloaded<color><enter><color=blue>"..zidScriptS3Relay)
		end
	end
	AskClientForString("ReloadScriptReloadS3Relay", "", 1, 500, "<#>NhËp ®­êng dÉn S3Relay")
end

function ReloadTaskReloadS3Relay(zidValue, zidTaskName)
	if zidValue == nil then
		return AskClientForString("ReloadTaskReloadS3Relay", "", 1, 500, "<#>File Task S3Relay")
	elseif type(zidValue) == "string" then
		Msg2Player("Sent data to S3Relay!")
		return RemoteExc("\\script\\zid_jx\\funs3reloadscript.lua", "ReloadTaskS3Relay", {zidValue}, "\\script\\global\\zid_jx\\gm\\gm_support.lua", "ReloadTaskReloadS3Relay", {})
	elseif type(zidValue) == "number" then
		if zidValue == 0 then
			return Msg2Player("FALSE to load Task S3Relay:<enter>"..zidTaskName)
		else
			Msg2Player("<color=yellow>Load Task S3Relay OK:<color><enter><color=green>"..zidTaskName)
		end
	end
end


-----------------------------------------------------------------------------------------------------------------------------------------------------
--																TÝnh n¨ng Call All Feature															--
-----------------------------------------------------------------------------------------------------------------------------------------------------

function Gm_Call_Big_Boss()
g_AskClientNumberEx(1, 10, "Sè L­îng Boss", {Gm_Call_Big_Bos, {nNum}})
end

function Gm_Call_Big_Bos(nNum)
RemoteExc("\\script\\zid_jx\\callhoatdong.lua", "Gm_Call_Big_Boss_", {nNum})
end

function Gm_Call_small_Bos()
RemoteExc("\\script\\zid_jx\\callhoatdong.lua", "Gm_Call_small_Boss_", {})
end



function Gm_Call_Va_()
RemoteExc("\\script\\zid_jx\\callhoatdong.lua", "Gm_Call_Va", {})
end

function Gm_Call_Hoa_Son()
RemoteExc("\\script\\zid_jx\\callhoatdong.lua", "Gm_Call_Hoa_Son", {})
end

function Gm_Call_Pld_()
RemoteExc("\\script\\zid_jx\\callhoatdong.lua", "Gm_Call_PLD", {})
end


function Gm_Call_Battles_()
Msg2Player("<color=green>NhËp Sè 1 Lµ Më S¬ CÊp<color>")
Msg2Player("<color=green>NhËp Sè 2 Lµ Më Trung CÊp<color>")
Msg2Player("<color=green>NhËp Sè 3 Lµ Më Cao CÊp<color>")
g_AskClientNumberEx(1, 3, "Lo¹i Tèng Kim:", {Gm_Call_Battles_Now, {nNum}})
end

function Gm_Call_Battles_Now(nNum)
RemoteExc("\\script\\zid_jx\\callhoatdong.lua", "Gm_Call_Battles", {nNum})
end

function Gm_Call_Battles_Tong()
RemoteExc("\\script\\zid_jx\\callhoatdong.lua", "Gm_Call_Tong_Battles", {})
end



function Call_Feature_CTC()
local szTitle = ""..LENHBAI_QTV.." Xin chµo, Ng­êi Muèn Sö Dông Chøc N¨ng Nµo ?"
local tbOpt =
	{
		{"B¾t §Çu B¸o Danh - CTC", Gm_Call_Start_Register_CTC_},
		{"KÕt Thóc B¸o Danh - CTC", Gm_Call_End_Register_CTC_},
		{"B¾t §Çu Më Map - CTC", Gm_Call_Start_OpenMap_CTC_},
		{"BÊt §Çu C«ng Thµnh ChiÕn", Gm_Call_Start_CTC_},
		{"Xãa Gi÷ LiÖu C«ng Thµnh ChiÕn", Gm_Call_ClearMap_CTC_},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end


function Gm_Call_Start_Register_CTC_()
RemoteExc("\\script\\zid_jx\\callhoatdong.lua", "Gm_Call_Start_Register_CTC", {})
end

function Gm_Call_End_Register_CTC_()
RemoteExc("\\script\\zid_jx\\callhoatdong.lua", "Gm_Call_End_Register_CTC", {})
end

function Gm_Call_Start_OpenMap_CTC_()
RemoteExc("\\script\\zid_jx\\callhoatdong.lua", "Gm_Call_Start_OpenMap_CTC", {})
end

function Gm_Call_Start_CTC_()
RemoteExc("\\script\\zid_jx\\callhoatdong.lua", "Gm_Call_Start_CTC", {})
end

function Gm_Call_ClearMap_CTC_()
RemoteExc("\\script\\zid_jx\\callhoatdong.lua", "Gm_Call_ClearMap_CTC", {})
end

function Gm_Call_LCA_H()
RemoteExc("\\script\\zid_jx\\callhoatdong.lua", "Gm_Call_LCAH", {})
end
function Gm_Call_YDB_Z()
RemoteExc("\\script\\zid_jx\\callhoatdong.lua", "Gm_Call_ydbz", {})
end

-----------------------------------------------------------------------------------------------------------------------------------------------------
--																TÝnh n¨ng MSG2															--
-----------------------------------------------------------------------------------------------------------------------------------------------------

function Msg2Sub(str)
RemoteExc("\\script\\zid_jx\\functionmsg.lua", "Msg2SubAll", {str})
end

function AddGlobal(str)
RemoteExc("\\script\\zid_jx\\functionmsg.lua", "Msg2Nofi", {str})
end

function AddGlobal_SubWorld(str)
RemoteExc("\\script\\zid_jx\\functionmsg.lua", "Msg2Allworld", {str})
end


--------------------------------------------------------------------------------------------------
function Gm_Call_Save_Rank()
RemoteExc("\\script\\zid_jx\\callhoatdong.lua", "Gm_SaveRankAll", {})
end

function Gm_Call_Update_Rank()
RemoteExc("\\script\\zid_jx\\callhoatdong.lua", "Gm_UpdateRank", {})
end

function Gm_Call_LMTc()
RemoteExc("\\script\\zid_jx\\callhoatdong.lua", "Gm_Call_LMTC", {})
end

