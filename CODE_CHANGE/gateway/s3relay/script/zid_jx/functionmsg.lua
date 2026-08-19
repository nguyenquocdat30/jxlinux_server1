function Msg2SubAll(str)
GlobalExecute(format("dw Msg2SubWorld([[%s]])", str))
end
function Msg2Nofi(str)
GlobalExecute(format("dw AddLocalCountNews([[%s]], 1)",str))
end

function Msg2Allworld(str)
GlobalExecute(format("dw AddLocalCountNews([[%s]], 1)",str))
GlobalExecute(format("dw Msg2SubWorld([[%s]])", str))
end

