Fishing = {}

Fishing.IsFishing = false
Fishing.FishesAvailableAtHookDepth = {}
Fishing.FishesAvailable = false

--[[
 ██╗ ██╗  ██╗ ██╗     ██╗   ██╗ █████╗ ██████╗ ███████╗     ██╗ ██╗  ██╗ ██╗ 
████████╗████████╗    ██║   ██║██╔══██╗██╔══██╗██╔════╝    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ██║   ██║███████║██████╔╝███████╗    ╚██╔═██╔╝╚██╔═██╔╝
████████╗████████╗    ╚██╗ ██╔╝██╔══██║██╔══██╗╚════██║    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝     ╚████╔╝ ██║  ██║██║  ██║███████║    ╚██╔═██╔╝╚██╔═██╔╝
 ╚═╝ ╚═╝  ╚═╝ ╚═╝       ╚═══╝  ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝     ╚═╝ ╚═╝  ╚═╝ ╚═╝                                                                            
--]]

Fishing.CurrentRodSetup = {
  rodobj   = false,
  rodtype  = false,
  bait     = false,
  line     = false,
  reel     = false,
  hook     = false  
}

Fishing.MiniGameSettings = {
  OverallEquipmentStrength = false,
  FishStrength             = false,
  FishFightChance          = false,
  ReelSpeed                = false,
  FishSpeed                = false, 
  MiniGameDifficulty       = false,
  HookDepth                = false,
  WaterDepth               = false,
  RewardFish               = false,
}


--[[
 ██╗ ██╗  ██╗ ██╗     ███╗   ██╗██╗   ██╗██╗    ███████╗██╗   ██╗███████╗███╗   ██╗████████╗███████╗     ██╗ ██╗  ██╗ ██╗ 
████████╗████████╗    ████╗  ██║██║   ██║██║    ██╔════╝██║   ██║██╔════╝████╗  ██║╚══██╔══╝██╔════╝    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ██╔██╗ ██║██║   ██║██║    █████╗  ██║   ██║█████╗  ██╔██╗ ██║   ██║   ███████╗    ╚██╔═██╔╝╚██╔═██╔╝
████████╗████████╗    ██║╚██╗██║██║   ██║██║    ██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║╚██╗██║   ██║   ╚════██║    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ██║ ╚████║╚██████╔╝██║    ███████╗ ╚████╔╝ ███████╗██║ ╚████║   ██║   ███████║    ╚██╔═██╔╝╚██╔═██╔╝
 ╚═╝ ╚═╝  ╚═╝ ╚═╝     ╚═╝  ╚═══╝ ╚═════╝ ╚═╝    ╚══════╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝     ╚═╝ ╚═╝  ╚═╝ ╚═╝                                                                                                                          
--]]

-- Open the rod loadout UI --
Fishing.OpenLoadout = function()
  Fishing.Callback("Fishing:GetFishingItems", function(allFishingItems)
    allFishingItems['rod'] = Fishing.CurrentRodSetup.rodtype
    SendNUIMessage({
      message  = "Open",
      items    = allFishingItems,
      rod      = Fishing.CurrentRodSetup,
      ui       = "loadout",
    })
    SetNuiFocus(true,true)
  end)
end 


RegisterNUICallback('setitem',function(data) 
  TriggerServerEvent("Fishing:RemoveItem", data.item)
  Fishing.CurrentRodSetup[data.type] = data.item
end)

RegisterNUICallback('unsetitem',function(data)
  Fishing.CurrentRodSetup[data.type] = false
  TriggerServerEvent("Fishing:AddItem", data.item)
end)


-- Close UI from Loadout ---- Also used if someone pulls rod out water throughout minigame. 
RegisterNUICallback('closed',function(data)
  Fishing.SettingDepth = false
  SetNuiFocus(false,false)
  ClearPedTasks(GetPlayerPed(-1))
  if data then 
    if data.notif == true then 
      Fishing.ShowNotification(data.text)
    end
  end
  Fishing.RodInHand()
end)
--- MINIGAME CALLBACKS

Fishing.OpenUI = function(depth)
  SendNUIMessage({
    message   = "depth",
    ui        = "minigame",
    maxDepth  = depth,
    reelDepth = Config.FishingEquipment['reel'][Fishing.CurrentRodSetup.reel].DepthLimit,
    HookDepth  = Fishing.MiniGameSettings.HookDepth, 
    reelSpeed = Fishing.MiniGameSettings.ReelSpeed,
  })
  SetNuiFocus(true,true)

  Fishing.SettingDepth = true
  while Fishing.SettingDepth do
    Fishing.ShowHelpNotification("~INPUT_MOVE_UP_ONLY~ Reel in\n~INPUT_MOVE_DOWN_ONLY~ Reel out")
    Wait(0)
  end
end

--- when a fish is biting
RegisterNUICallback('biting',function(data)
  Fishing.SettingDepth = false
  SetNuiFocus(false,false)
  Fishing.MiniGameSettings.HookDepth = data.depth 
  Fishing.GetFishies()
  if #Fishing.FishesAvailableAtCurrentHookDepth >= 1 then 
    Fishing.MiniGameSettings.RewardFish = Fishing.FishesAvailableAtCurrentHookDepth[math.random(#Fishing.FishesAvailableAtCurrentHookDepth)]
    Fishing.CalculateMiniGameSettings() 
    if Fishing.MiniGameSettings.RewardFish == "Fishing.Whale" then 
      if Config.ChanceWhalePullsYouIn >= math.random(100) then 
        Fishing.BeJonah()
      else
        Fishing.StartMinigame()
      end
    else
      Fishing.StartMinigame()
    end
  else 
    local FacingWater,depth = Fishing.CheckNearWater()
    Fishing.ShowNotification("No fish biting. Rethink your rod setup/depth?")
    Fishing.OpenUI(depth)
  end
end)

Fishing.StartMinigame = function()
  SetNuiFocus(true,true)
  SendNUIMessage({
    message   = "minigame",
    ui        = "minigame",
    fishSpeed = Fishing.MiniGameSettings.FishSpeed,
    fishStrength = Fishing.MiniGameSettings.FishStrength,
    equipStrength = Fishing.MiniGameSettings.OverallEquipmentStrength,
    fightChance = Fishing.MiniGameSettings.FishFightChance,
  })
end

-- Event on Successful Catch

RegisterNUICallback('success',function()
  SetNuiFocus(false,false)
  ClearPedTasks(GetPlayerPed(-1))
  Fishing.ShowNotification(string.format("You have caught a %s", Config.FishTypes[Fishing.MiniGameSettings.RewardFish].Name))
  Fishing.ThrowFishAtPlayer()
  TriggerServerEvent("Fishing:AddItem",Fishing.MiniGameSettings.RewardFish)
  Fishing.RemoveBait()
  Fishing.ShowNotification('Your bait has come off you will have to rebait!')
  Fishing.RodInHand()
end)

RegisterNUICallback('failed',function()
  SetNuiFocus(false,false)
  ClearPedTasks(GetPlayerPed(-1))
  if Config.ChanceOfEquipmentBreakOnFail >= math.random(100) then 
    Fishing.ShowNotification("You broke your line. Please set your rod back up.")
    Fishing.CurrentRodSetup.hook = false
    Fishing.CurrentRodSetup.line = false
    Fishing.RemoveBait()
  end
  Fishing.RodInHand()
end)


--[[
 ██╗ ██╗  ██╗ ██╗      ██████╗  █████╗ ███╗   ███╗███████╗    ███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗     ██╗ ██╗  ██╗ ██╗ 
████████╗████████╗    ██╔════╝ ██╔══██╗████╗ ████║██╔════╝    ██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ██║  ███╗███████║██╔████╔██║█████╗      ███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗    ╚██╔═██╔╝╚██╔═██╔╝
████████╗████████╗    ██║   ██║██╔══██║██║╚██╔╝██║██╔══╝      ╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗    ███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║    ╚██╔═██╔╝╚██╔═██╔╝
 ╚═╝ ╚═╝  ╚═╝ ╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝     ╚═╝ ╚═╝  ╚═╝ ╚═╝ 
                                                                                                                                                    
--]]

Fishing.CalculateMiniGameSettings = function()
  
  Fishing.MiniGameSettings.RewardFish = Fishing.FishesAvailableAtCurrentHookDepth[math.random(#Fishing.FishesAvailableAtCurrentHookDepth)]
  Fishing.MiniGameSettings.FishStrength = Config.FishTypes[Fishing.MiniGameSettings.RewardFish].Strength
  Fishing.MiniGameSettings.FishSpeed = Config.FishTypes[Fishing.MiniGameSettings.RewardFish].Speed
  Fishing.MiniGameSettings.FishFightChance = Config.FishTypes[Fishing.MiniGameSettings.RewardFish].ChanceOfFight
  Fishing.OverallEquipmentStrength()
  Fishing.GetDifficultyDifference()  
end

Fishing.GetDifficultyDifference = function()
  -- Gets the difficulty by comparing the difference between fish strength and OverallEquipmentStrength
  local Decrease = Fishing.MiniGameSettings.OverallEquipmentStrength - Fishing.MiniGameSettings.FishStrength
  local Difficulty = Decrease/Fishing.MiniGameSettings.OverallEquipmentStrength * 100
  Fishing.MiniGameSettings.MiniGameDifficulty = Difficulty/100
end

Fishing.OverallEquipmentStrength = function()
  local RodStrength  = Config.FishingEquipment['rodtype'][Fishing.CurrentRodSetup.rodtype].Strength
  local HookStrength = Config.FishingEquipment['hook'][Fishing.CurrentRodSetup.hook].Strength
  local ReelStrength = Config.FishingEquipment['reel'][Fishing.CurrentRodSetup.reel].Strength
  local LineStrength = Config.FishingEquipment['line'][Fishing.CurrentRodSetup.line].Strength
  Fishing.MiniGameSettings.OverallEquipmentStrength = RodStrength + HookStrength + ReelStrength + LineStrength  
end

--[[
 ██╗ ██╗  ██╗ ██╗     ███████╗ ██████╗ ██╗   ██╗██╗██████╗ ███╗   ███╗███████╗███╗   ██╗████████╗    ███████╗██╗   ██╗███╗   ██╗ ██████╗███████╗     ██╗ ██╗  ██╗ ██╗ 
████████╗████████╗    ██╔════╝██╔═══██╗██║   ██║██║██╔══██╗████╗ ████║██╔════╝████╗  ██║╚══██╔══╝    ██╔════╝██║   ██║████╗  ██║██╔════╝██╔════╝    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    █████╗  ██║   ██║██║   ██║██║██████╔╝██╔████╔██║█████╗  ██╔██╗ ██║   ██║       █████╗  ██║   ██║██╔██╗ ██║██║     ███████╗    ╚██╔═██╔╝╚██╔═██╔╝
████████╗████████╗    ██╔══╝  ██║▄▄ ██║██║   ██║██║██╔═══╝ ██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║       ██╔══╝  ██║   ██║██║╚██╗██║██║     ╚════██║    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ███████╗╚██████╔╝╚██████╔╝██║██║     ██║ ╚═╝ ██║███████╗██║ ╚████║   ██║       ██║     ╚██████╔╝██║ ╚████║╚██████╗███████║    ╚██╔═██╔╝╚██╔═██╔╝
 ╚═╝ ╚═╝  ╚═╝ ╚═╝     ╚══════╝ ╚══▀▀═╝  ╚═════╝ ╚═╝╚═╝     ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝       ╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝╚══════╝     ╚═╝ ╚═╝  ╚═╝ ╚═╝                                                                                                                                                                     
--]]

Fishing.AbandonRod = function()
  DeleteEntity(Fishing.CurrentRodSetup.rodobj)
  Fishing.CurrentRodSetup.rodobj  = false
  Fishing.CurrentRodSetup.rodtype = false
  for k,v in pairs(Fishing.CurrentRodSetup) do 
    if v ~= false and k ~= 'rodobj' and k ~= 'rodtype' then 
      TriggerServerEvent("Fishing:AddItem", v)
        SendNUIMessage({
          message  = "Clear",
          name    = v,
          type      = k,
          ui       = "loadout",
        })
      v = false
    end
  end
end

Fishing.RemoveBait = function()
  SendNUIMessage({
    message  = "ClearBait",
    name    = Fishing.CurrentRodSetup.bait,
    type      = "bait",
    ui       = "loadout",

  })
  Fishing.CurrentRodSetup.bait = false
end

Fishing.TakeOutRod = function(rodtype, rodname)
  if Config.UsingESX then    
    ESX.UI.Menu.CloseAll()
  else
    TriggerEvent("Inventory:CloseInventory")
  end

  if Fishing.CurrentRodSetup.rodobj == false then 
    if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
      local ped = GetPlayerPed(-1)
      local pedPos = GetEntityCoords(ped)
      local fishingRodHash = `prop_fishing_rod_01`

      Fishing.WaitForModel(fishingRodHash)
     
      local rodHandle = CreateObject(fishingRodHash, pedPos, true)
      Fishing.CurrentRodSetup.rodobj = rodHandle

      AttachEntityToEntity(rodHandle, ped, GetPedBoneIndex(ped, 18905), 0.1, 0.05, 0, 80.0, 120.0, 160.0, true, true, false, true, 1, true)

      SetModelAsNoLongerNeeded(fishingRodHash)
      Fishing.CurrentRodSetup.rodtype = rodtype
      Fishing.ShowNotification('You have taken out your '..rodname..'.')
      Fishing.RodInHand()
    else
      Fishing.ShowNotification("You can't take your rod out in the car.")
    end
  else
    Fishing.ShowNotification('You are already holding a '..rodname..'.')
  end
end

RegisterNetEvent("FishingSim:TakeOutRod")
AddEventHandler("FishingSim:TakeOutRod", Fishing.TakeOutRod)

RegisterNetEvent("Fishing:AbandonRod")
AddEventHandler("Fishing:AbandonRod", Fishing.AbandonRod)

--[[
 ██╗ ██╗  ██╗ ██╗     ██████╗  ██████╗ ██████╗     ██╗███╗   ██╗    ██╗  ██╗ █████╗ ███╗   ██╗██████╗      ██╗ ██╗  ██╗ ██╗ 
████████╗████████╗    ██╔══██╗██╔═══██╗██╔══██╗    ██║████╗  ██║    ██║  ██║██╔══██╗████╗  ██║██╔══██╗    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ██████╔╝██║   ██║██║  ██║    ██║██╔██╗ ██║    ███████║███████║██╔██╗ ██║██║  ██║    ╚██╔═██╔╝╚██╔═██╔╝
████████╗████████╗    ██╔══██╗██║   ██║██║  ██║    ██║██║╚██╗██║    ██╔══██║██╔══██║██║╚██╗██║██║  ██║    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ██║  ██║╚██████╔╝██████╔╝    ██║██║ ╚████║    ██║  ██║██║  ██║██║ ╚████║██████╔╝    ╚██╔═██╔╝╚██╔═██╔╝
 ╚═╝ ╚═╝  ╚═╝ ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═════╝     ╚═╝╚═╝  ╚═══╝    ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝      ╚═╝ ╚═╝  ╚═╝ ╚═╝                                                                                                                           
--]]

Fishing.RodInHand = function()
  while true do 
    Wait(1)
    Fishing.ShowHelpNotification("Press ~INPUT_TALK~ to try and cast your line.\nPress ~INPUT_SPECIAL_ABILITY_SECONDARY~ to modfiy your rod.\nPress ~INPUT_CREATOR_DELETE~ to cancel. ")
    if IsControlJustPressed(0,46) then 
      if Fishing.CanFish() then 
        local ped = GetPlayerPed(-1)
        if Fishing.IsFishing then return end
        Fishing.IsFishing = true

        Fishing.PlayAnimation(ped, "mini@tennis", "forehand_ts_md_far", {
            ["flag"] = 48
        })

        while IsEntityPlayingAnim(ped, "mini@tennis", "forehand_ts_md_far", 3) do
            Wait(0)
        end

        Fishing.PlayAnimation(ped, "amb@world_human_stand_fishing@idle_a", "idle_c", {
            ["flag"] = 11
        })

        local startedBaiting = GetGameTimer()
        local TimeToHook = math.random(Config.MinTimeToCatch * 1000, Config.MaxTimeToCatch * 1000)
        local FacingWater,depth = Fishing.CheckNearWater()
        Fishing.MiniGameSettings.ReelSpeed = Config.FishingEquipment['reel'][Fishing.CurrentRodSetup.reel].Speed
        --Fishing.CalculateMiniGameSettings()
        Fishing.OpenUI(depth)
        Fishing.IsFishing = false
        break
      end
    end

    if IsControlJustPressed(0,256) then
      Fishing.CancelFishing()
      Fishing.IsFishing = false
      break
    end 

    if IsControlJustPressed(0,29) then 
      Fishing.OpenLoadout()
      Fishing.IsFishing = false
      break
    end
  end
end

Fishing.CancelFishing = function()
  Fishing.AbandonRod()
  ClearPedTasks(GetPlayerPed(-1))
end

--[[
 ██╗ ██╗  ██╗ ██╗      ██████╗██╗  ██╗███████╗ ██████╗██╗  ██╗███████╗     ██╗ ██╗  ██╗ ██╗ 
████████╗████████╗    ██╔════╝██║  ██║██╔════╝██╔════╝██║ ██╔╝██╔════╝    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ██║     ███████║█████╗  ██║     █████╔╝ ███████╗    ╚██╔═██╔╝╚██╔═██╔╝
████████╗████████╗    ██║     ██╔══██║██╔══╝  ██║     ██╔═██╗ ╚════██║    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ╚██████╗██║  ██║███████╗╚██████╗██║  ██╗███████║    ╚██╔═██╔╝╚██╔═██╔╝
 ╚═╝ ╚═╝  ╚═╝ ╚═╝      ╚═════╝╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚══════╝     ╚═╝ ╚═╝  ╚═╝ ╚═╝                                                                                             
--]]

Fishing.RodReady = function()
  local Ready = true
  for k,v in pairs(Fishing.CurrentRodSetup) do 
    if v == false then 
      Ready = false
    end
  end
  return Ready
end

Fishing.CanFish = function()
  if not IsPedSwimming(GetPlayerPed(-1)) then 
    if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then    
      local FacingWater,depth = Fishing.CheckNearWater()
      if FacingWater ~= false then 
        if Fishing.RodReady() then 
          MaxDepth = Config.FishingEquipment['reel'][Fishing.CurrentRodSetup.reel].DepthLimit
          randomDepth = math.random(MaxDepth)
          hookDepth   = math.min(depth,randomDepth)  
          Fishing.MiniGameSettings.HookDepth = math.floor(hookDepth + 0.5)
          return true
        else
          Fishing.ShowNotification('You are going to need to set up your rod properly before you cast.')
          return false
        end
      else
        Fishing.ShowNotification('You need to be facing water in order to cast your line.')
        return false
      end
    else
      Fishing.ShowNotification("You cant fish from a vehicle.")
      return false
    end
  else
    Fishing.ShowNotification('You cant swim and fish.')
    return false
  end
end

Fishing.GetFishies = function()
  local res = {}
  for fish,fishType in pairs(Config.FishTypes) do
    for _,baitType in ipairs(fishType.BaitTypes) do
      if baitType == Fishing.CurrentRodSetup.bait then 
        if Fishing.MiniGameSettings.HookDepth >= fishType.Depth then 
          if Fishing.MiniGameSettings.HookDepth <= fishType.DepthLimit then
            for k,v in ipairs(fishType.HookTypes) do
              if v == Fishing.CurrentRodSetup.hook then 
                Fishing.FishesAvailable = true 
                table.insert(res, fish)
              end
            end
          end
        end
      end
    end
  end
  Fishing.FishesAvailableAtCurrentHookDepth = res
end

Fishing.CheckNearWater = function()
  local ped = PlayerPedId()
  local pos = GetEntityCoords(ped) + (GetEntityForwardVector(ped) * 5.0)
  local zone = GetLabelText(GetNameOfZone(pos.x,pos.y,pos.z)):lower()

  local ray = StartShapeTestRay(pos.x,pos.y,pos.z+10.0, pos.x,pos.y,pos.z-1000.0, -1, ped, 1)
  local ret,hit,endPos,surfaceNorm,mat = GetShapeTestResultIncludingMaterial(ray)

  local material = Enums.Materials[mat%0x100000000]
  if material then
    material = material:lower()
    if material:find("wet") or material:find("water") or material:find("deep") or zone:find("river") or zone:find("sea") or zone:find("ocean") or zone:find("creek") then -- 412
      local r,d = GetWaterHeight(pos.x,pos.y,pos.z)
      local depth = #(vector3(endPos.x,endPos.y,d) - endPos)

      if depth < 0.1 and depth > -0.1 then
        depth = 0.1
      end

      if depth > 10.0 then
        if not zone:find("sea") and not zone:find("ocean") then
          depth = 5.0
        end
      end
      Fishing.MiniGameSettings.WaterDepth = math.floor(depth + 0.5)
      return true,math.floor(depth + 0.5)
    else
      Fishing.MiniGameSettings.WaterDepth = 0.0
      return false,0.0
    end
  else
    Fishing.MiniGameSettings.WaterDepth = 10000.0
    return true,10000.0
  end
end

--[[
 ██╗ ██╗  ██╗ ██╗      █████╗ ███╗   ██╗██╗███╗   ███╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗     ██╗ ██╗  ██╗ ██╗ 
████████╗████████╗    ██╔══██╗████╗  ██║██║████╗ ████║██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ███████║██╔██╗ ██║██║██╔████╔██║███████║   ██║   ██║██║   ██║██╔██╗ ██║    ╚██╔═██╔╝╚██╔═██╔╝
████████╗████████╗    ██╔══██║██║╚██╗██║██║██║╚██╔╝██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ██║  ██║██║ ╚████║██║██║ ╚═╝ ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║    ╚██╔═██╔╝╚██╔═██╔╝
 ╚═╝ ╚═╝  ╚═╝ ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝     ╚═╝ ╚═╝  ╚═╝ ╚═╝ 
                                                                                                                   
--]]
 
Fishing.PlayAnimation = function(ped, dict, anim, settings)
	if dict then
    Citizen.CreateThread(function()
      RequestAnimDict(dict)

      while not HasAnimDictLoaded(dict) do
          Wait(100)
      end

      if settings == nil then
          TaskPlayAnim(ped, dict, anim, 1.0, -1.0, 1.0, 0, 0, 0, 0, 0)
      else 
          local speed = 1.0
          local speedMultiplier = -1.0
          local duration = 1.0
          local flag = 0
          local playbackRate = 0

          if settings["speed"] then
              speed = settings["speed"]
          end

          if settings["speedMultiplier"] then
              speedMultiplier = settings["speedMultiplier"]
          end

          if settings["duration"] then
              duration = settings["duration"]
          end

          if settings["flag"] then
              flag = settings["flag"]
          end

          if settings["playbackRate"] then
              playbackRate = settings["playbackRate"]
          end

          TaskPlayAnim(ped, dict, anim, speed, speedMultiplier, duration, flag, playbackRate, 0, 0, 0)
      end

      RemoveAnimDict(dict)
		end)
	else
		TaskStartScenarioInPlace(ped, anim, 0, true)
	end
end

--[[
 ██╗ ██╗  ██╗ ██╗     ███╗   ██╗ ██████╗ ████████╗██╗███████╗██╗ ██████╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗     ██╗ ██╗  ██╗ ██╗ 
████████╗████████╗    ████╗  ██║██╔═══██╗╚══██╔══╝██║██╔════╝██║██╔════╝██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ██╔██╗ ██║██║   ██║   ██║   ██║█████╗  ██║██║     ███████║   ██║   ██║██║   ██║██╔██╗ ██║███████╗    ╚██╔═██╔╝╚██╔═██╔╝
████████╗████████╗    ██║╚██╗██║██║   ██║   ██║   ██║██╔══╝  ██║██║     ██╔══██║   ██║   ██║██║   ██║██║╚██╗██║╚════██║    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ██║ ╚████║╚██████╔╝   ██║   ██║██║     ██║╚██████╗██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║███████║    ╚██╔═██╔╝╚██╔═██╔╝
 ╚═╝ ╚═╝  ╚═╝ ╚═╝     ╚═╝  ╚═══╝ ╚═════╝    ╚═╝   ╚═╝╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝     ╚═╝ ╚═╝  ╚═╝ ╚═╝ 
                                                                                                                                             
--]]

Fishing.NotifyCops = function()
  for _,Cops in pairs(Config.Cops) do 
   -- TriggerServerEvent('nc-trackables:DoNotify', ...)
   exports['core_dispach']:addCall("Fish", "Fishermen", {
    {icon="fa-fish", info= "Something about fish is happening"},
    }, {0,0,0}, "police", 3000, 11, 5 )
   --## Add your own cop notification event here. If you do not know what you are doing ask for commmunity help in the discord. 
  end
end

Fishing.ShowNotification = function(msg)
  AddTextEntry('fishing_notification', msg)
  SetNotificationTextEntry('fishing_notification')
  DrawNotification(false, true)
end

Fishing.ShowHelpNotification = function(msg)
  AddTextEntry('fishing_help_notification', msg)
  DisplayHelpTextThisFrame('fishing_help_notification', false)
end

--[[
 ██╗ ██╗  ██╗ ██╗     ██╗   ██╗████████╗██╗██╗     ███████╗     ██╗ ██╗  ██╗ ██╗ 
████████╗████████╗    ██║   ██║╚══██╔══╝██║██║     ██╔════╝    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ██║   ██║   ██║   ██║██║     ███████╗    ╚██╔═██╔╝╚██╔═██╔╝
████████╗████████╗    ██║   ██║   ██║   ██║██║     ╚════██║    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ╚██████╔╝   ██║   ██║███████╗███████║    ╚██╔═██╔╝╚██╔═██╔╝
 ╚═╝ ╚═╝  ╚═╝ ╚═╝      ╚═════╝    ╚═╝   ╚═╝╚══════╝╚══════╝     ╚═╝ ╚═╝  ╚═╝ ╚═╝ 
                                                                                 
--]]

Fishing.Callback = function(name,cb,...)
  if Config.UsingESX then
    ESX.TriggerServerCallback(name,cb,...)
  else
    nCore.Callback(name,cb,...)
  end
end

Fishing.WaitForModel = function(model)
  if not IsModelValid(model) then
      return
  end

  if not HasModelLoaded(model) then
    RequestModel(model)
  end

  while not HasModelLoaded(model) do
    Wait(0)
  end
end

--[[
 ██╗ ██╗  ██╗ ██╗     ██████╗          ██╗ ██████╗ ███╗   ██╗ █████╗ ██╗  ██╗     ██╗ ██╗  ██╗ ██╗ 
████████╗████████╗    ██╔══██╗         ██║██╔═══██╗████╗  ██║██╔══██╗██║  ██║    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ██████╔╝         ██║██║   ██║██╔██╗ ██║███████║███████║    ╚██╔═██╔╝╚██╔═██╔╝
████████╗████████╗    ██╔══██╗    ██   ██║██║   ██║██║╚██╗██║██╔══██║██╔══██║    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ██████╔╝    ╚█████╔╝╚██████╔╝██║ ╚████║██║  ██║██║  ██║    ╚██╔═██╔╝╚██╔═██╔╝
 ╚═╝ ╚═╝  ╚═╝ ╚═╝     ╚═════╝      ╚════╝  ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝  ╚═╝     ╚═╝ ╚═╝  ╚═╝ ╚═╝ 
                                                                                                   
--]]

Fishing.BeJonah = function()
  --## Take entire set up
  for k,v in pairs(Fishing.CurrentRodSetup) do 
    v = false
    Fishing.PreviousSetup[k] = v
  end
  Fishing.WhaleModel = 'a_c_humpback'
  Fishing.WhaleHash  = GetHashKey(Fishing.WhaleModel)

  RequestModel(Fishing.WhaleHash)
  while not HasModelLoaded(Fishing.WhaleHash) do Wait(0) end

  local ped = PlayerPedId()
  local pos = GetEntityCoords(ped)
  local fwd = GetEntityForwardVector(ped)
  local targetPos = pos+(fwd*10.0)
  local head = GetEntityHeading(ped)

  local force = 2.0
  local dir   = vector3(0.0,0.0,10.0)*force

  SetPedToRagdoll(ped,100,0,0,false,false,false)
  Wait(0)

  ApplyForceToEntity(ped, 3, dir.x,dir.y,dir.z, 0.0,0.0,0.0, 0, false,false,true,false,true)
  Wait(100)

  dir = (targetPos - pos)*force
  ApplyForceToEntity(ped, 3, dir.x,dir.y,dir.z, 0.0,0.0,0.0, 0, false,false,true,false,true)

  targetPos = pos+(fwd*30.0)
  Fishing.Whale = CreatePed(28, Fishing.WhaleHash, targetPos.x,targetPos.y,-4.0, head-180.0, true,true)
  while not DoesEntityExist(Fishing.Whale) do Wait(0) end

  SetEntityAsMissionEntity(Fishing.Whale,true,true)
  TaskGoToEntity(Fishing.Whale,ped,-1,1.0,2.0,1073741824,0)  

  while not IsPedSwimming(ped) do Wait(0) end
  TriggerServerEvent("InteractSound_SV:PlayOnOne",GetPlayerServerId(PlayerId()),'Fishing.Whale',0.7)
  Wait(100)

  ApplyForceToEntity(ped, 3, 0.0,0.0,-100.0, 0.0,0.0,0.0, 0, false,false,true,false,true)
  Wait(500)

  DoScreenFadeOut(1000)
  Wait(1000)

  SetPlayerInvincible(PlayerId(),true)
  Wait(5000)

  targetPos = vector3(-3186.4697265625,770.73327636719,2.9782388210297)
  SetEntityCoords(ped,targetPos.x,targetPos.y,targetPos.z)

  targetPos = vector3(-3184.5104492188,765.33923339844,5.7522916793823)
  SetEntityCoords(Fishing.Whale,targetPos.x,targetPos.y,targetPos.z)
  SetEntityHeading(Fishing.Whale,0.0)
  SetEntityHealth(Fishing.Whale,0)

  SetPedToRagdoll(ped,5000,0,0,false,false,false)
  Wait(2000)

  DoScreenFadeIn(2500)
  Wait(2500) 

  SetEntityAsMissionEntity(Fishing.Whale,false,false)
  SetEntityAsNoLongerNeeded(Fishing.Whale)
  SetPlayerInvincible(PlayerId(),false)

  local infront = Fishing.GetCoordsInfront(Fishing.Whale)
  local _,z = GetGroundZFor_3dCoord(infront.x,infront.y,infront.z + 10.0,0)
  local marker = {
    display  = false,
    control  = 38,
    location = vector3(infront.x,infront.y,z + 0.5),
    maintext = "Hack Up",
    scale    = {0.0,0.0,0.0},
    distance = 1.0,
    callback = Fishing.ChopWhale,
    args     = {}
  }
  TriggerEvent("Markers:Add",marker,function(marker_id)
    Fishing.Marker = marker_id
  end)
end

Fishing.ChopWhale = function()
  TriggerEvent("Markers:Remove",Fishing.Marker)
  Fishing.HackUpWhale()
  
end

Fishing.GetCoordsInfront = function(ent)
  local dmin,dmax = GetModelDimensions(GetEntityModel(ent))
  return GetEntityCoords(ent) + ((GetEntityForwardVector(ent) * dmax.y) * 0.5)
end

Fishing.HackUpWhale = function(ent)
  if Config.ChanceOfCopNotifyWhaleChop >= math.random(100) then 
    Fishing.NotifyCops()
  end
  local ped = PlayerPedId()
  TaskTurnPedToFaceEntity(ped,ent,-1)
  Wait(1000)

  local ad = 'amb@world_human_hammering@male@base'
  RequestAnimDict(ad)
  while not HasAnimDictLoaded(ad) do 
    RequestAnimDict(ad) 
    Wait(0) 
  end

  local prop = CreateObject(`prop_w_me_hatchet`, 0, 0, 0, true, true, true)
  SetEntityAsMissionEntity(prop,true,true)
  AttachEntityToEntity(prop, ped, GetPedBoneIndex(ped, 57005), 0.15, -0.02, -0.02, 350.0, 100.00, 280.0, true, true, false, true, 1, true)
  
  local maxChops = math.random(5,15)
  for i=1,maxChops,1 do
    TaskPlayAnim(ped, ad, 'base', 8.0, 8.0, -1, 80, 0, 0, 0, 0)
    Wait(2500)
    ClearPedTasks(ped)
    Wait(500)
  end
  DeleteEntity(Fishing.Whale)

  DetachEntity(prop,1,true)
  DeleteEntity(prop)
  if Config.ReturnRodFromWhale then
    for k,v in pairs(Fishing.PreviousSetup) do 
      TriggerServerEvent("Fishing:AddItem", v)
    end
  end
end

--[[
 ██╗ ██╗  ██╗ ██╗     ████████╗██╗  ██╗██████╗  ██████╗ ██╗    ██╗    ███████╗██╗███████╗██╗  ██╗     ██╗ ██╗  ██╗ ██╗ 
████████╗████████╗    ╚══██╔══╝██║  ██║██╔══██╗██╔═══██╗██║    ██║    ██╔════╝██║██╔════╝██║  ██║    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝       ██║   ███████║██████╔╝██║   ██║██║ █╗ ██║    █████╗  ██║███████╗███████║    ╚██╔═██╔╝╚██╔═██╔╝
████████╗████████╗       ██║   ██╔══██║██╔══██╗██║   ██║██║███╗██║    ██╔══╝  ██║╚════██║██╔══██║    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝       ██║   ██║  ██║██║  ██║╚██████╔╝╚███╔███╔╝    ██║     ██║███████║██║  ██║    ╚██╔═██╔╝╚██╔═██╔╝
 ╚═╝ ╚═╝  ╚═╝ ╚═╝        ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝  ╚══╝╚══╝     ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝     ╚═╝ ╚═╝  ╚═╝ ╚═╝ 
                                                                                                                       
--]]

Fishing.ThrowFishAtPlayer = function()
  local fishModel = 'a_c_fish'
  local fishHash  = GetHashKey(fishModel)

  RequestModel(fishHash)
  while not HasModelLoaded(fishHash) do Wait(0) end

  local ped     = PlayerPedId()
  local pedPos  = GetEntityCoords(ped)
  local pedHead = GetEntityHeading(ped)
  local fishPos = pedPos + (GetEntityForwardVector(ped) * 3) - vector3(0.0,0.0,0.5)

  local fish = CreatePed(4, fishHash, fishPos.x,fishPos.y,fishPos.z, pedHead-180.0, false,false)
  SetEntityHealth(fish,0)
  while not DoesEntityExist(fish) do Wait(100) end
  Wait(100)

  local force     = 500.0
  local dir       = ((pedPos + vector3(0.0,0.0,2.5)) - fishPos)*force--norm((pedPos + vector3(0.0,0.0,0.5)) - fishPos)*force

  ApplyForceToEntity(fish, 2, dir.x,dir.y,dir.z, 0.0,0.0,0.0, 0, false,false,true,false,true)

  Wait(500)

  SetEntityAsMissionEntity(fish,true,true)
  DeleteEntity(fish)
end

--[[
 ██╗ ██╗  ██╗ ██╗     ███╗   ███╗ █████╗ ████████╗███████╗██████╗ ██╗ █████╗ ██╗     ███████╗    ██╗      ██████╗  ██████╗ ██╗ ██████╗     ██╗ ██╗  ██╗ ██╗ 
████████╗████████╗    ████╗ ████║██╔══██╗╚══██╔══╝██╔════╝██╔══██╗██║██╔══██╗██║     ██╔════╝    ██║     ██╔═══██╗██╔════╝ ██║██╔════╝    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ██╔████╔██║███████║   ██║   █████╗  ██████╔╝██║███████║██║     ███████╗    ██║     ██║   ██║██║  ███╗██║██║         ╚██╔═██╔╝╚██╔═██╔╝
████████╗████████╗    ██║╚██╔╝██║██╔══██║   ██║   ██╔══╝  ██╔══██╗██║██╔══██║██║     ╚════██║    ██║     ██║   ██║██║   ██║██║██║         ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ██║ ╚═╝ ██║██║  ██║   ██║   ███████╗██║  ██║██║██║  ██║███████╗███████║    ███████╗╚██████╔╝╚██████╔╝██║╚██████╗    ╚██╔═██╔╝╚██╔═██╔╝
 ╚═╝ ╚═╝  ╚═╝ ╚═╝     ╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚══════╝╚══════╝    ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝ ╚═════╝     ╚═╝ ╚═╝  ╚═╝ ╚═╝ 
                                                                                                                                                            
--]]

local _Enums = {
  Materials = {
    Default = -1775485061, 
    Concrete = 1187676648, 
    ConcretePothole = 359120722, 
    ConcreteDusty = -1084640111, 
    Tarmac = 282940568, 
    TarmacPainted = -1301352528, 
    TarmacPothole = 1886546517, 
    RumbleStrip = -250168275, 
    BreezeBlock = -954112554, 
    Rock = -840216541, 
    RockMossy = -124769592, 
    Stone = 765206029, 
    Cobblestone = 576169331, 
    Brick = 1639053622, 
    Marble = 1945073303, 
    PavingSlab = 1907048430, 
    SandstoneSolid = 592446772, 
    SandstoneBrittle = 1913209870, 
    SandLoose = -1595148316, 
    SandCompact = 510490462, 
    SandWet = 909950165, 
    SandTrack = -1907520769, 
    SandUnderwater = -1136057692, 
    SandDryDeep = 509508168, 
    SandWetDeep = 1288448767, 
    Ice = -786060715, 
    IceTarmac = -1931024423, 
    SnowLoose = -1937569590, 
    SnowCompact = -878560889, 
    SnowDeep = 1619704960, 
    SnowTarmac = 1550304810, 
    GravelSmall = 951832588, 
    GravelLarge = 2128369009, 
    GravelDeep = -356706482, 
    GravelTrainTrack = 1925605558, 
    DirtTrack = -1885547121, 
    MudHard = -1942898710, 
    MudPothole = 312396330, 
    MudSoft = 1635937914, 
    MudUnderwater = -273490167, 
    MudDeep = 1109728704, 
    Marsh = 223086562, 
    MarshDeep = 1584636462, 
    Soil = -700658213, 
    ClayHard = 1144315879, 
    ClaySoft = 560985072, 
    GrassLong = -461750719, 
    Grass = 1333033863, 
    GrassShort = -1286696947, 
    Hay = -1833527165, 
    Bushes = 581794674, 
    Twigs = -913351839, 
    Leaves = -2041329971, 
    Woodchips = -309121453, 
    TreeBark = -1915425863, 
    MetalSolidSmall = -1447280105, 
    MetalSolidMedium = -365631240, 
    MetalSolidLarge = 752131025, 
    MetalHollowSmall = 15972667, 
    MetalHollowMedium = 1849540536, 
    MetalHollowLarge = -583213831, 
    MetalChainlinkSmall = 762193613, 
    MetalChainlinkLarge = 125958708, 
    MetalCorrugatedIron = 834144982, 
    MetalGrille = -426118011, 
    MetalRailing = 2100727187, 
    MetalDuct = 1761524221, 
    MetalGarageDoor = -231260695, 
    MetalManhole = -754997699, 
    WoodSolidSmall = -399872228, 
    WoodSolidMedium = 555004797, 
    WoodSolidLarge = 815762359, 
    WoodSolidPolished = 126470059, 
    WoodFloorDusty = -749452322, 
    WoodHollowSmall = 1993976879, 
    WoodHollowMedium = -365476163, 
    WoodHollowLarge = -925419289, 
    WoodChipboard = 1176309403, 
    WoodOldCreaky = 722686013, 
    WoodHighDensity = -1742843392, 
    WoodLattice = 2011204130, 
    Ceramic = -1186320715, 
    RoofTile = 1755188853, 
    RoofFelt = -1417164731, 
    Fibreglass = 1354180827, 
    Tarpaulin = -642658848, 
    Plastic = -2073312001, 
    PlasticHollow = 627123000, 
    PlasticHighDensity = -1625995479, 
    PlasticClear = -1859721013, 
    PlasticHollowClear = 772722531, 
    PlasticHighDensityClear = -1338473170, 
    FibreglassHollow = -766055098, 
    Rubber = -145735917, 
    RubberHollow = -783934672, 
    Linoleum = 289630530, 
    Laminate = 1845676458, 
    CarpetSolid = 669292054, 
    CarpetSolidDusty = 158576196, 
    CarpetFloorboard = -1396484943, 
    Cloth = 122789469, 
    PlasterSolid = -574122433, 
    PlasterBrittle = -251888898, 
    CardboardSheet = 236511221, 
    CardboardBox = -1409054440, 
    Paper = 474149820, 
    Foam = 808719444, 
    FeatherPillow = 1341866303, 
    Polystyrene = -1756927331, 
    Leather = -570470900, 
    Tvscreen = 1429989756, 
    SlattedBlinds = 673696729, 
    GlassShootThrough = 937503243, 
    GlassBulletproof = 244521486, 
    GlassOpaque = 1500272081, 
    Perspex = -1619794068, 
    CarMetal = -93061983, 
    CarPlastic = 2137197282, 
    CarSofttop = -979647862, 
    CarSofttopClear = 2130571536, 
    CarGlassWeak = 1247281098, 
    CarGlassMedium = 602884284, 
    CarGlassStrong = 1070994698, 
    CarGlassBulletproof = -1721915930, 
    CarGlassOpaque = 513061559, 
    Water = 435688960, 
    Blood = 5236042, 
    Oil = -634481305, 
    Petrol = -1634184340, 
    FreshMeat = 868733839, 
    DriedMeat = -1445160429, 
    EmissiveGlass = 1501078253, 
    EmissivePlastic = 1059629996, 
    VfxMetalElectrified = -309134265, 
    VfxMetalWaterTower = 611561919, 
    VfxMetalSteam = -691277294, 
    VfxMetalFlame = 332778253, 
    PhysNoFriction = 1666473731, 
    PhysGolfBall = -1693813558, 
    PhysTennisBall = -256704763, 
    PhysCaster = -235302683, 
    PhysCasterRusty = 2016463089, 
    PhysCarVoid = 1345867677, 
    PhysPedCapsule = -291631035, 
    PhysElectricFence = -1170043733, 
    PhysElectricMetal = -2013761145, 
    PhysBarbedWire = -1543323456, 
    PhysPooltableSurface = 605776921, 
    PhysPooltableCushion = 972939963, 
    PhysPooltableBall = -748341562, 
    Buttocks = 483400232, 
    ThighLeft = -460535871, 
    ShinLeft = 652772852, 
    FootLeft = 1926285543, 
    ThighRight = -236981255, 
    ShinRight = -446036155, 
    FootRight = -1369136684, 
    Spine0 = -1922286884, 
    Spine1 = -1140112869, 
    Spine2 = 1457572381, 
    Spine3 = 32752644, 
    ClavicleLeft = -1469616465, 
    UpperArmLeft = -510342358, 
    LowerArmLeft = 1045062756, 
    HandLeft = 113101985, 
    ClavicleRight = -1557288998, 
    UpperArmRight = 1501153539, 
    LowerArmRight = 1777921590, 
    HandRight = 2000961972, 
    Neck = 1718294164, 
    Head = -735392753, 
    AnimalDefault = 286224918, 
    CarEngine = -1916939624, 
    Puddle = 999829011, 
    ConcretePavement = 2015599386, 
    BrickPavement = -1147361576, 
    PhysDynamicCoverBound = -2047468855, 
    VfxWoodBeerBarrel = 998201806, 
    WoodHighFriction = -2140087047, 
    RockNoinst = 127813971, 
    BushesNoinst = 1441114862, 
    MetalSolidRoadSurface = -729112334, 
    StuntRampSurface = -2088174996, 
    Temp01 = 746881105, 
    Temp02 = -1977970111, 
    Temp03 = 1911121241, 
    Temp04 = 1923995104, 
    Temp05 = -1393662448, 
    Temp06 = 1061250033, 
    Temp07 = -1765523682, 
    Temp08 = 1343679702, 
    Temp09 = 1026054937, 
    Temp10 = 63305994, 
    Temp11 = 47470226, 
    Temp12 = 702596674, 
    Temp13 = -1637485913, 
    Temp14 = -645955574, 
    Temp15 = -1583997931, 
    Temp16 = -1512735273, 
    Temp17 = 1011960114, 
    Temp18 = 1354993138, 
    Temp19 = -801804446, 
    Temp20 = -2052880405, 
    Temp21 = -1037756060, 
    Temp22 = -620388353, 
    Temp23 = 465002639, 
    Temp24 = 1963820161, 
    Temp25 = 1952288305, 
    Temp26 = -1116253098, 
    Temp27 = 889255498, 
    Temp28 = -1179674098, 
    Temp29 = 1078418101, 
    Temp30 = 13626292 
  }
}

Enums = {}
for type,enums in pairs(_Enums) do
  Enums[type] = {}
  for label,hash in pairs(enums) do
    Enums[type][label]            = hash%0x100000000
    Enums[type][label:lower()]    = hash%0x100000000
    Enums[type][label:upper()]    = hash%0x100000000
    Enums[type][hash%0x100000000] = label
  end
end