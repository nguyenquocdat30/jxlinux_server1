Include("\\script\\lib\\awardtemplet.lua")

tbTimeActive =
{
	[1] = {1300, 1330},
	[2] = {2100, 2130},
}
tbAwardTK =
{
	{szName = "Phong V©n Phi Tèc hoµn", tbProp = {6, 1, 190, 0, 0, 0}, nCount = 50, nExpiredTime = 1440, nBindState = -2},	
	{szName = "LÖnh bµi", tbProp = {6, 1, 157, 0, 0, 0}, nCount = 20, nExpiredTime = 1440, nBindState = -2},	
}

TASK_RESET_DAILY_AWARD_TK	= 2776
TASK_INDEX_AWARD_TK				= 2777

nEndDate = 20501107

function Start_Date()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	if (nCurDate <= nEndDate) then
		return 1
	else
		return 0
	end
end

function CheckTimeActive()
	local nHour = tonumber(date("%H%M"))
	for i = 1, getn(tbTimeActive) do 
		if (nHour >= tbTimeActive[i][1] and nHour <=  tbTimeActive[i][2]) then
			return i
		end
	end
	return 0
end

function GetAwardTK()
	if CalcFreeItemCellCount() < 10 then
		Talk(1, "", "CÇn 10 ¤ Trèng Míi Cã ThÓ NhËn PhÇn Th­ëng Nµy");
		return
	end
	if Start_Date() == 0 then
		Talk(1, "", "§· HÕt H¹n Thêi Gian Ho¹t §éng Kh«ng ThÓ NhËn N÷a.");
		return 
	end
	ResetDailyAwardTK()
	
	local nIndex = CheckTimeActive()
	
	if (GetTask(TASK_INDEX_AWARD_TK) ~= nIndex) then
		SetTask(TASK_INDEX_AWARD_TK, nIndex)
		for i = 1, getn(tbAwardTK) do
			tbAwardTemplet:GiveAwardByList(tbAwardTK[i] , "Th­ëng Tèng Kim");
		end
	else
		Talk(1, "", "§¹i HiÖp §· NhËn Råi H·y Nh­êng L¹i Cho Ng­êi Kh¸c");
		return
	end
end

function ResetDailyAwardTK()
	local taskTemp = GetTask(TASK_RESET_DAILY_AWARD_TK)
	local nCurrDate = tonumber(GetLocalDate("%y%m%d"))
	if (taskTemp ~= nCurrDate) then
		SetTask(TASK_RESET_DAILY_AWARD_TK, nCurrDate)
		SetTask(TASK_INDEX_AWARD_TK, 0)
	end
end