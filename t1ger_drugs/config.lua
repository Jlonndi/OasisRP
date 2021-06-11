-------------------------------------
------- Created by T1GER#9080 -------
------------------------------------- 

Config = {}

-- General Settings:
Config.ESXSHAREDOBJECT 	= "esx:getSharedObject"	-- Change your getshared object event here, in case you are using anti-cheat.
Config.HasItemLabel		= true					-- set to false if your ESX doesn't support item labels.

-- Police Settings:
Config.PoliceJobs = {"police", "ambulance"}	-- Jobs that can't do bankrobberies etc, but can secure the banks.
Config.PoliceAlerts	= true			-- enable police alerts upon lockpicking in drug job
Config.AlertBlipShow = true			-- enable or disable blip on map on police notify
Config.AlertBlipTime = 20			-- miliseconds that blip is active on map (this value is multiplied with 4 in the script)
Config.AlertBlipRadius = 50.0		-- set radius of the police notify blip
Config.AlertBlipAlpha = 250			-- set alpha of the blip
Config.AlertBlipColor = 3			-- set blip color

-- General Job Settings:
Config.DrugJob_Item 		= "drugItem"		-- item (USB) to start jobs
--Config.RequiredCopsForJob 	= 3					-- set amount of cops required to start jobs.
Config.RequiredCopsForJob 	= 3	
Config.AllowCopsToDoJobs 	= false				-- set to true to allow police doing jobs.
Config.UsePhoneMSG 			= false 			-- Enable to receive job msg through phone, disable to use ESX.ShowNotification or anything else you'd like.
Config.mHacking 			= {enable = true, blocks = 3, time = 18}
Config.PayJobFeesWithCash 	= true			-- set to false to pay with bank money
Config.EnableCooldown		= true				-- Enable / disable cooldown feature
Config.CooldownTime 		= 1					-- Set cooldown time to wait before each drug jobs
Config.USB_CorruptChance	= 50				-- set chance in % for USB to corrupt after usage.
Config.EnableHeadshotKills 	= true 			-- Enable/Disable whether a player can headshot kill an NPC in one shot.
Config.EnableVehicleAlarm	= true				-- Enable/Disable vehicle clarm upon lockpicking 
Config.VehicleAlarmTime		= 25				-- Set duration of vehicle alarm upon lockpicking, in seconds.
Config.LockpickTime			= 25					-- Set duration of lockpicking, in seconds.

-- Drug USB Menu:
Config.DrugMenu = {
	[1] = {drug = 'cokebrick', label = 'Coke', enable = true, job_fees = 15000, reward = {min = 2, max = 4}},
	[2] = {drug = 'methbrick', label = 'Meth', enable = true, job_fees = 12000, reward = {min = 2, max = 4}},
	[3] = {drug = 'weedbrick', label = 'Weed', enable = true, job_fees = 11000, reward = {min = 3, max = 6}},
	[4] = {drug = 'hackingphone', label = 'Blackberry', enable = true, job_fees = 20000, reward = {min = 1, max = 1}},
}

-- Drug Jobs:
Config.DrugJobs = {
	[1] = {
		pos = {1218.84,-3002.0,5.15,134.59},
		inUse = false, veh_spawned = false, goons_spawned = false, player = false,
		goons = {
			[1] = {pos = {1227.49,-3003.93,9.32,124.05}, ped = 'G_M_Y_Lost_02', anim = {dict = 'amb@world_human_cop_idles@female@base', lib = 'base'}, weapon = 'WEAPON_ASSAULTRIFLE', armour = 100, accuracy = 75 },
			[2] = {pos = {1227.03,-2981.90,9.32,146.2}, ped = 'G_M_Y_MexGang_01', anim = {dict = 'rcmme_amanda1', lib = 'stand_loop_cop'}, weapon = 'WEAPON_ASSAULTRIFLE', armour = 100, accuracy = 75 },
			[3] = {pos = {1229.51,-2921.45,17.33,110.7}, ped = 'G_M_Y_SalvaBoss_01', anim = {dict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base', lib = 'base'}, weapon = 'WEAPON_ASSAULTRIFLE', armour = 100, accuracy = 80 },
			[4] = {pos = {1229.42,-3024.94,9.34,57.6}, ped = 'G_M_Y_Lost_02', anim = {dict = 'amb@world_human_cop_idles@female@base', lib = 'base'}, weapon = 'WEAPON_SAWNOFFSHOTGUN', armour = 100, accuracy = 70 },
			[5] = {pos = {1220.92,-3004.79,5.87,90.0}, ped = 'G_M_Y_MexGang_01', anim = {dict = 'rcmme_amanda1', lib = 'stand_loop_cop'}, weapon = 'WEAPON_PISTOL', armour = 100, accuracy = 70 },
			[6] = {pos = {1221.84,-2989.22,5.87,101.9}, ped = 'G_M_Y_SalvaBoss_01', anim = {dict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base', lib = 'base'}, weapon = 'WEAPON_PISTOL', armour = 100, accuracy = 70 },
			[7] = {pos = {1163.27,-3015.09,15.97,281.6}, ped = 'G_M_Y_Lost_02', anim = {dict = 'amb@world_human_cop_idles@female@base', lib = 'base'}, weapon = 'WEAPON_PUMPSHOTGUN', armour = 100, accuracy = 80 },
			[8] = {pos = {1222.01,-3034.67,5.87,32.7}, ped = 'G_M_Y_MexGang_01', anim = {dict = 'rcmme_amanda1', lib = 'stand_loop_cop'}, weapon = 'WEAPON_PISTOL', armour = 100, accuracy = 70 },
			[9] = {pos = {1214.04,-2952.24,5.87,121.7}, ped = 'G_M_Y_SalvaBoss_01', anim = {dict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base', lib = 'base'}, weapon = 'WEAPON_PISTOL', armour = 100, accuracy = 70 },
			[10] = {pos = {1179.71,-2972.33,5.90,61.9}, ped = 'G_M_Y_Lost_02', anim = {dict = 'amb@world_human_cop_idles@female@base', lib = 'base'}, weapon = 'WEAPON_PISTOL', armour = 100, accuracy = 70 },
			[11] = {pos = {1135.30,-2978.84,5.90,177.29}, ped = 'G_M_Y_MexGang_01', anim = {dict = 'rcmme_amanda1', lib = 'stand_loop_cop'}, weapon = 'WEAPON_PUMPSHOTGUN', armour = 100, accuracy = 80 },
			[12] = {pos = {1182.03,-2996.75,8.71,99.09}, ped = 'G_M_Y_SalvaBoss_01', anim = {dict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base', lib = 'base'}, weapon = 'WEAPON_ASSAULTRIFLE', armour = 100, accuracy = 70 },
			[13] = {pos = {1163.24,-3024.03,5.90,256.82}, ped = 'G_M_Y_Lost_02', anim = {dict = 'amb@world_human_cop_idles@female@base', lib = 'base'}, weapon = 'WEAPON_PUMPSHOTGUN', armour = 100, accuracy = 70 },
			--[14] = {pos = {-278.81,6313.05,35.17,357.04}, ped = 'G_M_Y_MexGang_01', anim = {dict = 'rcmme_amanda1', lib = 'stand_loop_cop'}, weapon = 'WEAPON_PISTOL', armour = 100, accuracy = 60 },
			--[15] = {pos = {-284.89,6307.96,35.17,110.27}, ped = 'G_M_Y_SalvaBoss_01', anim = {dict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base', lib = 'base'}, weapon = 'WEAPON_PISTOL', armour = 100, accuracy = 60 },
		},
		lockpick = {1219.47,-3003.14,5.87,5.87},
		blip = {sprite = 1, color = 5, scale = 0.65, label = "Daisy Lee", route = true},
	},
	[2] = {
		pos = {-775.63,-1463.11,4.48,331.84},
		inUse = false, veh_spawned = false, goons_spawned = false, player = false,
		goons = {
			[1] = {pos = {-785.35,-1454.66,5.00,296.26}, ped = 'G_M_Y_Lost_02', anim = {dict = 'amb@world_human_cop_idles@female@base', lib = 'base'}, weapon = 'WEAPON_PUMPSHOTGUN', armour = 100, accuracy = 80 },
			[2] = {pos = {-781.33,-1463.74,5.00,97.69}, ped = 'G_M_Y_MexGang_01', anim = {dict = 'rcmme_amanda1', lib = 'stand_loop_cop'}, weapon = 'WEAPON_PISTOL', armour = 100, accuracy = 70 },
			[3] = {pos = {-764.40,-1468.61,5.00,45.87}, ped = 'G_M_Y_SalvaBoss_01', anim = {dict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base', lib = 'base'}, weapon = 'WEAPON_PISTOL', armour = 100, accuracy = 70 },
			[4] = {pos = {-754.37,-1507.93,5.01,347.89}, ped = 'G_M_Y_Lost_02', anim = {dict = 'amb@world_human_cop_idles@female@base', lib = 'base'}, weapon = 'WEAPON_ASSAULTRIFLE', armour = 100, accuracy = 70 },
			[5] = {pos = {-735.44,-1502.17,5.00,23.15}, ped = 'G_M_Y_MexGang_01', anim = {dict = 'rcmme_amanda1', lib = 'stand_loop_cop'}, weapon = 'WEAPON_PISTOL', armour = 100, accuracy = 70 },
			[6] = {pos = {-730.08,-1500.34,5.00,5.84}, ped = 'G_M_Y_SalvaBoss_01', anim = {dict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base', lib = 'base'}, weapon = 'WEAPON_PISTOL', armour = 100, accuracy = 60 },
			[7] = {pos = {-707.39,-1416.76,5.00,13.51}, ped = 'G_M_Y_Lost_02', anim = {dict = 'amb@world_human_cop_idles@female@base', lib = 'base'}, weapon = 'WEAPON_PISTOL', armour = 100, accuracy = 70 },
			[8] = {pos = {-698.48,-1424.61,5.00,27.72}, ped = 'G_M_Y_MexGang_01', anim = {dict = 'rcmme_amanda1', lib = 'stand_loop_cop'}, weapon = 'WEAPON_PISTOL', armour = 100, accuracy = 70 },
			[9] = {pos = {-731.16,-1511.29,13.71,316.63}, ped = 'G_M_Y_SalvaBoss_01', anim = {dict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base', lib = 'base'}, weapon = 'WEAPON_ASSAULTRIFLE', armour = 100, accuracy = 80 },
			[10] = {pos = {-681.17,-1458.02,5.15,131.00}, ped = 'G_M_Y_Lost_02', anim = {dict = 'amb@world_human_cop_idles@female@base', lib = 'base'}, weapon = 'WEAPON_ASSAULTRIFLE', armour = 100, accuracy = 80 },
			[11] = {pos = {-697.45,-1400.88,5.15,145.59}, ped = 'G_M_Y_MexGang_01', anim = {dict = 'rcmme_amanda1', lib = 'stand_loop_cop'}, weapon = 'WEAPON_ASSAULTRIFLE', armour = 100, accuracy = 80 },
			--[[12] = {pos = {442.05,6461.47,28.73,45.69}, ped = 'G_M_Y_SalvaBoss_01', anim = {dict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base', lib = 'base'}, weapon = 'WEAPON_PISTOL', armour = 100, accuracy = 60 },
			[13] = {pos = {430.18,6460.15,28.76,33.52}, ped = 'G_M_Y_Lost_02', anim = {dict = 'amb@world_human_cop_idles@female@base', lib = 'base'}, weapon = 'WEAPON_PISTOL', armour = 100, accuracy = 60 },
			[14] = {pos = {437.35,6460.34,35.87,43.99}, ped = 'G_M_Y_MexGang_01', anim = {dict = 'rcmme_amanda1', lib = 'stand_loop_cop'}, weapon = 'WEAPON_PISTOL', armour = 100, accuracy = 60 },
			[15] = {pos = {439.02,6462.31,35.87,58.93}, ped = 'G_M_Y_SalvaBoss_01', anim = {dict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base', lib = 'base'}, weapon = 'WEAPON_PISTOL', armour = 100, accuracy = 60 },]]
		},
		lockpick = {-776.77,-1462.42,5.00,244.79},
		blip = {sprite = 1, color = 5, scale = 0.65, label = "Heliport", route = true},
	},
	[3] = {
		pos = {728.47,-1510.84,19.45,339.84},
		inUse = false, veh_spawned = false, goons_spawned = false, player = false,
		goons = {
			[1] = {pos = {732.12,-1534.11,20.15,153.25}, ped = 'G_M_Y_Lost_02', anim = {dict = 'amb@world_human_cop_idles@female@base', lib = 'base'}, weapon = 'WEAPON_PUMPSHOTGUN', armour = 100, accuracy = 80 },
			[2] = {pos = {725.66,-1532.65,19.79,111.84}, ped = 'G_M_Y_MexGang_01', anim = {dict = 'rcmme_amanda1', lib = 'stand_loop_cop'}, weapon = 'WEAPON_PISTOL', armour = 100, accuracy = 70 },
			[3] = {pos = {717.72,-1507.77,19.80,101.50}, ped = 'G_M_Y_SalvaBoss_01', anim = {dict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base', lib = 'base'}, weapon = 'WEAPON_PISTOL', armour = 100, accuracy = 60 },
			[4] = {pos = {730.37,-1510.53,19.79,341.30}, ped = 'G_M_Y_Lost_02', anim = {dict = 'amb@world_human_cop_idles@female@base', lib = 'base'}, weapon = 'WEAPON_ASSAULTRIFLE', armour = 100, accuracy = 60 },
			[5] = {pos = {724.24,-1508.27,22.78,333.29}, ped = 'G_M_Y_MexGang_01', anim = {dict = 'rcmme_amanda1', lib = 'stand_loop_cop'}, weapon = 'WEAPON_ASSAULTRIFLE', armour = 100, accuracy = 60 },
			[6] = {pos = {746.52,-1520.29,20.16,23.14}, ped = 'G_M_Y_SalvaBoss_01', anim = {dict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base', lib = 'base'}, weapon = 'WEAPON_PUMPSHOTGUN', armour = 100, accuracy = 60 },
			[7] = {pos = {740.51,-1501.97,20.31,80.41}, ped = 'G_M_Y_Lost_02', anim = {dict = 'amb@world_human_cop_idles@female@base', lib = 'base'}, weapon = 'WEAPON_PISTOL', armour = 100, accuracy = 60 },
			[8] = {pos = {777.35,-1502.59,20.49,2.94}, ped = 'G_M_Y_MexGang_01', anim = {dict = 'rcmme_amanda1', lib = 'stand_loop_cop'}, weapon = 'WEAPON_ASSAULTRIFLE', armour = 100, accuracy = 80 },
			[9] = {pos = {790.29,-1488.29,20.15,28.03}, ped = 'G_M_Y_SalvaBoss_01', anim = {dict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base', lib = 'base'}, weapon = 'WEAPON_PISTOL', armour = 100, accuracy = 75 },
			[10] = {pos = {805.62,-1574.47,20.73,36.20}, ped = 'G_M_Y_Lost_02', anim = {dict = 'amb@world_human_cop_idles@female@base', lib = 'base'}, weapon = 'WEAPON_PISTOL', armour = 100, accuracy = 90 },
			[11] = {pos = {797.08,-1579.82,20.70,32.32}, ped = 'G_M_Y_MexGang_01', anim = {dict = 'rcmme_amanda1', lib = 'stand_loop_cop'}, weapon = 'WEAPON_PISTOL', armour = 100, accuracy = 90 },
			--[[12] = {pos = {442.05,6461.47,28.73,45.69}, ped = 'G_M_Y_SalvaBoss_01', anim = {dict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base', lib = 'base'}, weapon = 'WEAPON_PISTOL', armour = 100, accuracy = 60 },
			[13] = {pos = {430.18,6460.15,28.76,33.52}, ped = 'G_M_Y_Lost_02', anim = {dict = 'amb@world_human_cop_idles@female@base', lib = 'base'}, weapon = 'WEAPON_PISTOL', armour = 100, accuracy = 60 },
			[14] = {pos = {437.35,6460.34,35.87,43.99}, ped = 'G_M_Y_MexGang_01', anim = {dict = 'rcmme_amanda1', lib = 'stand_loop_cop'}, weapon = 'WEAPON_PISTOL', armour = 100, accuracy = 60 },
			[15] = {pos = {439.02,6462.31,35.87,58.93}, ped = 'G_M_Y_SalvaBoss_01', anim = {dict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base', lib = 'base'}, weapon = 'WEAPON_PISTOL', armour = 100, accuracy = 60 },]]
		},
		lockpick = {727.12,-1510.32,19.77,244.44},
		blip = {sprite = 1, color = 5, scale = 0.65, label = "Canals", route = true},
	},
}

-- Job Vehicles Randomizer:
Config.JobVehicles = {'pony', 'mb250', 'honody',}

-- Delivery Config:
Config.Delivery = {
	[1] = {
		pos = {2132.45,4779.66,40.45},
		marker = {drawDist = 10.0, type = 27, scale = {x = 3.0, y = 3.0, z = 1.0}, color = {r = 240, g = 52, b = 52, a = 100}},
		blip = {sprite = 1, color = 5, label = "Grapeseed Airfield", scale = 0.75, route = true}
	},
	[2] = {
		pos = {3805.13,4460.59,4.02},
		marker = {drawDist = 10.0, type = 27, scale = {x = 3.0, y = 3.0, z = 1.0}, color = {r = 240, g = 52, b = 52, a = 100}},
		blip = {sprite = 1, color = 5, label = "Lighthouse Dock", scale = 0.75, route = true}
	},
	[3] = {
		pos = {45.55,6300.17,30.17},
		marker = {drawDist = 10.0, type = 27, scale = {x = 3.0, y = 3.0, z = 1.0}, color = {r = 240, g = 52, b = 52, a = 100}},
		blip = {sprite = 1, color = 5, label = "Chicken Plant", scale = 0.75, route = true}
	},
}

-- ## DRUG SALE ## --
Config.BlackListedPeds = {"s_m_y_cop_01", "s_m_y_dealer_01", "mp_m_shopkeep_01"}
Config.Sell_Chance = 50					-- set chance in % for successfull sale. 70 means 70% success.
Config.CallCopsChance = 70				-- set chance in % for NPC to call cops on failed sale. 
Config.MinCopsOnlineToSell = 2			-- set min amount of cops online to sell, otherwise draw text will not appear on NPC's.
Config.DrugSaleCooldown = 10				-- Cooldown between each drug sale in seconds.
Config.SellDrugsTimer	= 7				-- time taken to negotiate with NPC in seconds
Config.MaxSellCap = 0					-- max amount of drugs to be sold per server restart per player, to disable set to 0.
Config.ReceiveDirtyCash = true			-- true = dirty cash (black_money) | false = normal cash
Config.SellableDrugs = {"coke1g", "meth1g", "weed4g"}
Config.SaleSettings = {
	['coke1g'] = {
		price = {min = 150, max = 190},
		cops_multiplier = {enable = true, count = 0, value = 10},
		sell_amount = { [1] = {min = 1, max = 1}, [2] = {min = 1, max = 2}, [3] = {min = 1, max = 3}, [4] = {min = 1, max = 4}, [5] = {min = 3, max = 5} }
	},
	['meth1g'] = {
		price = {min = 135, max = 150},
		cops_multiplier = {enable = true, count = 0, value = 10},
		sell_amount = { [1] = {min = 1, max = 1}, [2] = {min = 1, max = 2}, [3] = {min = 1, max = 3}, [4] = {min = 1, max = 4}, [5] = {min = 3, max = 5} }
	},
	['weed4g'] = {
		price = {min = 95, max = 130},
		cops_multiplier = {enable = true, count = 0, value = 10},
		sell_amount = { [1] = {min = 1, max = 1}, [2] = {min = 1, max = 2}, [3] = {min = 1, max = 3}, [4] = {min = 1, max = 4}, [5] = {min = 3, max = 5} }
	},
}

-- Conversion Settings:
Config.DrugEffects = {
	{ 
		UsableItem 				= "coke1g",						-- item name in database for usable item
		ProgressBarText			= "Snorting Nose Candy",		-- progress bar text
		UsableTime 				= 5000,							-- Smoking time in MS
		EffectDuration 			= 20,							-- Duration for effect in seconds
		FasterSprint 			= true,							-- Enable or disable faster sprint while on drugs
		SprintValue 			= 1.5,							-- 1.0 is default
		MotionBlur 				= true,							-- Enable or disable motion blur while on drugs
		TimeCycleModifier		= true,							-- Enable or disable time cycle modifer while on drugs
		TimeCycleModifierType	= "spectator5",					-- Set type of time cycle modificer, see full list here: https://pastebin.com/kVPwMemE 
		UnlimitedStamina		= false,							-- Apply unlimited stamina while on drugs 
		BodyArmor				= true,						-- Apply Body Armor when taking drugs
		AddArmorValue			= 25,							-- Set value for body armor thats going to be added
		PlayerHealth			= false,						-- Apply health to player when taking drugs
		AddHealthValue			= 5,							-- Set value for player health thats going to be added
	},
	{ 
		UsableItem 				= "meth1g",						-- item name in database for usable item
		ProgressBarText			= "Making bad decisions",				-- progress bar text
		UsableTime 				= 5000,							-- item name in database for usable item
		EffectDuration 			= 35,							-- Duration for effect in seconds
		FasterSprint 			= true,						-- Enable or disable faster sprint while on drugs
		SprintValue 			= 2,							-- 1.0 is default
		MotionBlur 				= true,							-- Enable or disable motion blur while on drugs
		TimeCycleModifier		= true,							-- Enable or disable time cycle modifer while on drugs
		TimeCycleModifierType	= "spectator5",					-- Set type of time cycle modificer, see full list here: https://pastebin.com/kVPwMemE 
		UnlimitedStamina		= true,						-- Apply unlimited stamina while on drugs 
		BodyArmor				= false,						-- Apply Body Armor when taking drugs
		AddArmorValue			= 15,							-- Set value for body armor thats going to be added
		PlayerHealth			= true,							-- Apply health to player when taking drugs
		AddHealthValue			= 10,							-- Set value for player health thats going to be added
	},
	{ 
		UsableItem 				= "joint2g",					-- item name in database for usable item
		ProgressBarText			= "SMOKING JOINT",				-- progress bar text
		UsableTime 				= 2000,							-- item name in database for usable item
		EffectDuration 			= 30,							-- Duration for effect in seconds
		FasterSprint 			= true,						-- Enable or disable faster sprint while on drugs
		SprintValue 			= 0.5,							-- 1.0 is default
		MotionBlur 				= true,							-- Enable or disable motion blur while on drugs
		TimeCycleModifier		= true,							-- Enable or disable time cycle modifer while on drugs
		TimeCycleModifierType	= "spectator5",					-- Set type of time cycle modificer, see full list here: https://pastebin.com/kVPwMemE 
		UnlimitedStamina		= false,						-- Apply unlimited stamina while on drugs 
		BodyArmor				= false,							-- Apply Body Armor when taking drugs
		AddArmorValue			= 5,							-- Set value for body armor thats going to be added
		PlayerHealth			= true,						-- Apply health to player when taking drugs
		AddHealthValue			= 25,							-- Set value for player health thats going to be added
	}
}

-- Conversion Settings:
Config.DrugConversion = {
	{ 
		UsableItem 				= "cokebrick",					-- item name in database for usable item
		RewardItem 				= "coke10g",					-- item name in database for required item
		RewardAmount 			= {a = 6, b = 10},				-- Amount of RewardItem player receives. "a" is without scale and "b" is with scale
		MaxRewardItemInv		= {e = 44, f = 40},				-- Amount of RewardItem player can hold in inventory. "e" is without scale and "f" is with scale
		RequiredItem 			= "drugbags",					-- item name in database for required item
		RequiredItemAmount 		= {c = 6, d = 10},				-- Amount of RequiredItem for conversion. "c" is without scale and "d" is with scale
		HighQualityScale		= true,							-- enable/disable scale feature for the drugType
		hqscale					= "hqscale",					-- item name in database for hiqh quality scale item
		ProgressBarText			= "Breaking it down",		-- progress bar text
		ConversionTime			= 5000,							-- set conversion time in MS.
	},
	{ 
		UsableItem 				= "methbrick",					-- item name in database for usable item
		RewardItem 				= "meth10g",					-- item name in database for required item
		RewardAmount 			= {a = 6, b = 10},				-- Amount of RewardItem player receives. "a" is without scale and "b" is with scale
		MaxRewardItemInv		= {e = 44, f = 40},				-- Amount of RewardItem player can hold in inventory. "e" is without scale and "f" is with scale
		RequiredItem 			= "drugbags",					-- item name in database for required item
		RequiredItemAmount 		= {c = 6, d = 10},				-- Amount of RequiredItem for conversion. "c" is without scale and "d" is with scale
		HighQualityScale		= true,							-- enable/disable scale feature for the drugType
		hqscale					= "hqscale",					-- item name in database for hiqh quality scale item
		ProgressBarText			= "Where's Jesse Pinkman?",		-- progress bar text
		ConversionTime			= 5000,							-- set conversion time in MS.
	},
	{ 
		UsableItem 				= "weedbrick",					-- item name in database for usable item
		RewardItem 				= "weed20g",					-- item name in database for required item
		RewardAmount 			= {a = 8, b = 10},				-- Amount of RewardItem player receives. "a" is without scale and "b" is with scale
		MaxRewardItemInv		= {e = 44, f = 40},				-- Amount of RewardItem player can hold in inventory. "e" is without scale and "f" is with scale
		RequiredItem 			= "drugbags",					-- item name in database for required item
		RequiredItemAmount 		= {c = 8, d = 10},				-- Amount of RequiredItem for conversion. "c" is without scale and "d" is with scale
		HighQualityScale		= true,							-- enable/disable scale feature for the drugType
		hqscale					= "hqscale",					-- item name in database for hiqh quality scale item
		ProgressBarText			= "Break it down",		-- progress bar text
		ConversionTime			= 5000,							-- set conversion time in MS.
	},
	{ 
		UsableItem 				= "coke10g",					-- item name in database for usable item
		RewardItem 				= "coke1g",						-- item name in database for required item
		RewardAmount 			= {a = 6, b = 10},				-- Amount of RewardItem player receives. "a" is without scale and "b" is with scale
		MaxRewardItemInv		= {e = 44, f = 40},				-- Amount of RewardItem player can hold in inventory. "e" is without scale and "f" is with scale
		RequiredItem 			= "drugbags",					-- item name in database for required item
		RequiredItemAmount 		= {c = 6, d = 10},				-- Amount of RequiredItem for conversion. "c" is without scale and "d" is with scale
		HighQualityScale		= true,							-- enable/disable scale feature for the drugType
		hqscale					= "hqscale",					-- item name in database for hiqh quality scale item
		ProgressBarText			= "This sugar, Officer",			-- progress bar text
		ConversionTime			= 5000,							-- set conversion time in MS.
	},
	{ 
		UsableItem 				= "meth10g",					-- item name in database for usable item
		RewardItem 				= "meth1g",						-- item name in database for required item
		RewardAmount 			= {a = 6, b = 10},				-- Amount of RewardItem player receives. "a" is without scale and "b" is with scale
		MaxRewardItemInv		= {e = 44, f = 40},				-- Amount of RewardItem player can hold in inventory. "e" is without scale and "f" is with scale
		RequiredItem 			= "drugbags",					-- item name in database for required item
		RequiredItemAmount 		= {c = 6, d = 10},				-- Amount of RequiredItem for conversion. "c" is without scale and "d" is with scale
		HighQualityScale		= true,							-- enable/disable scale feature for the drugType
		hqscale					= "hqscale",					-- item name in database for hiqh quality scale item
		ProgressBarText			= "Why am I like this",			-- progress bar text
		ConversionTime			= 5000,							-- set conversion time in MS.
	},
	{ 
		UsableItem 				= "weed20g",					-- item name in database for usable item
		RewardItem 				= "weed4g",						-- item name in database for required item
		RewardAmount 			= {a = 4, b = 5},				-- Amount of RewardItem player receives. "a" is without scale and "b" is with scale
		MaxRewardItemInv		= {e = 46, f = 45},				-- Amount of RewardItem player can hold in inventory. "e" is without scale and "f" is with scale
		RequiredItem 			= "drugbags",					-- item name in database for required item
		RequiredItemAmount 		= {c = 4, d = 5},				-- Amount of RequiredItem for conversion. "c" is without scale and "d" is with scale
		HighQualityScale		= true,							-- enable/disable scale feature for the drugType
		hqscale					= "hqscale",					-- item name in database for hiqh quality scale item
		ProgressBarText			= "Bag it up",			-- progress bar text
		ConversionTime			= 5000,							-- set conversion time in MS.
	},
	{ 
		UsableItem 				= "weed4g",						-- item name in database for usable item
		RewardItem 				= "joint2g",					-- item name in database for required item
		RewardAmount 			= 2,							-- Amount of RewardItem player receives
		MaxRewardItemInv		= {e = 44, f = 40},				-- Amount of RewardItem player can hold in inventory. "e" is without scale and "f" is with scale
		RequiredItem 			= "rolpaper",					-- item name in database for required item
		RequiredItemAmount 		= 2,							-- Amount of RequiredItem for conversion
		HighQualityScale		= false,						-- enable/disable scale feature for the drugType
		hqscale					= "hqscale",					-- item name in database for hiqh quality scale item
		ProgressBarText			= "Rolling Loud",			-- progress bar text
		ConversionTime			= 5000,							-- set conversion time in MS.
	}
}

