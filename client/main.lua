(function()
    Shared = Core.Shared
    for tier, vehicles in pairs(Option.VehicleTiers) do
        for _, model in pairs(vehicles) do
            if Shared.Vehicles[model] then
                Shared.Vehicles[model].tier = tier
                Shared.VehicleHashes[Shared.Vehicles[model].hash].tier = tier
                print('Vehicle ' .. model .. ' has been assigned to tier: ' .. tier)
            else
                print('Vehicle ' .. model .. ' not found in Shared.Vehicles, skipping tier assignment.')
            end
        end
    end
end)()

local gear, currentVehicle = 1, 0
local currentVehicleMode = Option.VehicleModes[1]
local playerJob = { ['name'] = 'unemployed' }

function GetVehicleData()
    local vehicleEntity = GetVehiclePedIsIn(PlayerPedId(), false)
    local vehicleData = Shared.VehicleHashes[GetEntityModel(vehicleEntity)]
    return vehicleData
end

function IsCheckValid()
    local vehicleData = GetVehicleData()
    local vehicleEntity = GetVehiclePedIsIn(PlayerPedId(), false)
    if DoesEntityExist(vehicleEntity) and IsAuthorizedToSwitchMode() and vehicleData.category == 'emergency' then
        for i, tierData in pairs(Option.TierConfig) do
            if i == vehicleData.tier then
                print('Valid tier found: ' .. i)
                print('Vehicle category: ' .. vehicleData.category)
                return vehicleEntity
            end
        end
    end
    print('you are not authorized to switch modes or the vehicle is not valid.')
    return false
end

function GetHandlingConfig()
    local vehicleMode = GetVehicleMode()

    for tier, tierData in pairs(Option.TierConfig) do
        for mode, modeData in pairs(tierData) do
            if vehicleMode == mode then
                print(json.encode(modeData) .. ' : 1')
                return modeData
            end
        end
        break
    end
end

function GetModelFromHash()
    local vehicleData = GetVehicleData()
    local model = vehicleData.model
    return model
end

function UpdateHandling(vehicle)
    local handlingConfig = GetHandlingConfig(GetEntityModel(vehicle))
    print('Handling config for vehicle: ' .. json.encode(handlingConfig))
    for k, v in pairs(handlingConfig) do
        if math.type(v) == 'float' then
            SetVehicleHandlingFloat(vehicle, "CHandlingData", k, v)
        elseif math.type(v) == 'integer' then
            SetVehicleHandlingInt(vehicle, "CHandlingData", k, v)
        elseif type(v) == 'vector3' then
            SetVehicleHandlingVector(vehicle, "CHandlingData", k, v)
        end
    end
    FixVehicleHandling(vehicle)
end

function GetVehicleMode()
    return currentVehicleMode
end

function UpdatePlayerInfo()
    local playerData = Core.Functions.GetPlayerData()
    playerJob = playerData.job
end

function UpdateVehicleMode(vehicle)
    gear = gear % #Option.VehicleModes + 1
    if vehicle ~= currentVehicle then
        gear = 1
    end
    currentVehicle = vehicle
    currentVehicleMode = Option.VehicleModes[gear]
    print('Current vehicle mode: ' .. currentVehicleMode)
end

function IsAuthorizedToSwitchMode()
    if next(Option.AuthorizedJobs) == nil then -- No jobs defined
        return true
    end
    for _, v in ipairs(Option.AuthorizedJobs) do
        if playerJob.name == v then
            return true
        end
    end
    return false
end

function ApplyVehicleMods(vehicle)
    local vehicleMode = Option.VehicleModes[gear]
    print('Applying vehicle mods for mode: ' .. vehicleMode)

    ToggleVehicleMod(vehicle, 18, Option.VehicleModifications[vehicleMode].Turbo) -- Turbo
    print(GetVehicleMod(vehicle, 18))
    SetVehicleMod(vehicle, 11, Option.VehicleModifications[vehicleMode].Engine, false) -- Engine
    SetVehicleMod(vehicle, 12, Option.VehicleModifications[vehicleMode].Brakes, false) -- Brakes
    SetVehicleMod(vehicle, 13, Option.VehicleModifications[vehicleMode].Transmission, false) -- Transmission
end

function FixVehicleHandling(veh)
    SetVehicleModKit(veh, 0)
    SetVehicleMod(veh, 0, GetVehicleMod(veh, 0), false)
    SetVehicleMod(veh, 1, GetVehicleMod(veh, 1), false)
    SetVehicleMod(veh, 2, GetVehicleMod(veh, 2), false)
    SetVehicleMod(veh, 3, GetVehicleMod(veh, 3), false)
    SetVehicleMod(veh, 4, GetVehicleMod(veh, 4), false)
    SetVehicleMod(veh, 5, GetVehicleMod(veh, 5), false)
    SetVehicleMod(veh, 6, GetVehicleMod(veh, 6), false)
    SetVehicleMod(veh, 7, GetVehicleMod(veh, 7), false)
    SetVehicleMod(veh, 8, GetVehicleMod(veh, 8), false)
    SetVehicleMod(veh, 9, GetVehicleMod(veh, 9), false)
    SetVehicleMod(veh, 10, GetVehicleMod(veh, 10), false)
    SetVehicleMod(veh, 11, GetVehicleMod(veh, 11), false)
    SetVehicleMod(veh, 12, GetVehicleMod(veh, 12), false)
    SetVehicleMod(veh, 13, GetVehicleMod(veh, 13), false)
    SetVehicleMod(veh, 15, GetVehicleMod(veh, 15), false)
    SetVehicleMod(veh, 16, GetVehicleMod(veh, 16), false)
    SetVehicleMod(veh, 25, GetVehicleMod(veh, 25), false)
    SetVehicleMod(veh, 27, GetVehicleMod(veh, 27), false)
    SetVehicleMod(veh, 28, GetVehicleMod(veh, 28), false)
    SetVehicleMod(veh, 30, GetVehicleMod(veh, 30), false)
    SetVehicleMod(veh, 33, GetVehicleMod(veh, 33), false)
    SetVehicleMod(veh, 34, GetVehicleMod(veh, 34), false)
    SetVehicleMod(veh, 35, GetVehicleMod(veh, 35), false)
    SetVehicleWheelIsPowered(veh, 0, true)
    SetVehicleWheelIsPowered(veh, 1, true)
    SetVehicleWheelIsPowered(veh, 2, true)
    SetVehicleWheelIsPowered(veh, 3, true)
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    UpdatePlayerInfo()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    playerJob = job
end)

RegisterNetEvent('patrol_system:client:updatemode')
AddEventHandler('patrol_system:client:updatemode', function()
    local vehicle = IsCheckValid()
    if vehicle then
        UpdateVehicleMode(vehicle)
        UpdateHandling(vehicle)
        ApplyVehicleMods(vehicle)
        if Notify == 'qb' then
            Core.Functions.Notify((Option.Notification):format(currentVehicleMode), 'success', 1500)
        elseif Notify == 'ox_lib' then
            lib.notify({
                title = 'success',
                description = (Option.Notification):format(currentVehicleMode),
                type = 'success',
                duration = 1500,
            })
        end
    end
end)

AddEventHandler('onClientResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    UpdatePlayerInfo()
end)

RegisterCommand("pursuitmode", function(source, args, rawCommand)
    TriggerEvent('patrol_system:client:updatemode')
end, false)

RegisterKeyMapping('pursuitmode', 'Change pursuitmode', 'keyboard', Option.DefaultKey)