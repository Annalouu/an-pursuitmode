Option = {}
Option.Print = true
Core = 'trplr_core'
Notify = 'qb'

if Core == 'automatic' then
    if GetResourceState('qb-core') == 'started' then
        Core = exports['qb-core']:GetCoreObject()
    else
        print('qb-core not started, please start it before this resource.')
    end
elseif GetResourceState(Core) == 'started' then
    Core = exports[Core]:GetCoreObject()
else
    print('qb-core not started, please start it before this resource.')
end

local originalPrint = print
print = function(...)
    local info = debug.getinfo(2, "Sl")
    local lineInfo = info.short_src .. ":" .. info.currentline
    return Option.Print and originalPrint("[" .. lineInfo .. "]", ...)
end