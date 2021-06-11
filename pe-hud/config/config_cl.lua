Config              = {}

-- Variables (HUD)
Config.maxPlayers   = 75 -- Keep same as sv_maxclients within your server.cfg.
Config.hideArmor    = false
Config.hideOxygen   = false

Config.pulseHud     = true -- Pulse Effect when status is below the configured amount.
Config.pulseStart   = 35 -- Minimal value for pulse to start.

-- Wait times
Config.waitTime     = 400  -- Set to 100 so the hud is more fluid. However, performance will be affected.
Config.waitSpawn    = 5000 -- Time to set elements back to saved on spawn
Config.waitResource = 2000 -- Time to set elements back to saved after resource start

-- Variables (Controls)
Config.voiceKey     = 'h' -- Cycles through modes (has to match your voip script key)
Config.voiceKeySecondary = 'lftshift'
Config.openKey      = 'f7' -- Key for opening the customizing menu
Config.oxygenMax    = 4 -- Set to 10 / 4 if using vMenu

-- Variables (Framework)
Config.useESX       = true -- Change ESX config to true to use ESX (change ./html/js/config.js Config.useESX to true too)
Config.useStress    = false -- Use ESX stress by Utku (https://github.com/utkuali/Stress-System-by-utku)
