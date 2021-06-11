Config = {}


-- You can change min and max values here
Config.multipliers = {
	{name= "fInitialDriveForce", 	min= -100, 	max= 100, 	 value= 0},
	{name= "fDriveInertia", 		min= -100, 	max= 100,    value= 0},
	{name= "fDriveBiasFront", 		min= -100, 	max= 100,    value= 0},
	{name= "fBrakeForce", 			min= -100, 	max= 100,    value= 0},
	{name= "fBrakeBiasFront", 		min= -100, 	max= 100,    value= 0},
} 

Config.keys = {
	["hidespeeds"] = {
		key = 20, -- z
		name = "~INPUT_MULTIPLAYER_INFO~",
		text = "Hide/Show speeds"
	},
	["resetspeeds"] = {
		key = 73, -- x
		name = "~INPUT_VEH_DUCK~",
		text = "Reset speeds"
	},
	["close"] = {
		key = 194, -- Backspace
		name = "~INPUT_FRONTEND_RRIGHT~",
		text = "Close menu"
	},
	["nui"] = {
		key = 191, -- Enter
		name = "~INPUT_FRONTEND_RDOWN~",
		text = "Set Nuifocus"
	},
}


Config.useWheelMultipliers = true -- if false then ignore everything below this 



-- Here you can add multipliers depending on which wheel type vehicle is using
-- Example 
--[[
[4] = { -- off-road
		['fInitialDriveForce'] = 0.95,  -- Current (drive force) * 0.95, 
		["fTractionLossMult"] = 1.2, Current (Basically it affects how much grip is changed when driving on asphalt and mult) * 1.2
	  },
	
	Now if vehicle is using off-road tiers ->
	Vehicle has now have better grip on the terrain, but it loses power..

On this page, find out what changes you want to make depending on the type of tire that will come to your car --> https://gtamods.com/wiki/Handling.meta
]]
Config.tierMultipliers = {
	[0] = { -- sport
		['fInitialDriveForce'] = 1.1,
		["fTractionLossMult"] = 0.95,
		--["fBrakeForce"] = 0.98,
		--["fBrakeBiasFront"] = 0.5,
		--["fInitialDriveMaxFlatVel"] = 0.95,
	},
	[1] = { -- muscle
		['fInitialDriveForce'] = 1.0,
		["fTractionLossMult"] = 1.0,
	},
	[2] = { -- lowrider
		['fInitialDriveForce'] = 1.0,
		["fTractionLossMult"] = 1.0,
	},
	[3] = { -- suv
		['fInitialDriveForce'] = 1.0,
		["fTractionLossMult"] = 1.0,
	},
	[4] = { -- off-road
		['fInitialDriveForce'] = 0.95, 
		["fTractionLossMult"] = 1.2,
	},
	[5] = { -- tuning
		['fInitialDriveForce'] = 1.05,
		["fTractionLossMult"] = 0.98,
	},
	[6] = { -- motorcycle
		['fInitialDriveForce'] = 1.0,
		["fTractionLossMult"] = 1.0,
	},
	[7] = { -- super
		['fInitialDriveForce'] = 1.15,
		["fTractionLossMult"] = 0.9,
	},
}
