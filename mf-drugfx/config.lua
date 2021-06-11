Config = {
  ESX = {
    Use               = true,                   -- NOTE: If you disable this (you're not using ESX), also comment out/remove the es_extended dependency from the fxmanifest.lua file.
    GetClientTrigger  = "esx:getSharedObject",  -- The event name to return the ESX object on the client side.
    GetServerTrigger  = "esx:getSharedObject",  -- ^ For server side.
  },

  Items = {
    ['weed'] = {
      name    = 'Weed',
      type    = 'herb',           -- links to drug presets.
      quality = 1.0,              -- quality of drug/effect strength modifier   float           (0.1 - 2.0)
      instant = false,            -- is effect instant?                         true or false
      sober   = false,            -- does this effect cancel all other effects? true or false
      effects = {  
        move_speed    = 0.5,      -- set player movement speed?  false or float  (0.0 - 2.0)
        add_armor     = 100,      -- add armor to player?        false or int    (0-100)
        add_health    = false,    -- add health to player?       false or int    (0-100)
        take_armor    = false,    -- take armor from player?     false or int    (0-100)
        take_health   = false,    -- take health from player?    false or int    (0-100)
        health_regen  = 0.0,      -- set health regen multi?     false or float  (0.0 - 2.0)
      },
      animation = {
        type      = "animation",        
        dict      = 'amb@world_human_smoking_pot@male@base', 
        anim      = 'base',
        blend_in  = 8.0,
        blend_out = -8.0,
        flag      = 48,
        start     = 0.0,
        prop      = 'p_cs_joint_01',
        bone      = 18905,
        wait      = true,
      },
    },
    ['joint2g'] = {
      name    = 'Joint',
      type    = 'herb',           -- links to drug presets.
      quality = 1.0,              -- quality of drug/effect strength modifier   float           (0.1 - 2.0)
      instant = false,            -- is effect instant?                         true or false
      sober   = false,            -- does this effect cancel all other effects? true or false
      effects = {  
        move_speed    = 0.25,      -- set player movement speed?  false or float  (0.0 - 2.0)
        add_armor     = false,      -- add armor to player?        false or int    (0-100)
        add_health    = false,    -- add health to player?       false or int    (0-100)
        take_armor    = false,    -- take armor from player?     false or int    (0-100)
        take_health   = false,    -- take health from player?    false or int    (0-100)
        health_regen  = 0.0,      -- set health regen multi?     false or float  (0.0 - 2.0)
      },
      animation = {
        type      = "animation",        
        dict      = 'amb@world_human_smoking_pot@male@base', 
        anim      = 'base',
        blend_in  = 8.0,
        blend_out = -8.0,
        flag      = 48,
        start     = 0.0,
        prop      = 'p_cs_joint_01',
        bone      = 18905,
        wait      = true,
      },
    },
    ['acid'] = {
      name    = 'Acid',
      type    = 'trip',         
      quality = 1.0,
      instant = false,
      sober   = false,
      effects = {      
        move_speed    = false, 
        add_armor     = false,
        add_health    = false,
        take_armor    = false,
        take_health   = false, 
        health_regen  = false, 
      },
      animation = {
        type      = "animation",        
        dict      = 'anim@mp_player_intcelebrationmale@face_palm', 
        anim      = 'face_palm',
        blend_in  = 8.0,
        blend_out = -8.0,
        flag      = 48,
        start     = 0.2,
        prop      = 'prop_cs_pills',
        bone      = 18905,
        wait      = true,
        pos       = vector3(0.05,0.0,0.05)
      },
    },
    ['mushroom'] = {
      name    = 'Mushrooms',
      type    = 'trip',         
      quality = 0.5,
      instant = false,
      sober   = false,
      effects = {      
        move_speed    = false, 
        add_armor     = false,
        add_health    = false,
        take_armor    = false,
        take_health   = false, 
        health_regen  = false, 
      },
      animation = {
        type      = "animation",        
        dict      = 'anim@mp_player_intcelebrationmale@face_palm', 
        anim      = 'face_palm',
        blend_in  = 8.0,
        blend_out = -8.0,
        flag      = 48,
        start     = 0.2,
        prop      = 'prop_cs_pills',
        bone      = 18905,
        wait      = true,
        pos       = vector3(0.05,0.0,0.05)
      },
    },   
    ['meth'] = {
      name    = 'Meth',
      type    = 'amp',         
      quality = 1.0,
      instant = true,
      sober   = false,
      effects = {      
        move_speed    = 2.0, 
        add_armor     = false,
        add_health    = false,
        take_armor    = 100,
        take_health   = false, 
        health_regen  = 1.0, 
      },
      animation = {  
        type      = "animation",        
        dict      = 'switch@trevor@trev_smoking_meth', 
        anim      = 'trev_smoking_meth_loop',
        blend_in  = 1.0,
        blend_out = 1.0,
        flag      = 49,
        start     = 0.0,
        prop      = 'prop_cs_meth_pipe',
        bone      = 28422,
        wait      = true,
        timeout   = 10000,
      },
    },
    ['cocaine'] = {
      name    = 'Cocaine',
      type    = 'amp',         
      quality = 1.0,
      instant = true,
      sober   = false,
      effects = {      
        move_speed    = 2.0, 
        add_armor     = false,
        add_health    = 100,
        take_armor    = 100,
        take_health   = false, 
        health_regen  = 2.0, 
      },
      animation = {
        type      = "animation",        
        dict      = 'anim@mp_player_intcelebrationmale@face_palm', 
        anim      = 'face_palm',
        blend_in  = 8.0,
        blend_out = -8.0,
        flag      = 48,
        start     = 0.2,
        prop      = 'prop_cs_pills',
        bone      = 18905,
        wait      = true,
        pos       = vector3(0.05,0.0,0.05)
      },
    },
  ['coke1g'] = {
    name    = 'Coke',
    type    = 'trip',         
    quality = 1.0,
    instant = true,
    sober   = false,
    effects = {      
      move_speed    = 2.0, 
      add_armor     = 20,
      add_health    = false,
      take_armor    = false,
      take_health   = false, 
      health_regen  = 1.0, 
    },
    animation = {
      type      = "animation",        
      dict      = 'anim@mp_player_intcelebrationmale@face_palm', 
      anim      = 'face_palm',
      blend_in  = 8.0,
      blend_out = -8.0,
      flag      = 48,
      start     = 0.2,
      prop      = 'prop_cs_pills',
      bone      = 18905,
      wait      = true,
      pos       = vector3(0.05,0.0,0.05)
    },
  },
    ['crack_cocaine'] = {
      name    = 'Crack Cocaine',
      type    = 'amp',         
      quality = 1.0,
      instant = true,
      sober   = false,
      effects = {      
        move_speed    = 2.0, 
        add_armor     = false,
        add_health    = 100,
        take_armor    = 100,
        take_health   = false, 
        health_regen  = 2.0, 
      },
      animation = {  
        type      = "animation",        
        dict      = 'switch@trevor@trev_smoking_meth', 
        anim      = 'trev_smoking_meth_loop',
        blend_in  = 1.0,
        blend_out = 1.0,
        flag      = 49,
        start     = 0.0,
        prop      = 'prop_cs_crackpipe',
        bone      = 28422,
        wait      = true,
        timeout   = 10000,
        rot       = vector3(0.0,270.0,0.0),
        pos       = vector3(0.0,-0.02,0.0)
      },
    },
    ['heroin'] = {
      name    = 'Heroin',
      type    = 'opioid',         
      quality = 1.0,
      instant = false,
      sober   = false,
      effects = {      
        move_speed    = false, 
        add_armor     = false,
        add_health    = false,
        take_armor    = false,
        take_health   = false, 
        health_regen  = false, 
      },
      animation = {
        type      = "animation",        
        dict      = 'rcmpaparazzo1ig_4', 
        anim      = 'miranda_shooting_up',
        blend_in  = 8.0,
        blend_out = -8.0,
        flag      = 48,
        start     = 0.55,
        prop      = 'p_syringe_01_s',
        bone      = 28422,
        wait      = true,
      },
    },
    ['adrenaline'] = {
      name    = 'Adrenaline',
      type    = 'medical',         
      quality = 1.0,
      instant = true,
      sober   = true,
      effects = {      
        move_speed    = 2.0, 
        add_armor     = 100,
        add_health    = false,
        take_armor    = false,
        take_health   = false, 
        health_regen  = false, 
      },
      animation = {
        type      = "animation",        
        dict      = 'rcmpaparazzo1ig_4', 
        anim      = 'miranda_shooting_up',
        blend_in  = 8.0,
        blend_out = -8.0,
        flag      = 48,
        start     = 0.55,
        prop      = 'p_syringe_01_s',
        bone      = 28422,
        wait      = true,
        timeout   = 5000,
      },
    },
    ['morphine'] = {
      name    = 'Morphine',
      type    = 'medical',         
      quality = 1.0,
      instant = true,
      sober   = true,
      effects = {      
        move_speed    = false, 
        add_armor     = false,
        add_health    = 100,
        take_armor    = 100,
        take_health   = false, 
        health_regen  = false, 
      },
      animation = {
        type      = "animation",        
        dict      = 'rcmpaparazzo1ig_4', 
        anim      = 'miranda_shooting_up',
        blend_in  = 8.0,
        blend_out = -8.0,
        flag      = 48,
        start     = 0.55,
        prop      = 'p_syringe_01_s',
        bone      = 28422,
        wait      = true,
        timeout   = 5000,
      },
    },
    ['beer'] = {
      name    = 'Beer',
      type    = 'alcohol',         
      quality = 1.0,
      instant = false,
      sober   = false,
      effects = {      
        move_speed    = 0.8, 
        add_armor     = 5,
        add_health    = false,
        take_armor    = false,
        take_health   = 5, 
        health_regen  = false, 
      },
      animation = {
        type      = "animation",        
        dict      = 'mp_player_intdrink', 
        anim      = 'loop_bottle',
        blend_in  = 8.0,
        blend_out = -8.0,
        flag      = 48,
        start     = 0.0,
        prop      = 'prop_beer_bottle',
        bone      = 18905,
        wait      = true,
        rot       = vector3(-90.0,10.0,-10.0),
        pos       = vector3(0.10,-0.1,0.01),
      },
    },
    ['wine'] = {
      name    = 'Wine',
      type    = 'alcohol',         
      quality = 1.0,
      instant = false,
      sober   = false,
      effects = {      
        move_speed    = 0.8, 
        add_armor     = 5,
        add_health    = false,
        take_armor    = false,
        take_health   = 5, 
        health_regen  = false, 
      },
      animation = {
        type      = "animation",        
        dict      = 'mp_player_intdrink', 
        anim      = 'loop_bottle',
        blend_in  = 8.0,
        blend_out = -8.0,
        flag      = 48,
        start     = 0.0,
        prop      = 'prop_drink_redwine',
        bone      = 18905,
        wait      = true,
        rot       = vector3(-90.0,10.0,-10.0),
        pos       = vector3(0.10,-0.1,0.01),
      },
    },
  },

  Presets = {
    trip = {
      {
        timecycle               = 'BikerFilter',      -- main timecycle modifier      false or string       (any timecycle filter)
        timecycle_min_strength  = 0.2,                -- timecycle max strength       false or float        (0.0 - 2.0)
        timecycle_max_strength  = 1.5,                -- timecycle max strength       false or float        (0.0 - 2.0)

        secondary_timecycle               = false,    -- secondary timecycle modifier false or string       (any timecycle filter)
        secondary_timecycle_min_strength  = false,    -- timecycle max strength       false or float        (0.0 - 2.0)
        secondary_timecycle_max_strength  = false,    -- timecycle max strength       false or float        (0.0 - 2.0)   

        cam_shake               = 'DRUNK_SHAKE',      -- Cam shake            false or string     (any defined cam shake)
        cam_shake_min_strength  = 1.0,                -- Cam shake min        false or float      (0.0 - 2.0)
        cam_shake_max_strength  = 1.5,                -- Cam shake max        false or float      (0.0 - 2.0)
        motion_blur             = true,               -- Set ped motion blur  false or true

        effect_timeout = 120 * 1000,                  -- default time for effect. Milliseconds.

        spawn_clone   = false,                        -- spawn clone?         true or false
        draw_toon     = {'mario'},                    -- draw toons?          false or table of strings (any defined toons in Drugs.Toons)
        toon_count    = 1,                            -- toons to draw?       false or int    (1 - 2)
        draw_box      = 20,                           -- draw 3d box?         false or int    (1 - 30)
        play_song     = 'files/they-exist.mp3',       -- play song during?    false or string (if using fivem-getwave, must be getwave file string (e.g: 'files/altar.mp3'), if not, must be youtube video ID)
        get_wave      = true,                         -- use fivem-getwave?   true or false
        song_start    = 0,                            -- start song at second int             (0 - SONG LENGTH)
        drunk_drive   = true, 
      },
      {
        timecycle               = 'BikerFilter',     
        timecycle_min_strength  = 0.5,                
        timecycle_max_strength  = 2.0,              

        secondary_timecycle               = false,
        secondary_timecycle_min_strength  = false,   
        secondary_timecycle_max_strength  = false,              

        cam_shake               = 'DRUNK_SHAKE',    
        cam_shake_min_strength  = 1.5,              
        cam_shake_max_strength  = 2.0,            
        motion_blur             = true,            

        effect_timeout = 120 * 1000,             

        spawn_clone   = false,                 
        draw_toon     = {'luigi'},              
        toon_count    = 1,                   
        draw_box      = 20,                       
        play_song     = 'files/altar.mp3',        
        get_wave      = true,                 
        song_start    = 50,                     
        drunk_drive   = true, 
      },
      {
        timecycle               = 'BikerFilter',     
        timecycle_min_strength  = 1.0,                
        timecycle_max_strength  = 2.5,              

        secondary_timecycle               = false,
        secondary_timecycle_min_strength  = false,   
        secondary_timecycle_max_strength  = false,  

        cam_shake               = 'DRUNK_SHAKE',     
        cam_shake_min_strength  = 2.0,              
        cam_shake_max_strength  = 2.5,              
        motion_blur             = true,           

        effect_timeout = 120 * 1000,              

        spawn_clone   = true,                        
        draw_toon     = {'yoshi'},                    
        toon_count    = 1,                          
        draw_box      = 20,                         
        play_song     = 'files/gone.mp3',            
        get_wave      = true,                        
        song_start    = 0,                            
        drunk_drive   = true, 
      }
    },
    herb = {
      {
        timecycle               = 'Spectator9', 
        timecycle_min_strength  = 0.5,               
        timecycle_max_strength  = 0.8,                          

        secondary_timecycle               = false,  
        secondary_timecycle_min_strength  = false,    
        secondary_timecycle_max_strength  = false,    

        cam_shake               = false,   
        cam_shake_min_strength  = false,           
        cam_shake_max_strength  = false,  
        motion_blur             = false,          

        effect_timeout = 120 * 1000,

        spawn_clone   = false,           
        draw_toon     = false, 
        toon_count    = false,       
        draw_box      = false,  
        play_song     = false, 
        song_start    = false, 
        drunk_drive   = false, 
      },
    },
    amp = {
      {
        timecycle               = 'rply_brightness',   
        timecycle_min_strength  = 0.8,               
        timecycle_max_strength  = 1.2,               

        secondary_timecycle               = false,  
        secondary_timecycle_min_strength  = false,    
        secondary_timecycle_max_strength  = false,    

        cam_shake               = false,   
        cam_shake_min_strength  = false,           
        cam_shake_max_strength  = false,  
        motion_blur             = false,          

        effect_timeout = 30 * 1000,

        spawn_clone   = false,           
        draw_toon     = false, 
        toon_count    = false,       
        draw_box      = false,  
        play_song     = false,   
        song_start    = false, 
        drunk_drive   = false, 
      }
    },
    opioid = {
      {
        timecycle               = 'Water_River',   
        timecycle_min_strength  = 0.8,               
        timecycle_max_strength  = 1.2,                 

        secondary_timecycle               = false,  
        secondary_timecycle_min_strength  = false,    
        secondary_timecycle_max_strength  = false,    

        cam_shake               = true,   
        cam_shake_min_strength  = 0.3,           
        cam_shake_max_strength  = 0.5,  
        motion_blur             = false,          

        effect_timeout = 120 * 1000,

        spawn_clone   = false,           
        draw_toon     = false, 
        toon_count    = false,       
        draw_box      = false,  
        play_song     = false,   
        song_start    = false, 
        drunk_drive   = false, 
      }
    },
    medical = {
      {
        timecycle               = false,   
        timecycle_min_strength  = false,               
        timecycle_max_strength  = false,               

        secondary_timecycle               = false,  
        secondary_timecycle_min_strength  = false,    
        secondary_timecycle_max_strength  = false,    

        cam_shake               = false,   
        cam_shake_min_strength  = false,           
        cam_shake_max_strength  = false,  
        motion_blur             = false,          

        effect_timeout = 5 * 1000,

        spawn_clone   = false,           
        draw_toon     = false, 
        toon_count    = false,       
        draw_box      = false,  
        play_song     = false,   
        song_start    = false, 
        drunk_drive   = false, 
      }
    },
    alcohol = {
      {
        timecycle               = 'Drug_deadman_blend',     
        timecycle_min_strength  = 0.5,              
        timecycle_max_strength  = 0.8,                

        secondary_timecycle               = false,  
        secondary_timecycle_min_strength  = false,    
        secondary_timecycle_max_strength  = false,   

        cam_shake               = 'DRUNK_SHAKE',     
        cam_shake_min_strength  = 1.0,               
        cam_shake_max_strength  = 1.5,                
        motion_blur             = true,               

        effect_timeout = 120 * 1000,                

        spawn_clone   = false,                       
        draw_toon     = false,                        
        toon_count    = false,                       
        draw_box      = false,                        
        play_song     = false,                        
        song_start    = false,                   
        drunk_drive   = true,                
      }
    },
  },

  DrivingIncidents = {
    --{interaction = 06, time = 1000},
    {interaction = 07, time = 800},
    {interaction = 08, time = 800},
    --{interaction = 10, time = 800}, 
    {interaction = 11, time = 800},
    {interaction = 20, time = 2000},
    --{interaction = 27, time = 1500},
    --{interaction = 31, time = 2000} 
  },
  --[[
    POSSIBLE NOTED DRIVING INTERACTIONS:

    '1   
    '3 - brake + reverse  
    '4 - turn left 90 + braking  
    '5 - turn right 90 + braking  
    '6 - brake strong (handbrake?) until time ends  
    '7 - turn left + accelerate  
    '7 - turn right + accelerate  
    '9 - weak acceleration  
    '10 - turn left + restore wheel pos to center in the end  
    '11 - turn right + restore wheel pos to center in the end  
    '13 - turn left + go reverse  
    '14 - turn left + go reverse  
    '16 - crash the game after like 2 seconds :)  
    '17 - keep actual state, game crashed after few tries  
    '18 - game crash  
    '19 - strong brake + turn left/right  
    '20 - weak brake + turn left then turn right  
    '21 - weak brake + turn right then turn left  
    '22 - brake + reverse  
    '23 - accelerate fast  
    '24   
    '25 - brake turning left then when almost stopping it turns left more  
    '26 - brake turning right then when almost stopping it turns right more  
    '27 - brake until car stop or until time ends  
    '28 - brake + strong reverse acceleration  
    '30 - performs a burnout (brake until stop + brake and accelerate)  
    '31 - accelerate + handbrake  
    '32 - accelerate very strong 
  ]]
}

if Config.ESX.Use then
  if IsDuplicityVersion() then
    TriggerEvent(Config.ESX.GetServerTrigger,function(obj) ESX = obj; end)
  else
    TriggerEvent(Config.ESX.GetClientTrigger,function(obj) ESX = obj; end)
  end
end
