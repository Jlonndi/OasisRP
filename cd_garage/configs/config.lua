Config = {}
------------------------------------------------------------------------------------------------------
----------------------------------------------- MAIN -------------------------------------------------
------------------------------------------------------------------------------------------------------
Config.Database = 'mysql' --[ 'mysql' / 'ghmattimysql' ] Choose your sql database script.
Config.Language = 'EN' --[ 'EN' / 'FR' / 'ES' / 'CZ' / 'PT' ] You can add your own locales to the Locales.lua. But make sure to add it here.

Config.UseESX = true --Do you use es_extended?
Config.ESXTriggers = { --You can change the esx events (IF NEEDED).
    main = 'esx:getSharedObject',
    load = 'esx:playerLoaded',
    job = 'esx:setJob',
}

Config.NotificationType = { --[ 'chat' / 'mythic_old' / 'mythic_new' / 'esx' / 'custom' ].
    server = 'mythic_old',
    client = 'mythic_old', 
}
------------------------------------------------------------------------------------------------------
---------------------------------------------- MISC --------------------------------------------------
------------------------------------------------------------------------------------------------------
Config.UniqueGarages = true --Do you want to only be able to get your car from the garage you last put it in?
Config.ReturnVehiclePrice = 1250 --This is the price players pay for their vehicle to be returned to their garage if it has despawned.
Config.QuickChoose_Key = 38 --The key to open the quick garage. (default E).
Config.EnterGarage_Key = 74 --The key to open the inside garage. (default H).
Config.SaveCarHealth = true --Do you want to save the poped tyres and broken doors and re-apply them all when spawning a vehicle?
Config.DisableOwnership = false --Do you want players to be able to store vehicles that are not owned by anyone else, they will automatically saved to their garage?
------------------------------------------------------------------------------------------------------
------------------------------------- VEHICLES DATABASE TABLE ----------------------------------------
------------------------------------------------------------------------------------------------------
Config.UseDatabaseVehiclesTable = true --Do you want to allow the script to grab data from the 'vehicles' table in the database? (If disabled the vehicle class or vehicle price will not show on the UI and garage tax will be disabled).
Config.GarageTax = true --Do you want to enable the Vehicle tax system? You can edit each vehicle's tax cost individually in database (vehicles -> garage_tax)?
Config.VehicleDatabase_TableNames = { --The 'vehicles' database table is a common in esx servers, but we will repurpose this to store information for us to use on the garage UI's.
    [1] = 'vehicles5',
    [2] = 'vehicles10', --We were made aware that some people use multiple vehicles tables for donator vehicles / emergency vehicles etc, so this is optional for those people.
}
------------------------------------------------------------------------------------------------------
--------------------------------------------- IMPOUND ------------------------------------------------
------------------------------------------------------------------------------------------------------
Config.UseImpound = true --Do you want to use the built in impound system?
Config.ImpoundCommand = 'impound' --Customise the chat command to impound vehicles.
Config.ImpoundTime = 10 --How long it takes to impound a vehicle. (in seconds).
Config.AnyoneCanImpound = false --Do you want anyone to be able to go to the impound and pay a set fee (CivImpoundFee below), to get their vehicle out of the impound?
Config.CivImpoundFee = 1000 --^^^
Config.AllowedJobsImpound = { --Only jobs inside this table can impound vehicles or unimpound vehicles.
    ['police'] = true,
    ['mechanic'] = true,
    ['laynz'] = true,
    ['vegas'] = true,
    ['mbrp'] = true,
    ['kepler'] = true,
    ['coco'] = true,
    ['bpm'] = true,
    --['add_more_here'] = true,
}
------------------------------------------------------------------------------------------------------
------------------------------------------ TRANSFER VEHICLE ------------------------------------------
------------------------------------------------------------------------------------------------------
Config.UseTransferVehicle = false --Do you want to use the built in command to transfer vehicles to another player?
Config.TransferVehicleCommand = 'transfervehicle' --Customise the chat command to transfer vehicles.
Config.Blasklist_transfer = { --Vehicles inside this table will not be able to be transfered to another player. Use the vehicles spawn name. eg., 'adder'.
    --[GetHashKey('adder')] = true,
}
------------------------------------------------------------------------------------------------------
--------------------------------------------- MILEAGE ------------------------------------------------
------------------------------------------------------------------------------------------------------
Config.UseMileage = false --Do you want to use the built in vehicle mileage system? The higher the miles the lower the vehicles max health will be. (or you can repurpose this for any other use).
Config.CheckMilesCommand = 'checkmiles' --Customise the chat command to check your vehicles miles and max health.
Config.MileageMultiplier = 1.0 --If you increase this number it will increase how fast vehicles gain miles. (decrease to lower).
Config.SpeedMetrics = 'miles' --(miles/kilometers) Choose what you want the mileage to display as.
Config.ShowMaxHealth = true --Do you want to show the max health of the vehicle you are in when you use the /checkmiles command?
------------------------------------------------------------------------------------------------------
-------------------------------------------- PROPERTY ------------------------------------------------
------------------------------------------------------------------------------------------------------
Config.UsePropertys = false --Do you want to use built in property garages?
------------------------------------------------------------------------------------------------------
------------------------------------------- GARAGE SPACE ---------------------------------------------
------------------------------------------------------------------------------------------------------
Config.UseGarageSpace = false --Do you want to limit the amount of cars each player can hold?
Config.GarageSpaceCommand = 'garagespace' --Customise the chat command to purchase extra garage space.
Config.GarageSpace = { --If Config.UseGarageSpace is enabled, this is the max amount of cars each player can own. To allow people to own more vehicles, add them to the table.
    [1] = 0,
    [2] = 0,
    [3] = 0,
    [4] = 0,
    [5] = 0,
    [6] = 0,
    [7] = 0,
    [8] = 25000,
    [9] = 50000,
    [10] = 75000,
    --[11] = 100000, --The number 11 would be the 11th garage slot, and the 100000 number would be the price for the 11th garage slot.
}
Config.GarageSpaceJobs = { --Only jobs inside this table can sell extra garage slots to players.
    ['laynz'] = true,
    ['vegas'] = true,
    ['mbrp'] = true,
    ['kepler'] = true,
    ['coco'] = true,
    ['bpm'] = true,
    --['add_more_here'] = true,
}
------------------------------------------------------------------------------------------------------
------------------------------------------ INSIDE GARAGE ---------------------------------------------
------------------------------------------------------------------------------------------------------
Config.MaxVehiclesInsideGarage = 10 --This is the max number of vehicles that we allow into the inside garage (we are limited by the space inside the garage).
Config.Shell_Zaxis = 30 --This is how low under the ground the garage shell will spawn, you could use math.random(10,50) to make it random each time so players dont see each other in their garage.
Config.ShellTimeScript = 'vMenu' --Choose which time script you are using so we can set the time when you enter the shell. [ 'easytime' / 'vsync' / 'other' ].
Config.EnginesOn = false --Do you want the vehicles engine will be turned on when you enter the inside garage?
Config.LightsOn = false --Do you want the vehicles headlights will be turned on when you enter the inside garage?
Config.UseSpotlight = true --Do you want the spotlight to shine on the closest vehicle?
Config.InsideLoopWait = 100 --The wait timer of the loop to refresh the UI. (shorter times will be mor optimised client side but longer times means more delay when moving to the next car).
Config.OnlyShowCarsInThisGarage = true --Do you want the inside garage to only show the vehicles which are currently stored at that garage.  (this works for inside garage only, even with this enabled all the cars will show in the outside UI).
Config.Blacklisted_insidegarage = { --Vehicles inside this table will not be spawned inside the garage, this is used for large vehicles that will not fit.
    [GetHashKey('flatbed')] = true,
    --[GetHashKey('add_more_here')] = true,
}
Config.CarOffsets = { --This is the offsets of the vehicles inside the garage.
    [1] = {x = -4, y = 6.5, z = -99.43, h = 135.00},--1
    [2] = {x = -4, y = 10.8, z = -99.43, h = 135.00},--2
    [3] = {x = -4, y = 15.1, z = -99.43, h = 135.00},--3
    [4] = {x = -4, y = 19.4, z = -99.43, h = 135.00},--4
    [5] = {x = -4, y = 23.7, z = -99.42, h = 135.00},--5

    [6] = {x = -12, y = 23.7, z = -99.43, h = 225.00},--6
    [7] = {x = -12, y = 19.4, z = -99.42, h = 225.00},--7
    [8] = {x = -12, y = 15.1, z = -99.42, h = 225.00},--8
    [9] = {x = -12, y = 10.8, z = -99.43, h = 225.00},--9
    [10] = {x = -12, y = 6.5, z = -99.42, h = 225.00},--10
}
------------------------------------------------------------------------------------------------------
------------------------------------------- JOB VEHICLES ---------------------------------------------
------------------------------------------------------------------------------------------------------
Config.UseJobVehicles = true ---Do you want players with defined jobs (below) to be able to use the garage ui to spawn job vehicles? (if disabled none of the options below will be used).
Config.ChooseLiverys = false ---Do you want players to be able to change liverys when they spawn a vehicle at a job garage?
Config.JobOwnedPersonal = opersonal  --        TriggerServerEvent('cd_garage:SetJobOwnedVehicle', personal)
Config.JobOwnedSociety = osociety  --        TriggerServerEvent('cd_garage:SetJobOwnedVehicle', society)
Config.JobVehicles_SpawnLocations = {
    --coords: This is the area where players with defined jobs can spawn/store job vehicles.
    --distance: If the player is within the 'distance' of these coords, they can interact with the job garage.
    --method: There are 3 different methods you can use (all 3 are explained below).
    
        --'regular' = This will use the vehicles from the Config.JobVehicles_RegularMethod table below. These are spawned in vehicles and are not owned by anyone.
        --'personalowned' = This will use your personal job vehicles that you have purchased from the cardealer and only you can only access from your job spawn location. Vehicles in your owned_vehicles database table which have job_personalowned set to 1 will be classed as personal owned job vehicles.
        --'societyowned' = This will use society owned vehicles. This will search for your job instead of your steam/license identifier in the owned_vehicles database table and allow you to use all of the vehicles your job owns.
    
    ['police'] = { --If you choose to add more tables here for more jobs, they must be the jobs name, not the label.
        --MISSION ROW PD
        [1] = {coords = vector3(434.67, -974.95, 16.7), distance = 10, garage_type = 'car', method = 'personalowned'}, --MISSION ROW PD (cars)
        [2] = {coords = vector3(449.38, -981.2, 43.69), distance = 10, garage_type = 'air', method = 'regular'}, --MISSION ROW PD (helipad)
        --SANDY PD
        [3] = {coords = vector3(1859.16, 3678.11, 33.68), distance = 10, garage_type = 'car', method = 'personalowned'}, --SANDY PD (cars)
        [4] = {coords = vector3(1842.81, 3634.76, 33.32), distance = 10, garage_type = 'air', method = 'regular'}, --SANDY PD (helipad)
        --PALETO PD
        [5] = {coords = vector3(-440.03, 6031.02, 31.34), distance = 10, garage_type = 'car', method = 'personalowned'}, --PALETO PD (cars)
        [6] = {coords = vector3(-475.38, 5988.49, 31.34), distance = 10, garage_type = 'air', method = 'regular'}, --PALETO PD (helipad)
        --BOATS
        [7] = {coords = vector3(-1608.69, -1210.25, -0.42), distance = 20, garage_type = 'boat', method = 'regular'}, --VESPUCCI BEACH (boats)
        [8] = {coords = vector3(1430.31, 3776.28, 29.9), distance = 20, garage_type = 'boat', method = 'regular'}, --SANDY LAKE (boats)
        --Vespucci
        [9] = {coords = vector3(-1052.07, -856.79, 4.87), distance = 10, garage_type = 'car', method = 'personalowned'}, --vespucci (lowerlot)
        [10] = {coords = vector3(-1096.65, -834.49, 37.68), distance = 10, garage_type = 'air', method = 'regular'}, --vespucci (helipad)
        --MRPD REGULAR TYPE
        [11] = {coords = vector3(449.16, -974.95, 16.7), distance = 10, garage_type = 'car', method = 'regular'}, --MRPD REGULAR TYPE (cars)
    },
    ['ambulance'] = {
        --PILLBOX HOSPITAL
        [1] = {coords = vector3(-486.80, -343.15, 34.01), distance = 5, garage_type = 'car', method = 'personalowned'}, --MT Zonah HOSPITAL (cars)
        [2] = {coords = vector3(-457.71, -288.57, 80.17), distance = 5, garage_type = 'air', method = 'regular'}, --PILLBOX HOSPITAL (helipad)

        --SANDY MEDICAL
        [3] = {coords = vector3(294.59, -608.86, 43.33), distance = 10, garage_type = 'car', method = 'personalowned'}, --SANDY MEDICAL (cars)
        [4] = {coords = vector3(1842.81, 3634.76, 33.32), distance = 10, garage_type = 'air', method = 'regular'}, --SANDY MEDICAL (helipad)
        --Mt Zonah
        [5] = {coords = vector3(-488.78, -331.44, 34.36), distance = 5, garage_type = 'car', method = 'regular'}, --MT Zonah HOSPITAL (cars)
    },
    ['mechanic'] = {
        
        [1] = {coords = vector3(-356.79, -160.24, 38.78), distance = 10, garage_type = 'car', method = 'personalowned'}, --Laynz (cars)
        [2] = {coords = vector3(-162.98, -1302.45, 31.36), distance = 10, garage_type = 'car', method = 'personalowned'}, --JDM (cars)
        [3] = {coords = vector3(542.52, -210.92, 53.37), distance = 10, garage_type = 'car', method = 'personalowned'}, --A1 (cars)
        [4] = {coords = vector3(968.91, -1039.11, 40.83), distance = 10, garage_type = 'car', method = 'personalowned'}, --BPM (cars)
        [5] = {coords = vector3(1779.13, 3316.56, 41.39), distance = 10, garage_type = 'car', method = 'personalowned'}, --SRC (cars)
    },   
 
}

Config.JobVehicles_RegularMethod = { --This will only be used if any of the 'method'(s) in the table above is set to use 'regular' job vehicle.
--The script fills in the rest of the plate characters with random numbers, so for example 'PD' would be 'PD425424'.
    ['police'] = {
        [1] = {job = 'police', spawn_max = true, plate = 'LSPD5341', job_grade = 1, garage_type = 'car', model = '14charger'},
        [2] = {job = 'police', spawn_max = true, plate = 'LSPD5342', job_grade = 0, garage_type = 'car', model = '11cvpi'},
        [3] = {job = 'police', spawn_max = true, plate = 'LSPD5349', job_grade = 3, garage_type = 'car', model = '18charger'},
        [4] = {job = 'police', spawn_max = true, plate = 'LSPD5343', job_grade = 2, garage_type = 'car', model = '16fpis'},
        [5] = {job = 'police', spawn_max = true, plate = 'LSPD5344', job_grade = 3, garage_type = 'car', model = '16fpiu'},
        [6] = {job = 'police', spawn_max = true, plate = 'LSPD5345', job_grade = 3, garage_type = 'car', model = '18durango'},
        [7] = {job = 'police', spawn_max = true, plate = 'LSPD5346', job_grade = 4, garage_type = 'car', model = '20tahoe'},
        [8] = {job = 'police', spawn_max = true, plate = 'LSPD5347', job_grade = 4, garage_type = 'car', model = '2020fpiu'},
        [9] = {job = 'police', spawn_max = true, plate = 'LSPD5348', job_grade = 3, garage_type = 'air', model = 'polmav'},
        [9] = {job = 'police', spawn_max = true, plate = '5 OHSHIT', job_grade = 4, garage_type = 'car', model = 'polgt17'},
        [11] = {job = 'police', spawn_max = true, plate = 'LSPD53489', job_grade = 2, garage_type = 'boat', model = 'predator'},
        [12] = {job = 'police', spawn_max = true, plate = 'LSPD5350', job_grade = 4, garage_type = 'car', model = 'pbus'},
    },
    ['ambulance'] = {
        [1] = {job = 'ambulance', spawn_max = true, plate = 'EMS', job_grade = 0, garage_type = 'car', model = 'ambulance'},
        [2] = {job = 'ambulance', spawn_max = true, plate = 'EMS', job_grade = 0, garage_type = 'air', model = 'polmav'},
    },
    ['mechanic'] = {
        [1] = {job = 'mechanic', spawn_max = true, plate = 'SCRPURCR', job_grade = 0, garage_type = 'car', model = 'gtow'},
        [2] = {job = 'mechanic', spawn_max = true, plate = 'SCRPURCR', job_grade = 0, garage_type = 'car', model = 'ct660tow'},
    },

}
------------------------------------------------------------------------------------------------------
--------------------------------------------- BLIPS --------------------------------------------------
------------------------------------------------------------------------------------------------------
Config.BlipNames = true --Do you want each garage to be named by its unique id, for example: 'Garage A'? (If disabled all garages will be called 'Garage').
Config.Blip = {
    ['car'] = {
        sprite = 473, --Icon of the blip.
        scale = 0.6, --Size of the blip.
        colour = 9, --Colour of the blip.
        name = Locales[Config.Language]['garage']..' ' --You dont need to change this.
    },

    ['boat'] = {
        sprite = 357,
        scale = 0.6,
        colour = 9,
        name = Locales[Config.Language]['harbor']..' '
    },

    ['air'] = {
        sprite = 357,
        scale = 0.6,
        colour = 9,
        name = Locales[Config.Language]['hangar']..' '
    },
}
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-------------------------------------- GARAGE LOCATIONS ----------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
Config.Locations = {
    {
        Garage_ID = 'Legion', -- Legion Public Parking Garage
        Type = 'car', --The type of vehicles which use this garage. (car/boat/air).
        Dist = 10, --The distance that you can use this garage.
        x_1 = -281.34, y_1 = -887.96, z_1 = 31.32, --This is the location of the garage, where you press e to open for example.
        EventName1 = 'cd_garage:QuickChoose', --DONT CHANGE THIS.
        EventName2 = 'cd_garage:EnterGarage', --DONT CHANGE THIS.
        Name = '<b>'..Locales[Config.Language]['garage']..'</b></p>'..Locales[Config.Language]['open_garage_1']..'</p>'..Locales[Config.Language]['open_garage_2'], --You dont need to change this.
        x_2 = -310.97, y_2 = -891.67, z_2 = 31.08, h_2 = 250.00, --This is the location where the vehicle spawns.
        EnableBlip = true, --If edisabled, this garages blip will not show on the map.
    },

    {
        Garage_ID = 'Greenwich Parkway', --tractorsupply Parking Garage
        Type = 'car',
        Dist = 10,
        x_1 = -1015.91, y_1 = -2230.29, z_1 = 9.00,
        EventName1 = 'cd_garage:QuickChoose',
        EventName2 = 'cd_garage:EnterGarage',
        Name = '<b>'..Locales[Config.Language]['garage']..'</b></p>'..Locales[Config.Language]['open_garage_1']..'</p>'..Locales[Config.Language]['open_garage_2'],
        x_2 = -1015.91, y_2 = -2230.29, z_2 = 9.00, h_2 = 206.10,
        EnableBlip = true,
    },

    {
        Garage_ID = 'Grapeseed', -- Grapeseed Parking
        Type = 'car',
        Dist = 10,
        x_1 = 1700.99, y_1 = 4945.99, z_1 = 42.40,
        EventName1 = 'cd_garage:QuickChoose',
        EventName2 = 'cd_garage:EnterGarage',
        Name = '<b>'..Locales[Config.Language]['garage']..'</b></p>'..Locales[Config.Language]['open_garage_1']..'</p>'..Locales[Config.Language]['open_garage_2'],
        x_2 = 1701.09, y_2 = 4946.56, z_2 = 42.50, h_2 = 39.06,
        EnableBlip = true,
    },

    {
        Garage_ID = 'Willies', -- Paleto Public Garage
        Type = 'car',
        Dist = 10,
        x_1 = -80.22, y_1 = 6543.18, z_1 = 31.49,
        EventName1 = 'cd_garage:QuickChoose',
        EventName2 = 'cd_garage:EnterGarage',
        Name = '<b>'..Locales[Config.Language]['garage']..'</b></p>'..Locales[Config.Language]['open_garage_1']..'</p>'..Locales[Config.Language]['open_garage_2'],
        x_2 = -88.22, y_2 = 6552.44, z_2 = 31.49, h_2 = 330.00,
        EnableBlip = true,
    },

    {
        Garage_ID = 'Palm', -- Palm Trucking Public Parking
        Type = 'car',
        Dist = 10,
        x_1 = 136.87, y_1 = -3092.76, z_1 = 5.9,
        EventName1 = 'cd_garage:QuickChoose',
        EventName2 = 'cd_garage:EnterGarage',
        Name = '<b>'..Locales[Config.Language]['garage']..'</b></p>'..Locales[Config.Language]['open_garage_1']..'</p>'..Locales[Config.Language]['open_garage_2'],
        x_2 = 139.37, y_2 = -3096.28, z_2 = 5.47, h_2 = 268.55,
        EnableBlip = true,
    },

  {
        Garage_ID = 'Von Crastenburg', -- Von Crastenburg
        Type = 'car',
        Dist = 10,
        x_1 = -1283.09, y_1 = -213.70, z_1 = 42.45,
        EventName1 = 'cd_garage:QuickChoose',
        EventName2 = 'cd_garage:EnterGarage',
        Name = '<b>'..Locales[Config.Language]['garage']..'</b></p>'..Locales[Config.Language]['open_garage_1']..'</p>'..Locales[Config.Language]['open_garage_2'],
        x_2 = -1276.86, y_2 = -224.12, z_2 = 42.45, h_2 = 220.50,
        EnableBlip = true,
    },

    {
        Garage_ID = 'Sandy Shores', -- Sandy Shore Public Parking
        Type = 'car',
        Dist = 10,
        x_1 = 1704.74, y_1 = 3769.20, z_1 = 34.46,
        EventName1 = 'cd_garage:QuickChoose',
        EventName2 = 'cd_garage:EnterGarage',
        Name = '<b>'..Locales[Config.Language]['garage']..'</b></p>'..Locales[Config.Language]['open_garage_1']..'</p>'..Locales[Config.Language]['open_garage_2'],
        x_2 = 1706.85, y_2 = 3761.83, z_2 = 34.26, h_2 = 317.52,
        EnableBlip = true,
    },

    --[[{   --THIS IS AN BOAT GARAGE, YOU CAN REMOVE OR ADD NEW BOAT GARAGES IF YOU WISH.
        Garage_ID = 'Harbor',
        Type = 'boat',
        Dist = 10,
        x_1 = -849.79, y_1 = -1339.24, z_1 = 1.61,
        EventName1 = 'cd_garage:QuickChoose',
        Name = '<b>'..Locales[Config.Language]['harbor']..'</b></p>'..Locales[Config.Language]['open_garage_3'],
        x_2 = -850.77, y_2 = -1343.76, z_2 = -0.47, h_2 = 107.65,
        EnableBlip = true,
        JobRestricted = nil,
    },

    --[[{   --THIS IS AN AIR GARAGE, YOU CAN REMOVE OR ADD NEW AIR GARAGES IF YOU WISH.
        Garage_ID = 'A',
        Type = 'air',
        Dist = 10,
        x_1 = -982.55, y_1 = -2993.94, z_1 = 13.95,
        EventName1 = 'cd_garage:QuickChoose',
        Name = '<b>'..Locales[Config.Language]['hangar']..'</b></p>'..Locales[Config.Language]['open_garage_4'],
        x_2 = -989.59, y_2 = -3004.93, z_2 = 13.94, h_2 = 58.15,
        EnableBlip = true,
        JobRestricted = nil,
    },]]
}
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-------------------------------------- IMPOUND LOCATIONS ---------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
Config.Impound = { --DO NOT CHANGE THE TABLE IDENTIFIERSs, for example - ['car_2'], if you wish to add more, then name the next one ['car_3']. It must have either car/boat/air in the name.
--[[    ['car_1'] = {
        ImpoundID = 1, --The unique id of the impound.
        coords = {x = -186.14, y = -1260.91, z = 31.30}, --This is the location of the garage, where you press e to open for example.
        spawnpoint = {x = -189.79, y = -1260.78, z = 31.30, h = 177.93}, --This is the location where the vehicle spawns.
        blip = {
            sprite = 607, --Icon of the blip.
            scale = 1.0, --Size of the blip.
            colour = 64, --Colour of the blip.
            name = Locales[Config.Language]['car_vega'], --This can be changed in the Locales.
        }
    },--]]

    ['car_2'] = { 
        ImpoundID = 2,
        coords = {x = 408.40, y = -1639.61, z = 29.29},
        spawnpoint = {x = 409.39, y = -1647.92, z = 29.29, h = 227.81},
        blip = {
            sprite = 607,
            scale = 1.0,
            colour = 64,
            name = Locales[Config.Language]['car_lot143'],
        }
    },

--[[    ['car_3'] = { 
        ImpoundID = 3,
        coords = {x = 847.34, y = -951.84, z = 26.52},
        spawnpoint = {x = 849.09, y = -951.98, z = 26.28, h = 359.99},
        blip = {
            sprite = 607,
            scale = 1.0,
            colour = 64,
            name = Locales[Config.Language]['car_mbrp'],
        }
    },--]]

    ['car_4'] = { 
        ImpoundID = 4,
        coords = {x = -449.97, y = -1691.04, z = 18.96},
        spawnpoint = {x = -458.01, y = -1695.85, z = 19.01, h = 257.64},
        blip = {
            sprite = 607,
            scale = 1.0,
            colour = 64,
            name = Locales[Config.Language]['car_scrapwithdraw'],
        }
    },

    --[['car_5'] = { 
        ImpoundID = 5,
        coords = {x = -1233.64, y = -2100.04, z = 13.92},
        spawnpoint = {x = -1233.64, y = -2100.04, z = 13.92, h = 291.97},
        blip = {
            sprite = 0,
            scale = 0.0,
            colour = 0,
            name = Locales[Config.Language]['car_city_sofree'],
        }
    },--]]

      ['car_6'] = { 
        ImpoundID = 6,
        coords = {x = 2415.37, y = 3142.53, z = 47.34},
        spawnpoint = {x = 2413.25, y = 3138.05, z = 47.57, h = 154.23},
        blip = {
            sprite = 607,
            scale = 1.0,
            colour = 64,
            name = Locales[Config.Language]['oasis_insurance'],
        }
    },

    --[['car_7'] = { 
        ImpoundID = 7,
        coords = {x = -1607.03, y = -821.58, z = 10.03},
        spawnpoint = {x = -1606.94, y = -823.69, z = 9.61, h = 225.0},
        blip = {
            sprite = 607,
            scale = 1.0,
            colour = 64,
            name = Locales[Config.Language]['car_city_delperro'],
        }
    },

    ['car_8'] = { 
        ImpoundID = 8,
        coords = {x = 534.36, y = -173.53, z = 54.58},
        spawnpoint = {x = 534.84, y = -179.4, z = 53.97, h = 92.99},
        blip = {
            sprite = 607,
            scale = 1.0,
            colour = 64,
            name = Locales[Config.Language]['car_city_exotic'],
        }
    },

    ['car_9'] = { 
        ImpoundID = 9,
        coords = {x = 2350.15, y = 3132.28, z = 48.21},
        spawnpoint = {x = 2334.58, y = 3137.79, z = 47.76, h = 78.03},
        blip = {
            sprite = 607,
            scale = 1.0,
            colour = 64,
            name = Locales[Config.Language]['car_city_recycling'],
        }
    },

    ['car_10'] = { 
        ImpoundID = 10,
        coords = {x = -231.16, y = 6262.23, z = 31.44},
        spawnpoint = {x = -226.14, y = 6247.14, z = 31.07, h = 135.51},
        blip = {
            sprite = 607,
            scale = 1.0,
            colour = 64,
            name = Locales[Config.Language]['car_city_chrome'],
        }
    },]]

--[[    ['boat_1'] = {
        ImpoundID = 3,
        coords = {x = -848.8, y = -1368.42, z = 1.6},
        spawnpoint = {x = -848.4, y = -1362.8, z = -0.47, h = 113.0},
        blip = {
            sprite = 357,
            scale = 0.5,
            colour = 3,
            name = Locales[Config.Language]['boat_impound'],
        }
    },

--[[    ['air_1'] = {
        ImpoundID = 4,
        coords = {x = -956.49, y = -2919.74, z = 13.96},
        spawnpoint = {x = -960.22, y = -2934.4, z = 13.95, h = 153.0},
        blip = {
            sprite = 357,
            scale = 0.5,
            colour = 3,
            name = Locales[Config.Language]['air_impound'],
        }
    }, --]]
}
------------------------------------------------------------------------------------------------------
--------------------------------------------- WEBHOOKS -----------------------------------------------
------------------------------------------------------------------------------------------------------
--These are disabled by default, until you enter your discord webhook. 'FALSE' will disable them.
Config.ExploitLogWebhook = 'https://discord.com/api/webhooks/814178726275317787/3uent8o_tWK_ngfVAq2f-0z9uKYz9iIp8lwWd6l-23BsECtxw0GTSsJX9J1Ze0oFeKKy' --If a player is found using cheat engine to change the hash of a vehicle, this will send a message on discord and kick them from the game.
Config.ImpoundLogWebhook = 'https://discord.com/api/webhooks/814147268545478697/Sfcko1laR9J3O-yNhPey7f8Vo5Oy-w4jRDVKZMl9REk8a63gNzWWrPc4NvDYmCM4EItg' --When a player impounds/unimpounds a vehicle it will send a message on discord.
Config.TransferVehicleLogWebhook = 'https://discord.com/api/webhooks/814177502062444565/eLYVI5LtKTBmtsnTtitexcYD8CtdRnlaOP6EOSuERS63DLvEwVi9vUzsiQ__rkxQHqmW' --When a player transfers a vehicle to another player it will send a message on discord.
Config.VehicleManagementLogWebhook = 'https://discord.com/api/webhooks/814177504012926997/VXuR-iNLJ6UOsHUDMXtvB983MVioTzH1H7UQTGYqRmU4fkbFcbz8Z1wNHTvxR3MPjR9V' --When a staff member uses the vehiclemanagment commands it will send a message on discord.