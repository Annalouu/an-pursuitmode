# Vehicle Performance System Configuration

## Overview

This configuration system allows for dynamic vehicle performance tuning with multiple drive modes and tier-based vehicle classifications. It integrates with QB-Core framework and provides authorized job-based access control.

---

## Basic Configuration
```lua
---@field Print boolean Enable debug messages for troubleshooting
---@field Core string Framework core identifier (default: 'qb-')
---@field DefaultKey string Default drive mode when entering vehicle
---@field Notify string Notification system to use ('qb-core' or 'ox_lib')
---@field Notification string Notification message template (%s = mode name)
```
### Example:
```lua
Config.Print = false
Config.Core = 'qb-'
Config.DefaultKey = 'N'
Config.Notify = 'qb-core'
Config.Notification = "%s mode applied"
```

---

## Authorization System
```lua
---@field AuthorizedJobs table|nil Jobs allowed to use the system (nil = all players)
```
### Example:
```lua
Config.AuthorizedJobs = {
    "police",
    "sheriff",
    "ems"
}
```

---

## Vehicle Tier Classification
```lua
---@field VehicleTiers table Vehicle spawn names organized by performance tier
---@field S table Elite/Specialist vehicles (highest performance)
---@field A table Advanced patrol vehicles
---@field B table Standard patrol vehicles
---@field C table Entry-level patrol vehicles (lowest performance)
```
### Example:
```lua
Config.VehicleTiers = {
    ['S'] = {
        'police',
        'police_interceptor'
    },
    ['A'] = {
        'police2',
        'police_charger'
    },
    ['B'] = {
        'police3',
        'police_explorer'
    },
    ['C'] = {
        'police4',
        'police_crown'
    },
}
```

---

## Drive Modes
```lua
---@field VehicleModes table Available drive modes in order
---@field N string Normal/Patrol mode (stock performance)
---@field S string Sport mode (enhanced performance)
---@field S+ string Sport Plus mode (high performance)
---@field R string Race mode (maximum performance)
```
### Example:
```lua
Config.VehicleModes = { 
    "N",
    "S", 
    "S+",
    "R"
}
```

---

## Vehicle Modifications
```lua
---@field VehicleModifications table Visual and mechanical modifications per mode
---@field Turbo boolean Enable/disable turbo sound and effect
---@field Engine number Engine upgrade level (-1 = stock, 0-3 = upgrade levels)
---@field Brakes number Brake upgrade level (0-2)
---@field Transmission number Transmission upgrade level (-1 = stock, 0-2 = upgrade levels)
```
### Example:
```lua
Config.VehicleModifications = {
    ["N"] = {
        ["Turbo"] = false,
        ["Engine"] = -1,
        ["Brakes"] = 0,
        ["Transmission"] = -1,
    },
    ["S+"] = {
        ["Turbo"] = true,
        ["Engine"] = 2,
        ["Brakes"] = 2,
        ["Transmission"] = 2,
    }
}
```

---

## Performance Tuning Parameters
```lua
---@field TierConfig table Performance values for each tier and mode combination
---@field fDriveInertia number Drive inertia multiplier (higher = more responsive)
---@field fBrakeForce number Braking force multiplier (0.0-2.0, higher = stronger brakes)
---@field fInitialDriveMaxFlatVel number Maximum flat velocity (~top speed in mph)
---@field fSteeringLock number Steering lock angle (lower = more sensitive steering)
---@field fInitialDriveForce number Initial drive force (acceleration multiplier)
```
### Example - Tier S (Elite) Configuration:
```lua
Config.TierConfig = {
    ["S"] = {
        ["N"] = {
            ["fDriveInertia"] = 1.000000,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 165.000000,
            ["fSteeringLock"] = 36.00,
            ["fInitialDriveForce"] = 0.320
        },
        ["R"] = {
            ["fDriveInertia"] = 1.280000,
            ["fBrakeForce"] = 1.100,
            ["fInitialDriveMaxFlatVel"] = 195.000000,
            ["fSteeringLock"] = 30.00,
            ["fInitialDriveForce"] = 0.480
        }
    }
}
```

---

## Performance Tier Breakdown

### Tier S (Elite/Specialist)
- **Normal Mode**: 165 mph top speed, responsive handling
- **Race Mode**: 195 mph top speed, maximum acceleration and braking

### Tier A (Advanced Patrol)
- **Normal Mode**: 155 mph top speed, good balance
- **Race Mode**: 185 mph top speed, high performance

### Tier B (Standard Patrol)
- **Normal Mode**: 145 mph top speed, reliable performance
- **Race Mode**: 175 mph top speed, enhanced capabilities

### Tier C (Entry Level)
- **Normal Mode**: 135 mph top speed, basic patrol use
- **Race Mode**: 165 mph top speed, moderate enhancement

---

## Usage Notes

1. **Drive Inertia**: Controls how quickly the vehicle responds to input changes
2. **Brake Force**: Higher values provide stronger stopping power but may cause wheel lock
3. **Max Flat Velocity**: Directly correlates to top speed on flat surfaces
4. **Steering Lock**: Lower values make steering more sensitive and responsive
5. **Drive Force**: Higher values improve acceleration but may affect handling

---

## Integration Example

```lua
-- Check if player has authorized job
local hasAccess = false
if Config.AuthorizedJobs then
    for _, job in pairs(Config.AuthorizedJobs) do
        if PlayerData.job.name == job then
            hasAccess = true
            break
        end
    end
else
    hasAccess = true
end

-- Apply vehicle modifications based on current mode
local vehicleHash = GetEntityModel(vehicle)
local vehicleName = GetDisplayNameFromVehicleModel(vehicleHash):lower()
local tier = GetVehicleTier(vehicleName)
local currentMode = GetCurrentDriveMode(vehicle)

-- Apply performance settings
local config = Config.TierConfig[tier][currentMode]
SetVehicleHandlingFloat(vehicle, "CHandlingData", "fDriveInertia", config.fDriveInertia)
SetVehicleHandlingFloat(vehicle, "CHandlingData", "fBrakeForce", config.fBrakeForce)
-- ... apply other settings
```

## Credit

Original [Annalouu](https://github.com/Annalouu)
Refactored by [LenixDev](https://github.com/LenixDev)
