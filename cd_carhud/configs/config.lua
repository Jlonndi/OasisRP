Config = {}
------------------------------------------------------------------------------------------------------
----------------------------------------------- MAIN ------------------------------------------------
------------------------------------------------------------------------------------------------------
Config.Language = 'EN' --[ 'EN' / 'FR' / 'ES' / 'CZ' / 'PT' ]. (You can add your own locales to the Locales.lua. But make sure to add it here).
Config.NotificationType = { --[ 'chat' / 'mythic_old' / 'mythic_new' / 'esx' / 'custom' ].
    server = 'esx',
    client = 'esx', 
}
------------------------------------------------------------------------------------------------------
------------------------------------------ OPTIMISATION ----------------------------------------------
------------------------------------------------------------------------------------------------------
Config.DisableExitingVehicle = false --If enabled, you will not be able to press F to exit the vehicle while the seatbelt is enabled. [WARNING - If this is enabled, this will increase the ms usage of this script.]
Config.SeatbeltLoopTimer = 50 --(ms) Increasing ths value will lower the ms used in resmon. [WARNING - The side effect of increasing this value to increase opimisation is that players will be less likely to be ejected/tires pop when crashing vehicles as the loop slower.]
------------------------------------------------------------------------------------------------------
-------------------------------------- KEYPRESS AND COMMAND ------------------------------------------
------------------------------------------------------------------------------------------------------
--The keypress and chat command are combined together by using the register keymapping native. If you disable one, it will disable both.
Config.Settings = {
    ENABLE = true, --The main toggle for the settings. If disabled, all of the options below in this sub-table will not used.
    command = 'carhud', --Customise the chat command to open the settings UI.
    key = '9', --Customise the key to open the settings UI.
    description = Locales[Config.Language]['settings_description'], --Customise the description for the chat message.
}

Config.Seatbelt = {
    ENABLE = true, --The main toggle for the seatbelt. If disabled, all of the options below in this sub-table will not used.
    command = 'seatbelt', --Customise the chat command to toggle the seatbelt.
    key = 'F1', --Customise the key to toggle the seatbelt.
    description = Locales[Config.Language]['seatbelt_description'], --Customise the description for the chat message.

    eject = true, --If enabled, when you crash hard enough you will be ejected from the vehicle.
    ragdoll = true, --If enabled, when you are ejected from a vehicle you will ragdoll for a short time.
    tyrepop = false, --If enabled, when you are crash hard enough a random tyre will pop.
}

Config.Cruise = {
    ENABLE = true, --The main toggle for the settings. If disabled, all of the options below in this sub-table will not used.
    command = 'cruise', --Customise the chat command to toggle cruise control.
    key = 'LShift', --Customise the key to toggle cruise control.
    description = Locales[Config.Language]['cruise_description'], --Customise the description for the chat message.
}

Config.ToggleCarhud = {
    ENABLE = true, --The main toggle for the carhud UI visibility. If disabled, all of the options below in this sub-table will not used.
    command = 'carhudtoggle', --Customise the chat command to toggle the carhud UI visibility.
    description = Locales[Config.Language]['togglecarhud_description'], --Customise the description for the chat message.
    minimap = true, --if enabled, the mini map will also be hidden while the main carhud UI is hidden.
}
------------------------------------------------------------------------------------------------------
---------------------------------------------- OTHER -------------------------------------------------
------------------------------------------------------------------------------------------------------
Config.HideMiniMap = true --If enabled, the mini-map will be hidden when the player is on foot, but will show when the player is in a car.