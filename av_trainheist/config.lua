Config = {}

--[[
	Discord Config is inside server/main.lua
]]--

Config.DrillName = 'drill' -- Drill item name
Config.PC = {x = 2634.36, y = 2932.10, z = 44.73} -- PC location (1st step)
Config.PCitem = false -- PC needs item to be hacked?
Config.PCitemName = 'hackingphone' -- Item needed to hack PC
Config.HackBlocks = 2 -- Number of blocks per side
Config.HackTime = 20 -- Time before hacking minigame ends
Config.PoliceJobName = 'police' -- Who will receive the train alert and blip on map?
Config.MinPolice = 4 -- Min Police online to start the robbery
Config.Timer = 300 -- Countdown for drill to finish and robbers be able to rob the train (5 mins by default [300]).
Config.CooldownTime = 60 -- Time before the robbery can be triggered again (1 hour by default).
Config.GiveMoney = true -- False if player don't get money when robbing the train
Config.Account = 'black_money' -- Just in case you use a different name for dirty money
Config.Money = math.random(60000,90000) -- Amount player receives when robbing the train. You can use math.random(minimum,maximum)
Config.GiveItems = true -- Give items?
Config.Items = {
	{name = 'hammerwirecutter', count = 1},
	{name = 'hqscale', count = 1},
} 
Config.GiveWeapons = true -- True if you want player to receive weapons
Config.Weapons = {
	{weapon = 'WEAPON_CROWBAR', ammo = 1},

}

Config.Lang = {
['hack_pc'] = 'Press ~r~[E]~w~ to hack PC',
['pc_item'] = 'Missing item',
['cooldown'] = 'No trains available',
['robbery_started'] = 'Rob the Illegal Goods from the train, Use a Drill to break into the cockpit',
['drill'] = 'Drill installed',
['drill_countdown1'] = 'Drill: ~r~',
['drill_countdown2'] = '~w~ seconds remaining',
['rob_train'] = 'Press ~r~[E]~w~ to rob the train',
['you_stole'] = 'You stole ',
['rob_progress'] = 'Train robbery in progress, verify your GPS',
['train_cab'] = 'You only can rob the cockpit',
['failed'] = 'Robbery has failed',
}

--your notification system goes here:

RegisterNetEvent('train:notify')
AddEventHandler('train:notify', function(msg)	
	
exports['mythic_notify']:SendAlert('inform', msg)
end)