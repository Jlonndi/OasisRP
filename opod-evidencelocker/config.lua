Config = {}

Config.SharedObject = 'esx:getSharedObject' -- ESX Shared Object / Change if using a custom version of ESX
Config.language = 'en' -- Language used
Config.UseESX_1_2 = false

-- [Locker Settings]
Config.LockerLocations = {
    MainLocker = {pos = vector3(923.65, -1173.87, 25.74), h = 88.25, model = 'prop_mil_crate_01', radius = 2.5, label = 'Main Evidence Locker at SAHP', isLocked = true, limit = 1000}, -- MainLocker 
    { pos = vector3(485.07, -997.17, 30.69), h = 90.0, model = 'hei_prop_crate_stack_01', radius = 3.0, label = 'MRPD Evidence Locker', isLocked = true, limit = 100},
    -- { pos = vector3(119.1544, -526.6272, 43.3), h = 30.0, model = 'hei_prop_crate_stack_01', radius = 3.0, label = 'LSPD Locker', isLocked = true, limit = 30},  -- https://plebmasters.de/?app=objects
}

-- [Notifications] --
-- This will default to the default notifications if all disabled --
Config.MythicNotify   = true      -- You need to disable pNotify if this is enabled
Config.MythicOptions  = {
    type              = 'inform',  -- options are: inform, error, success
    background        = '#ffffff', -- Remove if not using
    color             = '#000000'  --^
}

Config.pNotify        = false       -- You need to disable MythicNotify if this is enabled
Config.pNotifyOptions = {
    type              = 'info',      -- options are: alert, success, error, warning, info
    layout            = 'bottomCenter' -- options are: top, topLeft, topRight, topCenter, center, centerLeft, centerRight, bottom, bottomLeft, bottomRight, bottomCenter
}

Config.UseCustomNames  = true -- Use custom evidence locker names if true set the name using the label parameter above
Config.Use3DText = true

-- [Inventory System]
Config.UseESXInventory = true -- Use ESX Inventory HUD
Config.UseWeight       = false

-- [Dispatch] --
Config.UseBreakingNews                 = true -- Use the breaking news scaleform
Config.PlayDispatch                    = true -- Play radio dispatch
Config.ShowAlertForWhitelistedJobsOnly = true -- Show for everyone or the whitelisted jobs

Config.WhitelistedJobs = { -- Jobs that can open the evidence locker
    'police',
    'ambulance',
    'bcso'
}

-- [Locker Status'] --
Config.Autolock = true -- If true it will automatically lock the locker if its left open for the set time
Config.AutolockTime = 10 -- After 5 minutes of the evidence locker being unlocked it will auto lock
Config.ResetLockerTimer = 240 -- After X minutes the evidence in the main evidence locker will be cleared


-- [Door Lock System] --
Config.UseDoors = false
Config.Doors = {
    { pos = { x = -2353.747, y = 3252.641, z = 32.959}, h = 150.104, model = -1207991715, alarm = "The Main Evidence Locker's alarms have been set off" }, -- Main Locker
    { pos = { x = -2359.631, y = 3247.564, z = 93.053}, h = 149.942, model = -1207991715 },
    { pos = { x = 443.407, y = -989.445, z = 30.839}, h = 180.0, model = 185711165, alarm = "The Police Evidence locker's alarms have been set off" },
    { pos = { x = 446.008, y = -989.445, z = 30.839}, h = 0.0, model = 185711165, alarm = "The Police Evidence locker's alarms have been set off" },
}
-- when there is an alarm parameter it will alert the police if the door is lockpicked

-- [Robbery Settings] --
Config.UseC4 = true -- If true it will use a C4 else it will use thermite
Config.MainLockerRaid = true -- If enabled only the Main Evidence Locker will be allowed to be robbed
Config.MinPolice = 6 -- Minimum amount of police needed to rob
Config.MassCooldown = true -- Using a global cooldown
Config.RobberyCooldown = 600 -- The cooldown between robbing the evidence locker in minutes
Config.RobberyLength = 7 -- Minutes until the locker opens
Config.MainLockerRobberyLength = 30 -- Minutes until the locker opens
Config.RobberyRadius = 50 -- Radius of active robbery if ran out of radius it will cancel

-- [Item Names] --
Config.ThermiteItem = 'thermite'
Config.C4Item = 'explosives'
Config.HackingDevice = 'hackingdevice'