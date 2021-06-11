Config                            = {}

Config.DrawDistance               = 10.0 -- How close do you need to be for the markers to be drawn (in GTA units).
Config.MarkerType                 = {Cloakrooms = 20, Armories = 21, BossActions = 22, Vehicles = 36, Helicopters = 34}
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 50, g = 50, b = 204}

Config.EnablePlayerManagement     = true -- Enable if you want society managing.
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- Enable if you're using esx_identity.
Config.EnableLicenses             = true -- Enable if you're using esx_license.

Config.EnableHandcuffTimer        = true -- Enable handcuff timer? will unrestrain player after the time ends.
Config.HandcuffTimer              = 15 * 60000 -- 10 minutes.

Config.EnableJobBlip              = true -- Enable blips for cops on duty, requires esx_society.
Config.EnableCustomPeds           = false -- Enable custom peds in cloak room? See Config.CustomPeds below to customize peds.

Config.EnableESXService           = true -- Enable esx service?
Config.MaxInService               = 20 -- How much people can be in service at once?

Config.Locale                     = 'en'

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(461.24, -996.49, 30.69)
		},

		Armories = {
			vector3(482.63, -995.56, 30.69)
		},

		Vehicles = { -- dont comment this otherwise the script will show errors,just put the blips underground
			{
				Spawner = vector3(-454.6, -1017.4, -28.4),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{coords = vector3(438.4, -1018.3, -27.7), heading = 90.0, radius = 6.0},
					{coords = vector3(441.0, -1024.2, -28.3), heading = 90.0, radius = 6.0},
					{coords = vector3(453.5, -1022.2, -28.0), heading = 90.0, radius = 6.0},
					{coords = vector3(450.9, -1016.5, -28.1), heading = 90.0, radius = 6.0}
				}
			},

			{
				Spawner = vector3(-473.3, -1018.8, -28.0),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{coords = vector3(475.9, -1021.6, -28.0), heading = 276.1, radius = 6.0},
					{coords = vector3(484.1, -1023.1, -27.5), heading = 302.5, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-461.1, -981.5, -43.6),
				InsideShop = vector3(477.0, -1106.4, -43.0),
				SpawnPoints = {
					{coords = vector3(449.5, -981.2, -43.6), heading = 92.6, radius = 10.0}
				}
			}
		},

		BossActions = {
			vector3(0.00, 0.00, -25.00)
		}

	},

	Sandy = {

		Blip = {
			Coords  = vector3(1854.2, 3686.75, 34.26),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.0,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(1849.27, 3696.21, 34.26)
		},

		Armories = {
			vector3(1841.68, 3690.68, 34.26)
		},

		Vehicles = {
			{
				Spawner = vector3(1861.22, 3685.75, 34.27),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{coords = vector3(1853.47, 3675.9, 33.33), heading = 211.2, radius = 6.0},
					{coords = vector3(1850.1, 3674.7, 33.35), heading = 210.36, radius = 6.0},
					{coords = vector3(1847.1, 3672.51, 33.28), heading = 212.8, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(-467.2, -5998.58, -31.27),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{coords = vector3(-475.09, -5988.91, -31.34), heading = 142.79, radius = 10.0}
				}
			}
		},

		BossActions = {
			vector3(1862.55, 3689.96, 34.26)
		}
	}
}

Config.AuthorizedWeapons = {
	recruit = {
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	probation = {
		{weapon = 'WEAPON_PISTOL', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	officer = {
		{weapon = 'WEAPON_PISTOL', price = 0},
		{weapon = 'WEAPON_COMBATPISTOL', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	senior = {
		{weapon = 'WEAPON_PISTOL', price = 0},
		{weapon = 'WEAPON_COMBATPISTOL', price = 0},
		{weapon = 'WEAPON_HEAVYPISTOL', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 0}
	},

	corporal = {
		{weapon = 'WEAPON_PISTOL', price = 0},
		{weapon = 'WEAPON_COMBATPISTOL', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_HEAVYPISTOL', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 0}
	},

	snrcorpral = {
		{weapon = 'WEAPON_PISTOL', price = 0},
		{weapon = 'WEAPON_COMBATPISTOL', price = 0},
		{weapon = 'WEAPON_HEAVYPISTOL', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		--{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 0}
	},

	sergeant = {
		{weapon = 'WEAPON_PISTOL', price = 0},
		{weapon = 'WEAPON_COMBATPISTOL', price = 0},
		{weapon = 'WEAPON_HEAVYPISTOL', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		--{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 0}
	},

	lieutenant = {
		{weapon = 'WEAPON_PISTOL', price = 0},
		{weapon = 'WEAPON_COMBATPISTOL', price = 0},
		{weapon = 'WEAPON_HEAVYPISTOL', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		--{weapon = 'WEAPON_SMG', price = 0},
		--{weapon = 'WEAPON_CARBINERIFLE', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 0}
	},

	captain = {
		{weapon = 'WEAPON_PISTOL', price = 0},
		{weapon = 'WEAPON_COMBATPISTOL', price = 0},
		{weapon = 'WEAPON_HEAVYPISTOL', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		--{weapon = 'WEAPON_SMG', price = 0},
		--{weapon = 'WEAPON_CARBINERIFLE', price = 0},
		--{weapon = 'WEAPON_SPECIALCARBINE', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 0}
	},

	commander = {
		{weapon = 'WEAPON_PISTOL', price = 0},
		{weapon = 'WEAPON_COMBATPISTOL', price = 0},
		{weapon = 'WEAPON_HEAVYPISTOL', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		--{weapon = 'WEAPON_CARBINERIFLE', price = 0},
		--{weapon = 'WEAPON_SPECIALCARBINE', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 0}
	},

	astchief = {
		{weapon = 'WEAPON_PISTOL', price = 0},
		{weapon = 'WEAPON_COMBATPISTOL', price = 0},
		{weapon = 'WEAPON_HEAVYPISTOL', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', price = 0},
		--{weapon = 'WEAPON_SPECIALCARBINE', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 0}
	},

	chief = {
		{weapon = 'WEAPON_PISTOL', price = 0},
		{weapon = 'WEAPON_COMBATPISTOL', price = 0},
		{weapon = 'WEAPON_HEAVYPISTOL', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', price = 0},
		{weapon = 'WEAPON_SPECIALCARBINE', price = 0},
		--{weapon = 'WEAPON_MARKSMANRIFLE', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 0}
	},

	boss = {
		{weapon = 'WEAPON_PISTOL', price = 0},
		{weapon = 'WEAPON_COMBATPISTOL', price = 0},
		{weapon = 'WEAPON_HEAVYPISTOL', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 0},
		{weapon = 'WEAPON_SMG', price = 0},
		{weapon = 'WEAPON_CARBINERIFLE', price = 0},
		{weapon = 'WEAPON_SPECIALCARBINE', price = 0},
		{weapon = 'WEAPON_MARKSMANRIFLE', price = 0},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0},
		{weapon = 'WEAPON_PUMPSHOTGUN', price = 0}
	}
}

Config.AuthorizedVehicles = {
	car = {
		recruit = {
			{model = '11cvpi', price = 1},
			{model = '14charger', price = 1},
			{model = '14raptor', price = 1},
			{model = '15challenger', price = 1},
			{model = '16fpis', price = 1},
			{model = '16fpiu', price = 1},
			{model = '17colorado', price = 1},
			{model = '18durango', price = 1},
			{model = '18mustang', price = 1},
			{model = '19charger', price = 1},
			{model = '20tahoe', price = 1},
			{model = '2020fpiu', price = 1},
			{model = 'fbi', price = 1},
			{model = 'fbi2', price = 1},
			{model = 'police', price = 1},
			{model = 'police2', price = 1},
			{model = 'police3', price = 1},
			{model = 'police4', price = 1},
			{model = 'policeb', price = 1},
			{model = 'pranger', price = 1},
			{model = 'sheriff', price = 1},
			{model = 'sheriff2', price = 1},
			{model = 'tahoe21', price = 1},
			{model = 'mustang', price = 1},
			{model = 'viper', price = 1},
			{model = 'viper2', price = 1},
			{model = 'poltowtruck', price = 1},
			{model = 'n14charger', price = 1},
			{model = 'ncaprice', price = 1},
			{model = 'ndurango', price = 1},
			{model = 'nexplorer', price = 1},
			{model = 'ntahoe', price = 1},
			{model = 'ntaurus', price = 1}
		},

		probation = {
			{model = '11cvpi', label = "test", price = 1},
			{model = '14charger', price = 1},
			{model = '14raptor', price = 1},
			{model = '15challenger', price = 1},
			{model = '16fpis', price = 1},
			{model = '16fpiu', price = 1},
			{model = '17colorado', price = 1},
			{model = '18durango', price = 1},
			{model = '18mustang', price = 1},
			{model = '19charger', price = 1},
			{model = '20tahoe', price = 1},
			{model = '2020fpiu', price = 1},
			{model = 'fbi', price = 1},
			{model = 'fbi2', price = 1},
			{model = 'police', price = 1},
			{model = 'police2', price = 1},
			{model = 'police3', price = 1},
			{model = 'police4', price = 1},
			{model = 'policeb', price = 1},
			{model = 'pranger', price = 1},
			{model = 'sheriff', price = 1},
			{model = 'sheriff2', price = 1},
			{model = 'tahoe21', price = 1},
			{model = 'mustang', price = 1},
			{model = 'viper', price = 1},
			{model = 'viper2', price = 1},
			{model = 'poltowtruck', price = 1},
			{model = 'n14charger', price = 1},
			{model = 'ncaprice', price = 1},
			{model = 'ndurango', price = 1},
			{model = 'nexplorer', price = 1},
			{model = 'ntahoe', price = 1},
			{model = 'ntaurus', price = 1}
		},

		officer = {
			{model = '11cvpi', label = "test", price = 1},
			{model = '14charger', price = 1},
			{model = '14raptor', price = 1},
			{model = '15challenger', price = 1},
			{model = '16fpis', price = 1},
			{model = '16fpiu', price = 1},
			{model = '17colorado', price = 1},
			{model = '18durango', price = 1},
			{model = '18mustang', price = 1},
			{model = '19charger', price = 1},
			{model = '20tahoe', price = 1},
			{model = '2020fpiu', price = 1},
			{model = 'fbi', price = 1},
			{model = 'fbi2', price = 1},
			{model = 'police', price = 1},
			{model = 'police2', price = 1},
			{model = 'police3', price = 1},
			{model = 'police4', price = 1},
			{model = 'policeb', price = 1},
			{model = 'pranger', price = 1},
			{model = 'sheriff', price = 1},
			{model = 'sheriff2', price = 1},
			{model = 'tahoe21', price = 1},
			{model = 'mustang', price = 1},
			{model = 'viper', price = 1},
			{model = 'viper2', price = 1},
			{model = 'poltowtruck', price = 1},
			{model = 'n14charger', price = 1},
			{model = 'ncaprice', price = 1},
			{model = 'ndurango', price = 1},
			{model = 'nexplorer', price = 1},
			{model = 'ntahoe', price = 1},
			{model = 'ntaurus', price = 1}
		},

		senior = {
			{model = '11cvpi', label = "test", price = 1},
			{model = '14charger', price = 1},
			{model = '14raptor', price = 1},
			{model = '15challenger', price = 1},
			{model = '16fpis', price = 1},
			{model = '16fpiu', price = 1},
			{model = '17colorado', price = 1},
			{model = '18durango', price = 1},
			{model = '18mustang', price = 1},
			{model = '19charger', price = 1},
			{model = '20tahoe', price = 1},
			{model = '2020fpiu', price = 1},
			{model = 'fbi', price = 1},
			{model = 'fbi2', price = 1},
			{model = 'police', price = 1},
			{model = 'police2', price = 1},
			{model = 'police3', price = 1},
			{model = 'police4', price = 1},
			{model = 'policeb', price = 1},
			{model = 'pranger', price = 1},
			{model = 'sheriff', price = 1},
			{model = 'sheriff2', price = 1},
			{model = 'tahoe21', price = 1},
			{model = 'mustang', price = 1},
			{model = 'viper', price = 1},
			{model = 'viper2', price = 1},
			{model = 'poltowtruck', price = 1},
			{model = 'n14charger', price = 1},
			{model = 'ncaprice', price = 1},
			{model = 'ndurango', price = 1},
			{model = 'nexplorer', price = 1},
			{model = 'ntahoe', price = 1},
			{model = 'ntaurus', price = 1}
		},

		corporal = {
			{model = '11cvpi', label = "test", price = 1},
			{model = '14charger', price = 1},
			{model = '14raptor', price = 1},
			{model = '15challenger', price = 1},
			{model = '16fpis', price = 1},
			{model = '16fpiu', price = 1},
			{model = '17colorado', price = 1},
			{model = '18durango', price = 1},
			{model = '18mustang', price = 1},
			{model = '19charger', price = 1},
			{model = '20tahoe', price = 1},
			{model = '2020fpiu', price = 1},
			{model = 'fbi', price = 1},
			{model = 'fbi2', price = 1},
			{model = 'police', price = 1},
			{model = 'police2', price = 1},
			{model = 'police3', price = 1},
			{model = 'police4', price = 1},
			{model = 'policeb', price = 1},
			{model = 'pranger', price = 1},
			{model = 'sheriff', price = 1},
			{model = 'sheriff2', price = 1},
			{model = 'tahoe21', price = 1},
			{model = 'mustang', price = 1},
			{model = 'viper', price = 1},
			{model = 'viper2', price = 1},
			{model = 'poltowtruck', price = 1},
			{model = 'n14charger', price = 1},
			{model = 'ncaprice', price = 1},
			{model = 'ndurango', price = 1},
			{model = 'nexplorer', price = 1},
			{model = 'ntahoe', price = 1},
			{model = 'ntaurus', price = 1}
		},

		snrcorpral = {
			{model = '11cvpi', label = "test", price = 1},
			{model = '14charger', price = 1},
			{model = '14raptor', price = 1},
			{model = '15challenger', price = 1},
			{model = '16fpis', price = 1},
			{model = '16fpiu', price = 1},
			{model = '17colorado', price = 1},
			{model = '18durango', price = 1},
			{model = '18mustang', price = 1},
			{model = '19charger', price = 1},
			{model = '20tahoe', price = 1},
			{model = '2020fpiu', price = 1},
			{model = 'fbi', price = 1},
			{model = 'fbi2', price = 1},
			{model = 'police', price = 1},
			{model = 'police2', price = 1},
			{model = 'police3', price = 1},
			{model = 'police4', price = 1},
			{model = 'policeb', price = 1},
			{model = 'pranger', price = 1},
			{model = 'sheriff', price = 1},
			{model = 'sheriff2', price = 1},
			{model = 'tahoe21', price = 1},
			{model = 'mustang', price = 1},
			{model = 'viper', price = 1},
			{model = 'viper2', price = 1},
			{model = 'poltowtruck', price = 1},
			{model = 'n14charger', price = 1},
			{model = 'ncaprice', price = 1},
			{model = 'ndurango', price = 1},
			{model = 'nexplorer', price = 1},
			{model = 'ntahoe', price = 1},
			{model = 'ntaurus', price = 1}
		},

		sergeant = {
			{model = '11cvpi', label = "test", price = 1},
			{model = '14charger', price = 1},
			{model = '14raptor', price = 1},
			{model = '15challenger', price = 1},
			{model = '16fpis', price = 1},
			{model = '16fpiu', price = 1},
			{model = '17colorado', price = 1},
			{model = '18durango', price = 1},
			{model = '18mustang', price = 1},
			{model = '19charger', price = 1},
			{model = '20tahoe', price = 1},
			{model = '2020fpiu', price = 1},
			{model = 'fbi', price = 1},
			{model = 'fbi2', price = 1},
			{model = 'police', price = 1},
			{model = 'police2', price = 1},
			{model = 'police3', price = 1},
			{model = 'police4', price = 1},
			{model = 'policeb', price = 1},
			{model = 'pranger', price = 1},
			{model = 'sheriff', price = 1},
			{model = 'sheriff2', price = 1},
			{model = 'tahoe21', price = 1},
			{model = 'mustang', price = 1},
			{model = 'viper', price = 1},
			{model = 'viper2', price = 1},
			{model = 'poltowtruck', price = 1},
			{model = 'n14charger', price = 1},
			{model = 'ncaprice', price = 1},
			{model = 'ndurango', price = 1},
			{model = 'nexplorer', price = 1},
			{model = 'ntahoe', price = 1},
			{model = 'ntaurus', price = 1}
		},

		lieutenant = {
			{model = '11cvpi', label = "test", price = 1},
			{model = '14charger', price = 1},
			{model = '14raptor', price = 1},
			{model = '15challenger', price = 1},
			{model = '16fpis', price = 1},
			{model = '16fpiu', price = 1},
			{model = '17colorado', price = 1},
			{model = '18durango', price = 1},
			{model = '18mustang', price = 1},
			{model = '19charger', price = 1},
			{model = '20tahoe', price = 1},
			{model = '2020fpiu', price = 1},
			{model = 'fbi', price = 1},
			{model = 'fbi2', price = 1},
			{model = 'police', price = 1},
			{model = 'police2', price = 1},
			{model = 'police3', price = 1},
			{model = 'police4', price = 1},
			{model = 'policeb', price = 1},
			{model = 'pranger', price = 1},
			{model = 'sheriff', price = 1},
			{model = 'sheriff2', price = 1},
			{model = 'tahoe21', price = 1},
			{model = 'mustang', price = 1},
			{model = 'viper', price = 1},
			{model = 'viper2', price = 1},
			{model = 'poltowtruck', price = 1},
			{model = 'n14charger', price = 1},
			{model = 'ncaprice', price = 1},
			{model = 'ndurango', price = 1},
			{model = 'nexplorer', price = 1},
			{model = 'ntahoe', price = 1},
			{model = 'ntaurus', price = 1}
		},

		captain = {
			{model = '11cvpi', label = "test", price = 1},
			{model = '14charger', price = 1},
			{model = '14raptor', price = 1},
			{model = '15challenger', price = 1},
			{model = '16fpis', price = 1},
			{model = '16fpiu', price = 1},
			{model = '17colorado', price = 1},
			{model = '18durango', price = 1},
			{model = '18mustang', price = 1},
			{model = '19charger', price = 1},
			{model = '20tahoe', price = 1},
			{model = '2020fpiu', price = 1},
			{model = 'fbi', price = 1},
			{model = 'fbi2', price = 1},
			{model = 'police', price = 1},
			{model = 'police2', price = 1},
			{model = 'police3', price = 1},
			{model = 'police4', price = 1},
			{model = 'policeb', price = 1},
			{model = 'pranger', price = 1},
			{model = 'sheriff', price = 1},
			{model = 'sheriff2', price = 1},
			{model = 'tahoe21', price = 1},
			{model = 'mustang', price = 1},
			{model = 'viper', price = 1},
			{model = 'viper2', price = 1},
			{model = 'poltowtruck', price = 1},
			{model = 'n14charger', price = 1},
			{model = 'ncaprice', price = 1},
			{model = 'ndurango', price = 1},
			{model = 'nexplorer', price = 1},
			{model = 'ntahoe', price = 1},
			{model = 'ntaurus', price = 1}
		},

		commander = {
			{model = '11cvpi', label = "test", price = 1},
			{model = '14charger', price = 1},
			{model = '14raptor', price = 1},
			{model = '15challenger', price = 1},
			{model = '16fpis', price = 1},
			{model = '16fpiu', price = 1},
			{model = '17colorado', price = 1},
			{model = '18durango', price = 1},
			{model = '18mustang', price = 1},
			{model = '19charger', price = 1},
			{model = '20tahoe', price = 1},
			{model = '2020fpiu', price = 1},
			{model = 'fbi', price = 1},
			{model = 'fbi2', price = 1},
			{model = 'police', price = 1},
			{model = 'police2', price = 1},
			{model = 'police3', price = 1},
			{model = 'police4', price = 1},
			{model = 'policeb', price = 1},
			{model = 'pranger', price = 1},
			{model = 'sheriff', price = 1},
			{model = 'sheriff2', price = 1},
			{model = 'tahoe21', price = 1},
			{model = 'mustang', price = 1},
			{model = 'viper', price = 1},
			{model = 'viper2', price = 1},
			{model = 'poltowtruck', price = 1},
			{model = 'n14charger', price = 1},
			{model = 'ncaprice', price = 1},
			{model = 'ndurango', price = 1},
			{model = 'nexplorer', price = 1},
			{model = 'ntahoe', price = 1},
			{model = 'ntaurus', price = 1}
		},

		astchief = {
			{model = '11cvpi', label = "test", price = 1},
			{model = '14charger', price = 1},
			{model = '14raptor', price = 1},
			{model = '15challenger', price = 1},
			{model = '16fpis', price = 1},
			{model = '16fpiu', price = 1},
			{model = '17colorado', price = 1},
			{model = '18durango', price = 1},
			{model = '18mustang', price = 1},
			{model = '19charger', price = 1},
			{model = '20tahoe', price = 1},
			{model = '2020fpiu', price = 1},
			{model = 'fbi', price = 1},
			{model = 'fbi2', price = 1},
			{model = 'police', price = 1},
			{model = 'police2', price = 1},
			{model = 'police3', price = 1},
			{model = 'police4', price = 1},
			{model = 'policeb', price = 1},
			{model = 'pranger', price = 1},
			{model = 'sheriff', price = 1},
			{model = 'sheriff2', price = 1},
			{model = 'tahoe21', price = 1},
			{model = 'mustang', price = 1},
			{model = 'viper', price = 1},
			{model = 'viper2', price = 1},
			{model = 'poltowtruck', price = 1},
			{model = 'n14charger', price = 1},
			{model = 'ncaprice', price = 1},
			{model = 'ndurango', price = 1},
			{model = 'nexplorer', price = 1},
			{model = 'ntahoe', price = 1},
			{model = 'ntaurus', price = 1}
		},

		chief = {
			{model = '11cvpi', label = "test", price = 1},
			{model = '14charger', price = 1},
			{model = '14raptor', price = 1},
			{model = '15challenger', price = 1},
			{model = '16fpis', price = 1},
			{model = '16fpiu', price = 1},
			{model = '17colorado', price = 1},
			{model = '18durango', price = 1},
			{model = '18mustang', price = 1},
			{model = '19charger', price = 1},
			{model = '20tahoe', price = 1},
			{model = '2020fpiu', price = 1},
			{model = 'fbi', price = 1},
			{model = 'fbi2', price = 1},
			{model = 'police', price = 1},
			{model = 'police2', price = 1},
			{model = 'police3', price = 1},
			{model = 'police4', price = 1},
			{model = 'policeb', price = 1},
			{model = 'pranger', price = 1},
			{model = 'sheriff', price = 1},
			{model = 'sheriff2', price = 1},
			{model = 'tahoe21', price = 1},
			{model = 'mustang', price = 1},
			{model = 'viper', price = 1},
			{model = 'viper2', price = 1},
			{model = 'poltowtruck', price = 1},
			{model = 'n14charger', price = 1},
			{model = 'ncaprice', price = 1},
			{model = 'ndurango', price = 1},
			{model = 'nexplorer', price = 1},
			{model = 'ntahoe', price = 1},
			{model = 'ntaurus', price = 1}
		},

		boss = {
			{model = '11cvpi', label = "test", price = 1},
			{model = '14charger', price = 1},
			{model = '14raptor', price = 1},
			{model = '15challenger', price = 1},
			{model = '16fpis', price = 1},
			{model = '16fpiu', price = 1},
			{model = '17colorado', price = 1},
			{model = '18durango', price = 1},
			{model = '18mustang', price = 1},
			{model = '19charger', price = 1},
			{model = '20tahoe', price = 1},
			{model = '2020fpiu', price = 1},
			{model = 'fbi', price = 1},
			{model = 'fbi2', price = 1},
			{model = 'police', price = 1},
			{model = 'police2', price = 1},
			{model = 'police3', price = 1},
			{model = 'police4', price = 1},
			{model = 'policeb', price = 1},
			{model = 'pranger', price = 1},
			{model = 'sheriff', price = 1},
			{model = 'sheriff2', price = 1},
			{model = 'tahoe21', price = 1},
			{model = 'mustang', price = 1},
			{model = 'viper', price = 1},
			{model = 'viper2', price = 1},
			{model = 'poltowtruck', price = 1},
			{model = 'n14charger', price = 1},
			{model = 'ncaprice', price = 1},
			{model = 'ndurango', price = 1},
			{model = 'nexplorer', price = 1},
			{model = 'ntahoe', price = 1},
			{model = 'ntaurus', price = 1}
		}
	},

	helicopter = {
		recruit = {},

		probation = {},

		officer = {
			{model = 'polmav', props = {modLivery = 0}, price = 1}
		},

		senior = {
			{model = 'polmav', props = {modLivery = 0}, price = 1}
		},

		corporal = {
			{model = 'polmav', props = {modLivery = 0}, price = 1}
		},

		snrcorpral = {
			{model = 'polmav', props = {modLivery = 0}, price = 1}
		},

		sergeant = {
			{model = 'polmav', props = {modLivery = 0}, price = 1}
		},

		lieutenant = {
			{model = 'polmav', props = {modLivery = 0}, price = 1}
		},

		captain = {
			{model = 'polmav', props = {modLivery = 0}, price = 1}
		},

		commander = {
			{model = 'polmav', props = {modLivery = 0}, price = 1}
		},

		astchief = {
			{model = 'polmav', props = {modLivery = 0}, price = 1}
		},

		chief = {
			{model = 'polmav', props = {modLivery = 0}, price = 1}
		},

		boss = {
			{model = 'polmav', props = {modLivery = 0}, price = 1}
		}
	}
}

Config.CustomPeds = {
	shared = {
		{label = 'Sheriff Ped', maleModel = 's_m_y_sheriff_01', femaleModel = 's_f_y_sheriff_01'},
		{label = 'Police Ped', maleModel = 's_m_y_cop_01', femaleModel = 's_f_y_cop_01'}
	},

	recruit = {},

	probation = {},

	officer = {},

	senior = {},

	corporal = {},

	snrcorpral = {},

	sergeant = {},

	lieutenant = {},

	captain = {},

	commander = {},

	astchief = {},

	chief = {},

	boss = {
		{label = 'SWAT Ped', maleModel = 's_m_y_swat_01', femaleModel = 's_m_y_swat_01'}
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
	recruit = { --Cadet
		male = {
			tshirt_1 = 20,  tshirt_2 = 0,
			torso_1 = 25,   torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 93,
			pants_1 = 13,   pants_2 = 0,
			shoes_1 = 42,   shoes_2 = 0,
			mask_1 = 0,
			helmet_1 = 90,  helmet_2 = 2,
			chain_1 = 23,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 23,  tshirt_2 = 0,
			torso_1 = 52,   torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 108,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 37,   shoes_2 = 0,
			mask_1 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

    probation = { --Probationary Officer
		male = {
			tshirt_1 = 20,  tshirt_2 = 0,
			torso_1 = 25,   torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 93,
			pants_1 = 10,   pants_2 = 0,
			shoes_1 = 42,   shoes_2 = 0,
			mask_1 = 0,
			helmet_1 = 90,  helmet_2 = 2,
			chain_1 = 23,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 23,  tshirt_2 = 0,
			torso_1 = 52,   torso_2 = 2,
			decals_1 = 0,   decals_2 = 0,
			arms = 108,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 37,   shoes_2 = 0,
			mask_1 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

	officer = { --Officer
		male = {
			tshirt_1 = 17,  tshirt_2 = 0,
			torso_1 = 22,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 86,
			pants_1 = 13,   pants_2 = 0,
			shoes_1 = 42,   shoes_2 = 0,
			mask_1 = 0,
			helmet_1 = 90,  helmet_2 = 2,
			chain_1 = 23,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 23,  tshirt_2 = 0,
			torso_1 = 54,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 109,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 37,   shoes_2 = 0,
			mask_1 = 0,
			helmet_1 = 0,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

    senior = { --Senior Police Officer
		male = {
			tshirt_1 = 17,  tshirt_2 = 0,
			torso_1 = 25,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 93,
			pants_1 = 13,   pants_2 = 0,
			shoes_1 = 42,   shoes_2 = 0,
			mask_1 = 0,
			helmet_1 = 90,  helmet_2 = 2,
			chain_1 = 23,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 22,  tshirt_2 = 0,
			torso_1 = 52,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 109,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 37,   shoes_2 = 0,
			mask_1 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},


	snrcorpral = { --Sergeant
		male = {
			tshirt_1 = 17,  tshirt_2 = 0,
			torso_1 = 25,   torso_2 = 0,
			decals_1 = 9,   decals_2 = 0,
			arms = 93,
			pants_1 = 13,   pants_2 = 0,
			shoes_1 = 42,   shoes_2 = 0,
			mask_1 = 0,
			helmet_1 = 90,  helmet_2 = 2,
			chain_1 = 23,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 22,  tshirt_2 = 0,
			torso_1 = 52,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 109,
			pants_1 = 19,   pants_2 = 0,
			shoes_1 = 37,   shoes_2 = 0,
			mask_1 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

	sergeant = { --Master Sergeant
		male = {
			tshirt_1 = 17,  tshirt_2 = 0,
			torso_1 = 25,   torso_2 = 0,
			decals_1 = 10,   decals_2 = 0,
			arms = 0,
			pants_1 = 13,   pants_2 = 0,
			shoes_1 = 42,   shoes_2 = 0,
			mask_1 = 0,
			helmet_1 = 90,  helmet_2 = 2,
			chain_1 = 23,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 52,  tshirt_2 = 0,
			torso_1 = 18,   torso_2 = 14,
			decals_1 = 0,   decals_2 = 0,
			arms = 1,
			pants_1 = 18,   pants_2 = 3,
			shoes_1 = 35,   shoes_2 = 0,
			mask_1 = 8,
			helmet_1 = 13,  helmet_2 = 3,
			chain_1 = 1,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

	lieutenant = { --Lieutenant
		male = {
			tshirt_1 = 17,  tshirt_2 = 0,
			torso_1 = 25,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 93,
			pants_1 = 13,   pants_2 = 0,
			shoes_1 = 42,   shoes_2 = 0,
			mask_1 = 0,
			helmet_1 = 90,  helmet_2 = 2,
			chain_1 = 23,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
	},
		female = {
			tshirt_1 = 23,  tshirt_2 = 0,
			torso_1 = 52,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 108,
			pants_1 = 19,   pants_2 = 3,
			shoes_1 = 37,   shoes_2 = 0,
			mask_1 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

	captain = { --Captain
		male = {
			tshirt_1 = 17,  tshirt_2 = 0,
			torso_1 = 25,   torso_2 = 1,
			decals_1 = 10,   decals_2 = 0,
			arms = 93,
			pants_1 = 41,   pants_2 = 0,
			shoes_1 = 42,   shoes_2 = 0,
			mask_1 = 0,
			helmet_1 = 90,  helmet_2 = 2,
			chain_1 = 23,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		},
		female = {
			tshirt_1 = 23,  tshirt_2 = 0,
			torso_1 = 52,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 108,
			pants_1 = 26,   pants_2 = 2,
			shoes_1 = 37,   shoes_2 = 0,
			mask_1 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

	commander = { --Commander
		male = {
			tshirt_1 = 20,  tshirt_2 = 0,
			torso_1 = 25,   torso_2 = 2,
			decals_1 = 12,   decals_2 = 2,
			arms = 0,
			pants_1 = 41,   pants_2 = 0,
			shoes_1 = 42,   shoes_2 = 0,
			mask_1 = 0,
			helmet_1 = 90,  helmet_2 = 0,
			chain_1 = 23,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
	},
		female = {
			tshirt_1 = 23,  tshirt_2 = 0,
			torso_1 = 52,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 108,
			pants_1 = 26,   pants_2 = 2,
			shoes_1 = 37,   shoes_2 = 0,
			mask_1 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

	astchief = { --Assistant Cheif
		male = {
			tshirt_1 = 17,  tshirt_2 = 0,
			torso_1 = 25,   torso_2 = 1,
			decals_1 = 12,   decals_2 = 2,
			arms = 93,
			pants_1 = 13,   pants_2 = 0,
			shoes_1 = 42,   shoes_2 = 0,
			mask_1 = 0,
			helmet_1 = 90,  helmet_2 = 2,
			chain_1 = 23,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
	},
		female = {
			tshirt_1 = 23,  tshirt_2 = 0,
			torso_1 = 52,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 108,
			pants_1 = 26,   pants_2 = 2,
			shoes_1 = 37,   shoes_2 = 0,
			mask_1 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

		chief = { --Cheif
		male = {
			tshirt_1 = 17,  tshirt_2 = 0,
			torso_1 = 25,   torso_2 = 0,
			decals_1 = 12,   decals_2 = 2,
			arms = 93,
			pants_1 = 13,   pants_2 = 0,
			shoes_1 = 42,   shoes_2 = 0,
			mask_1 = 0,
			helmet_1 = 90,  helmet_2 = 2,
			chain_1 = 23,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
	},
		female = {
			tshirt_1 = 23,  tshirt_2 = 0,
			torso_1 = 52,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 108,
			pants_1 = 26,   pants_2 = 2,
			shoes_1 = 37,   shoes_2 = 0,
			mask_1 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

	boss = { --Commissioner
		male = {
			tshirt_1 = 17,  tshirt_2 = 0,
			torso_1 = 25,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 93,
			pants_1 = 13,   pants_2 = 0,
			shoes_1 = 42,   shoes_2 = 0,
			mask_1 = 0,
			helmet_1 = 90,  helmet_2 = 2,
			chain_1 = 23,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
	},
		female = {
			tshirt_1 = 23,  tshirt_2 = 0,
			torso_1 = 52,   torso_2 = 1,
			decals_1 = 0,   decals_2 = 0,
			arms = 108,
			pants_1 = 19,   pants_2 = 3,
			shoes_1 = 37,   shoes_2 = 0,
			mask_1 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 0,     ears_2 = 0
		}
	},

	bullet_wear = {
        male = {
            bproof_1 = 17,  bproof_2 = 0
        },
        female = {
            bproof_1 = 30,  bproof_2 = 0
        }
    },

	gilet_wear = {
		male = {
			bproof_1 = 11,  bproof_2 = 0
		},
		female = {
			bproof_1 = 40,  bproof_2 = 0
		}
	}
}