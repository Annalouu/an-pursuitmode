Config = {}
Config.Print = false
Config.Core = 'qb-'
Config.DefaultKey = 'N'
Config.Notify = 'qb-core'
Config.Notification = "%s mode applied"

Config.AuthorizedJobs = {
    "police",
}

Config.VehicleTiers = {
    ['S'] = {
        'police',
    },
    ['A'] = {
        'police2',
    },
    ['B'] = {
        'police3',
    },
    ['C'] = {
        'police4',
    },
}

Config.VehicleModes = { 
    "N",
    "S",
    "S+",
    "R"
}

Config.VehicleModifications = {
    ["N"] = {
        ["Turbo"] = false,
        ["Engine"] = -1,
        ["Brakes"] = 0,
        ["Transmission"] = -1,
    },
    ["S"] = {
        ["Turbo"] = false,
        ["Engine"] = 1,
        ["Brakes"] = 1,
        ["Transmission"] = 1,
    },
    ["S+"] = {
        ["Turbo"] = true,
        ["Engine"] = 2,
        ["Brakes"] = 2,
        ["Transmission"] = 2,
    },
    ["R"] = {
        ["Turbo"] = true,
        ["Engine"] = 3,
        ["Brakes"] = 2,
        ["Transmission"] = 2,
    }
}

Config.TierConfig = {
    ["C"] = {
        ["N"] = {
            ["fDriveInertia"] = 1.000000,
            ["fBrakeForce"] = 0.750,
            ["fInitialDriveMaxFlatVel"] = 135.000000,
            ["fSteeringLock"] = 42.00,
            ["fInitialDriveForce"] = 0.260
        },
        ["S"] = {
            ["fDriveInertia"] = 1.050000,
            ["fBrakeForce"] = 0.800,
            ["fInitialDriveMaxFlatVel"] = 145.000000,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.280
        },
        ["S+"] = {
            ["fDriveInertia"] = 1.100000,
            ["fBrakeForce"] = 0.850,
            ["fInitialDriveMaxFlatVel"] = 155.000000,
            ["fSteeringLock"] = 38.00,
            ["fInitialDriveForce"] = 0.300
        },
        ["R"] = {
            ["fDriveInertia"] = 1.150000,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 165.000000,
            ["fSteeringLock"] = 36.00,
            ["fInitialDriveForce"] = 0.350
        }
    },
    ["B"] = {
        ["N"] = {
            ["fDriveInertia"] = 1.000000,
            ["fBrakeForce"] = 0.800,
            ["fInitialDriveMaxFlatVel"] = 145.000000,
            ["fSteeringLock"] = 40.00,
            ["fInitialDriveForce"] = 0.280
        },
        ["S"] = {
            ["fDriveInertia"] = 1.080000,
            ["fBrakeForce"] = 0.850,
            ["fInitialDriveMaxFlatVel"] = 155.000000,
            ["fSteeringLock"] = 38.00,
            ["fInitialDriveForce"] = 0.310
        },
        ["S+"] = {
            ["fDriveInertia"] = 1.130000,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 165.000000,
            ["fSteeringLock"] = 36.00,
            ["fInitialDriveForce"] = 0.340
        },
        ["R"] = {
            ["fDriveInertia"] = 1.180000,
            ["fBrakeForce"] = 0.950,
            ["fInitialDriveMaxFlatVel"] = 175.000000,
            ["fSteeringLock"] = 34.00,
            ["fInitialDriveForce"] = 0.380
        }
    },
    ["A"] = {
        ["N"] = {
            ["fDriveInertia"] = 1.000000,
            ["fBrakeForce"] = 0.850,
            ["fInitialDriveMaxFlatVel"] = 155.000000,
            ["fSteeringLock"] = 38.00,
            ["fInitialDriveForce"] = 0.300
        },
        ["S"] = {
            ["fDriveInertia"] = 1.100000,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 165.000000,
            ["fSteeringLock"] = 36.00,
            ["fInitialDriveForce"] = 0.330
        },
        ["S+"] = {
            ["fDriveInertia"] = 1.160000,
            ["fBrakeForce"] = 0.950,
            ["fInitialDriveMaxFlatVel"] = 175.000000,
            ["fSteeringLock"] = 34.00,
            ["fInitialDriveForce"] = 0.370
        },
        ["R"] = {
            ["fDriveInertia"] = 1.220000,
            ["fBrakeForce"] = 1.000,
            ["fInitialDriveMaxFlatVel"] = 185.000000,
            ["fSteeringLock"] = 32.00,
            ["fInitialDriveForce"] = 0.420
        }
    },
    ["S"] = {
        ["N"] = {
            ["fDriveInertia"] = 1.000000,
            ["fBrakeForce"] = 0.900,
            ["fInitialDriveMaxFlatVel"] = 165.000000,
            ["fSteeringLock"] = 36.00,
            ["fInitialDriveForce"] = 0.320
        },
        ["S"] = {
            ["fDriveInertia"] = 1.120000,
            ["fBrakeForce"] = 0.950,
            ["fInitialDriveMaxFlatVel"] = 175.000000,
            ["fSteeringLock"] = 34.00,
            ["fInitialDriveForce"] = 0.360
        },
        ["S+"] = {
            ["fDriveInertia"] = 1.200000,
            ["fBrakeForce"] = 1.000,
            ["fInitialDriveMaxFlatVel"] = 185.000000,
            ["fSteeringLock"] = 32.00,
            ["fInitialDriveForce"] = 0.410
        },
        ["R"] = {
            ["fDriveInertia"] = 1.280000,
            ["fBrakeForce"] = 1.100,
            ["fInitialDriveMaxFlatVel"] = 195.000000,
            ["fSteeringLock"] = 30.00,
            ["fInitialDriveForce"] = 0.480
        }
    },
}