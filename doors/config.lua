TriggerEvent("esx:getSharedObject", function(obj) ESX = obj; end)

AuthorizedItems = {
  keys_missionrow_pd_front    = "Mission Row Key (Front)",
  keys_master_key_single_use  = "Master Key (Single Use)",
  keys_master_key             = "Master Key",
  keys_101foggyfoothills_key  = "101 Foggy Foot Hills",	 	 	 
  keys_1020banhamcanyondr_key = "1020 Banham Canyon Dr Key",	 	 	 
  keys_102foggyfoothills_key  = "102 Foggy Foot Hills",	 	 	 
  keys_1035zancudoave_key     = "1035 Zancudo Ave Key",	 	 	 
  keys_103foggyfoothills_key  = "103 Foggy Foot Hills",	 	 	 
  keys_104foggyfoothills_key  = "104 Foggy Foot Hills",	 	 	 
  keys_105foggyfoothills_key  = "105 Foggy Foot Hills",	 	 	 
  keys_106foggyfoothills_key  = "106 Foggy Foot Hills",	 	 	 
  keys_107foggyfoothills_key  = "107 Foggy Foot Hills",	 	 	 
  keys_126forumdrive_key      = "126 Forum Drive Key",	 	 	 
  keys_141suiteb_key          = "141 Suite B Key",	 	 	 
  keys_1954buenvinoroad_key   = "1954 Buen Vino Road Key",	 	 	 
  keys_1delperrofwy_key       = "1 Del Perro Fwy Key",	 	 	 
  keys_241baycityave_key      = "241 Bay City Avenue Key",	 	 	 
  keys_293lagunaplace_key     = "293 Laguna Place Key",	 	 	 
  keys_3761delperrofwy_key    = "3761 Del Perro Fwy Key",	 	 	 
  keys_381sanandreasave_key   = "Quartz Towers Key",	 	 	 
  keys_553portola_key         = "553 Portola Dr Key",	 	 	 
  keys_722senorard_key        = "La Fuente Blanca Key",	 	 	 
  keys_7709greatoceanhwy_key  = "7709 Great Ocean Highway Key",	 	 	 
  keys_811gomastreet_key      = "811 Goma Street Apt.B Key",	 	 	 
  keys_911buenvinoroad_key    = "911 Buen Vino Road Key",	 	 	 
  keys_dragstrip_key          = "Drag Strip Key",	 	 	 
  keys_equalitywayaptsa1_key  = "Equality Way Apartments A1 Key",	 	 	 
  keys_equalitywayaptsa2_key  = "Equality Way Apartments A2 Key",	 	 	 
  keys_equalitywayaptsb1_key  = "Equality Way Apartments B1 Key",	 	 	 
  keys_equalitywayaptsb2_key  = "Equality Way Apartments B2 Key",	 	 	 
  keys_equalitywayaptsc1_key  = "Equality Way Apartments C1 Key",	 	 	 
  keys_equalitywayaptsc2_key  = "Equality Way Apartments C2 Key",	 	 	 
  keys_grovestreetcustoms_key = "Grove Street Customs Key",	 	 	 	 	 	 	 	 	 
  keys_oasisarcade_key        = "Oasis Arcade Key",	 	 	 
  keys_oasiscityhall_key      = "Oasis City Hall Key",	 	 	 
  keys_pacallshippingdio_key  = "PacAll Shipping Key",	 	 	 
  keys_rodncams_key           = "Rod n Cams Muscles Key",	 	 	 
  keys_sahp_key               = "San Andreas Highway Patrol Key",	 	 	 
  keys_skybar_key             = "Sky Bar at the Elk Ridge Key",	 	 	 
  keys_switchinlaynez_key     = "Switchin Laynez Key",	 	 	 
  keys_vanillaunicorn_key     = "Vanilla Unicorn Key",	 	 	 
  keys_yachtclubunit110_key   = "110 Yacht Club Key",	 	 	 
  keys_yachtclubunit111_key   = "111 Yacht Club Key",	 	 	 
  keys_yachtclubunit112_key   = "112 Yacht Club Key",	 	 	 
  keys_yachtclubunit210_key   = "210 Yacht Club Key",	 	 	 
  keys_yachtclubunit211_key   = "211 Yacht Club Key",	 	 	 
  keys_yachtclubunit212_key   = "212 Yacht Club Key",	 	 	 
  keys_yachtclubunit310_key   = "310 Yacht Club Key",	 	 	 
  keys_yachtclubunit311_key   = "311 Yacht Club Key",	 	 	 
  keys_yachtclubunit312_key   = "312 Yacht Club Key",	 	 	 
  keys_police_key             = "POLICE",
  keys_ems_key                = "EMS",
  keys_mos_mech_key           = "Mosley Mechanic",
  keys_laynez_mech_key        = "Laynez Mechanic",
  keys_veg_mech_key           = "Vega's Mechanic",
  keys_mechanic_key           = "Mechanic",	 	 	 
  keys_city_council_key       = "City Council",
  keys_conquistador_key       = "Eye of Apollo",
  keys_playboy_key            = "648 Americano Way",
  keys_wholesale_key          = "Wholesale Access",
  keys_coco_key          = "CocoMotos Key",
}

-- Minigame Presets
Minigames = {
  ['Hacking'] = {
    item = 'hacking_laptop',
    options = {
      time        = {min = 10, max = 60, step = 2},
      letters     = {min = 02, max = 10, step = 1},
    }
  },
  ['Lockpick'] = {
    item = 'lockpick',
    options = {
      pins        = {min = 01, max = 10, step = 1},
    }
  },
  -- Uncomment minigames that you own/want to use.
  --[[
  ['LockpickV2'] = {
    item = 'lockpickv2'
  },
  ['Thermite'] = {
    item = 'thermite',
    options = {      
      difficulty   = {min = 0.1, max = 1.0, step = 0.1},
      speed_scale  = {min = 0.1, max = 2.0, step = 0.1},
      score_inc    = {min = 0.1, max = 1.0, step = 0.1},
    }
  },  
  ]]
}

-- Translate here.
Labels = {
  unlock            = "Unlock",
  lock              = "Lock",
  do_unlock         = "[~r~E~s~] ",
  do_lock           = "[~g~E~s~] ",
  access_granted    = "~g~Access Granted.~s~",
  access_denied     = "~r~Access Denied.~s~",
  key_shop_3dtxt    = "[~g~E~s~] Key Shop",
  key_shop_helptxt  = "~INPUT_PICKUP~ Key Shop",
  key_shop_bliptxt  = "Key Shop",
  no_bank_acc       = "Could not find bank account.",
  police_warning    = "Somebody is attempting to break into a door at %s. \nPress ~INPUT_PICKUP~ to set GPS."
}
   
Controls = {
  TextOffset = {
    ["height"] = {
      codes = {81,82},
      text = "Height -/+",
    },
    ["forward"] = {
      codes = {172,173},
      text = "Forward/Back",
    },
    ["right"] = {
      codes = {174,175},
      text = "Right/Left",
    },
    ["done"] = {
      codes = {191},
      text = "Done",
    },
  },
}

Config = {  
  -- ESX bank account name.
  BankAccountName = "bank",

  -- Warn police when a minigame/break in attempt has failed?
  WarnPoliceOnFail = true,

  -- Warn police wehn a minigame/break in attempt has succeeded?
  WarnPoliceOnSuccess = true,

  -- How long should we give the police to react to said notification? (Seconds).
  PoliceNotifyTimer = 15,

  -- Jobs to notify with above interactions.
  PoliceJobs = {
    police  = {min_rank = 0},
  },

  -- These jobs can access any door that allows raid access.
  RaidAccess = {
    police   = {min_rank = 0},
  },

  -- Chunking effects MS usage with lots of doors.
  Chunking = {
    -- The acceptable range for doors to be considered for primary chunk.
    -- Reduce range to reduce MS.
    range     = 50.0,

    -- Timer: the time between re-chunks.
    -- Increase timer to reduce MS but also reduce overall "responsiveness" of mod.
    timer     = 5000,

    -- Movement: distance before chunking is reconsidered (overwriting timer).
    -- Increase movement to reduce MS, but too a high a value may cause unforseen effects with player teleportation.
    movement  = 50.0,
  },

  Shops = {
    -- Wouldn't use more then a few shops personally. Try your luck though.
    {
      -- Distance to interact.
      interact_dist = 2.0,

      -- Distance to consider for rendering.
      render_dist   = 20.0,

      -- Shop Location
      location = vector3(-1301.21,-569,40.37),

      -- Use 3D Text?
      draw_text     = true,
      text_to_draw  = Labels.key_shop_3dtxt,
      text_offset   = vector3(0.0,0.0,0.5),

      -- Use Help Text?
      draw_help     = true,
      help_to_draw  = Labels.key_shop_helptxt,

      -- Marker Info
      draw_marker   = true,
      marker_type   = 1,
      marker_color  = {r = 255,g = 255,b = 255,a = 50},
      marker_scale  = {x = 1.0,y = 1.0,z = 1.0},
      marker_offset = vector3(0.0,0.0,-1.0),

      -- Blip Info
      --draw_blip         = true,
      --blip_sprite       = 186,
      --blip_color        = 0,
      --blip_scale        = 0.8,
      --blip_text         = Labels.key_shop_bliptxt,
      --blip_display      = 2,
      --blip_short_range  = false,
      --blip_high_detail  = true,

      -- Content of Shop
      content = {
        {
          -- Item name (relevant to database item names).
          item_name  = "keys_missionrow_pd_front",

          -- Item label (purely for menu).
          item_label = "Mission Row PD Keys (Front)",

          -- Derp?
          item_price = 500000,

          -- Is this item restricted to authorized jobs below?
          restricted = false,
          auth_jobs = {
            police    = {min_rank = 0},
            mechanic  = {min_rank = 2},
          },
        },
        {
          item_name  = "keys_master_key",
          item_label = "Master Key",
          item_price = 500000,

          restricted = false,
          auth_jobs = {
            police    = {min_rank = 5},
          },
        },
        {
          item_name  = "keys_master_key_single_use",
          item_label = "Master Key (Single Use)",
          item_price = 500000,

          restricted = false,
          auth_jobs = {
            police    = {min_rank = 4},
          },
        },
        {
          item_name  = "keys_101foggyfoothills_key",
          item_label = "Foggy Foothills 101",
          item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_1020banhamcanyondr_key",
           item_label = "1020 Banham Canyon Dr",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_102foggyfoothills_key",
           item_label = "Foggy Foothills 102",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_1035zancudoave_key",
           item_label = "1035 Zancudo Ave Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_103foggyfoothills_key",
           item_label = "Foggy Foothills 103",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_104foggyfoothills_key",
           item_label = "Foggy Foothills 104",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
         },
        {
           item_name  = "keys_105foggyfoothills_key",
           item_label = "Foggy Foothills 105",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_106foggyfoothills_key",
           item_label = "Foggy Foothills 106",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_107foggyfoothills_key",
           item_label = "Foggy Foothills 107",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_126forumdrive_key",
           item_label = "126 Forum Drive Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_141suiteb_key",
           item_label = "141 Suite B Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_1954buenvinoroad_key",
           item_label = "1954 Buen Vino Road Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_1delperrofwy_key",
           item_label = "1 Del Perro Fwy Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_241baycityave_key",
           item_label = "241 Bay City Avenue Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_293lagunaplace_key",
           item_label = "293 Laguna Place Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_3761delperrofwy_key",
           item_label = "3761 Del Perro Fwy Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_381sanandreasave_key",
           item_label = "Quartz Towers Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_553portola_key",
           item_label = "553 Portola Dr Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_722senorard_key",
           item_label = "La Fuente Blanca Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_7709greatoceanhwy_key",
           item_label = "7709 Great Ocean Highway Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_811gomastreet_key",
           item_label = "811 Goma Street Apt.B Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_911buenvinoroad_key",
           item_label = "911 Buen Vino Road Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_dragstrip_key",
           item_label = "Drag Strip Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_equalitywayaptsa1_key",
           item_label = "Equality Way Apartments A1 Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_equalitywayaptsa2_key",
           item_label = "Equality Way Apartments A2 Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_equalitywayaptsb1_key",
           item_label = "Equality Way Apartments B1 Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_equalitywayaptsb2_key",
           item_label = "Equality Way Apartments B2 Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_equalitywayaptsc1_key",
           item_label = "Equality Way Apartments C1 Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_equalitywayaptsc2_key",
           item_label = "Equality Way Apartments C2 Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_grovestreetcustoms_key",
           item_label = "Grove Street Customs Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_oasisarcade_key",
           item_label = "Oasis Arcade Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_oasiscityhall_key",
           item_label = "Oasis City Hall Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_pacallshippingdio_key",
           item_label = "PacAll Shipping Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_rodncams_key",
           item_label = "Rod n Cams Muscles Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_sahp_key",
           item_label = "San Andreas Highway Patrol Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_skybar_key",
           item_label = "Sky Bar at the Elk Ridge Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_switchinlaynez_key",
           item_label = "Switchin Laynez Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_vanillaunicorn_key",
           item_label = "Vanilla Unicorn Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_yachtclubunit110_key",
           item_label = "110 Yacht Club Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_yachtclubunit111_key",
           item_label = "111 Yacht Club Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_yachtclubunit112_key",
           item_label = "112 Yacht Club Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_yachtclubunit210_key",
           item_label = "210 Yacht Club Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_yachtclubunit211_key",
           item_label = "211 Yacht Club Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_yachtclubunit212_key",
           item_label = "212 Yacht Club Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_yachtclubunit310_key",
           item_label = "310 Yacht Club Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_yachtclubunit311_key",
           item_label = "311 Yacht Club Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_yachtclubunit312_key",
           item_label = "312 Yacht Club Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
        {
           item_name  = "keys_yellow_jack_key",
           item_label = "Yellow Jack Inn Key",
           item_price = 25,

          restricted = false,
          auth_jobs = {
            realestateagent = {min_rank = 3},
          },
        },
      },
    },
  },

  Doors = {
    { -- Jail Main Gate
      locked = true,
      interact_in_veh = true,

      dist = 20.0,
      draw = 10.0,

      text_loc = vector3(1844.998,2608.50,46.00),

      allow_raid = true,
      auth_jobs = {
        boling    = {min_rank = 0},
        offboling    = {min_rank = 0},
      },

      auth_items = {
        keys_master_key_single_use  = {take_item = true},
        keys_master_key             = {take_item = false},
      },

      can_break = true,
      break_items = {
        lockpick        = {minigame = "Lockpick",   take_item = false, take_on_fail = true},
        hacking_laptop  = {minigame = "Hacking",    take_item = false, take_on_fail = true},
        --lockpickv2      = {minigame = "LockpickV2", take_item = false, take_on_fail = true},
        --thermite        = {minigame = "Thermite",   take_item = false, take_on_fail = false},
      },

      hacking_preset = {
        time    = 35,
        letters = 7,
      },

      lockpick_preset = {
        pins = 4
      },

      thermite_preset = {  
        difficulty        = 0.5,
        speed_scale       = 1.5,
        score_inc         = 0.5,
      },

      objects = {
        {
          reposition = true,
          door_model = GetHashKey('prop_gate_prison_01'),
          door_loc   = vector3(1844.998,2604.810,44.638),
          door_rot   = vector3(0.0,0.0,90.0),
        },
      }
    },

    { -- Jail Gate 2
      locked = true,
      interact_in_veh = true,

      dist = 20.0,
      draw = 10.0,

      text_loc = vector3(1818.542,2608.512,46.011),

      allow_raid = true,
      auth_jobs = {
        boling    = {min_rank = 0},
        offboling    = {min_rank = 0},
      },

      auth_items = {
        keys_master_key_single_use  = {take_item = true},
        keys_master_key             = {take_item = false},
      },

      can_break = true,
      break_items = {
        lockpick        = {minigame = "Lockpick",   take_item = false, take_on_fail = true},
        hacking_laptop  = {minigame = "Hacking",    take_item = false, take_on_fail = true},
        --lockpickv2      = {minigame = "LockpickV2", take_item = false, take_on_fail = true},
        --thermite        = {minigame = "Thermite",   take_item = false, take_on_fail = false},
      },

      hacking_preset = {
        time    = 35,
        letters = 7,
      },

      lockpick_preset = {
        pins = 4
      },

      thermite_preset = {  
        difficulty        = 0.5,
        speed_scale       = 1.5,
        score_inc         = 0.5,
      },

      objects = {
        {
          reposition = true,
          door_model = GetHashKey('prop_gate_prison_01'),
          door_loc   = vector3(1818.542,2604.812,44.611),
          door_rot   = vector3(0.0,0.0,90.0),
        },
      }
    },

    {    

      dist = 5.0,
      draw = 10.0,  
      auth_jobs = {
        police = {min_rank = 4},
      },
      break_items = {
        lockpick = false,
        thermite = {minigame = 'Thermite',take_on_fail = false,take_item = false},
        hacking_laptop = false,
        lockpickv2 = false,
      },
      locked = true,
      thermite_preset = {
        score_inc = 1,
        difficulty = 0.5,
        speed_scale = 0.5,
      },
      interact_in_veh = true,
      text_loc = vector3(22.14923, 6433.033, 31.37436),
      can_break = true,
      objects = {
        [1] = {
          door_rot = vector3(0, 0, 44.99994),
          door_loc = vector3(22.14923, 6433.033, 30.41879),
          reposition = false,
          door_model = -2007495856,
        },
      },
      allow_raid = true,
    }
  }
}

mLibs = exports["meta_libs"]