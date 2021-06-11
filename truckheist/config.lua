-------------------------------------
------- Created by T1GER#9080 -------
------------------------------------- 

Config = {}

-- Police Settings:
Config.PoliceJobs = {"police", "ambulance", "bcso"}	-- Jobs that can't do criminal things etc.
Config.RequiredCops = 3					-- required police online for players to do jobs
Config.NotfiyCops = true				-- Notify Cops on blowing the truck
Config.AlertBlipShow = true				-- enable or disable blip on map on police notify
Config.AlertBlipTime = 30				-- miliseconds that blip is active on map (this value is multiplied with 4 in the script)
Config.AlertBlipRadius = 50.0			-- set radius of the police notify blip
Config.AlertBlipAlpha = 250			-- set alpha of the blip
Config.AlertBlipColor = 5				-- set blip color

Config.KeyToStartJob = 38

Config.JobFees = 12000			-- Amount of money to start a job
Config.UseBankMoney = false		-- Set to false to pay job fees with cash
Config.HackingBlocks = 3		-- amount of blocks u have to match
Config.HackingSeconds = 18		-- seconds to hack

Config.HackDataTimer = 10		-- time from pressed E to receving location on the truck
Config.DetonateTimer = 15			-- time until bomb is detonated
Config.RobTruckTimer = 50			-- time spent to rob the truck

Config.EnablePlayerMoneyBag = false   -- Enable or disable player wearing a 'heist money bag' after the robbery:

Config.CooldownTimer = 90		-- set cooldown time in minutes, before a player can start a job again

Config.HasItemLabel = true		-- set to false if your ESX vers. doesnt support item labels

Config.Reward = {min = 40000, max = 60000, dirty = true}
Config.ItemReward = {
	enable = true,
	items = {
		[1] = {item = 'goldbar', min = 4, max = 8, chance = 60},
		[2] = {item = 'dia_box', min = 4, max = 8, chance = 40},
	}
}

Config.JobSpot = {
	[1] = {
		pos = {2310.21,4885.19,41.81},
		heading = 31.43,
		blip = {enable = false, sprite = 47, display = 4, scale = 0.65, color = 5, name = "Truck Robbery Job"},
	},
}

Config.TruckSpawn = {
	[1] = {
		pos = {-1327.47,-86.04,49.31},
		inUse = false,
		security = {
			[1] = {ped = 's_m_m_security_01', seat = -1, weapon = 'WEAPON_PISTOL_MK2'},
			[2] = {ped = 's_m_m_security_01', seat = 0, weapon = 'WEAPON_ASSAULTSHOTGUN'},
			[3] = {ped = 's_m_m_security_01', seat = 1, weapon = 'WEAPON_CARBINERIFLE_MK2'},
			[4] = {ped = 's_m_m_security_01', seat = 2, weapon = 'WEAPON_ASSAULTSHOTGUN'},
		},
	},
	[2] = {
		pos = {-2075.88,-233.73,21.10},
		inUse = false,
		security = {
			[1] = {ped = 's_m_m_security_01', seat = -1, weapon = 'WEAPON_PISTOL_MK2'},
			[2] = {ped = 's_m_m_security_01', seat = 0, weapon = 'WEAPON_ASSAULTSHOTGUN'},
			[3] = {ped = 's_m_m_security_01', seat = 1, weapon = 'WEAPON_CARBINERIFLE_MK2'},
			[4] = {ped = 's_m_m_security_01', seat = 2, weapon = 'WEAPON_ASSAULTSHOTGUN'},
		},
	},
	[3] = {
		pos = {-972.17,-1530.90,4.89},
		inUse = false,
		security = {
			[1] = {ped = 's_m_m_security_01', seat = -1, weapon = 'WEAPON_PISTOL_MK2'},
			[2] = {ped = 's_m_m_security_01', seat = 0, weapon = 'WEAPON_ASSAULTSHOTGUN'},
			[3] = {ped = 's_m_m_security_01', seat = 1, weapon = 'WEAPON_CARBINERIFLE_MK2'},
			[4] = {ped = 's_m_m_security_01', seat = 2, weapon = 'WEAPON_ASSAULTSHOTGUN'},
		},
	},
	[4] = {
		pos = {798.18,-1799.81,29.33},
		inUse = false,
		security = {
			[1] = {ped = 's_m_m_security_01', seat = -1, weapon = 'WEAPON_PISTOL_MK2'},
			[2] = {ped = 's_m_m_security_01', seat = 0, weapon = 'WEAPON_ASSAULTSHOTGUN'},
			[3] = {ped = 's_m_m_security_01', seat = 1, weapon = 'WEAPON_CARBINERIFLE_MK2'},
			[4] = {ped = 's_m_m_security_01', seat = 2, weapon = 'WEAPON_ASSAULTSHOTGUN'},
		},
	},
	[5] = {
		pos = {456.96,-825.73,27.59},
		inUse = false,
		security = {
			[1] = {ped = 's_m_m_security_01', seat = -1, weapon = 'WEAPON_PISTOL_MK2'},
			[2] = {ped = 's_m_m_security_01', seat = 0, weapon = 'WEAPON_ASSAULTSHOTGUN'},
			[3] = {ped = 's_m_m_security_01', seat = 1, weapon = 'WEAPON_CARBINERIFLE_MK2'},
			[4] = {ped = 's_m_m_security_01', seat = 2, weapon = 'WEAPON_ASSAULTSHOTGUN'},
		},
	},
	[6] = {
		pos = {1247.07,-344.65,69.08},
		inUse = false,
		security = {
			[1] = {ped = 's_m_m_security_01', seat = -1, weapon = 'WEAPON_PISTOL_MK2'},
			[2] = {ped = 's_m_m_security_01', seat = 0, weapon = 'WEAPON_ASSAULTSHOTGUN'},
			[3] = {ped = 's_m_m_security_01', seat = 1, weapon = 'WEAPON_CARBINERIFLE_MK2'},
			[4] = {ped = 's_m_m_security_01', seat = 2, weapon = 'WEAPON_ASSAULTSHOTGUN'},
		},
	},
}
