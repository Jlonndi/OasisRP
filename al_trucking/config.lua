Trucking = {}

-- If set to false, you're responsible for your own framework integration (And you must enable Trucking.UsingNativeUI unless you create your own UI system). Otherwise, if you're using ESX - keep true
Trucking.UsingESX = true

-- If you are using ESX, you can keep this false. Otherwise, you can enable this along with uncommenting the NativeUI lines in the fxmanifest.lua
Trucking.UsingNativeUI = false

-- If you're NOT using ESX, I recommend you keep this false if you don't want to make server side job fetching/setting changes
-- Otherwise, if you're using ESX, you can keep this true to require the proper job name to interact with the functionality of the script, or keep it false if you want player jobs to be ignored (all players, despite the job, will be able to interact with the script functionality...Example: Off-duty police or service workers can do this job without job name restrictions)
Trucking.RequireJob = true

-- If RequireJob is false, this will be ignored
Trucking.JobName = 'trucking'

-- How much the player will get payed PER mile. (Please note that the the mileage may not be 100% accurate all the time)
-- Ex: If you have to drive a total of 7 miles, the script may count that as 5 or so miles as it does not take to account the road miles
-- but rather the direct distance from you and the destination (like a straight line instead of what you see on your GPS with all the corners, etc.)
-- Here is an image as an example: https://media.discordapp.net/attachments/267051370962616325/775411990789226506/unknown.png
Trucking.Payment = 300 -- Making this higher will compensate for the miles not counted

-- Fee payed by the player if the trialer is destroyed OR make this false to disable this feature
Trucking.DestroyedTrailerFee = false

-- If a trailer is destroyed or a truck is destroyed, it will be deleted. Turn this false if you do not want to delete the trailer / truck if it gets destroyed
-- I put this here in case the destroyed vehicle may be involved in an RP scenario. Keeping this true will be better for performance
Trucking.DeleteDestroyedEntity = false

Trucking.XP_Config = {
    XPForPromotion = {
        -- How much XP is needed to become a level 2 truck driver (Access to refrigerated cargo)
        1000,
        -- How much XP is needed to become a level 3 truck driver (Access to fuel tankers)
        2000,
        -- How much XP is needed to become a level 4 truck driver (Access to high value/fragile cargo)
        4000,
        -- How much XP is needed to become a level 5 truck driver (Access to special cargo)
        6000,
    },
    -- How much XP earned per mile.
    -- Ex: It will take 60 miles to get promoted to a level 2 driver with 15 XP per mile. Then an extra 120 miles to get promoted to a level 3 driver
    -- NOTE: This WILL VARY. If they damage the trailer, they will not earn full XP.
    XPPerMile = 10
}

Trucking.Escort = {
    -- The escort vehicle used for special cargo
    vehicle = 'crusader',

    -- Fee payed by the player if the escort vehicle is destroyed OR make this false to disable this feature
    destructionFee = 1500,

    -- Required driver level to be able to use escort vehicles (Make this false to ignore this)
    requiredLevel = 2,

    -- Amount of time (in seconds) a player has to deny/accept a escort request
    timeToRespond = 30,

    -- The percentage of money the escort driver will make from the trucker payout
    -- Example: If the trucker earns $10,000, at 75%, the escort driver will make $7,500
    payPercentage = 75,

    -- How far away the driver has to be from the escort vehicle to get cancelled from their current job
    radius = 100,

    -- If the driver is the cause of a route cancellation, how much should they get fined? (You can make this false to disable this feature)
    cancellationFee = 750,
}

-- How much more will be added onto the final payout after completing a route. (Based on job rank)
Trucking.Multipliers = {
    -- Dry Cargo
    1.0,
    -- Refrigerated Cargo
    1.1,
    -- Fuel Tanker
    1.2,
    -- High Value Cargo
    1.3,
    -- Special Cargo (Requires Escort)
    1.4,
}

-- How many seconds do certain actions take
Trucking.Timing = {
    ['tasks'] = 8
}

Trucking.Color = {
    ['marker'] = {
        r = 63,
        g = 129,
        b = 42,
    },
    ['blip'] = 25,
}

Trucking.Renting = {
    -- Money required to be held as a security deposit. Change this to false if you dont want this
    securityDeposit = 2400,

    -- Trucks that can be rented
    Trucks = {
        ['hauler'] = {
            rentPrice = 750,
            label = 'Hauler',
        },
        ['packer'] = {
            rentPrice = 1250,
            label = 'Packer',
        },
        ['phantom'] = {
            rentPrice = 1000,
            label = 'Phantom',
        },
        ['phantom3'] = {
            rentPrice = 1500,
            label = 'Phantom Custom',
        },
    },
}

Trucking.Routes = {
    -- Dry Cargo
    {
        vector4(-8.81,-578.63,38.83,343.03), 
        vector4(-2034.67,-275.38,23.39,59.35), 
        vector4(-1279.5,-1357.61,4.31,301.67), 
        vector4(-1022.62,-1416.39,5.29,206.46), 
        vector4(-533.03,-886.55,25.18,183.44), 
        vector4(-365.57,-105.62,39.54,167.72), 
        vector4(573.82,127.86,99.47,250.76), 
        vector4(1120.99,-793.4,57.75,359.83), 
        vector4(2673.04,1412.28,24.55,358.79), 
        vector4(588.25,2784.67,43.49,10.0),
        vector4(179.11,6392.11,32.55,306.97), 
        vector4(970.51,3609.76,32.85,4.23),
        vector4(1003.25,-1533.16,29.56,90.41), 
        vector4(972.24,-1942.58,31.08,184.39), 
        vector4(1084.27,-2300.44,30.23,273.95), 
        vector4(-453.39,-2286.99,7.61,272.12), 
        vector4(-807.28,-771.92,21.0,93.83), 
    },
    -- Refrigeration Cargo
    {
        vector4(-1442.88,-376.98,38.29,129.03), 
        vector4(-566.06,303.28,83.16,272.25), 
        vector4(1131.46,-291.92,68.93,278.26), 
        vector4(2545.67,427.43,108.46,305.84), 
        vector4(1963.53,3761.43,32.2,213.29), 
        vector4(880.52,3662.48,32.88,181.64), 
        vector4(-2951.0,399.77,15.05,86.7), 
        vector4(-2164.54,4287.69,48.96,154.18), 
        vector4(176.03,6399.02,31.33,302.92), 
        vector4(-680.24,5798.58,17.33,253.84),
        vector4(-2060.14,-309.15,13.16,85.85),
        vector4(-568.26,-2818.88,6.0,314.66), 
        vector4(-996.95,-2231.07,9.0,132.03),
        vector4(-1224.37,-1219.78,7.11,105.79), 
        vector4(-1394.17,-656.7,28.67,45.04), 
        vector4(372.91,358.45,102.55,169.58), 
        vector4(170.56,-1534.23,29.14,221.99), 
        vector4(-1213.25,354.37,71.03,216.36), 
    },
    -- Fuel / Gas
    {
        vector4(130.0,6667.43,31.94,133.92), 
        vector4(1701.29,6425.07,32.64,249.77), 
        vector4(1720.05,4936.19,42.15,55.13), 
        vector4(1981.2,3789.64,32.18,204.98), 
        vector4(1056.4,2651.29,39.55,0.97), 
        vector4(60.28,2797.08,57.88,47.55), 
        vector4(-1404.34,-271.95,46.4,135.28), 
        vector4(-358.06,-1500.05,30.15,5.75), 
        vector4(831.3,-1017.89,26.74,181.81), 
        vector4(2546.46,413.04,108.46,309.53),
        vector4(2548.7,2581.38,37.94,105.89), 
        vector4(1197.12,-1380.45,35.23,182.75),
        vector4(1168.68,-316.7,69.18,280.01),
        vector4(170.56,-1534.23,29.14,221.99), 
        vector4(1200.47,2638.15,37.84,312.64), 
    },
    -- Fragile / High Value Cargo
    {
        {
            -- Vehicle that will be attached onto the trailer
            model = 'entity2',
            -- If you don't have the vehicle properties in a (string) json format, you can make this false and vehicle properties will be ignored. AKA, if you don't know what you're doing, make vehProps false
            vehProps = '{"plate":"07HNR807","dirtLevel":0.0,"model":-2120700196,"engineHealth":1000.0,"modEngineBlock":-1,"modRightFender":-1,"modLivery":-1,"windowTint":1,"modArchCover":-1,"modShifterLeavers":-1,"modDashboard":-1,"modSpoilers":1,"neonEnabled":[false,false,false,false],"color2":0,"modHydrolic":-1,"modWindows":-1,"modDoorSpeaker":-1,"modSideSkirt":-1,"modTurbo":false,"modSpeakers":-1,"modSuspension":-1,"modTrunk":-1,"modFender":-1,"modRoof":-1,"modSteeringWheel":-1,"tankHealth":1000.0,"modFrame":-1,"wheels":7,"modGrille":-1,"xenonColor":255,"bodyHealth":1000.0,"modTrimA":-1,"modRearBumper":2,"modAPlate":-1,"modBrakes":-1,"modAirFilter":-1,"modEngine":-1,"modVanityPlate":-1,"pearlescentColor":70,"modDial":-1,"fuelLevel":35.6,"modFrontWheels":4,"modExhaust":2,"modHood":-1,"plateIndex":0,"modArmor":-1,"modSeats":-1,"extras":[],"modTank":-1,"modHorns":-1,"color1":70,"tyreSmokeColor":{"1":255,"2":255,"3":255,"n":3},"modTransmission":-1,"neonColor":{"1":255,"2":0,"3":255,"n":3},"modPlateHolder":-1,"modFrontBumper":0,"modStruts":-1,"wheelColor":0,"modAerials":-1,"modBackWheels":-1,"modXenon":false,"modSmokeEnabled":false,"modTrimB":-1,"modOrnaments":-1}',
            -- On-Trailer Offset
            trailerOffset = vector3(0.0, 0.0, 0.9),
            deliveryScenarios = {
                {
                    -- Pickup / Spawn Location
                    vector4(1093.81,-3159.68,5.9,4.11), 
                    -- Dropoff Location
                    vector4(-1613.63,20.63,62.18,335.35), 
                },
                {
                    -- Pickup / Spawn Location
                    vector4(-849.35,-1274.62,5.0,306.8), 
                    -- Dropoff Location
                    vector4(-989.63,419.09,75.17,203.49),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(-1150.28,-1983.67,13.16,287.98),
                    -- Dropoff Location
                    vector4(935.38,66.24,79.17,329.64),
                },
            },
        },
        {
            -- Vehicle that will be attached onto the trailer
            model = 'riata',
            -- If you don't have the vehicle properties in a (string) json format, you can make this false and vehicle properties will be ignored. AKA, if you don't know what you're doing, make vehProps false
            vehProps = '{"modDashboard":-1,"modSideSkirt":2,"modPlateHolder":-1,"modEngineBlock":-1,"extras":[],"engineHealth":1000.0,"modFender":-1,"modHorns":-1,"modFrontBumper":2,"modSeats":-1,"windowTint":1,"modVanityPlate":-1,"color1":138,"tyreSmokeColor":{"1":255,"2":255,"3":255,"n":3},"modAirFilter":-1,"modRoof":5,"bodyHealth":1000.0,"modEngine":-1,"modRearBumper":1,"modDial":-1,"wheels":4,"modTrunk":-1,"modSpeakers":-1,"pearlescentColor":138,"modSteeringWheel":-1,"modTransmission":-1,"modTrimA":-1,"modHydrolic":-1,"modStruts":-1,"modLivery":-1,"modAerials":-1,"modXenon":false,"modTurbo":false,"modExhaust":2,"modRightFender":-1,"neonColor":{"1":255,"2":0,"3":255,"n":3},"modShifterLeavers":-1,"modFrame":-1,"modHood":5,"modOrnaments":-1,"modBrakes":-1,"modSuspension":-1,"modBackWheels":-1,"modTank":-1,"modFrontWheels":5,"color2":0,"dirtLevel":0.1,"modDoorSpeaker":-1,"wheelColor":0,"xenonColor":255,"tankHealth":1000.0,"plateIndex":0,"modArchCover":-1,"model":-1532697517,"modTrimB":-1,"modGrille":1,"modSmokeEnabled":false,"modSpoilers":-1,"neonEnabled":[false,false,false,false],"modWindows":-1,"plate":"04NUP644","fuelLevel":44.9,"modAPlate":-1,"modArmor":-1}',
            -- On-Trailer Offset
            trailerOffset = vector3(0.0, 0.0, 0.9),
            deliveryScenarios = {
                {
                    -- Pickup / Spawn Location
                    vector4(1112.14,-3125.49,5.9,188.09),
                    -- Dropoff Location
                    vector4(1363.28,-553.0,74.34,160.62),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(-372.38,-97.37,45.66,349.7),
                    -- Dropoff Location
                    vector4(1409.43,1118.82,114.84,91.22),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(-1114.43,-309.24,37.66,89.58),
                    -- Dropoff Location
                    vector4(310.1,3385.31,36.41,336.35),
                },
            },
        },
        {
            -- Vehicle that will be attached onto the trailer
            model = 'bulldozer',
            -- If you don't have the vehicle properties in a (string) json format, you can make this false and vehicle properties will be ignored. AKA, if you don't know what you're doing, make vehProps false
            vehProps = '{"tankHealth":1000.0,"modFender":-1,"extras":[],"modAirFilter":-1,"modGrille":-1,"modBackWheels":-1,"plateIndex":3,"plate":"00LHQ524","modSmokeEnabled":false,"modSideSkirt":-1,"modStruts":-1,"windowTint":-1,"modRoof":-1,"modBrakes":-1,"modTrunk":-1,"modRightFender":-1,"neonEnabled":[false,false,false,false],"model":1886712733,"modHood":-1,"tyreSmokeColor":{"1":255,"2":255,"3":255,"n":3},"modEngineBlock":-1,"modTrimA":-1,"modFrame":-1,"modXenon":false,"modWindows":-1,"modTank":-1,"modAPlate":-1,"dirtLevel":7.0,"xenonColor":255,"bodyHealth":1000.0,"modTransmission":-1,"modFrontBumper":-1,"modPlateHolder":-1,"modShifterLeavers":-1,"modDashboard":-1,"modEngine":-1,"modTrimB":-1,"color1":42,"engineHealth":1000.0,"modSpoilers":-1,"modSuspension":-1,"wheels":0,"neonColor":{"1":255,"2":0,"3":255,"n":3},"modArmor":-1,"modHydrolic":-1,"modExhaust":-1,"modRearBumper":-1,"modSteeringWheel":-1,"modSeats":-1,"modFrontWheels":-1,"color2":1,"modTurbo":false,"modDial":-1,"modLivery":-1,"fuelLevel":41.3,"modVanityPlate":-1,"modOrnaments":-1,"modSpeakers":-1,"pearlescentColor":1,"modAerials":-1,"modHorns":-1,"modArchCover":-1,"modDoorSpeaker":-1,"wheelColor":156}',
            -- On-Trailer Offset
            trailerOffset = vector3(0.0, 0.0, 0.9),
            deliveryScenarios = {
                {
                    -- Pickup / Spawn Location
                    vector4(-133.04,-2551.89,6.02,144.22),
                    -- Dropoff Location
                    vector4(2986.75,2973.3,87.26,313.23),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(-133.04,-2551.89,6.02,144.22),
                    -- Dropoff Location
                    vector4(-150.1,-1037.08,27.27,75.87),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(-133.04,-2551.89,6.02,144.22),
                    -- Dropoff Location
                    vector4(131.26,-380.31,43.26,332.85),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(-133.04,-2551.89,6.02,144.22),
                    -- Dropoff Location
                    vector4(-1665.7,414.56,88.99,80.78),
                },
            },
        },
        {
            -- Vehicle that will be attached onto the trailer
            model = 'bifta',
            -- If you don't have the vehicle properties in a (string) json format, you can make this false and vehicle properties will be ignored. AKA, if you don't know what you're doing, make vehProps false
            vehProps = '{"modExhaust":2,"xenonColor":255,"wheels":4,"modTank":-1,"modVanityPlate":-1,"modSmokeEnabled":false,"dirtLevel":0.0,"modRoof":1,"modFender":-1,"modDashboard":-1,"modArchCover":-1,"modSuspension":-1,"modGrille":-1,"modTrimB":-1,"tankHealth":999.9,"neonColor":{"1":255,"2":0,"3":255,"n":3},"pearlescentColor":150,"modEngineBlock":-1,"bodyHealth":998.8,"modSpoilers":2,"modLivery":-1,"modTrunk":-1,"modDoorSpeaker":-1,"modAPlate":-1,"modShifterLeavers":-1,"color1":150,"modAerials":-1,"modAirFilter":-1,"modPlateHolder":-1,"modBackWheels":-1,"tyreSmokeColor":{"1":255,"2":255,"3":255,"n":3},"plateIndex":0,"modBrakes":2,"modRightFender":-1,"modFrame":0,"modSteeringWheel":-1,"color2":112,"modDial":-1,"modStruts":-1,"modSpeakers":-1,"extras":[],"modTrimA":-1,"modHood":-1,"plate":"20FTY288","modTransmission":2,"fuelLevel":35.8,"modWindows":-1,"engineHealth":992.5,"modXenon":false,"modTurbo":false,"modFrontBumper":-1,"modHorns":-1,"modEngine":3,"wheelColor":0,"modHydrolic":-1,"neonEnabled":[false,false,false,false],"model":-349601129,"modSideSkirt":0,"modOrnaments":-1,"modArmor":-1,"modSeats":-1,"modFrontWheels":2,"windowTint":1,"modRearBumper":-1}',
            -- On-Trailer Offset
            trailerOffset = vector3(0.0, 0.0, 0.9),
            deliveryScenarios = {
                {
                    -- Pickup / Spawn Location
                    vector4(-182.73,-1327.59,31.18,0.99),
                    -- Dropoff Location
                    vector4(871.59,2336.81,51.68,299.87),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(-182.73,-1327.59,31.18,0.99),
                    -- Dropoff Location
                    vector4(2085.7,1733.69,103.18,316.48),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(-1112.65,-2015.19,13.19,315.4),
                    -- Dropoff Location
                    vector4(3079.76,2738.39,72.76,0.16),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(-1112.65,-2015.19,13.19,315.4),
                    -- Dropoff Location
                    vector4(668.07,3204.75,39.19,103.18),
                },
            },
        },
    },
    -- Special Cargo
    {
        {
            -- Vehicle that will be attached onto the trailer
            model = 'barracks3',
            -- If you don't have the vehicle properties in a (string) json format, you can make this false and vehicle properties will be ignored. AKA, if you don't know what you're doing, make vehProps false
            vehProps = false,
            -- On-Trailer Offset
            trailerOffset = vector3(0.0, 0.0, -0.75),
            deliveryScenarios = {
                {
                    -- Pickup / Spawn Location
                    vector4(-290.29,-2713.59,6.0,44.17), 
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(2111.21,4769.44,41.21,105.18),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(210.0,2803.14,45.66,101.16),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(274.65,-3286.32,5.8,356.23),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(596.14,-3037.99,6.07,1.96),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(794.85,-3049.98,5.77,357.92),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(2358.88,3165.63,47.93,98.48),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
            },
        },
        {
            -- Vehicle that will be attached onto the trailer
            model = 'barracks2',
            -- If you don't have the vehicle properties in a (string) json format, you can make this false and vehicle properties will be ignored. AKA, if you don't know what you're doing, make vehProps false
            vehProps = false,
            -- On-Trailer Offset
            trailerOffset = vector3(0.0, 0.0, -0.72),
            deliveryScenarios = {
                {
                    -- Pickup / Spawn Location
                    vector4(-290.29,-2713.59,6.0,44.17), 
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(2111.21,4769.44,41.21,105.18),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(210.0,2803.14,45.66,101.16),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(274.65,-3286.32,5.8,356.23),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(596.14,-3037.99,6.07,1.96),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(794.85,-3049.98,5.77,357.92),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(2358.88,3165.63,47.93,98.48),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
            },
        },
        {
            -- Vehicle that will be attached onto the trailer
            model = 'insurgent2',
            -- If you don't have the vehicle properties in a (string) json format, you can make this false and vehicle properties will be ignored. AKA, if you don't know what you're doing, make vehProps false
            vehProps = false,
            -- On-Trailer Offset
            trailerOffset = vector3(0.0, 0.0, -0.72),
            deliveryScenarios = {
                {
                    -- Pickup / Spawn Location
                    vector4(-290.29,-2713.59,6.0,44.17), 
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(2111.21,4769.44,41.21,105.18),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(210.0,2803.14,45.66,101.16),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(274.65,-3286.32,5.8,356.23),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(596.14,-3037.99,6.07,1.96),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(794.85,-3049.98,5.77,357.92),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(2358.88,3165.63,47.93,98.48),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
            },
        },
        {
            -- Vehicle that will be attached onto the trailer
            model = 'mesa3',
            -- If you don't have the vehicle properties in a (string) json format, you can make this false and vehicle properties will be ignored. AKA, if you don't know what you're doing, make vehProps false
            vehProps = false,
            -- On-Trailer Offset
            trailerOffset = vector3(0.0, 0.0, -0.65),
            deliveryScenarios = {
                {
                    -- Pickup / Spawn Location
                    vector4(-290.29,-2713.59,6.0,44.17), 
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(2111.21,4769.44,41.21,105.18),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(210.0,2803.14,45.66,101.16),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(274.65,-3286.32,5.8,356.23),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(596.14,-3037.99,6.07,1.96),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(794.85,-3049.98,5.77,357.92),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(2358.88,3165.63,47.93,98.48),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
            },
        },
        {
            -- Vehicle that will be attached onto the trailer
            model = 'crusader',
            -- If you don't have the vehicle properties in a (string) json format, you can make this false and vehicle properties will be ignored. AKA, if you don't know what you're doing, make vehProps false
            vehProps = false,
            -- On-Trailer Offset
            trailerOffset = vector3(0.0, 0.0, -0.7),
            deliveryScenarios = {
                {
                    -- Pickup / Spawn Location
                    vector4(-290.29,-2713.59,6.0,44.17), 
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(2111.21,4769.44,41.21,105.18),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(210.0,2803.14,45.66,101.16),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(274.65,-3286.32,5.8,356.23),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(596.14,-3037.99,6.07,1.96),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(794.85,-3049.98,5.77,357.92),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(2358.88,3165.63,47.93,98.48),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
            },
        },
        {
            -- Vehicle that will be attached onto the trailer
            model = 'apc',
            -- If you don't have the vehicle properties in a (string) json format, you can make this false and vehicle properties will be ignored. AKA, if you don't know what you're doing, make vehProps false
            vehProps = false,
            -- On-Trailer Offset
            trailerOffset = vector3(0.0, 0.0, -0.7),
            deliveryScenarios = {
                {
                    -- Pickup / Spawn Location
                    vector4(-290.29,-2713.59,6.0,44.17), 
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(2111.21,4769.44,41.21,105.18),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(210.0,2803.14,45.66,101.16),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(274.65,-3286.32,5.8,356.23),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(596.14,-3037.99,6.07,1.96),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(794.85,-3049.98,5.77,357.92),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
                {
                    -- Pickup / Spawn Location
                    vector4(2358.88,3165.63,47.93,98.48),
                    -- Dropoff Location
                    vector4(-2071.28,3387.45,31.24,245.45),
                },
            },
        },
    },
}

Trucking.Trailers = {
    {
        label = 'Shipment Container Trailer',
        model = 'trailers',
        taskOffsets = { -- If changes are made, the order MUST be the same. Ex. Air/Electric Lines -> Left Tires -> Rear Door -> Right Tires
            -- Air/Electric Lines
            vector3(-1.75, 6.25, -1.0),
            -- Left Tires
            vector3(-2.5, -4.25, -1.5),
            -- Rear Door
            vector3(0.0, -7.0, -1.5), -- This can be false if the trailer has no rear door
            -- Right Tires
            vector3(2.5, -4.25, -1.5),
        },
        --[[
            Route types:
            1 - Dry cargo
            2 - Refrigeration Cargo
            3 - Fuel / Gas
            4 - Fragile Cargo
            5 - Special Cargo
        ]]
        routeType = 1,
    },
    {
        label = 'Refrigeration Trailer',
        model = 'trailers2',
        taskOffsets = { -- If changes are made, the order MUST be the same. Ex. Air/Electric Lines -> Left Tires -> Rear Door -> Right Tires
            -- Air/Electric Lines
            vector3(-1.75, 6.25, -1.0),
            -- Left Tires
            vector3(-2.5, -4.25, -1.5),
            -- Rear Door
            vector3(0.0, -7.0, -1.5), -- This can be false if the trailer has no rear door
            -- Right Tires
            vector3(2.5, -4.25, -1.5),
        },
        --[[
            Route types:
            1 - Dry cargo
            2 - Refrigeration Cargo
            3 - Fuel / Gas
            4 - Fragile Cargo
            5 - Special Cargo
        ]]
        routeType = 2
    },
    {
        label = 'Fuel Tanker Trailer',
        model = 'tanker',
        taskOffsets = { -- If changes are made, the order MUST be the same. Ex. Air/Electric Lines -> Left Tires -> Rear Door -> Right Tires
            -- Air/Electric Lines
            vector3(-1.75, 6.25, -1.0),
            -- Left Tires
            vector3(-2.5, -4.25, -1.5),
            -- Rear Door
            false, -- This can be false if the trailer has no rear door
            -- Right Tires
            vector3(2.5, -4.25, -1.5),
        },
        --[[
            Route types:
            1 - Dry cargo
            2 - Refrigeration Cargo
            3 - Fuel / Gas
            4 - Fragile Cargo
            5 - Special Cargo
        ]]
        routeType = 3
    },
    {
        label = 'Flatbed Trailer',
        model = 'trflat',
        taskOffsets = { -- If changes are made, the order MUST be the same. Ex. Air/Electric Lines -> Left Tires -> Rear Door -> Right Tires
            -- Air/Electric Lines
            vector3(-1.75, 6.25, 0.5), 
            -- Left Tires
            vector3(-2.5, -4.25, 0.0),
            -- Rear Door
            false, -- This can be false if the trailer has no rear door
            -- Right Tires
            vector3(2.5, -4.25, 0.0),
        },
        --[[
            Route types:
            1 - Dry cargo
            2 - Refrigeration Cargo
            3 - Fuel / Gas
            4 - Fragile Cargo
            5 - Special Cargo
        ]]
        routeType = 4
    },
    {
        label = 'Army Flatbed Trailer',
        model = 'armytrailer',
        taskOffsets = { -- If changes are made, the order MUST be the same. Ex. Air/Electric Lines -> Left Tires -> Rear Door -> Right Tires
            -- Air/Electric Lines
            vector3(-2.0, 6.25, -1.5), 
            -- Left Tires
            vector3(-2.5, -3.5, -2.0),
            -- Rear Door
            false, -- This can be false if the trailer has no rear door
            -- Right Tires
            vector3(2.5, -3.5, -2.0),
        },
        --[[
            Route types:
            1 - Dry cargo
            2 - Refrigeration Cargo
            3 - Fuel / Gas
            4 - Fragile Cargo
            5 - Special Cargo
        ]]
        routeType = 5
    },
}

Trucking.Locations = {
    ClockInSpot = vector3(835.88,-1211.54,28.01),

    RentTruck = vector3(969.12,-1226.74,27.07),

    ReturnTruck = vector3(1000.03,-1184.81,25.42), 

    GetTrailer = vector3(913.91,-1273.25,27.1),

    TruckSpawns = {
        vector4(975.62,-1225.95,25.45,305.51), 
        vector4(977.82,-1228.78,25.42,307.46), 
        vector4(980.12,-1231.85,25.39,307.24), 
        vector4(982.48,-1234.61,25.36,308.24), 
        vector4(984.23,-1237.99,25.34,305.21), 
        vector4(986.25,-1241.12,25.34,306.94), 
        vector4(988.34,-1244.13,25.35,307.08), 
        vector4(990.55,-1247.1,25.36,305.26), 
    },

    TrailerSpawns = {
        vector4(905.0,  -1227.0,  25.51, 184.0),
        vector4(910.0,  -1226.84, 25.26, 184.0), 
        vector4(915.0,  -1226.52, 25.26, 184.0), 
        vector4(920.0,  -1226.28, 25.26, 184.0), 
        vector4(925.0,  -1225.94, 25.26, 184.0), 
        vector4(930.0,  -1225.59, 25.45, 184.0), 
        vector4(935.0,  -1225.59, 25.45, 184.0), 
        vector4(872.25, -1228.73, 25.87, 182.3),
        vector4(867.25, -1228.73, 25.87, 182.3),
        vector4(862.25, -1228.73, 25.87, 182.3),
    },

    EscortSpawns = {
        vector4(1012.54,-1219.2,25.09,90.44),
        vector4(1012.58,-1222.92,25.1,87.51),
        vector4(1012.59,-1226.57,25.14,87.06),
        vector4(1012.86,-1230.34,25.17,86.56),
    }
}

Trucking.Blips = {
    {
        coords = Trucking.Locations.RentTruck,
        title = 'Trucking: Rental Facility',
        id = 1
    },
    {
        coords = Trucking.Locations.ReturnTruck,
        title = 'Trucking: Rental Return',
        id = 1
    },
    {
        coords = Trucking.Locations.GetTrailer,
        title = 'Trucking: Trailers',
        id = 1
    },
}

-- You can easily swap a new notification system in here if you would like
Trucking.Notify = function(type, msg, time)
    if not time then time = 5000 end
    exports['mythic_notify']:SendAlert(type, msg, time)
end

-- You can easily swap a new progress bar system in here if you would like
Trucking.Progress = function(id, time, label, useWhileDead, canCancel, controlDisables)
    exports['mythic_progbar']:Progress({
        name = id,
        duration = time,
        label = label,
        useWhileDead = useWhileDead,
        canCancel = canCancel,
        controlDisables = controlDisables
    })

    -- DO NOT EDIT THE BELOW
    if controlDisables.disableCarMovement then
        local lt = true
        Citizen.CreateThread(function()
            while lt do Citizen.Wait(0)
                DisableControlAction(0, 63, true)
                DisableControlAction(0, 64, true)
                DisableControlAction(0, 71, true)
                DisableControlAction(0, 72, true)
                DisableControlAction(0, 75, true)
            end
        end)
        Citizen.Wait(time)
        lt = false
    else
        Citizen.Wait(time)
    end
end

Trucking.Translation = {
    ['clock_in_out'] = "Press ~INPUT_PICKUP~ to clock in/out",
    ['clocked_in'] = "You've clocked in. Check out the map for work related areas",
    ['clocked_out'] = "You've clocked out",
    ['rent_truck'] = "Press ~INPUT_PICKUP~ to view rental options",
    ['vehicle_in_way'] = "Vehicle in the way!",
    ['rented_truck'] = "You have rented a truck. You have full responsibility over this vehicle including any damages made!",
    ['return_truck'] = "Press ~INPUT_PICKUP~ to return vehicle",
    ['already_renting'] = "You are already renting a truck!",
    ['not_a_rental_truck'] = "This is not the same vehicle you rented from us!",
    ['returned_truck'] = "Truck returned",
    ['get_in_truck'] = "Get into your truck!",
    ['get_out_truck'] = "Get out of the truck!",
    ['attach_trailer'] = "Attach your trailer to your truck",
    ['trailer_task1'] = "Attach air and electric lines to your trailer",
    ['doing_trailer_task1'] = "Attaching and examining air/electric lines to trailer",
    ['do_trailer_task1'] = "Press ~INPUT_PICKUP~ to attach lines",
    ['trailer_task2'] = "Examine Left Tires",
    ['doing_trailer_task2'] = "Examining and recording tire information",
    ['do_trailer_task2'] = "Press ~INPUT_PICKUP~ to examine tires",
    ['trailer_task3'] = "Secure the rear door",
    ['doing_trailer_task3'] = "Securing and examining rear door",
    ['do_trailer_task3'] = "Press ~INPUT_PICKUP~ to examine and secure rear door",
    ['trailer_task4'] = "Examine Right Tires",
    ['doing_trailer_task4'] = "Examining and recording tire information",
    ['do_trailer_task4'] = "Press ~INPUT_PICKUP~ to examine tires",
    ['greenlight'] = "Greenlight - You're able to pull out of the lot, first stop has been routed to your GPS",
    ['traileroptions'] = "Press ~INPUT_PICKUP~ to view job options",
    ['traileroption_1'] = "Dry Trailer Goods",
    ['traileroption_2'] = "Refrigerated Trailer Goods",
    ['traileroption_3'] = "Fuel Tanker",
    ['blip_trailer'] = "Trucking: Trailer",
    ['blip_route'] = "Trucking: Delivery",
    ['backtrailer'] = "Back your trailer into the highlighted spot",
    ['unloadtrailer'] = "Press ~INPUT_PICKUP~ to unload cargo",
    ['dropofftrailer'] = "Press ~INPUT_PICKUP~ to drop off trailer",
    ['jonCancelSync'] = "Your trucking route has been cancelled due to you leaving unexpectedly",
    ['attachtrailer'] = "Attach your trailer again!",
    ['trailerfaraway'] = "You got too far away from your trailer! Route was cancelled",
    ['alreadygottrailer'] = "You already have a trailer!",
    ['unloadingtrailer'] = "Unloading a portion of your trailer",
    ['attachspecialcargo'] = 'Press ~INPUT_PICKUP~ to attach cargo',
    ['detachspecialcargo'] = 'Press ~INPUT_PICKUP~ to detach cargo',
    ['closerspecialcargo'] = 'You are getting far from the cargo, get closer!',
    ['no_players_nearby'] = 'No players nearby!',
    ['escort_new_point_no_cargo'] = 'Escort the driver to the marked location!',
    ['escort_new_point_cargp'] = 'Escort the cargo to the marked location!',
    ['escort_standby_trailer'] = 'Standby while the driver prepares their trailer',
    ['escort_standby_pickup'] = 'Standby while the driver obtains the cargo',
    ['escort_standby_dropoff'] = 'Standby while the driver drops off the cargo',
    ['escort_get_in_vehicle'] = 'Get back into your escort vehicle!',
    ['escort_not_available'] = 'Any error happened while trying to prepare the escort driver!',
    ['escort_fetching'] = 'Please wait while we prepare your route!',
    ['earnedpromo'] = "You earned a promotion!",
    ['unloadingcargo'] = "Unloading cargo",
    ['escort_error_common'] = "There was an error preparing this player. They may not have experience!",
    ['escort_request_deny'] = "You denied the job",
    ['escort_request_cancelled'] = "Offer canceled. The player did not respond",
    ['escort_request_denied'] = "The job was denied by the player",
    ['escort_request_accepted'] = "The job was accepted by the player!",
    ['escort_update_gps'] = "Your GPS has been updated",
    ['escort_far'] = "You got too far away from your escort vehicle! Route was cancelled",
    ['escort_far_driver'] = "You got too far away from the truck driver! Route was cancelled",
    ['escort_return'] = "Return your escort vehicle back at the depot!",
    ['escort_get_closer'] = "You're too far away from the driver. Get closer!",
    ['escort_driver_failed'] = "The escort driver failed! Route was cancelled",
    ['escort_trucker_failed'] = "The truck driver failed! Route was cancelled",
    ['escort_return_reward'] = "Return your escort vehicle to receive your reward",
    ['escort_distance_cancel'] = "You got too far from your escort vehicle, route was cancelled!",
    ['escort_driver_distance'] = "You\'re getting far from the escort! Get closer!",
    ['escort_driver_distance_cancel'] = "You got too far from the escort",
    ['blip_escort'] = "Escort Driver",
    ['blip_trucker'] = "Truck Driver",
    ['no_money_rent'] = "You don't have enough money to rent!",
    ['truckdestroyed'] = "Rental truck destroyed!",

    ['menu_header'] = "Truck Depot",
    ['menu_label_buy'] = "Buy a truck",
    ['menu_label_rent'] = "Rent a truck",
    ['menu_label_escort_info'] = "This type of cargo requires a escort vehicle, would you like to continue?",
    ['menu_label_escort_no'] = "No",
    ['menu_label_escort_yes'] = "Yes",
    ['menu_label_escort_player_selection'] = "Choose a nearby player with a driver level of 3 or higher",

    -- Formatted Notifications
    -- DO NOT CHANGE %s IN ANY OF THESE BELOW
    ['rented_truck_deposit'] = "You've payed $%s as a security deposit. You have full responsibility over this vehicle including any damages made!",
    ['damaged_truck'] = "$%s has been kept from your security deposit due to damages done to the truck exceeding our policy. Any money remaining was given back",
    ['damaged_trailer'] = "Trailer was damaged! $%s was deducted from your paycheck. You recieved a total of $%s",
    ['no_money_rent_security'] = "You don't have enough money to rent! A security deposit of $%s is required",
    ['nextpoint'] = "Next stop has been routed to your GPS | %s/%s",
    ['trailerdestroyed'] = "Trailer destroyed! You were fined $%s due to destroyed goods!",
    ['escortdestroyed'] = "Escort vehicle destroyed, you were fined $%s!",
    ['truckdestroyed_security'] = "Rental truck destroyed! You will not be recieving your security deposit of $%s",
    ['moneyearned'] = "You have earned $%s from this route!",
    ['xpearnedpromo'] = "You earned %s XP | %s XP until your next promotion!",
    ['xpearnednopromo'] = "You earned %s XP",
    ['escort_error_xp'] = 'This player does not meet the driver level requirement! They must be a level %s driver!',
    ['escort_request_waiting'] = "Waiting for player response...\n[%s seconds remaining]",
    ['damaged_escort'] = "Escort vehicle was damaged! $%s was deducted from your paycheck. You recieved a total of $%s",
    ['escort_distance_cancel_fee'] = "You got too far from your escort vehicle, route was cancelled! You were fined $%s",
    
    ['escort_request'] = {
        "AL_TRUCKING_HELP1", -- I suggest NOT changing this
        "%s wants you to escort them!~n~Press ~INPUT_FRONTEND_RDOWN~ to accept~n~Press ~INPUT_FRONTEND_RRIGHT~ to deny",
    },

    -- NativeUI, you can ignore this if you are using ESX --
    ['nativeUI_rental_sub'] = "Truck rental selection",
    ['nativeUI_rental_item_sub'] = "$%s, plus an additional $%s for a deposit",
    ['nativeUI_trailer_sub'] = "Trailer selection",
    ['nativeUI_escort_info'] = "This requires a escort driver",
    ['nativeUI_escort_cancel'] = "Cancel",
    ['nativeUI_escort_check_nearby_players'] = "Check for nearby players",
    ['nativeUI_escort_request_escort'] = "Request if this person wants to be your escort driver",
}