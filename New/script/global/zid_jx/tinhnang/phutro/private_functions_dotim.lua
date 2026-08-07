IncludeLib("ITEM")
IncludeLib("TASKSYS")
TITLEDIALOG = "Tªn nh©n vËt: <color=green>%s<color>\n".."Tªn tµi kho¶n: <color=green>%s<color>\n".."Täa ®é: <color=green>%d, %d/%d<color> \nIP : <color=green>%s<color>"
 tb_RegItem = {
	-- yªu cÇu 1,  (cã thÓ add thªm)
	[1] = {
				szName = "TiÒn §ång",
				szItem = {4,417,1,-1}, -- vËt phÈm  
				szNumber = 111, -- sè l­îng 
				},		
}
tb_UI = {
	[1] = {
				szSay =  "N©ng cÊp dßng tÝm/GiveUI",
				szUI = {"N©ng cÊp thuéc tÝnh", "Xin mêi bá ®å tÝm vµo ®©y, \nchó ý : ®å ®· Ðp dßng tõ thî rÌn sÏ kh«ng thÓ n©ng cÊp", "Upgrade", "OnCancel",1},
				},
	[2] = {
				szSay =  "§æi ®å th­êng thµnh ®å tÝm/GiveUI",
				szUI = {"§æi §å", "Chøc n¨ng ®æi ®å tr¾ng/xanh thµnh ®å tÝm \n Yªu cÇu "..tb_RegItem[1].szName.." : "..tb_RegItem[1].szNumber.."", "CoverToPurple", "OnCancel"},
				},
}
function dotim()
	dofile("script/global/zid_jx/tinhnang/phutro/private_functions_dotim.lua")
    local nW,nX,nY = GetWorldPos()
	local szIP = GetIP()
    local tbSay = {format(TITLEDIALOG, GetName(), GetAccount() ,nW,nX,nY,szIP)}
	for i = 1, getn(tb_UI) do
		local str = tb_UI[i].szSay
			tinsert(tbSay,""..str) 
	end
    tinsert(tbSay, "KÕt thóc ®èi tho¹i./no")
	CreateTaskSay(tbSay)
	return 1;
end
-----------------------------------------------------------------
function GiveUI(i)
	local str = tb_UI[i+1].szUI
	GiveItemUI(str[1],str[2],str[3],str[4]);
end
-------------§æi ®å th­êng thµnh ®å tÝm-------------
function CoverToPurple(nItemCount)
	if nItemCount ~= 1 then
		Talk(1,"","Ta chØ cÇn 1 ®å tr¾ng hoÆc xanh th«i")
		 return
	end
	local nItemIndex = GetGiveItemUnit(nItemCount)
	local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp(nItemIndex)
	if nGenre ~= 0 then
		Talk(1,"","§å nµy kh«ng thÓ chuyÓn thµnh ®å tÝm")
		return 
	end
	local nQuality =  GetItemQuality(nItemIndex)
	if nQuality ~= 0 then
		Talk(1,"","Ng­¬i ®ïa ta µ ? ®©y kh«ng ph¶i lµ ®å tr¾ng/xanh")
		return 
	end
	for i = 1,  getn(tb_RegItem) do
		local RegItem = tb_RegItem[i].szItem
		local RegItemName = tb_RegItem[i].szName
		local RegItemNum = tb_RegItem[i].szNumber
		local n_coincount = CalcEquiproomItemCount(RegItem[1],RegItem[2],RegItem[3],RegItem[4])
		if n_coincount <  RegItemNum then
			Talk(1,"","Trªn ng­êi cña ng­¬i kh«ng ®ñ "..RegItemNum.." "..RegItemName.."" ) 
			return 
		end
	end
	for i = 1,  getn(tb_RegItem) do
		local RegItem = tb_RegItem[i].szItem
		local RegItemNum = tb_RegItem[i].szNumber
		ConsumeEquiproomItem(RegItemNum,RegItem[1],RegItem[2],RegItem[3],RegItem[4])
	end
	local nRandSeed = ITEM_GetItemRandSeed(nItemIndex)
	local Prop1,Prop2,Prop3,Prop4,Prop5,Prop6 = -1,-1,-1,-1,-1,-1
	AddItemEx(4,nRandSeed,2,nGenre,nDetailType,nParticular,nLevel,nSeries,nQuality,Prop1,Prop2,Prop3,Prop4,Prop5,Prop6)
	RemoveItemByIndex(nItemIndex)
	Msg2Player("ChuyÓn ®æi thµnh c«ng")
end
----------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------
function Upgrade(nItem)
	if nItem ~= 1 then
		 return Talk(1,"","ChØ ®­îc bá vµo 1 mãn ®å th«i")
	end
	local nItemIndex = GetGiveItemUnit(nItem)
	local nQuality	= GetItemQuality(nItemIndex)
	if nQuality ~= 2 then
		return  Talk(1,"","Kh«ng ph¶i lµ ®å tÝm")
	end
	if nQuality == 2  then
		local nCount = 0
		for i = 1 , 6 do
			local att = GetItemAllParams(nItemIndex)
			if att[i] ~=  0 then
				nCount = nCount + 1
			end
		end
		if nCount ~= 0  then
			return ChoseItemLine(nItem,nCount)
		end
		return  Talk(1,"","§å tÝm cÇn Ýt nhÊt 1 dßng míi cã thÓ n©ng cÊp")
	end
end

function ChoseItemLine(nItem,nCount)
	local nItemIndex = GetGiveItemUnit(nItem)
	local szTitle = "Xin chµo ! §¹i hiÖp muèn n©ng cÊp dßng nµo ?\n"
	local tbOpt= {}
	local szFile = "\\settings\\item\\004\\magicattriblevel.txt"
	local str = ""
	for i = 1, nCount do
		local att = GetItemAllParams(nItemIndex)
		local attributeNum = att[i]
		local nLineAttribute = mod(i,2)
		if	attributeNum == -1 then
			if nLineAttribute == 0 then
				str = "Thuéc tÝnh <Èn "..i.."> ch­a kh¶m n¹m <Click ®Ó kh¶m>"
				tinsert(tbOpt, {str,ChoseAttribute,{nItem,i,nLineAttribute}})
			end
			if nLineAttribute == 1 then
				str = "Thuéc tÝnh <hiÖn "..i.."> ch­a kh¶m n¹m <Click ®Ó kh¶m>"
				tinsert(tbOpt, {str,ChoseAttribute,{nItem,i,nLineAttribute}})
			end
		end
		if attributeNum ~= -1 then
			local szID = tonumber(TabFile_GetCell(szFile, attributeNum + 1, "MAGIC_ID"))
			local szNextID = tonumber(TabFile_GetCell(szFile, attributeNum + 2, "MAGIC_ID"))
			local szLevel = tonumber(TabFile_GetCell(szFile, attributeNum + 1, "LEVEL"))
			local szNextLevel  = tonumber(TabFile_GetCell(szFile, attributeNum + 2, "LEVEL"))
			local AttID,AttNumber = GetItemMagicAttrib(nItemIndex,i)
			local ItemMagicDesc = GetItemMagicDesc(AttID,AttNumber,0,0)
			str = ""..ItemMagicDesc.." : CÊp hiÖn t¹i ["..szLevel.."]"
			tinsert(tbOpt, {str,UpgradeAttribute,{nItem,i,attributeNum,szID,szNextID,szLevel,szNextLevel}})
		end
	end
	tinsert(tbOpt, {"L¸t n÷a quay l¹i"});
	CreateNewSayEx(szTitle, tbOpt)	
end

function ChoseAttribute(nItem,nNum,bolen)
	local nItemIndex = GetGiveItemUnit(nItem)
	local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp(nItemIndex)
	local att = GetItemAllParams(nItemIndex)
	local szTitle = "Xin chµo ! §¹i hiÖp muèn n©ng cÊp dßng nµo ??\n"
	local tbOpt= {}
	local szFile = "\\settings\\item\\004\\magicattriblevel.txt"
	local nRowCount = TabFile_GetRowCount(szFile)
	local check = 0
	for i = 2,  nRowCount do
		local szLevel = tonumber(TabFile_GetCell(szFile, i, "LEVEL"))
		local szSERIES = tonumber(TabFile_GetCell(szFile, i, "SERIES"))
		local szPREFIX = tonumber(TabFile_GetCell(szFile, i, "PREFIX"))
		-----------------------------------------------------------------------------------------------------------
		if szSERIES == nSeries  or szSERIES == nil and szLevel == 1 and szPREFIX == bolen  then
			local szNAME = tostring(TabFile_GetCell(szFile, i, "NAME"))
			local szID = tonumber(TabFile_GetCell(szFile, i, "MAGIC_ID"))
			local szLevel = tonumber(TabFile_GetCell(szFile, i, "LEVEL"))
			tinsert(tbOpt, {szNAME,AddAttribute,{nItem,nNum,i-1}})
			--Msg2Player("Sè dßng :"..i..", Tªn :"..szNAME..", Èn/hiÖn :"..szPREFIX..", id thuéc tÝnh: "..szID..", CÊp ®é :"..szLevel.."")
		end	
	end
	tinsert(tbOpt, {"L¸t n÷a quay l¹i"});
	CreateNewSayEx(szTitle, tbOpt)
end
function AddAttribute(nItem,nLine,nNum)
		local nItemIndex = GetGiveItemUnit(nItem)
		Msg2Player(""..nItem..","..nLine..","..nNum.."")
		SetItemMagicLevel(nItemIndex,nLine, nNum)
		SyncItem(nItemIndex)
		SaveNow()
end
function UpgradeAttribute(nItem,nNum,id,szID,szNextID,szLevel,szNextLevel)
	local nItemIndex = GetGiveItemUnit(nItem)
	local att = GetItemAllParams(nItemIndex)
	local MagicLevel = GetItemMagicLevel(nItemIndex,nNum)
	local attributeNum = att[nNum]
	if szID == szNextID then
		SetItemMagicLevel(nItemIndex,nNum, attributeNum+1)
		SyncItem(nItemIndex)
		SaveNow()
		return Talk(1,"","B¹n ®· n©ng cÊp thµnh c«ng dßng "..nNum.." tõ cÊp "..szLevel.." lªn cÊp "..szNextLevel.."")
	end
	if szID ~= szNextID then
		return Talk(1,"","B¹n ®· n©ng cÊp max option dßng "..nNum.."")
	end
	return Talk(1,"","Lçi ch­a râ, liªn hÖ víi GM")
end
----------------------------------------------------------------------------------------------------------------------------------