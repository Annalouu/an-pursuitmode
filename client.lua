if Config.framework == 'qbcore' then
    QBCore = exports["qb-core"]:GetCoreObject()
elseif Config.framework == 'esx' then
    ESX = exports.es_extended:getSharedObject()
end

local gear = 1
local currentVehicle = 0
local currentVehicleMode = Config.VehicleModes[1]
local playerJob = {['name'] = 'unemployed'}
local hashModelMap = {}

function GetVehicleMode()
    return currentVehicleMode
end

if Config.framework == 'qbcore' then
    RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    updatePlayerInfo()
    setupModelHashMap()
    end)
elseif Config.framework == 'esx' then
    RegisterNetEvent('esx:playerLoaded', function(xPlayer)
    updatePlayerInfo()
    setupModelHashMap()
    PlayerData = xPlayer   
    end)
end

if Config.framework == 'qbcore' then
    RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
        playerJob = job
    end)
elseif Config.framework == 'esx' then
    RegisterNetEvent('esx:setJob')
    AddEventHandler('esx:setJob', function (job)
        playerJob = job
    end)
end
    

function fixVehicleHandling(veh)
    SetVehicleModKit(veh,0)
    SetVehicleMod(veh,0,GetVehicleMod(veh,0),false)
    SetVehicleMod(veh,1,GetVehicleMod(veh,1),false)
    SetVehicleMod(veh,2,GetVehicleMod(veh,2),false)
    SetVehicleMod(veh,3,GetVehicleMod(veh,3),false)
    SetVehicleMod(veh,4,GetVehicleMod(veh,4),false)
    SetVehicleMod(veh,5,GetVehicleMod(veh,5),false)
    SetVehicleMod(veh,6,GetVehicleMod(veh,6),false)
    SetVehicleMod(veh,7,GetVehicleMod(veh,7),false)
    SetVehicleMod(veh,8,GetVehicleMod(veh,8),false)
    SetVehicleMod(veh,9,GetVehicleMod(veh,9),false)
    SetVehicleMod(veh,10,GetVehicleMod(veh,10),false)
    SetVehicleMod(veh,11,GetVehicleMod(veh,11),false)
    SetVehicleMod(veh,12,GetVehicleMod(veh,12),false)
    SetVehicleMod(veh,13,GetVehicleMod(veh,13),false)
    SetVehicleMod(veh,15,GetVehicleMod(veh,15),false)
    SetVehicleMod(veh,16,GetVehicleMod(veh,16),false)
    SetVehicleMod(veh,25,GetVehicleMod(veh,25),false)
    SetVehicleMod(veh,27,GetVehicleMod(veh,27),false)
    SetVehicleMod(veh,28,GetVehicleMod(veh,28),false)
    SetVehicleMod(veh,30,GetVehicleMod(veh,30),false)
    SetVehicleMod(veh,33,GetVehicleMod(veh,33),false)
    SetVehicleMod(veh,34,GetVehicleMod(veh,34),false)
    SetVehicleMod(veh,35,GetVehicleMod(veh,35),false)
    SetVehicleWheelIsPowered(veh,0,true)
    SetVehicleWheelIsPowered(veh,1,true)
    SetVehicleWheelIsPowered(veh,2,true)
    SetVehicleWheelIsPowered(veh,3,true)
end

function setupModelHashMap()
    for k,v in pairs(Config.VehiclesConfig) do
        hashModelMap[GetHashKey(k)] = k
    end
end

function getModelFromHash(hash)
    return hashModelMap[hash]
end

function isValidVehicle(vehicle)
    local vehicleHash = GetEntityModel(vehicle)
    local vehicleModel = getModelFromHash(vehicleHash)
    return Config.VehiclesConfig[vehicleModel]
end

local function getHandlingConfig(vehicleHash)
    local vehicleModel = getModelFromHash(vehicleHash)
    if Config.VehiclesConfig[vehicleModel] then
        return Config.VehiclesConfig[vehicleModel][currentVehicleMode]
    end
end

function updateHandling(vehicle)
    local handlingConfig = getHandlingConfig(GetEntityModel(vehicle))
    for k,v in pairs(handlingConfig) do
        if math.type(v) == 'float' then
            SetVehicleHandlingFloat(vehicle, "CHandlingData", k, v)
        elseif math.type(v) == 'integer' then
            SetVehicleHandlingInt(vehicle, "CHandlingData", k, v)
        elseif type(v) == 'vector3' then
            SetVehicleHandlingVector(vehicle, "CHandlingData", k, v)
        end
    end
    fixVehicleHandling(vehicle)
end

function applyVehicleMods(vehicle)
    local vehicleMode = Config.VehicleModes[gear]
    
    ToggleVehicleMod(vehicle, 18, Config["VehicleModifications"][vehicleMode]["Turbo"]) -- Turbo
    ToggleVehicleMod(vehicle, 22, Config["VehicleModifications"][vehicleMode]["XenonHeadlights"]) -- Xenon Headlights
    SetVehicleMod(vehicle, 11, Config["VehicleModifications"][vehicleMode]["Engine"], false) -- Engine
    SetVehicleMod(vehicle, 12, Config["VehicleModifications"][vehicleMode]["Brakes"], false) -- Brakes
    SetVehicleMod(vehicle, 13, Config["VehicleModifications"][vehicleMode]["Transmission"], false) -- Transmission
    SetVehicleXenonLightsColour(vehicle, Config["VehicleModifications"][vehicleMode]["XenonHeadlightsColor"]) -- Xenon Headlights Color

end

function updateVehicleMode(vehicle)
    gear = gear % #Config.VehicleModes + 1
    if vehicle ~= currentVehicle then
        gear = 1
    end
    currentVehicle = vehicle
    currentVehicleMode = Config.VehicleModes[gear]
    TriggerEvent('an-pursuitmode:vehicleModeChanged', currentVehicleMode)
end

function updatePlayerInfo()
    if Config.framework == 'qbcore' then
        local playerData = QBCore.Functions.GetPlayerData()
        playerJob = playerData.job
    elseif Config.framework == 'esx' then
        local PlayerData = ESX.GetPlayerData()
        playerJob = PlayerData.job
    end
end

function isAuthorizedToSwitchMode()
    if next(Config.AuthorizedJobs) == nil then -- No jobs defined
        return true
    end
    if Config.framework == 'qbcore' then
    for i, v in ipairs(Config.AuthorizedJobs) do
        if playerJob.name == v then
            return true
        end
    end
    elseif Config.framework == 'esx' then
        for i, v in ipairs(Config.AuthorizedJobs) do
            if playerJob.name == v then
                return true
            end
        end
    end
    return false
end

RegisterNetEvent('an-pursuitmode:client:updateVehicleMode')
AddEventHandler('an-pursuitmode:client:updateVehicleMode', function()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        local vehicle = GetVehiclePedIsIn(ped)
        if DoesEntityExist(vehicle) and isValidVehicle(vehicle) and isAuthorizedToSwitchMode() then
            updateVehicleMode(vehicle)
            updateHandling(vehicle)
            applyVehicleMods(vehicle)
            if Config.framework == 'qbcore' then
            QBCore.Functions.Notify((Config.Notification):format(currentVehicleMode))
            elseif Config.framework == 'esx' then
                lib.notify({
                    title = 'success',
                    description = (Config.Notification):format(currentVehicleMode),
                    type = 'success',
                    duration = 1000,
            })
            end
        end
    end
end)


local InPursuitMode = false
CreateThread(function()
    while true do
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped) then
            if not InPursuitMode then
                local vehicle = GetVehiclePedIsIn(ped)
                if DoesEntityExist(vehicle) then
                    TriggerEvent('an-pursuitmode:client:updateVehicleMode')
                    InPursuitMode = true
                end
            end
        else
            InPursuitMode = false
        end
        Wait(1000)
    end
end)

AddEventHandler('onClientResourceStart', function (resourceName)
    if(GetCurrentResourceName() ~= resourceName) then
      return
    end
    updatePlayerInfo()
    setupModelHashMap()
end)

RegisterCommand("pursuitmode", function(source, args, rawCommand)
    TriggerEvent('an-pursuitmode:client:updateVehicleMode')
end, false)

RegisterKeyMapping('pursuitmode', 'Change pursuitmode (POLICE ONLY)', 'keyboard', Config.DefaultKey)
