-------------------------------------
------- Created by T1GER#9080 -------
------------------------------------- 

Config 						= {}

-- General Settings:
Config.ESXSHAREDOBJECT 	= "esx:getSharedObject"	-- Change your getshared object event here, in case you are using anti-cheat.
Config.HasItemLabel		= true					-- set to false if your ESX doesn't support item labels.
Config.T1GER_Insurance	= true					-- set to false if you don't own t1ger-insurance script.
Config.T1GER_Keys		= true					-- set to false if you don't own t1ger-keys script.

-- Police Settings:
Config.PoliceJobs 	= {"police", "bcso", "boling",}		-- Jobs that can't do bankrobberies etc, but can secure the banks.
Config.AllowPolice	= false						-- Set to false to disallow police doing scrapyard jobs.
Config.MinimumCops	= 0 						-- Set minimum required cops online to do jobs for scrapyard
-- Alert Blip
Config.AlertBlipShow = true			-- enable or disable blip on map on police notify
Config.AlertBlipTime = 20			-- miliseconds that blip is active on map (this value is multiplied with 4 in the script)
Config.AlertBlipRadius = 50.0		-- set radius of the police notify blip
Config.AlertBlipAlpha = 250			-- set alpha of the blip
Config.AlertBlipColor = 3			-- set blip color

-- Scrapyard Settings:
Config.NPC_SwitchMinutes 	= 120				-- set timer in minutes for when NPC switches location. (48 minutes is 24 hours in game time)
Config.CarListAmount		= 8					-- Adjust amount of cars on the list. 3 cars are default.
Config.UsePhoneMSG 			= true 			-- Enable to receive job msg through phone, disable to use ESX.ShowNotification or anything else you'd like.
Config.ScrapYardNPC 		= "Rod"		
Config.EnableCooldown		= true				-- Enable / disable cooldown feature
Config.CooldownTime 		= 3					-- Set cooldown time to wait before each scrapyard job
Config.AllowScrapOwnedVeh	= true				-- Enable / disable scrapping owned vehicles
Config.DeleteOwnedVehicles	= true				-- Enable/disable deleting owned vehicles (if t1ger-insurance = true and veh got insurance, then veh will be sent to impound)

-- Scrapyards:
Config.Scrapyard = {
	[1] = {
		NPC1 = { ped = 's_m_y_xmech_02_mp', name = "Bill", pos = {-469.42,-1718.28,18.69,281.9}, scenario = "WORLD_HUMAN_AA_SMOKE" },
		NPC2 = {
			ped = 's_m_y_xmech_02_mp', name = "Dom",
			startPos = {-465.77,-1707.58,18.8,252.19},
			endPos = {-459.98,-1712.81,18.67,240.04},
			idleScenario = "WORLD_HUMAN_AA_SMOKE",
			workScenario = "WORLD_HUMAN_CLIPBOARD",
			timer = {walkToCar = 6, decidePrice = 4, walkBack = 5}
		},
		vehPos = {-457.29,-1713.84,18.64},
		marker = {drawDist = 35.0, type = 27, scale = {x = 5.0, y = 5.0, z = 1.0}, color = {r = 240, g = 52, b = 52, a = 100}},
		blip = {enable = true, sprite = 280, color = 5, label = "Scrapyard", scale = 0.8},
	},
	[2] = {
		NPC1 = { ped = 's_m_y_xmech_02_mp', name = "Brian", pos = {483.88,-1311.32,29.22,274.01}, scenario = "WORLD_HUMAN_AA_SMOKE" },
		NPC2 = {
			ped = 's_m_y_xmech_02_mp', name = "Jerry",
			startPos = {475.19,-1313.36,29.21,231.3},
			endPos = {478.35,-1316.21,29.2,238.97},
			idleScenario = "WORLD_HUMAN_AA_SMOKE",
			workScenario = "WORLD_HUMAN_CLIPBOARD",
			timer = {walkToCar = 4.5, decidePrice = 4, walkBack = 4.5}
		},
		vehPos = {481.05,-1317.67,29.2},
		marker = {drawDist = 35.0, type = 27, scale = {x = 5.0, y = 5.0, z = 1.0}, color = {r = 240, g = 52, b = 52, a = 100}},
		blip = {enable = true, sprite = 280, color = 5, label = "Scrapyard", scale = 0.8},
	}

}

-- Car List:
Config.CarListCars = {
	[1] = {label = "Bollokan Prairie", hash = -1450650718, price = 450},
	[2] = {label = "Vulcar Ingot", hash = -1289722222, price = 350},
	[3] = {label = "Obey Tailgater", hash = -1008861746, price = 450},
	[4] = {label = "Pegassi Faggio", hash = -1842748181, price = 250},
	[5] = {label = "Dinka Jester", hash = -1297672541, price = 750},
	[6] = {label = "Vapid Slamvan", hash = 1119641113, price = 500},
	[7] = {label = "Weeny Issi", hash = -1177863319, price = 200},
	[8] = {label = "Cheval Picador", hash = 1507916787, price = 300},
	[9] = {label = "Vulcar Warrener", hash = 1373123368, price = 310},
	[10] = {label = "Albany Cavalcade", hash = -789894171, price = 250},
	[11] = {label = "Albany Washington", hash = 1777363799, price = 230},
	[12] = {label = "Ubermacht Oracle XS", hash = 1348744438, price = 295},
	[13] = {label = "Vapid Bobcat", hash = 1069929536, price = 500},
	[14] = {label = "Albany Emporer", hash = -685276541, price = 230},
	[15] = {label = "Vapid Benson", hash = 2053223216, price = 500},
	[16] = {label = "Brute Tipper II", hash = -947761570, price = 350},
	[17] = {label = "Karin Sultan", hash = 970598228, price = 350},
	[18] = {label = "Maibatsu Mule", hash = 904750859, price = 450},
	[19] = {label = "Liberty Walk BMW i8 Roadster", hash = -1476696782, price = 2750},
	[20] = {label = "458Swap GT86", hash = 1057957495, price = 5000},
	[21] = {label = "Aston Martin DBS Superlegerra Topcar Spyder", hash = -1696979623, price = 3500},
	[22] = {label = "Canis Mesa", hash = 914654722, price = 450},
	[23] = {label = "Bugatti Chiron Mansory Centuria", hash = 389821046, price = 4000},
	[24] = {label = "Hyundai Sonata Turbo", hash = -1315675508, price = 1000},
	[25] = {label = "Maybach S650", hash = -2049182041, price = 5000},
	[26] = {label = "Gulasch Tow Truck", hash = -1735036962, price = 400},
	[27] = {label = "Hyundai Veloster N", hash = 1696740208, price = 875},
	[28] = {label = "McClaren 720S NLargo", hash = 44461989, price = 7500},
	[29] = {label = "SDOT Silverado 1500", hash = 1987735581, price = 850},
	[30] = {label = "CAT Tow Truck", hash = -789617406, price = 950},
	[31] = {label = "BMW X5M", hash = -658586604, price = 1250},
	[32] = {label = "Hyundai Sonata 1.6L", hash = -1619632315, price = 450},
	[33] = {label = "2021 Cadillac Ct5", hash = -2016538024, price = 1100},
	[34] = {label = "Warthog", hash = 654202280, price = 5000},
	[35] = {label = "Mansory Urus", hash = -184310767, price = 5000},
	[36] = {label = "Hellaphant", hash = -1323690325, price = 3500},
	[37] = {label = "2020 Audi R8", hash = -143695728, price = 1250},
	[38] = {label = "Gallardo Liberty Walk", hash = 233884472, price = 1350},
	[39] = {label = "Mansory Dawn", hash = -35871888, price = 6000},
	[40] = {label = "Mercedes AMG-GTS", hash = -217995216, price = 1250},
	[41] = {label = "Declasse Torndao Drop", hash = 1531094468, price = 400},
	[42] = {label = "Imponte Ruiner ", hash = -1130810103, price = 420},
	[43] = {label = "Cheval Fugitive", hash = 1909141499, price = 500},
	[44] = {label = "Declasse Sabre-GT", hash = 1685021548, price = 400},
	[45] = {label = "Bravado Buffalo", hash = -304802106, price = 300},
	[46] = {label = "Mansory AMG-GTS", hash = 1909252846, price = 5000},
	[47] = {label = "Vapid Stanier", hash = -1477580979, price = 350},
	[48] = {label = "Declasse Tornado", hash = 464687292, price = 350},
	[49] = {label = "Albany Buccaneer", hash = -682211828, price = 350},
	[50] = {label = "Vapid Minivan", hash = -310465116, price = 350},
	[51] = {label = "Albany Manana", hash = -2124201592, price = 350},
	[52] = {label = "Fathom FQ2", hash = -1137532101, price = 350},
	[53] = {label = "Benefactor Glendale", hash = 75131841, price = 350},
	[54] = {label = "Dewbauchee Exemplar", hash = -5153954, price = 350},
	[55] = {label = "Declasse Premier", hash = -1883869285, price = 350},
	[56] = {label = "Ocelot F620", hash = -591610296, price = 350},
}

-- Materials:
Config.Materials = {
	[1] = {label = "Rubber", item = "rubber", chance = 40, amount = {min = 10, max = 40}},
	[2] = {label = "Scrap Metal", item = "scrap_metal", chance = 90, amount = {min = 70, max = 120}},
	[3] = {label = "Electric Scrap", item = "electric_scrap", chance = 50, amount = {min = 20, max = 70}},
	[4] = {label = "Plastic", item = "plastic", chance = 89, amount = {min = 40, max = 90}},
	[5] = {label = "Glass", item = "glass", chance = 35, amount = {min = 20, max = 55}},
	[6] = {label = "Aluminium", item = "aluminium", chance = 62, amount = {min = 10, max = 60}},
	[7] = {label = "Copper", item = "copper", chance = 45, amount = {min = 20, max = 40}},
	[8] = {label = "Steel", item = "steel", chance = 30, amount = {min = 10, max = 50}}
}

-- Reward Settings:
Config.EnableCashRewards 	= true		-- Enable/disable cash rewards.
Config.ReceiveDirtyCash 	= true		-- Set to false to receive normal cash.
Config.EnableItemRewards 	= true		-- Enable receiving item rewards upon scrapping.
Config.MaxItemsInReward		= 4			-- Maximum amount of items to receive, e.g. 3 means, rubber, glass, plastic. Setting to 5 means two more items.

-- Lockpick:
Config.UsableLockpick = {{
	item			= "lockpick",			-- Item name in database for usable item
	label			= "Lockpick",			-- Item name that is displayed in notifications etc
	timer 			= 10,					-- Lockpicking time in seconds
	alarm = {enable = true, time = 25}, 	-- Enable/Disable car clarm upon lockpicking & set alarm duration in seconds
	policeAlert		= true,					-- Enable/Disable police alert upon lockpicking
	anim_dict		= "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
	anim_name		= "machinic_loop_mechandplayer",
}}