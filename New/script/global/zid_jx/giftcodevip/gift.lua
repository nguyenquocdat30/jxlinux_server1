IncludeLib("FILESYS");
IncludeLib("TASKSYS");
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\global\\zid_jx\\giftcodevip\\libgm.lua")
Include("\\script\\global\\zid_jx\\giftcodevip\\gift_award.lua")
Task_VipCode = 5025
Task_GiftCode = 5024
-------------------------------------------------------
tbKandy = {}
tbKandy.szFile = "\\dulieu\\checkcode.dat"
server_loadfile(tbKandy.szFile)
---------------------------------------------
function codehieu()
dofile("script/global/zid_jx/giftcodevip/gift.lua")
dofile("script/global/zid_jx/giftcodevip/gift_award.lua")
	local szTitle ="<color=green>Vui Lßng NhËp T©n Thñ:<color> <color=yellow>tanthu999 <color>\n"
	local tbOpt = {
		{"NhËp GiftCode T©n Thñ",QuaTanThu},
		{"NhËp Code Vip ",CodeStrings},
		{"Tho¸t",}
	}
	CreateNewSayEx(szTitle, tbOpt) 

end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function CodeStrings()
				if CalcFreeItemCellCount() >= 40 then
					AskClientForString("CODECHECK","",1,999999999,"NhËp GiftCode")
				else
					Talk(1,"","Hµnh Trang Kh«ng §ñ 40 ¤ Trèng H·y S¾p XÕp L¹i Råi NhËn Th­ëng")
				end
			
end;

function CODECHECK(nVar)
	local IsClone = server_getdata(tbKandy.szFile,"GIFT_CODE_CHECK",nVar);
	local nillVar = 0
	if IsClone ~= "" then 
		return Say("<color=red>M· GIFTCODE §· §­îc Sö Dông Vui Lßng Liªn HÖ GM §Ó\n§­îc Gi¶i QuyÕt<color>")
	end
	for k=1,getn(ListGift) do
		if nVar == ListGift[k][1] then
			server_setdata(tbKandy.szFile,"GIFT_CODE_CHECK",nVar,"1");
			server_savedata(tbKandy.szFile);
			SetTask(Task_VipCode, 1) tbAwardTemplet:GiveAwardByList(tbQuaTang.tbAward[2],"PhÇn Th­ëng GiftCode")
			Earn(10000000) -- 1k van
			Msg2SubWorld("<color=green>Chóc Mõng<color> "..GetName().." <color=green> §· NhËn GiftCode  Hç Trî Acc ChÝnh Thµnh C«ng\n Code Gåm:\n+ Xu\n+ TiÒn V¹n")
			WriteLogPro("dulieu/checkcodeshare_"..date("%d_%m_%Y")..".txt",""..GetAccount().."  "..GetName().."  "..GetIP().."\t "..tonumber(GetLocalDate("%Y%m%d%H%M")).." \t su dung code   "..nVar.." \n");
			return
		else 
			nillVar = 0
		end
	end
	if nillVar == 0 then
		return Say("M· gift ng­¬i võa nhËp vµo kh«ng tån t¹i trong hÖ thèng!")
	end;
end;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function QuaTanThu()
	if GetTask(Task_GiftCode) == 0 then
		if CalcFreeItemCellCount() >= 40 then
			AskClientForString("CHECKCODE","",1,999999999,"NhËp GiftCode")
		else
			Talk(1,"","Hµnh Trang Kh«ng §ñ 40 ¤ Trèng H·y S¾p XÕp L¹i Råi NhËn Th­ëng")
		end
	else
		Talk(1,"","<color=red>"..GetName().." §· NhËn Th­ëng Råi")
	end
end

function CHECKCODE(nVar)
	for i = 1,getn(GiftTanThu) do
		if nVar == GiftTanThu[i][1] then
			SetTask(Task_GiftCode,1) tbAwardTemplet:GiveAwardByList(tbQuaTang.tbAward[1],"PhÇn Th­ëng GiftCode")
			Msg2SubWorld("<color=green>Chóc Mõng<color> "..GetName().." <color=green> §· NhËn GiftCode Thµnh C«ng, Gåm:\n+50 phi tèc\n+50 lÖnh bµi\n+50phi tèc")
			return
		end
		Talk(1,"","<color=red>"..GetName().." NhËp Th«ng Tin Kh«ng ChÝnh X¸c")
	end
end
function WriteLogPro(data,str)
	local Data2 = openfile(""..data.."", "a+");
	write(Data2,tostring(str));
	closefile(Data2);
end
----------------------------------------------------------------------------------------------------------------------------------------------------------