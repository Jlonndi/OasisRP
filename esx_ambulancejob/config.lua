Config                            = {}

Config.DrawDistance               = 20.0

Config.Marker                     = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}

Config.ReviveReward               = 400  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = false -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'en'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 7 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 6 * minute -- Time til the player bleeds out

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = false
Config.RemoveItemsAfterRPDeath    = false

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 1000

Config.RespawnPoint = {coords = vector3(-444.57, -319.34, -130.88), heading = 32.55}

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(-435.84, -343.34, 34.91),
			sprite = 61,
			scale  = 1.0,
			color  = 1
		},

		AmbulanceActions = {
			vector3(-443.11, -311.47, 34.13)
		},

		Pharmacies = {
			vector3(-458.26, -310.10, 33.84)
		},

		Armory = {
			vector3(-437.72, -308.72, 34.13)
		},

		Vehicles = {
			{
				Spawner = vector3(-491.69, -336.52, -50.00), --zonah
				InsideShop = vector3(-491.69, -336.52, -50.00), --zonah
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = { -- all pillbox
					{ coords = vector3(-491.69, -336.52, -50.00), heading = 276.09, radius = 4.0 },
					{ coords = vector3(-491.69, -336.52, -50.00), heading = 268.06, radius = 4.0 },
					{ coords = vector3(-491.69, -336.52, -50.00), heading = 179.03, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(352.26, -578.21, 74.17),
				InsideShop = vector3(305.6, -1419.7, 41.5),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(350.86, -587.96, 74.17), heading = 142.7, radius = 10.0 }
				}
			}
		},

		FastTravels = {
			{
				From = vector3(-294.7, -1448.1, -29.0),
				To = { coords = vector3(272.8, -1358.8, 23.5), heading = 0.0 },
				Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, rotate = false }
			}
		},

		FastTravelsPrompt = {
			{
				From = vector3(-237.4, -1373.8, -26.0),
				To = { coords = vector3(-251.9, -1363.3, -38.5), heading = 0.0 },
				Marker = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, rotate = false },
				Prompt = _U('fast_travel')
			}
		}

	}
}

Config.AuthorizedVehicles = {

    recruit = {
		{ model = 'ambulance', label = 'Ambulance', price = 40 },
		{ model = 'alstahoe', label = 'Ambulance', price = 40 },
		{ model = 'Battalion1', label = 'Ambulance', price = 40 },
		{ model = 'Battalion2', label = 'Ambulance', price = 40 },
		{ model = 'Battalion3', label = 'Ambulance', price = 40 },
		{ model = 'Battalion4', label = 'Ambulance', price = 40 },
		{ model = '20ramambo', label = 'Ambulance', price = 40 },
		{ model = 'stretcher', label = 'Ambulance', price = 40 },
    },

	nurse = {
		{ model = 'ambulance', label = 'Ambulance', price = 40 },
		{ model = 'alstahoe', label = 'Ambulance', price = 40 },
		{ model = 'Battalion1', label = 'Ambulance', price = 40 },
		{ model = 'Battalion2', label = 'Ambulance', price = 40 },
		{ model = 'Battalion3', label = 'Ambulance', price = 40 },
		{ model = 'Battalion4', label = 'Ambulance', price = 40 },
		{ model = '20ramambo', label = 'Ambulance', price = 40 },
		{ model = 'stretcher', label = 'Ambulance', price = 40 },

	},

	paramedic = {
		{ model = 'ambulance', label = 'Ambulance', price = 40 },
		{ model = 'alstahoe', label = 'Ambulance', price = 40 },
		{ model = 'Battalion1', label = 'Ambulance', price = 40 },
		{ model = 'Battalion2', label = 'Ambulance', price = 40 },
		{ model = 'Battalion3', label = 'Ambulance', price = 40 },
		{ model = 'Battalion4', label = 'Ambulance', price = 40 },
		{ model = '20ramambo', label = 'Ambulance', price = 40 },
		{ model = 'stretcher', label = 'Ambulance', price = 40 },

	},

	supervisor = {
		{ model = 'ambulance', label = 'Ambulance', price = 40 },
		{ model = 'alstahoe', label = 'Ambulance', price = 40 },
		{ model = 'Battalion1', label = 'Ambulance', price = 40 },
		{ model = 'Battalion2', label = 'Ambulance', price = 40 },
		{ model = 'Battalion3', label = 'Ambulance', price = 40 },
		{ model = 'Battalion4', label = 'Ambulance', price = 40 },
		{ model = '20ramambo', label = 'Ambulance', price = 40 },
		{ model = 'stretcher', label = 'Ambulance', price = 40 },

	},

	chief = {
		{ model = 'ambulance', label = 'Ambulance', price = 40 },
		{ model = 'alstahoe', label = 'Ambulance', price = 40 },
		{ model = 'Battalion1', label = 'Ambulance', price = 40 },
		{ model = 'Battalion2', label = 'Ambulance', price = 40 },
		{ model = 'Battalion3', label = 'Ambulance', price = 40 },
		{ model = 'Battalion4', label = 'Ambulance', price = 40 },
		{ model = '20ramambo', label = 'Ambulance', price = 40 },
		{ model = 'stretcher', label = 'Ambulance', price = 40 },

	},

	boss = {
		{ model = 'ambulance', label = 'Ambulance', price = 40 },
		{ model = 'alstahoe', label = 'Ambulance', price = 40 },
		{ model = 'Battalion1', label = 'Ambulance', price = 40 },
		{ model = 'Battalion2', label = 'Ambulance', price = 40 },
		{ model = 'Battalion3', label = 'Ambulance', price = 40 },
		{ model = 'Battalion4', label = 'Ambulance', price = 40 },
		{ model = '20ramambo', label = 'Ambulance', price = 40 },
		{ model = 'stretcher', label = 'Ambulance', price = 40 },

	},

}

Config.AuthorizedWeapons = {
	recruit = {
		{weapon = 'WEAPON_SNSPISTOL', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_FLARE', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	nurse = {
		{weapon = 'WEAPON_SNSPISTOL', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_FLARE', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	paramedic = {
		{weapon = 'WEAPON_SNSPISTOL', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_FLARE', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	supervisor = {
		{weapon = 'WEAPON_SNSPISTOL', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_FLARE', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	chief = {
		{weapon = 'WEAPON_SNSPISTOL', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_FLARE', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	boss = {
		{weapon = 'WEAPON_SNSPISTOL', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_FLARE', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	}
}

Config.AuthorizedHelicopters = {

	recruit = {},

	nurse = {},

	paramedic = {},

	nurse = {},

	chief = {
		{
			model = 'medevac',
			label = 'MedeVac',
			price = 150000
		},

		{
			model = 'seasparrow',
			label = 'Sea Sparrow',
			price = 300000
		}
	},

	boss = {
		{
			model = 'medevac',
			label = 'MedeVac',
			price = 150000
		},

		{
			model = 'seasparrow',
			label = 'Sea Sparrow',
			price = 250000
		}
	}

}
