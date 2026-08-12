Include("\\script\\global\\zid_jx\\tinhnang\\phutro\\chuyendoimonphai.lua");
Include("\\script\\global\\zid_jx\\tinhnang\\phutro\\doitennhanvat.lua");
Include("\\script\\global\\zid_jx\\tinhnang\\baucua\\main.lua");
Include("\\script\\global\\zid_jx\\tinhnang\\phutro\\private_functions_dotim.lua");
Include("\\script\\changefeature\\feature_man.lua");
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua");
function main()
	local tbSay = {}
	tinsert(tbSay,"§å TÝm/dotim")
	tinsert(tbSay,"BÇu Cua T«m C¸/mainbaucua")
	tinsert(tbSay,"§æi Tªn Nh©n VËt/maindoiten")
	tinsert(tbSay,"ChuyÓn §æi M«n Ph¸i./chuyenmonphai")
	tinsert(tbSay,"ChÕ T¹o Vò KhÝ Ph¸t S¸ng/mainchetaovukhi")
	tinsert(tbSay,"§Ó Ta Suy NghÜ L¹i./onCancel")
	Say("<color=yellow>"..GetName().."<color> Cã G× CÇn Gióp §ì", getn(tbSay), tbSay)
end


function mainbaucua()
GameFeast:DialogMain()
end

function onCancel() end


function mainchetaovukhi()
tbFeatureNpc:SelectType()
end


function maindoiphai()
ChangeFaction:DialogMain()
end






