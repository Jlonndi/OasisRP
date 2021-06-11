Config = {}
Config.DrawDistance = 100.0

Config.EnablePlayerManagement = true
Config.EnableSocietyOwnedVehicles = false
Config.EnableVaultManagement = true
Config.EnableHelicopters = false
Config.EnableMoneyWash = false
Config.MaxInService = -1
Config.Locale = 'en'

Config.MissCraft = 10 -- %

Config.AuthorizedVehicles = {
    { name = '2018s650p',  label = 'S 650 Mayback Stretch' },
}

Config.Blips = {
    Blip = {
      Pos     = { x = 129.246, y = -1299.363, z = 29.501 },
      Sprite  = 121,
      Display = 4,
      Scale   = 1.2,
      Colour  = 27,
    },
}

Config.Zones = {
    Cloakrooms = {
        Pos   = { x = 105.111, y = -1303.221, z = 27.788 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 255, g = 187, b = 255 },
        Type  = 27,
    },

    Vaults = {
        Pos   = { x = 93.406, y = -1291.753, z = 28.288 },
        Size  = { x = 1.3, y = 1.3, z = 1.0 },
        Color = { r = 30, g = 144, b = 255 },
        Type  = 23,
    },

    Fridge = {
        Pos   = { x = 129.52, y = -1283.56, z = 28.27 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 248, g = 248, b = 255 },
        Type  = 23,
    },

    Vehicles = {
        Pos          = { x = 137.177, y = -1278.757, z = 28.371 },
        SpawnPoint   = { x = 138.436, y = -1263.095, z = 28.626 },
        Size         = { x = 1.8, y = 1.8, z = 1.0 },
        Color        = { r = 255, g = 255, b = 0 },
        Type         = 23,
        Heading      = 207.43,
    },

    VehicleDeleters = {
        Pos   = { x = 133.203, y = -1265.573, z = 28.396 },
        Size  = { x = 3.0, y = 3.0, z = 0.2 },
        Color = { r = 255, g = 255, b = 0 },
        Type  = 1,
    },

--[[
    Helicopters = {
        Pos          = { x = 137.177, y = -1278.757, z = 28.371 },
        SpawnPoint   = { x = 138.436, y = -1263.095, z = 28.626 },
        Size         = { x = 1.8, y = 1.8, z = 1.0 },
        Color        = { r = 255, g = 255, b = 0 },
        Type         = 23,
        Heading      = 207.43,
    },

    HelicopterDeleters = {
        Pos   = { x = 133.203, y = -1265.573, z = 28.396 },
        Size  = { x = 3.0, y = 3.0, z = 0.2 },
        Color = { r = 255, g = 255, b = 0 },
        Type  = 1,
    },
]]--

    BossActions = {
        Pos   = { x = 94.951, y = -1294.021, z = -28.268 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Color = { r = 0, g = 100, b = 0 },
        Type  = 1,
    },

-----------------------
-------- SHOPS --------
    Drinks = {
        Pos   = { x = -2955.242, y = 385.897, z = 14.041 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 238, g = 0, b = 0 },
        Type  = 23,
        Items = {
            { name = 'jager',      label = _U('jager'),   price = 3 },
            { name = 'vodka',      label = _U('vodka'),   price = 4 },
            { name = 'rum',       label = _U('rum'),    price = 2 },
            { name = 'whisky',     label = _U('whisky'),  price = 7 },
            { name = 'tequila',    label = _U('tequila'), price = 2 },
            { name = 'martini',    label = _U('martini'), price = 5 }
        },
    },

    NonAlcoholic = {
        Pos   = { x = 178.028, y = 307.467, z = 104.392 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 238, g = 110, b = 0 },
        Type  = 23,
        Items = {
            { name = 'seltzer',        label = _U('seltzer'),     price = 4 },
            { name = 'juice',    label = _U('juice'), price = 3 },
            { name = 'icetea',      label = _U('icetea'),   price = 4 },
            { name = 'redbull',      label = _U('redbull'),   price = 7 },
            { name = 'drpepper',    label = _U('drpepper'), price = 2 },
            { name = 'lemonade',    label = _U('lemonade'), price = 1 }
        },
    },

    Appetizer = {
        Pos   = { x = 98.675, y = -1809.498, z = 26.095 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 142, g = 125, b = 76 },
        Type  = 23,
        Items = {
            { name = 'peanutbowl',   label = _U('peanutbowl'),    price = 7 },
            { name = 'cashewbowl',    label = _U('cashewbowl'),     price = 10 },
            { name = 'pistachiobowl',     label = _U('pistachiobowl'),      price = 15 },
            { name = 'chipbowl',        label = _U('chipbowl'),         price = 5 },
            { name = 'sausage',       label = _U('sausage'),        price = 25 },
            { name = 'grapebunch',    label = _U('grapebunch'),     price = 15 }
        },
    },

    Ice = {
        Pos   = { x = 26.979, y = -1343.457, z = 28.517 },
        Size  = { x = 1.6, y = 1.6, z = 1.0 },
        Color = { r = 255, g = 255, b = 255 },
        Type  = 23,
        Items = {
            { name = 'ice',     label = _U('ice'),      price = 1 },
            { name = 'mint',  label = _U('mint'),   price = 2 }
        },
    },
}

-----------------------
----- TELEPORTERS -----
Config.TeleportZones = {
  --[[EnterBuilding = {
    Pos       = { x = 132.608, y = -1293.978, z = 28.269 },
    Size      = { x = 1.2, y = 1.2, z = 0.1 },
    Color     = { r = 128, g = 128, b = 128 },
    Marker    = 1,
    Hint      = _U('e_to_enter_1'),
    Teleport  = { x = 126.742, y = -1278.386, z = 28.569 }
  },

  ExitBuilding = {
    Pos       = { x = 132.517, y = -1290.901, z = 28.269 },
    Size      = { x = 1.2, y = 1.2, z = 0.1 },
    Color     = { r = 128, g = 128, b = 128 },
    Marker    = 1,
    Hint      = _U('e_to_exit_1'),
    Teleport  = { x = 131.175, y = -1295.598, z = 28.569 },
  },


  --[[EnterHeliport = {
    Pos       = { x = 126.843, y = -729.012, z = 241.201 },
    Size      = { x = 2.0, y = 2.0, z = 0.2 },
    Color     = { r = 204, g = 204, b = 0 },
    Marker    = 1,
    Hint      = _U('e_to_enter_2),
    Teleport  = { x = -65.944, y = -818.589, z =  320.801 }
  },

  ExitHeliport = {
    Pos       = { x = -67.236, y = -821.702, z = 320.401 },
    Size      = { x = 2.0, y = 2.0, z = 0.2 },
    Color     = { r = 204, g = 204, b = 0 },
    Marker    = 1,
    Hint      = _U('e_to_exit_2'),
    Teleport  = { x = 124.164, y = -728.231, z = 241.801 },
  },
]]--
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
    barman_outfit = {
      male = {
          ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
          ['torso_1'] = 211,   ['torso_2'] = 0,
          ['decals_1'] = 0,   ['decals_2'] = 0,
          ['arms'] = 11,
          ['pants_1'] = 59,   ['pants_2'] = 0,
          ['shoes_1'] = 11,   ['shoes_2'] = 1,
          ['chain_1'] = 30,  ['chain_2'] = 0
      },
      female = {
          ['tshirt_1'] = 6,   ['tshirt_2'] = 0,
          ['torso_1'] = 144,    ['torso_2'] = 3,
          ['decals_1'] = 0,   ['decals_2'] = 0,
          ['arms'] = 15,
          ['pants_1'] = 15,   ['pants_2'] = 6,
          ['shoes_1'] = 30,    ['shoes_2'] = 4,
          ['chain_1'] = 16,    ['chain_2'] = 8
      }},
    dancer_outfit_1 = {
      male = {
          ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
          ['torso_1'] = 106,   ['torso_2'] = 0,
          ['decals_1'] = 0,   ['decals_2'] = 0,
          ['arms'] = 14,
          ['pants_1'] = 33,   ['pants_2'] = 9,
          ['shoes_1'] = 10,   ['shoes_2'] = 9,
          ['chain_1'] = 0,  ['chain_2'] = 0
      },
      female = {
          ['tshirt_1'] = 6,   ['tshirt_2'] = 0,
          ['torso_1'] = 108,   ['torso_2'] = 1,
          ['decals_1'] = 0,   ['decals_2'] = 0,
          ['arms'] = 4,
          ['pants_1'] = 52,   ['pants_2'] = 1,
          ['shoes_1'] = 29,   ['shoes_2'] = 1,
          ['chain_1'] = 16,   ['chain_2'] = 2
      }},
    dancer_outfit_2 = {
      male = {
          ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
          ['torso_1'] = 152,   ['torso_2'] = 3,
          ['decals_1'] = 0,   ['decals_2'] = 0,
          ['arms'] = 14,
          ['pants_1'] = 33,    ['pants_2'] = 0,
          ['shoes_1'] = 10,   ['shoes_2'] = 0,
          ['chain_1'] = 0,  ['chain_2'] = 0
      },
      female = {
          ['tshirt_1'] = 6,   ['tshirt_2'] = 0,
          ['torso_1'] = 104,   ['torso_2'] = 3,
          ['decals_1'] = 0,   ['decals_2'] = 0,
          ['arms'] = 15,
          ['pants_1'] = 49,   ['pants_2'] = 3,
          ['shoes_1'] = 14,   ['shoes_2'] = 1,
          ['chain_1'] = 0,    ['chain_2'] = 0
      }},
    dancer_outfit_3 = {
      male = {
          ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
          ['torso_1'] = 152,   ['torso_2'] = 3,
          ['decals_1'] = 0,   ['decals_2'] = 0,
          ['arms'] = 14,
          ['pants_1'] =92,    ['pants_2'] = 0,
          ['shoes_1'] = 53,   ['shoes_2'] = 2,
          ['chain_1'] = 0,  ['chain_2'] = 0
      },
      female = {
          ['tshirt_1'] = 6,   ['tshirt_2'] = 0,
          ['torso_1'] = 104,   ['torso_2'] = 7,
          ['decals_1'] = 0,   ['decals_2'] = 0,
          ['arms'] = 15,
          ['pants_1'] = 49,   ['pants_2'] = 7,
          ['shoes_1'] = 30,   ['shoes_2'] = 4,
          ['chain_1'] = 0,    ['chain_2'] = 0
      }},
    dancer_outfit_4 = {
      male = {
          ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
          ['torso_1'] = 169,   ['torso_2'] = 0,
          ['decals_1'] = 0,   ['decals_2'] = 0,
          ['arms'] = 15,
          ['pants_1'] = 92,   ['pants_2'] = 4,
          ['shoes_1'] = 5,   ['shoes_2'] = 14,
          ['chain_1'] = 0,  ['chain_2'] = 0
      },
      female = {
          ['tshirt_1'] = 6,   ['tshirt_2'] = 0,
          ['torso_1'] = 9,   ['torso_2'] = 0,
          ['decals_1'] = 0,   ['decals_2'] = 0,
          ['arms'] = 12,
          ['pants_1'] = 15,   ['pants_2'] = 1,
          ['shoes_1'] = 30,   ['shoes_2'] = 8,
          ['chain_1'] = 0,    ['chain_2'] = 0
      }},
    dancer_outfit_5 = {
      male = {
          ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
          ['torso_1'] = 169,   ['torso_2'] = 0,
          ['decals_1'] = 0,   ['decals_2'] = 0,
          ['arms'] = 15,
          ['pants_1'] = 92,   ['pants_2'] = 5,
          ['shoes_1'] = 2,   ['shoes_2'] = 0,
          ['chain_1'] = 0,  ['chain_2'] = 0
      },
      female = {
          ['tshirt_1'] = 6,   ['tshirt_2'] = 0,
          ['torso_1'] = 11,   ['torso_2'] = 3,
          ['decals_1'] = 0,   ['decals_2'] = 0,
          ['arms'] = 15,
          ['pants_1'] = 15,   ['pants_2'] = 0,
          ['shoes_1'] = 14,   ['shoes_2'] = 7,
          ['chain_1'] = 0,    ['chain_2'] = 0
      }},
    dancer_outfit_6 = {
      male = {
          ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
          ['torso_1'] = 169,   ['torso_2'] = 0,
          ['decals_1'] = 0,   ['decals_2'] = 0,
          ['arms'] = 15,
          ['pants_1'] = 92,   ['pants_2'] = 6,
          ['shoes_1'] = 2,   ['shoes_2'] = 3,
          ['chain_1'] = 0,  ['chain_2'] = 0
      },
      female = {
          ['tshirt_1'] = 3,   ['tshirt_2'] = 0,
          ['torso_1'] = 15,   ['torso_2'] = 0,
          ['decals_1'] = 0,   ['decals_2'] = 0,
          ['arms'] = 15,
          ['pants_1'] = 15,   ['pants_2'] = 0,
          ['shoes_1'] = 14,   ['shoes_2'] = 0,
          ['chain_1'] = 16,    ['chain_2'] = 0
      }},
    dancer_outfit_7 = {
      male = {
          ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
          ['torso_1'] = 124,   ['torso_2'] = 1,
          ['decals_1'] = 0,   ['decals_2'] = 0,
          ['arms'] = 14,
          ['pants_1'] = 60,   ['pants_2'] = 2,
          ['shoes_1'] = 10,   ['shoes_2'] = 10,
          ['chain_1'] = 45,  ['chain_2'] = 0
      },
      female = {
          ['tshirt_1'] = 6,   ['tshirt_2'] = 0,
          ['torso_1'] = 197,  ['torso_2'] = 5,
          ['decals_1'] = 0,   ['decals_2'] = 0,
          ['arms'] = 15,
          ['pants_1'] = 95,   ['pants_2'] = 5,
          ['shoes_1'] = 52,   ['shoes_2'] = 5,
          ['chain_1'] = 16,    ['chain_2'] = 9
      }}
  }