Config = {}

Config.EnableDebug = false -- This will enable some prints and remove the police requirement.

-- How many policemen required to start the robbery.
Config.PoliceRequired = 3

-- If enabled you will need to shoot before breaking the trays.
Config.NeedsToShootBeforeStart = true

-- Weapons available to destroy glass.
Config.WeaponsNeeded = {
    GetHashKey("weapon_pumpshotgun"),
    GetHashKey("weapon_sawnoffshotgun"),
    GetHashKey("weapon_heavypistol"),
    GetHashKey("weapon_pistol"),
    GetHashKey("weapon_golfclub"),
    GetHashKey("weapon_crowbar"),
}

-- This is where you turn the alarm off
Config.Interactables = {
    {
        Text = "Press ~INPUT_CONTEXT~ to turn off the ~y~alarm~s~.",

        Location = vector3(-631.06042480469, -230.67230224609, 38.057056427002),

        Distance = 1.3,

        Job = "police",

        Callback = function()
            OpenStoreComputer()
        end
    }
}

-- These are the rewards available to get when performing a robbery. You will need to add these items to your database.sql
Config.Rewards = {
    "jewels",
    "dia_box",
    "goldwatch",
    "goldnecklace"
}

-- Do not touch any of these below.
Config.AnimSpeeds = {
    smash_case_necklace = 0.2,
    smash_case_e = 0.143,
    smash_case_tray_a = 0.168,
    smash_case_tray_b = 0.041
}

Config.Trays = {
    {
        Location = vector3(-627.735, -234.439, 37.875),
        SceneLocation = vector3(-628.187, -233.538, 37.0946),
        SceneRotation = vector3(0.0, 0.0, -144.0),
        Animation = "smash_case_necklace",
        Ray = "DES_Jewel_Cab",
        Something = "JWL_00"
    },
    {
        Location = vector3(-626.716, -233.685, 37.8583),
        SceneLocation = vector3(-627.136, -232.775, 37.0946),
        SceneRotation = vector3(0.0, 0.0, -144.0),
        Animation = "smash_case_necklace",
        Ray = "DES_Jewel_Cab",
        Something = "JWL_01"
    },
    {
        Location = vector3(-627.35, -234.947, 37.8531),
        SceneLocation = vector3(-626.62, -235.725, 37.0946),
        SceneRotation = vector3(0.0, 0.0, 36.0),
        Animation = "smash_case_tray_a",
        Ray = "DES_Jewel_Cab3",
        Something = "JWL_02"
    },
    {
        Location = vector3(-626.298, -234.193, 37.8492),
        SceneLocation = vector3(-625.57, -234.962, 37.0946),
        SceneRotation = vector3(0.0, 0.0, 36.0),
        Animation = "smash_case_tray_b",
        Ray = "DES_Jewel_Cab4",
        Something = "JWL_04"
    },
    {
        Location = vector3(-626.399, -239.132, 37.8616),
        SceneLocation = vector3(-626.894, -238.2, 37.0856),
        SceneRotation = vector3(0.0, 0.0, -144.0),
        Animation = "smash_case_e",
        Ray = "DES_Jewel_Cab2",
        Something = "JWL_05"
    },
    {
        Location = vector3(-625.376, -238.358, 37.8687),
        SceneLocation = vector3(-625.867, -237.458, 37.0946),
        SceneRotation = vector3(0.0, 0.0, -144.0),
        Animation = "smash_case_tray_a",
        Ray = "DES_Jewel_Cab3",
        Something = "JWL_06"
    },
    {
        Location = vector3(-625.517, -227.421, 37.86),
        SceneLocation = vector3(-624.738, -228.2, 37.0946),
        SceneRotation = vector3(0.0, 0.0, 36.0),
        Animation = "smash_case_tray_a",
        Ray = "DES_Jewel_Cab3",
        Something = "JWL_07"
    },
    {
        Location = vector3(-624.467, -226.653, 37.861),
        SceneLocation = vector3(-623.688, -227.437, 37.0946),
        SceneRotation = vector3(0.0, 0.0, 36.0),
        Animation = "smash_case_tray_b",
        Ray = "DES_Jewel_Cab4",
        Something = "JWL_08"
    },
    {
        Location = vector3(-623.8118, -228.6336, 37.8522),
        SceneLocation = vector3(-624.293, -227.831, 37.0946),
        SceneRotation = vector3(0.0, 0.0, -143.511),
        Animation = "smash_case_e",
        Ray = "DES_Jewel_Cab2",
        Something = "JWL_09"
    },
    {
        Location = vector3(-624.1267, -230.7476, 37.8618),
        SceneLocation = vector3(-624.939, -231.247, 37.0946),
        SceneRotation = vector3(0.0, 0.0, -54.13),
        Animation = "smash_case_tray_b",
        Ray = "DES_Jewel_Cab4",
        Something = "JWL_10"
    },
    {
        Location = vector3(-621.7181, -228.9636, 37.8425),
        SceneLocation = vector3(-620.864, -228.481, 37.0946),
        SceneRotation = vector3(0.0, 0.0, 126.925),
        Animation = "smash_case_tray_a",
        Ray = "DES_Jewel_Cab3",
        Something = "JWL_11"
    },
    {
        Location = vector3(-622.7541, -232.614, 37.8638),
        SceneLocation = vector3(-623.3596, -233.2296, 37.0946),
        SceneRotation = vector3(0.0, 0.0, -52.984),
        Animation = "smash_case_necklace",
        Ray = "DES_Jewel_Cab",
        Something = "JWL_12"
    },
    {
        Location = vector3(-620.3262, -230.829, 37.8578),
        SceneLocation = vector3(-619.408, -230.1969, 37.0946),
        SceneRotation = vector3(0.0, 0.0, 126.352),
        Animation = "smash_case_necklace",
        Ray = "DES_Jewel_Cab",
        Something = "JWL_13"
    },
    {
        Location = vector3(-620.6465, -232.9308, 37.8407),
        SceneLocation = vector3(-620.184, -233.729, 37.0946),
        SceneRotation = vector3(0.0, 0.0, 36.398),
        Animation = "smash_case_tray_b",
        Ray = "DES_Jewel_Cab4",
        Something = "JWL_14"
    },
    {
        Location = vector3(-619.978, -234.93, 37.8537),
        SceneLocation = vector3(-620.44, -234.084, 37.0946),
        SceneRotation = vector3(0, 0, -144),
        Ray = "DES_Jewel_Cab",
        Animation = "smash_case_necklace",
        Something = "JWL_15",
    },
    {
        Location = vector3(-618.937, -234.16, 37.8425),
        SceneLocation = vector3(-619.39, -233.32, 37.0946),
        SceneRotation = vector3(0, 0, -144),
        Ray = "DES_Jewel_Cab3",
        Animation = "smash_case_tray_a",
        Something = "JWL_16",
    },
    {
        Location = vector3(-620.163, -226.212, 37.8266),
        SceneLocation = vector3(-620.797, -226.79, 37.0946),
        SceneRotation = vector3(0, 0, -54),
        Ray = "DES_Jewel_Cab",
        Animation = "smash_case_necklace" ,
        Something = "JWL_17",
    },
    {
        Location = vector3(-619.384, -227.259, 37.8342),
        SceneLocation = vector3(-620.055, -227.817, 37.0856),
        SceneRotation = vector3(0, 0, -54),
        Ray = "DES_Jewel_Cab2",
        Animation = "smash_case_e",
        Something = "JWL_18",
    },
    {
        Location = vector3(-618.019, -229.115, 37.8302),
        SceneLocation = vector3(-618.679, -229.704, 37.0946),
        SceneRotation = vector3(0, 0, -54),
        Ray = "DES_Jewel_Cab3",
        Animation = "smash_case_tray_a",
        Something = "JWL_19",
    },
    {
        Location = vector3(-617.249, -230.156, 37.8201),
        SceneLocation = vector3(-617.937, -230.731, 37.0856),
        SceneRotation = vector3(0, 0, -54),
        Ray = "DES_Jewel_Cab2",
        Animation = "smash_case_e",
        Something = "JWL_20",
    }
}