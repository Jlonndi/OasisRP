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
Config.ESX_allowedperms = { --FOR ESX ONLY. You decide which permission groups can use the staff commands to add/remove coins.
  	['superadmin'] = true,
    ['admin'] = false,
    ['mod'] = false,
    ['helper'] = false,
}

Config.Using_cdgarage = true --Do you use te Codesign garage?
Config.Using_cdmultichar = false --Are you the using Codesign Multicharacter script?
Config.MaxCharacterSlots = 5 --If you are using the using Codesign Multicharacter script ^^, what is the maximum amount of character slots you allow players to have?
Config.PlateUpperCaps = true --When purchasing a vehicle do you want the letters of the plate to be saved in the databsase in upper case? If set to false the plate will be saved in lower case.
Config.PurchaseCommand = 'tebex_purchase' --DONT CHANGE IF YOU DONT KNOW WHAT YOU ARE DOING. This is the command for the tebex transactions.

Config.BlacklistedWords = {'CHANGE_ME', 'CHANGE_ME'} --These words are blacklisted from plate changes. If a plate change contains any of these words the transaction will be canceled.

Config.NotificationType = { --[ 'chat' / 'mythic_old' / 'mythic_new' / 'esx' / 'custom' ]
    server = 'esx',
    client = 'esx',
}

------------------------------------------------------------------------------------------------------
------------------------------------------- CHAT COMMANDS --------------------------------------------
------------------------------------------------------------------------------------------------------

Config.RedeemCommand = 'redeem' --The command players who have purchased items on tebex can use to redeem their purchase in game.
Config.StaffCommands = {
    Add_Balance = 'add_balance', --The command for staff to manually add coins to a players balance in the database.
    Remove_Balance = 'remove_balance', --The command for staff to manually remove coins to from a players balance database.
}
------------------------------------------------------------------------------------------------------
---------------------------------------- TEBEX WEBSITE PRODUCTS --------------------------------------
------------------------------------------------------------------------------------------------------

Config.TebexListings = { --These are the products that you will list for sale on your tebex website.
    [1] = {
        ProductName = '10 BeachBucks', --You can change this, but this ProductName must be identical to the name of the product on your tebex website.
        Amount = 10, --This is the amount of coins the player will recieve when he purchases this product.
    },

    [2] = {
        ProductName = '30 BeachBucks',
        Amount = 30,
    },

    [3] = {
        ProductName = '50 BeachBucks',
        Amount = 50,
    },

    [4] = {
        ProductName = '100 BeachBucks',
        Amount = 100,
    },

    [5] = {
        ProductName = 'test rank 100coins',
        Amount = 100,
    },

   -- [6] = {
   --     ProductName = 'ADD_MORE_PRODUCTS_HERE',
   --     Amount = 50,
   -- },
}

------------------------------------------------------------------------------------------------------
-------------------------------------------- MAIN LOCATIONS ------------------------------------------
------------------------------------------------------------------------------------------------------

Config.Locations = {
    [1] = {x = -1394.81, y = -3265.03, z = 13.93, h = 339.85,   Distance = 10.0, EventName = 'cd_donatorshop:Enter', Text = Locales[Config.Language]['enter']},--The entrance to the donator shop.
    [2] = {x = -1266.89, y = -2965.47, z = -48.48, h = 179.08,  Distance = 10.0, EventName = 'cd_donatorshop:Exit', Text = Locales[Config.Language]['exit']},--The exit to the donator shop.
    [3] = {x = -1246.55, y = -2984.19, z = -48.49, h = 0.0,     Distance = 10.0, EventName = 'cd_donatorshop:Menu', Text = Locales[Config.Language]['menu']},--The donator shop main shop UI.
}

------------------------------------------------------------------------------------------------------
----------------------------------------------- VEHICLES ---------------------------------------------
------------------------------------------------------------------------------------------------------

Config.ManuallyPlaceVehicles = false --Do you want to manually enter the coords for each vehicles location? (If disabled the script will automatically choose the location of each vehicle, circled around the Config.StartCoords below.)
Config.AutomaticStartCoords = vector4(-1266.83, -3013.54, -48.49, 180.0) --(THIS WILL ONLY BE USED IF Config.ManuallyPlaceVehicles ABOVE^^ IS DISABLED). You can change the coords for where the vehicles will spawn. This is the centre, the vehicles will spawn around this location.
Config.VehiclePurchaseCoords = vector4(-1394.81, -3265.03, 13.93, 339.85) --This is the location where your vehicle will spawn after you make a purchase.

Config.Vehicles = {
    --Cost = This is how much the vehicle will cost.
    --Model = This is the spawn name of the vehicle.
    --Description = This is the description which will be displayed on the vehicles UI.
    --Coords = (THIS WILL ONLY BE USED IF Config.ManuallyPlaceVehicles ABOVE^^ IS ENABLED). You can manually set the location of each vehicle.
    [1] = {Cost = 10, Model = 'tcninja', Name = 'Ninja', Description = 'Theif in the Night', Coords = vector4(0, 0, 0, 0)},
    [2] = {Cost = 10, Model = 'pkr1', Name = 'Yamaha R1', Description = 'Wasp', Coords = vector4(0, 0, 0, 0)},
    [3] = {Cost = 25, Model = 'c7', Name = 'NFS Heat C7', Description = 'Getaway driverrr', Coords = vector4(0, 0, 0, 0)},
    [4] = {Cost = 20, Model = 'r35kream', Name = 'Kream R35', Description = 'Kream, right...', Coords = vector4(0, 0, 0, 0)},
    [5] = {Cost = 20, Model = 'polestar1', Name = 'NFS Heat Polestar1', Description = 'Whats this?', Coords = vector4(0, 0, 0, 0)},
    [6] = {Cost = 25, Model = 'bugtona', Name = '1969 Dayton Slammed', Description = 'Im a long boi', Coords = vector4(0, 0, 0, 0)},
    [7] = {Cost = 10, Model = 'g632019', Name = 'Brabus 800 Adventure XLP', Description = 'On road, off road, who cares?', Coords = vector4(0, 0, 0, 0)},
    [8] = {Cost = 20, Model = '20f450', Name = '2020 F450', Description = 'Not Compensating', Coords = vector4(0, 0, 0, 0)},
    [9] = {Cost = 5, Model = 'floatin', Name = 'Escalade w/ Floaters', Description = 'Floatin down the street', Coords = vector4(0, 0, 0, 0)},
    [10] = {Cost = 40, Model = 'rmodessenza', Name = 'Lamborghini Essenza', Description = 'ILLEGAL: This is a NON-street legal vehicle, drive at your own risk!', Coords = vector4(0, 0, 0, 0)},
    --[11] = {Cost = 20, Model = 'ADD_MORE_CARS_HERE', Description = 'CHANGE_ME', Coords = vector4(0, 0, 0, 0)},
}

------------------------------------------------------------------------------------------------------
------------------------------------------ IN GAME PRODUCT MENU --------------------------------------
------------------------------------------------------------------------------------------------------

Config.Prop = { --The prop to mark the location where players can access the main shop UI.
    Model = 'xm_prop_base_staff_desk_01',
    Coords = vector4(-1242.32, -2988.77, -49.50, 180.0),
}

Config.Shop = {
    --[[1] = {
        Title = 'Plate Change',
        Description = 'Buy a custom plate',
        Input_Type = 'text',
        Input_Description = 'Enter a plate between 1-8 characters',
        Pattern = '[^a-zA-Z0-9]',
        MaxLength = 8,
        Image = 'plate_change.png',
        Cost = 10,
        RewardType = 'plate_change',
        Quantity = nil,
        ItemName = nil,
    },]]


    --[[2] = {
        Title = 'Phone Number',
        Description = 'Buy a custom phone number',
        Input_Type = 'text',
        Input_Description = 'Enter a number between 1-8 characters',
        MaxLength = 8,
        Pattern = '[^0-9\\-]',
        Image = 'phone_number.png',
        Cost = 15,
        RewardType = 'phone_number',
        Quantity = nil,
        ItemName = nil,
    },]]

    --[[3] = {
        Title = 'Assault Rifle',
        Description = 'Carbine Rifle with 250 rounds of ammunition',
        Input_Type = 'number',
        Input_Description = '1 = x1 weapon with x250 ammo',
        MaxLength = nil,
        Pattern = nil,
        Image = 'weapon.png',
        Cost = 5,
        RewardType = 'weapon',
        Quantity = 250,
        ItemName = 'WEAPON_CARBINERIFLE',
    },]]

    --[[4] = {
        Title = 'Money',
        Description = 'A briefcase with $10,000 cash inside',
        Input_Type = 'number',
        Input_Description = '1 = $10000',
        MaxLength = nil,
        Pattern = nil,
        Image = 'money.png',
        Cost = 5,
        RewardType = 'money',
        Quantity = 10000,
        ItemName = nil,
    },]]
    [1] = {
        Title = 'Lucky Ticket',
        Description = 'x1 Lucky Wheel Ticket',
        Input_Type = 'number',
        Input_Description = '1 = x1 Lucky Wheel Ticket',
        MaxLength = nil,
        Pattern = nil,
        Image = 'casino_ticket.png',
        Cost = 5,
        RewardType = 'item',
        Quantity = 1,
        ItemName = 'casino_ticket',
    },

    [2] = {
        Title = 'Character Name',
        Description = 'Change your character name',
        Input_Type = 'text',
        Input_Description = 'eg., John Smith',
        MaxLength = nil,
        Pattern = '[^a-zA-Z\\s]',
        Image = 'character_name.png',
        Cost = 10,
        RewardType = 'character_name',
        Quantity = nil,
        ItemName = nil,
    },

    [3] = {
        Title = 'License plate',
        Description = 'x1 Custom License Plate, /calladmin when ready to use and be patient',
        Input_Type = 'number',
        Input_Description = '1 = x1 License Plate',
        MaxLength = nil,
        Pattern = nil,
        Image = 'licenseplate.png',
        Cost = 5,
        RewardType = 'item',
        Quantity = 1,
        ItemName = 'licenseplate',
    },

    [4] = {
        Title = 'Drift Pack 1',
        Description = 'Contains x1 Drift F-150, x1 Drift F-150 Go-Kart',
        Input_Type = 'number',
        Input_Description = '1 = x1 FULL car pack',
        MaxLength = 1,
        Pattern = '[^0-9\\-]',
        Image = 'drift_pack_1.png',
        Cost = 50,
        RewardType = 'vehicle_pack',
        Quantity = nil,
        ItemName = {'GODzOOFv2KART', 'GODzOOFv2'},
    },

    [5] = {
        Title = 'Server Booster 16-Pack',
        Description = 'Show-off you being a supporter with fireworks!  Remember they are illegal inside City Limits.',
        Input_Type = 'number',
        Input_Description = '1 = x1 Firework 16 Pack',
        MaxLength = nil,
        Pattern = nil,
        Image = 'bananabuster.png',
        Cost = 5,
        RewardType = 'item',
        Quantity = 1,
        ItemName = 'zapfireworkpack',
    },


    --[[9] = {
        Title = 'Character Slot',
        Description = 'Add 1 extra character slot',
        Input_Type = 'number',
        Input_Description = '1 = x1 extra character slot',
        MaxLength = nil,
        Pattern = nil,
        Image = 'character_slot.png',
        Cost = 10,
        RewardType = 'character_slot',
        Quantity = nil,
        ItemName = nil,
    },]]
}


--[[
VEHICLE PLATE CHANGE EXAMPLE.

    [1] = {
        Title = 'Plate Change',                                             -- Title.
        Description = 'Buy a custom plate',                                 -- Description.
        Input_Type = 'text',                                                -- [ 'text' / 'number' ] DONT change if you dont know what you are doing - https://www.w3schools.com/html/html_form_input_types.asp.
        Input_Description = '8 characters long (including whitespaces)',    -- The help text inside the input box.
        Pattern = '[^a-zA-Z0-9]',                                           -- '[^a-zA-Z0-9]' = Allows both text and numbers with no spaces. / '[^0-9\\-]' = Allows numbers only. / '[^a-zA-Z\\s]' = Allows text with spaces.
        MaxLength = 8,                                                      -- The max amount of characters allowed.
        Image = 'license-plate.png',                                        -- The display image. (must be a .png and 512 x 512 size) 
        Cost = 10,                                                          -- The cost to purchase 1 of these.
        RewardType = 'plate_change',                                        -- DONT change this.
        Quantity = nil,                                                     -- DONT change this.
        ItemName = nil,                                                     -- DONT change this.
    },


PHONE NUMBER CHANGE EXAMPLE.

    [2] = {
        Title = 'Phone Number',                                             -- Title.
        Description = 'Buy a custom phone number',                          -- Description.
        Input_Type = 'text',                                                -- [ 'text' / 'number' ] DONT change if you dont know what you are doing - https://www.w3schools.com/html/html_form_input_types.asp.
        Input_Description = 'Enter a number between 1-8 characters',        -- The help text inside the input box.
        MaxLength = 8,                                                      -- The max amount of characters allowed.
        Pattern = '[^0-9\\-]',                                              -- '[^a-zA-Z0-9]' = Allows both text and numbers with no spaces. / '[^0-9\\-]' = Allows numbers only. / '[^a-zA-Z\\s]' = Allows text with spaces.
        Image = 'phone_change.png',                                         -- The display image. (must be a .png and 512 x 512 size) 
        Cost = 15,                                                          -- The cost to purchase 1 of these.
        RewardType = 'phone_number',                                        -- DONT change this.
        Quantity = nil,                                                     -- DONT change this.
        ItemName = nil,                                                     -- DONT change this.
    },


GIVE WEAPON EXAMPLE.

    [3] = {
        Title = 'Assault Rifle',                                            -- Title.
        Description = 'Carbine Rifle with 250 rounds of ammunition',        -- Description.
        Input_Type = 'number',                                              -- [ 'text' / 'number' ] DONT change if you dont know what you are doing - https://www.w3schools.com/html/html_form_input_types.asp.
        Input_Description = '1 = x1 weapon with x250 ammo',                 -- The help text inside the input box.
        MaxLength = nil,                                                    -- DONT change this.
        Pattern = nil,                                                      -- DONT change this.
        Image = 'weapon.png',                                               -- The display image. (must be a .png and 512 x 512 size) 
        Cost = 5,                                                           -- The cost to purchase 1 of these.
        RewardType = 'weapon',                                              -- DONT change this.
        Quantity = 250,                                                     -- If the RewardType is 'weapon', then this is the amount of ammo to add. (players will only recieve 1 weapon).
        ItemName = 'WEAPON_CARBNIERIFLE',                                   -- The spawn name of this weapon.
    },


GIVE MONEY EXAMPLE.

    [4] = {
        Title = 'Money',                                                    -- Title.
        Description = 'A briefcase with $10,000 cash inside',               -- Description.
        Input_Type = 'number',                                              -- [ 'text' / 'number' ] DONT change if you dont know what you are doing - https://www.w3schools.com/html/html_form_input_types.asp.
        Input_Description = '1 = $10000',                                   -- The help text inside the input box.
        MaxLength = nil,                                                    -- DONT change this.
        Pattern = nil,                                                      -- DONT change this.
        Image = 'money.png',                                                -- The display image. (must be a .png and 512 x 512 size) 
        Cost = 5,                                                           -- The cost to purchase 1 of these.
        RewardType = 'money',                                               -- DONT change this.
        Quantity = 10000,                                                   -- If the RewardType is 'money', then this is the amount of money to add. (10000 would give the player $10,000 to their bank).
        ItemName = nil,                                                     -- DONT change this.
    },


GIVE ITEM EXAMPLE.

    [5] = {
        Title = 'Gold Bars',                                                -- Title.
        Description = 'x5 24 carat gold bars',                              -- Description.
        Input_Type = 'number',                                              -- [ 'text' / 'number' ] DONT change if you dont know what you are doing - https://www.w3schools.com/html/html_form_input_types.asp.
        Input_Description = '1 = x5 items',                                 -- The help text inside the input box.
        MaxLength = nil,                                                    -- DONT change this.
        Pattern = nil,                                                      -- DONT change this.
        Image = 'goldbar.png',                                              -- The display image. (must be a .png and 512 x 512 size) 
        Cost = 5,                                                           -- The cost to purchase 1 of these.
        RewardType = 'item',                                                -- DONT change this.
        Quantity = 5,                                                       -- If the RewardType is 'item', then this is the amount of items add. (1 would give the player x1 item).
        ItemName = 'water',                                                 -- The spawn name of this item.
    },

CHANGE CHARACTER NAME EXAMPLE.
    [6] = {
        Title = 'Character Name',                                           -- Title.
        Description = 'Change your character name',                         -- Description.
        Input_Type = 'text',                                                -- [ 'text' / 'number' ] DONT change if you dont know what you are doing - https://www.w3schools.com/html/html_form_input_types.asp.
        Input_Description = 'eg., John Smith',                              -- The help text inside the input box.
        MaxLength = nil,                                                    -- DONT change this.
        Pattern = '[^a-zA-Z\\s]',                                           -- '[^a-zA-Z0-9]' = Allows both text and numbers with no spaces. / '[^0-9\\-]' = Allows numbers only. / '[^a-zA-Z\\s]' = Allows text with spaces.
        Image = 'character_name.png',                                       -- The display image. (must be a .png and 512 x 512 size) 
        Cost = 15,                                                          -- The cost to purchase 1 of these.
        RewardType = 'character_name',                                      -- DONT change this.
        Quantity = nil,                                                     -- DONT change this.
        ItemName = nil,                                                     -- DONT change this.
    },

FULL VEHICLE PACKS EXAMPLE. (by "packs" we mean you can sell multiple vehicles in this 1 product)
    [7] = {
        Title = 'Vehicle Pack',                                             -- Title.
        Description = 'Contains x1 adder, x1 golf cart and x1 jetski',      -- Description.
        Input_Type = 'number',                                              -- [ 'text' / 'number' ] DONT change if you dont know what you are doing - https://www.w3schools.com/html/html_form_input_types.asp.
        Input_Description = '1 = x1 FULL car pack',                         -- The help text inside the input box.
        MaxLength = 1,                                                      -- The max amount of characters allowed.
        Pattern = '[^0-9\\-]',                                              -- '[^a-zA-Z0-9]' = Allows both text and numbers with no spaces. / '[^0-9\\-]' = Allows numbers only. / '[^a-zA-Z\\s]' = Allows text with spaces.
        Image = 'vehicle_pack.png',                                         -- The display image. (must be a .png and 512 x 512 size) 
        Cost = 50,                                                          -- The cost to purchase 1 of these.
        RewardType = 'vehicle_pack',                                        -- DONT change this.
        Quantity = nil,                                                     -- DONT change this.
        ItemName = {'adder', 'seashark', 'caddy'},                          -- Add the spawn name of the vehicles included in this vehicle pack to this table. Use the same format as the example.
    },


ADD CHARACTER SLOT EXAMPLE. (this comes pre-configured to work with cd_multicharacter. It will not work on other multichar scripts unless you edit the code).

    [8] = {
        Title = 'Character Slot',                                           -- Title.
        Description = 'Add 1 extra character slot',                         -- Description.
        Input_Type = 'number',                                              -- [ 'text' / 'number' ] DONT change if you dont know what you are doing - https://www.w3schools.com/html/html_form_input_types.asp.
        Input_Description = '1 = x1 extra character slot',                  -- The help text inside the input box.
        MaxLength = nil,                                                    -- DONT change this.
        Pattern = nil,                                                      -- DONT change this.
        Image = 'character_slot.png',                                       -- The display image. (must be a .png and 512 x 512 size) 
        Cost = 10,                                                          -- The cost to purchase 1 of these.
        RewardType = 'character_slot',                                      -- DONT change this.
        Quantity = nil,                                                     -- DONT change this.
        ItemName = nil,                                                     -- DONT change this.
    },
]]