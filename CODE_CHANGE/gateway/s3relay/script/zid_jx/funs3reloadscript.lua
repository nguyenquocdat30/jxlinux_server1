
function ReloadScriptS3Relay(StringScript)
	local ValueReceived = LoadScript(StringScript)
	if FALSE(ValueReceived) then
		print("FALSE to LoadScript")
		return 0, StringScript
	else
		print("LoadScript Successefull")
		return 1, StringScript
	end
end

function ReloadTaskS3Relay(StringTask)
	local ValueReceived = TaskLoad(StringTask)
	if FALSE(ValueReceived) then
		print("FALSE to LoadTask")
		return 0, StringTask
	else
		print("TaskLoad Successefull")
		return 1, StringTask
	end
end

function ReloadScriptMultiGamesv(_1)
	print("\t Reload Script 4 MultiGameSv: ".._1)
	return GlobalExecute(format("dw LoadScript([[%s]])",_1))
end

function FALSE(nValue)
	if (nValue == nil or nValue == 0 or nValue == "") then
		return 1
	else
		return nil
	end
end