Config = {}
-- Resource Config.

Config.DrawDistance = 3.0 -- Don't touch please. (Only if you know, how much distance should the bot listen to you and interact with you.)

-- Choose either Weight ESX system, or the old ESX limit system.
Config.WeightSystem = false -- If false then the resource will use the old ESX limit system, if true the resource will use the new Weight system!
Config.ESXTrigger = 'esx:getSharedObject'

--- Ped Config.
Config.PedName  = "Ricky Glover" -- Ped Name, You can use colors like ~w~ ~r~ ~b~ etc..
Config.PedFontID  = 1 -- TextDraw FontID
Config.PedHash = 's_m_y_xmech_02'
Config.Point = {x= 1592.37, y= 3585.47, z= 38.77, h= 302.88} -- Static Place that the blackmarket bots will spawn if Config.RandomSpawn is false.
Config.RandomSpawn = true -- Toggle if you want to make the BlackMarket get Spawned in random place each RESOURCE start/restart or not.
Config.RandomPlaces = {
    {x= -303.00, y= 30.62, z= 63.18, h= 274.97}, 
    {x= -921.43, y= -1410.09, z= 7.68, h= 269.44},  
    {x= -415.03, y= -2608.20, z= 8.76, h= 109.26}, 
    {x= 1665.25, y= 0.72, z= 166.12, h= 73.75},
    {x= -446.77, y= 1599.64, z= 358.35, h= 71.78},  
    {x= 2899.67, y= 4502.88, z= 48.08, h= 119.08}, 
    {x= 1674.48, y= 5142.24, z= 150.70, h= 31.57}, 
    {x= 2584.38, y= 6164.65, z= 165.10, h= 342.90}, 
    {x= 2409.45, y= 3032.43, z= 48.15, h= 352.29}, 
    {x= -2950.57, y= 57.02, z= 11.61, h= 68.52}, 
}


--- Dog Config.
Config.SpawnDog = true -- Spawn Dog? If true, Check  the next two options, if false, Change "Config.DoesDogNeedToAttack" to false too.
Config.DogName = "Broly" -- Dog Name, You can use colors like ~w~ ~r~ ~b~ etc..
Config.DogFontID  = 1 -- TextDraw FontID
Config.DogHash = 'a_c_husky'
Config.DoesDogNeedToAttack = true -- If SpawnDog is false then make it false, if SpawnDog is True then it's up to you if you want the dog to attack or no.

--- Items Config.
--- If type = 1 then that's means ITEM
--- If type = 2 then that's means WEAPON
Config.UseCash   = false -- If you want to use cash, IF true then ignore the Config.MoneyType.
Config.MoneyType = 'black_money' -- That's the money type that the player should pay with.
Config.ItemsToBuy = {
    { name = "drill", label = "Drill", price = 1000, type = 1},
    { name = "drugbags", label = "Bags", price = 1, type = 1},
    { name = "lockpick", label = "Lockpick", price = 100, type = 1},
    { name = "drugItem", label = "Black USB-C", price = 500, type = 1},
    { name = "hackerDevice", label = "Hacker Device", price = 1000, type = 1},
    { name = "rolpaper", label = "Rolling Paper", price = 1, type = 1},
    { name = "weed_seed", label = "Marijuana Seeds", price = 250, type = 1}
}


-- Blip Settings.
Config.CreateBlip = false -- This Enable/Disable the creation of the blip, IF TRUE then check the rest of Blip settings.
Config.CircleBlip = false -- Choose ethier Circle blip that randomly generated around the Bot and the Ped OR Fixed Blip.
Config.FixedBlipName = "BlackMarket" -- The name of the blip, ONLY if CircleBlip == false.
Config.FixedBlipNumber = 163 -- Blip Sprite Can be found here to pick your icon > https://docs.fivem.net/docs/game-references/blips/
Config.FixedBlipColour = 1 -- Blip Colours can be found here, pick your fav. one > https://docs.fivem.net/docs/game-references/blips/#blip-colors

--- Update Checker Config.
Config.AutoCheckForUpdate = true -- Do you want to check for new version ? | if Yes then check Config.ShowChanges if not then ignore Config.ShowChanges or put it false.
Config.ShowChanges = true -- If Config.AutoCheckForUpdate = true then it's up to you if you want to print the change log or not if there's new update in the console.


--- Translate & Menu
Config["Translate"] = { -- Please Try the English translate to know how you should translate.
    -- Those are the notifications, You can use colors such as ~r~ and ~w~ if you are using the default ESX notifications.
    YouBoughtTheItem1 = "You bought x", -- x is like this "You bought x10 that cost 1000 Red Money."
    YouBoughtTheItem2 = " that cost ", --Leave spaces like it is.
    YouBoughtTheItem3 = " Dirty Money.", --Leave spaces like it is.
    InventoryIsFull = "You can't carry more items, Your bag is full",
    DontHaveEnoughMoney ="You don't have enough dirty money, Get more:",
    YouAlreadyHaveWEAPON = "You already have that Weapon, I can't give you it again.",

    -- Menu Titles
    Title = 'BlackMarket',
}

Config.MenuAlign = 'center' -- That's the menu align.