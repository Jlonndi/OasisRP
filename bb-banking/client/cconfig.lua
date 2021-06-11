BBBankingCore = {}
BBBankingCore['config'] = {
    ['banks'] = { -- Bank locations
        [1]     = vector3(149.88, -1040.34, 29.37),
        [2]     = vector3(-350.83, -49.6, 49.04),
        [3]     = vector3(314.36, -278.46, 54.17),
        [4]     = vector3(-1212.98, -330.26, 37.79),
        [5]     = vector3(-2963.45, 482.81, 15.7),
        [6]     = vector3(1175.15, 2706.07, 38.09),
        [7]     = vector3(1653.78, 4850.56, 41.99),
        [8]     = vector3(-1074.67, -2559.01, 13.97),
        [9]     = vector3(-112.22, 6468.92, 31.63),
        [10]    = vector3(242.1, 224.44, 106.29),
    },

    ['blip'] = { -- Blips settings
        enabled     = true, -- Enable bank blips?
        blipName    = "Bank",
        blipType    = 108,
        blipColor   = 2,
        blipScale   = 0.8
    },
    
    ['atmModels'] = { -- ATM Models, Do NOT Touch
        "prop_atm_01",
        "prop_atm_02",
        "prop_atm_03",
        "prop_fleeca_atm"
    },
    --['lang'] = 'en', -- NOT NEEDED FOR VERSION 1.0.1+, Change on fxmanifist.lua
    ['popupText']     = true, -- Enables popupText instead of markers [Less MS]
    ['atmPopupText']  = false, -- Enables atm popupText instead of commands [More MS]
}