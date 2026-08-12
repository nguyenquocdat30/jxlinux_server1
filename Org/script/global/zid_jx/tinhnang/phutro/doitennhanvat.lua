Include("\\script\\gmscript.lua")
Include("\\script\\lib\\file.lua");
Include("\\script\\lib\\string.lua");
Include("\\script\\global\\forbidmap.lua");
Include("\\script\\global\\playerlist.lua")
Include("\\script\\global\\rename_head.lua")
Include("\\script\\global\\rolename_op.lua")
Include("\\script\\global\\zid_jx\\log\\log.lua")

Include("\\script\\global\\rename_head.lua")

function maindoiten()

	server_loadfile("\\jxzid\\kiemtra_doiten.dat");	

	local tbSay = {}
	tinsert(tbSay,"KiÓm tra tªn nh©n vËt ./query_rolename")
	tinsert(tbSay,"§æi tªn nh©n vËt ./change_rolename3")
	tinsert(tbSay,"§Ó ta suy nghÜ l¹i ./thoat")
	Say("<color=yellow>"..GetName().."<color> ng­¬i muèn ®æi tªn nh©n vËt ph¶i tiªu hao <color=red>1000 V¹n L­îng<color> cã muèn thùc hiÖn kh«ng?", getn(tbSay), tbSay)

end

function query_rolename()
	AskClientForString("on_query_rolename", "", 1, 21, "<#> Xin nhËp tªn nh©n vËt cÇn t×m hiÓu");
end

function on_query_rolename(new_name)
	QueryRoleName(new_name);
	SaveRename(new_name)
end


function SaveRename(nVar)
	local szFile = "\\jxzid\\kiemtra_doiten.dat"
	local szAccount = GetAccount();
	server_setdata(szFile,"ACCOUNT_RENAME",szAccount,nVar);
	server_savedata(szFile);
end



function GetRename()
	local szFile = "\\jxzid\\kiemtra_doiten.dat"
	local newName = server_getdata(szFile,"ACCOUNT_RENAME",GetAccount());
	if not newName or newName == "" then 
		return ""
	end
	return newName
end


function change_rolename3()
	local _, nTongId = GetTongName()
	if (nTongId ~= 0) then
		Msg2Player(" <color=green>§¹i hiÖp ®· cã Bang Héi kh«ng thÓ tiÕn hµnh thao t¸c nµy!<color>")
		return
	end

	local tendakiemtra = GetRename()
	if tendakiemtra ~= "" and tendakiemtra ~= "0" then
		local tbOpt = {}
		tinsert(tbOpt,"§ång ý ®æi ./on_change_rolename3")
		tinsert(tbOpt,"Kh«ng ®Ó ta kiÓm tra l¹i tªn kh¸c ./Quit")
		Say("§¹i hiÖp cã muèn ®æi tªn thµnh <color=red>"..tendakiemtra.."<color>", getn(tbOpt), tbOpt)
		else
		Say("§¹i hiÖp kiÓm tra tªn tr­íc khi ®æi")
	end

end

function on_change_rolename3()
	local new_name = GetRename()
	if (GetName() == new_name) then
		Talk(1, "", "<#> B¹n muèn ®æi tªn g×?")
	else
		if(muabangxu(10000000) == 1) then
			SaveRename("0");
			RenameRole(new_name)
			SaveLogs("doitennhanvat", format("[%s] | Tµi Kho¶n :(%s) | Nh©n vËt : [%s] §æi Sang Tªn [%s]!",date("%H:%M:%S - %d/%m/%Y"),GetAccount(),GetName(),new_name));

		end
	end
end

function muabangxu(soxu)
	if GetCash() < soxu then
		Say("Kh¸ch quan kh«ng mang ®ñ tiÒn v¹n!", 0)
		return -1;
	end
	Pay(soxu)
	return 1;
end;

