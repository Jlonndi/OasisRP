-------------------------------------
------- Created by Chief -------
------------------------------------- 

Config 						= {}

-- General Settings:
Config.ESXSHAREDOBJECT 	= "esx:getSharedObject"	-- Change your getshared object event here, in case you are using anti-cheat.
Config.HasItemLabel		= true					-- set to false if your ESX doesn't support item labels.
Config.T1GER_Insurance	= true					-- set to false if you don't own t1ger-insurance script.
Config.T1GER_Keys		= true					-- set to false if you don't own t1ger-keys script.

-- Police Settings:
Config.PoliceJobs 	= {"police", "bcso"}		-- Jobs that can't do bankrobberies etc, but can secure the banks.
Config.AllowPolice	= false						-- Set to false to disallow police doing scrapyard jobs.
Config.MinimumCops	= 0 						-- Set minimum required cops online to do jobs for scrapyard
-- Alert Blip
Config.AlertBlipShow = false			-- enable or disable blip on map on police notify
Config.AlertBlipTime = 20			-- miliseconds that blip is active on map (this value is multiplied with 4 in the script)
Config.AlertBlipRadius = 50.0		-- set radius of the police notify blip
Config.AlertBlipAlpha = 250			-- set alpha of the blip
Config.AlertBlipColor = 3			-- set blip color

-- Scrapyard Settings:
Config.NPC_SwitchMinutes 	= 1,440				-- set timer in minutes for when NPC switches location. (48 minutes is 24 hours in game time)
Config.CarListAmount		= 112					-- Adjust amount of cars on the list. 3 cars are default.
Config.UsePhoneMSG 			= true 			-- Enable to receive job msg through phone, disable to use ESX.ShowNotification or anything else you'd like.
Config.ScrapYardNPC 		= "Chief"		
Config.EnableCooldown		= false				-- Enable / disable cooldown feature
Config.CooldownTime 		= 5					-- Set cooldown time to wait before each scrapyard job
Config.AllowScrapOwnedVeh	= true				-- Enable / disable scrapping owned vehicles
Config.DeleteOwnedVehicles	= true				-- Enable/disable deleting owned vehicles (if t1ger-insurance = true and veh got insurance, then veh will be sent to impound)

-- Scrapyards:
Config.Scrapyard = {
	[1] = {
		NPC1 = { ped = 's_m_y_xmech_02_mp', name = "Chief", pos = {2346.81,3043.28,48.18,278.32}, scenario = "WORLD_HUMAN_AA_SMOKE" },
		NPC2 = {
			ped = 's_m_y_xmech_02_mp', name = "Chief",
			startPos = {2344.26,3036.57,48.15,289.75},
			endPos = {2348.37,3037.98,48.19,276.42},
			idleScenario = "WORLD_HUMAN_AA_SMOKE",
			workScenario = "WORLD_HUMAN_CLIPBOARD",
			timer = {walkToCar = 6, decidePrice = 4, walkBack = 5}
		},
		vehPos = {2351.12,3038.91,48.13},
		marker = {drawDist = 35.0, type = 27, scale = {x = 5.0, y = 5.0, z = 1.0}, color = {r = 240, g = 52, b = 52, a = 100}},
		blip = {enable = true, sprite = 280, color = 5, label = "Scrapyard", scale = 0.8},
	},
	--[[2] = {
		NPC1 = { ped = 's_m_y_xmech_02_mp', name = "Chief", pos = {483.88,-1311.32,29.22,274.01}, scenario = "WORLD_HUMAN_AA_SMOKE" },
		NPC2 = {
			ped = 's_m_y_xmech_02_mp', name = "Chief",
			startPos = {475.19,-1313.36,29.21,231.3},
			endPos = {478.35,-1316.21,29.2,238.97},
			idleScenario = "WORLD_HUMAN_AA_SMOKE",
			workScenario = "WORLD_HUMAN_CLIPBOARD",
			timer = {walkToCar = 4.5, decidePrice = 4, walkBack = 4.5}
		},
		vehPos = {481.05,-1317.67,29.2},
		marker = {drawDist = 35.0, type = 27, scale = {x = 5.0, y = 5.0, z = 1.0}, color = {r = 240, g = 52, b = 52, a = 100}},
		blip = {enable = true, sprite = 280, color = 5, label = "Scrapyard", scale = 0.8},
	}]]
}

-- Car List:
Config.CarListCars = {
	[1] = {label = "Liberty Walk BMW i8 Roadster", hash = -1476696782, price = 0},
	[2] = {label = "458Swap GT86", hash = 1057957495, price = 0},
	[3] = {label = "Bugatti Chiron Mansory Centuria", hash = 389821046, price = 0},
	[4] = {label = "Hyundai Sonata Turbo", hash = -1315675508, price = 0},
	[5] = {label = "Maybach S650", hash = -2049182041, price = 0},
	[6] = {label = "Gulasch Tow Truck", hash = -1735036962, price = 0},
	[7] = {label = "Hyundai Veloster N", hash = 1696740208, price = 0},
	[8] = {label = "McClaren 720S NLargo", hash = 44461989, price = 0},
	[9] = {label = "SDOT Silverado 1500", hash = 1987735581, price = 0},
	[10] = {label = "CAT Tow Truck", hash = -789617406, price = 0},
	[11] = {label = "BMW X5M", hash = -658586604, price = 0},
	[12] = {label = "Hyundai Sonata 1.6L", hash = -1619632315, price = 0},
	[13] = {label = "2021 Cadillac Ct5", hash = -2016538024, price = 0},
	[14] = {label = "Warthog", hash = 654202280, price = 0},
	[15] = {label = "Mansory Urus", hash = -184310767, price = 0},
	[16] = {label = "Hellaphant", hash = -1323690325, price = 0},
	[17] = {label = "2020 Audi R8", hash = -143695728, price = 0},
	[18] = {label = "Gallardo Liberty Walk", hash = 233884472, price = 0},
	[19] = {label = "Mansory Dawn", hash = -35871888, price = 0},
	[20] = {label = "Mercedes AMG-GTS", hash = -217995216, price = 0},
	[21] = {label = "Aston Martin DBS Superlegerra Topcar Spyder", hash = -1696979623, price = 0},
	[22] = {label = "2019 Porsche GT3RS", hash = -135309332, price = 0},
	[23] = {label = "2020 Porsche 911", hash = 962803572, price = 0},
	[24] = {label = "2017 Ford GT", hash = -2011325074, price = 0},
	[25] = {label = "2021 BMW M5 Competition X-Drive", hash = 1441804088, price = 0},
	[26] = {label = "Audi R8 Vorsteiner", hash = -121923718, price = 0},
	[27] = {label = "Audi RS7 Widebody", hash = -1647894488, price = 0},
	[28] = {label = "Bentley Bentayga STARTECH", hash = -1980604310, price = 0},
	[29] = {label = "Bentley Continental GT", hash = 898843282, price = 0},
	[30] = {label = "BMW M4 Convertiable", hash = -1790311237, price = 0},
	[31] = {label = "BMW M8 Competition", hash = 242156012, price = 0},
	[32] = {label = "BMW i8", hash = -1540353819, price = 0},	
	[33] = {label = "2017 Aston Martin DB11", hash = 765170133, price = 0},
	[34] = {label = "BMW X5 M Series", hash = -658586604, price = 0},
	[35] = {label = "Brabus G500 4x4", hash = 974390719, price = 0},
	[36] = {label = "Ferrari 458 Italia", hash = -635747987, price = 0},
	[37] = {label = "Ferrari F12 TDF", hash = 29976887, price = 0},	
	[38] = {label = "Koenigsegg Gemera", hash = 285057540, price = 0},	
	[39] = {label = "Lamborghini Gallardo Liberty Walk", hash = 233884472, price = 0},	
	[40] = {label = "Lamborghini Huracan Evo", hash = -1176538962, price = 0},
	[41] = {label = "Lamborghini LP750-4", hash = -1698677681, price = 0},
	[42] = {label = "Lamborghini Urus", hash = -520214134, price = 0},
	[43] = {label = "Mclaren 720s", hash = -1370111350, price = 0},	
	[44] = {label = "Mclaren MP412c", hash = -640306883, price = 0},	
	[45] = {label = "Mclaren Senna", hash = -433961724, price = 0},	
	[46] = {label = "Mercedes AMG C63s", hash = -863499820, price = 0},	
	[47] = {label = "Mercedes GT63 AMG", hash = -1073239791, price = 0},	
	[48] = {label = "Pagani Huayra Roadster", hash = -1135949905, price = 0},	
	[49] = {label = "Porsche CGT", hash = -1716760427, price = 0},	
	[50] = {label = "Range Rover Sport Startech", hash = 1993609528, price = 0},
	[51] = {label = "Rolls Royce Phantom", hash = 793261770, price = 0},
	[52] = {label = "BMW i8 RMod", hash = -1850735528, price = 0},
	[53] = {label = "Maserati Levante", hash = 468704959, price = 0},
	[54] = {label = "2020 Aston Martin Vantage", hash = -1067176722, price = 0},
	[55] = {label = "2010 Maserati Gran Turismo S", hash = 450852636, price = 0},
	[56] = {label = "Rolls Royce Cullinan", hash = 1640627795, price = 0},
	[57] = {label = "Rolls Royce Wraith", hash = -1095688294, price = 0},
	[58] = {label = "Maserati Ghibli", hash = -1125493898, price = 0},
	[59] = {label = "Maserati Quatroporte GTS", hash = -1056078084, price = 0},
	[60] = {label = "2018 Rofhartge MR 500", hash = 1770467389, price = 0},	
	[61] = {label = "Brabus A45", hash = -910466076, price = 0},	
	[62] = {label = "Mercedes S63 AMG Cabriolet", hash = -189485405, price = 0},	
	[63] = {label = "2020 Mercedes GLS", hash = -2083068063, price = 0},	
	[64] = {label = "2018 Range Rover Velar", hash = 542147885, price = 0},	
	[65] = {label = "Lamborghini Countach", hash = 812105156, price = 0},	
	[66] = {label = "Koenigsegg CCX", hash = 2102008873, price = 0},
	[67] = {label = "Nio", hash = 1072466081, price = 0},
	[68] = {label = "Mazda MX-5 Miata", hash = -1539291163, price = 0},
	[69] = {label = "Nissan Silvia S13", hash = 1476518781, price = 0},
	[70] = {label = "2013 Subaru BRZ", hash = 1411828323, price = 0},
	[71] = {label = "Toyota GT86", hash = -565536581, price = 0},
	[72] = {label = "2004 Subaru WRX STI", hash = -1298373790, price = 0},
	[73] = {label = "VW Golf R Rocket Bunny", hash = 2098317155, price = 0},
	[74] = {label = "Honda S2000", hash = -1549019518, price = 0},
	[75] = {label = "Mitsubishi Evo VI", hash = 818070263, price = 0},
	[76] = {label = "Lexus IS-350", hash = 761919778, price = 0},
	[77] = {label = "350Z Rocket Bunny", hash = 277535473, price = 0},
	[78] = {label = "Mitusbishi Evo X FQ-400", hash = 759625212, price = 0},
	[79] = {label = "2014 Q50 VIP Stanced", hash = 1582249670, price = 0},
	[80] = {label = "Toyota GT86 Liberty Walk", hash = -1044597983, price = 0},
	[81] = {label = "Nissan 370Z Pandem", hash = 995682231, price = 0},
	[82] = {label = "1998 Supra MKIV RHD", hash = 905399718, price = 0},
	[83] = {label = "BRZ Rocket Bunny", hash = 1458362510, price = 0},
	[84] = {label = "Mazda RX-7 FD RHD", hash = -1589129298, price = 0},
	[85] = {label = "Q60 Red Sport Project Black", hash = -36436459, price = 0},
	[86] = {label = "Mini Copper Liberty Walk", hash = 2038065870, price = 0},
	[87] = {label = "Nissan GTR-R35", hash = -980169995, price = 0},
	[88] = {label = "Honda S2000 CR", hash = -296051997, price = 0},
	[89] = {label = "Nissan Silvia S14 Drift", hash = 920402128, price = 0},
	[90] = {label = "200SX Mad FD", hash = 856483391, price = 0},
	[91] = {label = "Nissan GTR-R34 Skyline Widebody", hash = 1253410086, price = 0},
	[92] = {label = "Nissan GTR-R34 Skyline V Spec II", hash = 695412077, price = 0},
	[93] = {label = "Nissan GTR-R34 Skyline M-Spec", hash = -998964491, price = 0},
	[94] = {label = "Nissan R50 ItalDesign", hash = 1674460262, price = 0},
	[95] = {label = "RSX Type -S", hash = 364325782, price = 0},
	[96] = {label = "1987 Honda Civic EF 9 Stanced", hash = -134973038, price = 0},
	[97] = {label = "Can-Am Maverick X3", hash = -1337524170, price = 0},
	[98] = {label = "Can-Am Maverick X3 4 Seater", hash = -68008894, price = 0},
	[99] = {label = "Chevrolet Colorado Camper Cab", hash = 2057543555, price = 0},
	[100] = {label = "2018 Chevrolet Silverado 1500", hash = -1532567086, price = 0},
	[101] = {label = "2012 Chevrolet Silverado 1500 High Country", hash = -1046681959, price = 0},
	[102] = {label = "2020 Chevrolet Silverado Z71", hash = 180339400, price = 0},
	[103] = {label = "2012 Chevrolet Silverado 3500 High Country Dually", hash = 1218516106, price = 0},
	[104] = {label = "2006 Chevrolet Silverado 2500HD Work", hash = 318134088, price = 0},
	[105] = {label = "2016 Chevrolet Silverado 3500 High Country Duramax", hash = 816418593, price = 0},
	[106] = {label = "1997 K1500 Lifted", hash = 538688296, price = 0},
	[107] = {label = "1998 Chevrolet C1500", hash = -49815220, price = 0},
	[108] = {label = "Chevrolet Silverado High Country Bagged", hash = -1428136352, price = 0},
	[109] = {label = "Dodge Ram 2500 Lifted", hash = 163397662, price = 0},
	[110] = {label = "1992 Dodge Ram 250", hash = -858712856, price = 0},
	[111] = {label = "Lamborghini Veneno", hash = -42051018, price = 0},
	[112] = {label = "Roush Ford Mustang", hash = -1811173299, price = 0},

}


-- Materials:
Config.Materials = {
	[1] = {label = "Rubber", item = "rubber", chance = 100, amount = {min = 200, max = 400}},
	[2] = {label = "Scrap Metal", item = "scrap_metal", chance = 100, amount = {min = 450, max = 650}},
	[3] = {label = "Electric Scrap", item = "electric_scrap", chance = 100, amount = {min = 200, max = 400}},
	[4] = {label = "Plastic", item = "plastic", chance = 100, amount = {min = 200, max = 400}},
	[5] = {label = "Glass", item = "glass", chance = 100, amount = {min = 50, max = 100}},
	[6] = {label = "Aluminium", item = "aluminium", chance = 100, amount = {min = 200, max = 400}},
	[7] = {label = "Copper", item = "copper", chance = 100, amount = {min = 200, max = 400}},
	[8] = {label = "Steel", item = "steel", chance = 100, amount = {min = 200, max = 400}}
}


-- Reward Settings:
Config.EnableCashRewards 	= false		-- Enable/disable cash rewards.
Config.ReceiveDirtyCash 	= false		-- Set to false to receive normal cash.
Config.EnableItemRewards 	= true		-- Enable receiving item rewards upon scrapping.
Config.MaxItemsInReward		= 8			-- Maximum amount of items to receive, e.g. 3 means, rubber, glass, plastic. Setting to 5 means two more items.

-- Lockpick:
Config.UsableLockpick = {{
	item			= "lockpick",			-- Item name in database for usable item
	label			= "Lockpick",			-- Item name that is displayed in notifications etc
	timer 			= 10,					-- Lockpicking time in seconds
	alarm = {enable = true, time = 25}, 	-- Enable/Disable car clarm upon lockpicking & set alarm duration in seconds
	policeAlert		= false,					-- Enable/Disable police alert upon lockpicking
	anim_dict		= "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
	anim_name		= "machinic_loop_mechandplayer",
}}