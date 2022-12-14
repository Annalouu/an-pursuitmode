Config = {}

Config.DefaultKey = 'N'
Config.framework = 'esx' -- qbcore / esx
Config.Notification = "%s mode applied" -- %s is the vehiclemode

Config.AuthorizedJobs = {
    "police",
}

Config.VehicleModes = { 
    "C",
    "B",
    "A",
    "S"
}

Config.VehicleModifications = { -- define each mode their own modifications
    ["C"] = {
        ["Turbo"] = false,
        ["XenonHeadlights"] = false,
        ["Engine"] = -1,
        ["Brakes"] = -1,
        ["Transmission"] = -1,
        ["XenonHeadlightsColor"] = 0,
    },
    ["B"] = {
        ["Turbo"] = false,
        ["XenonHeadlights"] = false,
        ["Engine"] = 2,
        ["Brakes"] = 1,
        ["Transmission"] = 2,
        ["XenonHeadlightsColor"] = 0,
    },
    ["A"] = {
        ["Turbo"] = true,
        ["XenonHeadlights"] = false,
        ["Engine"] = 3,
        ["Brakes"] = 1,
        ["Transmission"] = 2,
        ["XenonHeadlightsColor"] = 0,
    },
    ["S"] = {
        ["Turbo"] = true,
        ["XenonHeadlights"] = false,
        ["Engine"] = 4,
        ["Brakes"] = 2,
        ["Transmission"] = 3,
        ["XenonHeadlightsColor"] = 1,
    }
}

 Config.VehiclesConfig = {
    ["police"] = {
        ["C"] = {
            ["fDriveInertia"] = 1.000000,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 145.000000,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.285
        },
        ["B"] = {
            ["fDriveInertia"] = 1.100000,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 150.000000,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.29
        },
        ["A"] = {
            ["fDriveInertia"] = 1.15,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 165.0,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.30
        },
        ["S"] = {
            ["fDriveInertia"] = 1.17,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 179.0,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.45
        }
    },
--[[     ["police"] = {  -- this is an example of how to add more cars.
        ["C"] = {
            ["fDriveInertia"] = 1.000000,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 145.000000,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.285
        },
        ["B"] = {
            ["fDriveInertia"] = 1.100000,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 150.000000,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.29
        },
        ["A"] = {
            ["fDriveInertia"] = 1.15,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 165.0,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.30
        },
        ["S"] = {
            ["fDriveInertia"] = 1.17,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 179.0,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.45
        }
    }, ]]
    ["police2"] = {
        ["C"] = {
            ["fDriveInertia"] = 1.000000,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 145.000000,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.285
        },
        ["B"] = {
            ["fDriveInertia"] = 1.100000,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 150.000000,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.29
        },
        ["A"] = {
            ["fDriveInertia"] = 1.15,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 165.0,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.30
        },
        ["S"] = {
            ["fDriveInertia"] = 1.17,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 179.0,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.45
        }
    },
    ["police3"] = {
        ["C"] = {
            ["fDriveInertia"] = 1.000000,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 145.000000,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.285
        },
        ["B"] = {
            ["fDriveInertia"] = 1.100000,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 150.000000,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.29
        },
        ["A"] = {
            ["fDriveInertia"] = 1.15,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 165.0,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.30
        },
        ["S"] = {
            ["fDriveInertia"] = 1.17,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 179.0,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.45
        }
    },
    ["police4"] = {
        ["C"] = {
            ["fDriveInertia"] = 1.000000,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 145.000000,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.285
        },
        ["B"] = {
            ["fDriveInertia"] = 1.100000,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 150.000000,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.29
        },
        ["A"] = {
            ["fDriveInertia"] = 1.15,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 165.0,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.30
        },
        ["S"] = {
            ["fDriveInertia"] = 1.17,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 179.0,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.45
        }
    },
    ["fbi"] = {
        ["C"] = {
            ["fDriveInertia"] = 1.000000,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 145.000000,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.285
        },
        ["B"] = {
            ["fDriveInertia"] = 1.100000,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 150.000000,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.29
        },
        ["A"] = {
            ["fDriveInertia"] = 1.15,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 165.0,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.30
        },
        ["S"] = {
            ["fDriveInertia"] = 1.17,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 179.0,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.45
        }
    },
    ["fbi2"] = {
        ["C"] = {
            ["fDriveInertia"] = 1.000000,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 145.000000,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.285
        },
        ["B"] = {
            ["fDriveInertia"] = 1.100000,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 150.000000,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.29
        },
        ["A"] = {
            ["fDriveInertia"] = 1.15,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 165.0,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.30
        },
        ["S"] = {
            ["fDriveInertia"] = 1.17,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 179.0,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.45
        }
    }
}



