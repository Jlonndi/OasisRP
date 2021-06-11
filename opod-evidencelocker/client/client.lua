ESX              = nil
local PlayerData, targetIndex, isAllowed, isInMarker, isRobbing, Lang, playerCoords, EvidenceBlip, pCoords, explosives = {}, nil, false, false, false, Locales[Config.language], nil

CT(function() while ESX == nil do TE(Config.SharedObject, function(obj) ESX = obj end) Citizen.Wait(5) end end)

RNE('esx:playerLoaded', function(xPlayer) PlayerData = xPlayer end)
RNE('esx:setJob', function(job) PlayerData.job = job for _, job in ipairs(Config.WhitelistedJobs) do if PlayerData.job.name == job then isAllowed = true break else isAllowed = false end end end)

Citizen.CreateThread(function()
    while true do
        playerCoords = GetEntityCoords(PlayerPedId())
        Citizen.Wait(250)
    end
end)

Citizen.CreateThread(function()
    while playerCoords == nil do Citizen.Wait(50) end
    for k, locker in pairs(Config.LockerLocations) do
        local model = GetHashKey(locker.model)
        local evidenceLocker = GetClosestObjectOfType(locker.pos, 5.0, model, 0, 1, 1)
        if evidenceLocker then
            while ESX == nil do
                Citizen.Wait(5)
            end
            Citizen.Wait(50)
            ESX.Game.DeleteObject(evidenceLocker)
        end
        local thermite = ESX.Game.GetClosestObject(playerCoords, {[GetHashKey('hei_prop_heist_thermite')] = true, [GetHashKey('prop_c4_final')] = true})
        ESX.Game.DeleteObject(thermite)
        local obj =  CreateObject(model, locker.pos.xy, locker.pos.z - 1, 0, 0, 1)
        PlaceObjectOnGroundProperly(obj)
        FreezeEntityPosition(obj, true)
        SetEntityHeading(obj, locker.h)
        SetModelAsNoLongerNeeded(model)
    end
end)

CT(function()
    while ESX == nil do Citizen.Wait(5) end
    while PlayerData.job == nil do PlayerData.job = ESX.GetPlayerData().job Citizen.Wait(500)  end
    while playerCoords == nil do Citizen.Wait(50) end
    for _, job in ipairs(Config.WhitelistedJobs) do if PlayerData.job.name == job then isAllowed = true break else isAllowed = false end end
        while true do
            Citizen.Wait(9)
            for k, locker in pairs(Config.LockerLocations) do
                if (not Config.MainLockerRaid) or (Config.MainLockerRaid and k == 'MainLocker' and not isAllowed) or (isAllowed) then
                local dist = #(playerCoords - locker.pos)
                    if dist < 100.0 then
                        if not isRobbing and dist > locker.radius - 1 and dist < locker.radius then
                            if not Config.Use3DText then
                                DrawMarker(27, locker.pos.xy, locker.pos.z - 0.9, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, locker.radius, locker.radius, 1.0, 255, 0, 0, 30, 0, 0, 1, 0, nil, nil, 0)
                            end
                        elseif dist < locker.radius - 1 then
                            local str = Lang['open_locker']
                            if isAllowed or not locker.isLocked then
                            if Config.UseCustomNames then str = string.format(Lang['open_custom_locker'], locker.label) end
                            elseif locker.isLocked then str = Lang['rob_locker'] end
                            if not locker.isLocked and isAllowed then
                            str = str .. Lang['lock_evidence']
                            end
                            if not isRobbing then
                                if Config.Use3DText then
                                    str = string.gsub(str, "~INPUT_CONTEXT~", '~y~E~w~')
                                    str = string.gsub(str, "~INPUT_CELLPHONE_CAMERA_FOCUS_LOCK~", '~y~L~w~')
                                    ESX.Game.Utils.DrawText3D(vector3(locker.pos.xy, locker.pos.z), str, 1.2, 4)
                                else
                                    ESX.ShowHelpNotification(str) Citizen.Wait(5)
                                end
                            end
                            targetIndex = k
                        elseif targetIndex ~= nil and not isRobbing and #(playerCoords - locker['pos']) >= locker['radius'] then
                            targetIndex = nil
                        end
                    end
                end
            end
      end
end)
    
RNE('opod-evidencelocker:currentlyRobbing', function(curLocker)
    isRobbing, targetIndex = true, curLocker
    TE('opod-evidencelocker:plantExplosive', curLocker)
end)

RNE('opod-evidencelocker:startTimer', function(target)
    local timer = Config.RobberyLength * 60
    if target == 'MainLocker' then timer = Config.MainLockerRobberyLength * 60 end
    
    CT(function()
        while timer > 0 and isRobbing do
            Citizen.Wait(1000)

            if timer > 0 then
                timer = timer - 1
            end
        end
    end)

    CT(function()
        if target == 'MainLocker' then
            SendNUIMessage({type = 'progressStart', timeout = Config.MainLockerRobberyLength * 1000 * 60})
        else
            SendNUIMessage({type = 'progressStart', timeout = Config.RobberyLength * 1000 * 60})
        end
    end)
end)

CT(function()
    while playerCoords == nil do Citizen.Wait(50) end
    while true do
        if targetIndex ~= nil then
            if IsControlJustReleased(0, 38) then
                if targetIndex ~= nil and isAllowed or not Config.LockerLocations[targetIndex].isLocked then
                    if Config.UseESXInventory then
                        ESX.TriggerServerCallback("opod-evidencelocker:getLockerInventory", function(inventory)
                            TE("esx_inventoryhud:openEvidenceInventory", inventory, targetIndex)
                        end, targetIndex)
                    else OpenEvidenceLocker(targetIndex) end
                elseif Config.LockerLocations[targetIndex].isLocked and not isRobbing then
                    if (Config.MainLockerRaid and targetIndex == 'MainLocker') or (not Config.MainLockerRaid) then
                        TSE('opod-evidencelocker:startRobbery', targetIndex, playerCoords)
                    end
                end
                Citizen.Wait(500)
            end
            if isRobbing then
                local lockerPos = Config.LockerLocations[targetIndex].pos
                if #(playerCoords - lockerPos) > Config.RobberyRadius then
                    TSE('opod-evidencelocker:tooFar', targetIndex)
                end
            end

            if IsControlJustReleased(0, 182) then
                if not Config.LockerLocations[targetIndex].isLocked and isAllowed then
                    TSE("opod-evidencelocker:setLockerLock", targetIndex, true)
                end
            end
        end
        Citizen.Wait(12)
    end
end)

RNE('opod-evidencelocker:setLockerCooldown', function(cooldown, index)
    TSE('opod-evidencelocker:setLockerCooldown', cooldown, index)
end)

RNE('opod-evidencelocker:plantExplosive', function(target)
    while playerCoords == nil do Citizen.Wait(50) end
    local playerPed = PlayerPedId()
    local targetEvidence = Config.LockerLocations[target]
    TaskGoStraightToCoord(playerPed, targetEvidence.pos, 1.0, -1, heading, 1.1)
    
    while true do if #(playerCoords - targetEvidence.pos) < 1.5 then break end Citizen.Wait(50) end -- Check if the player is close to the evidence locker
    ClearPedTasksImmediately(playerPed)
    local direction = (playerCoords - targetEvidence.pos)
    local heading = math.deg(math.atan2(direction.y, direction.x)) + 90.0

    SetEntityHeading(playerPed, heading)
    -- Animation Side
    ESX.Streaming.RequestAnimDict('anim@heists@ornate_bank@thermal_charge', function(dict)
        if HasAnimDictLoaded('anim@heists@ornate_bank@thermal_charge') then
            local fwd, _, _, pos = GetEntityMatrix(playerPed)
            local newPos = (fwd * 0.8) + pos            
            SetEntityCoords(playerPed, newPos.xy, newPos.z - 1)
            FreezeEntityPosition(playerPed, true)
            local rot, pos = GetEntityRotation(playerPed), GetEntityCoords(playerPed)
            SetPedComponentVariation(playerPed, 5, -1, 0, 0)
            local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), pos.x, pos.y, pos.z,  true,  true, false)
            local scene = NetworkCreateSynchronisedScene(pos.x, pos.y, pos.z, rot.x, rot.y, rot.z, 2, 0, 0, 1065353216, 0, 1.3)
            SetEntityCollision(bag, 0, 1)
            NetworkAddPedToSynchronisedScene(playerPed, scene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.5, -4.0, 1, 16, 1148846080, 0)
            NetworkAddEntityToSynchronisedScene(bag, scene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
            NetworkStartSynchronisedScene(scene)
            Citizen.Wait(1500)
            pos = GetEntityCoords(playerPed)
            local eHash
            if Config.UseC4 then eHash = GetHashKey("prop_c4_final") else eHash = GetHashKey("hei_prop_heist_thermite") end
            explosives = CreateObject(eHash, pos.x, pos.y, pos.z + 0.2, 1, 1, 1)
            SetEntityCollision(explosives, 0, 1)
            if Config.UseC4 then AttachEntityToEntity(explosives, playerPed, GetPedBoneIndex(playerPed, 28422), 0, 0, 0, 90.0, 180.0, 180.0, 1, 1, 0, 1, 1, 1) else AttachEntityToEntity(explosives, playerPed, GetPedBoneIndex(playerPed, 28422), 0, 0, 0, 0, 0, 180.0, 1, 1, 0, 1, 1, 1) end
            Citizen.Wait(4000)
            ESX.Game.DeleteObject(bag)
            SetPedComponentVariation(playerPed, 5, 45, 0, 0)
            DetachEntity(explosives, 1, 1)
            FreezeEntityPosition(explosives, 1)
            NetworkStopSynchronisedScene(scene)
            FreezeEntityPosition(playerPed, false)
            SetEntityCollision(explosives, 0, 1)
            pCoords = GetEntityCoords(explosives)
            if not Config.UseC4 then
                TSE('opod-evidencelocker:startThermiteEffect', explosives)
            end
        end
    end)
end)

if Config.Autolock then
    CT(function()
        while true do
        Citizen.Wait(10000)
            for i, locker in pairs(Config.LockerLocations) do
                if not locker.isLocked then
                    Citizen.Wait((Config.AutolockTime) * 60 * 1000)
                    TSE("opod-evidencelocker:setLockerLock", i, true)
                end
            end
        end
    end)
end

if Config.UseDoors then
    CT(function()
        while ESX == nil do Citizen.Wait(5) end

        local doorLocations = {}
        local coords
        ESX.TriggerServerCallback('opod-evidencelocker:GetDoorList', function(doors)
            for _, door in ipairs(doors) do
                local foundDoor = GetClosestObjectOfType(vector3(tonumber(door['x']), tonumber(door['y']), tonumber(door['z'])), 1.5, door['model'], false, false, false)
                FreezeEntityPosition(foundDoor, door['state'] or true)
                SetEntityHeading(foundDoor, door['heading'] + 0.0001)
                table.insert(doorLocations, { obj = foundDoor, heading = door['heading'], pos = {x = tonumber(door['x']), y = tonumber(door['y']), z = tonumber(door['z'])}, model = door['model'] , isLocked = (door['state'] or 1), alarm = (door['alarm'] or false)})
            end
        end)
        CT(function()
            while true do
                Citizen.Wait(500)
                for _, door in ipairs(doorLocations) do
                    if DoesEntityExist(door['obj']) then
                        coords = GetEntityCoords(door['obj'])
                        FreezeEntityPosition(foundDoor, door['isLocked'] or 1)
                        SetEntityHeading(foundDoor, door['heading'] + 0.0001)
                    else
                        door['obj'] = GetClosestObjectOfType(vector3(door['pos']['x'], door['pos']['y'], door['pos']['z']), 1.5, tonumber(door['model']), false, false, false)
                        FreezeEntityPosition(door['obj'], door['isLocked'] or 1)
                        coords = GetEntityCoords(door['obj'])
                        SetEntityHeading(door['obj'], door['heading'] + 0.0001)
                    end
                end
            end
        end)
        while true do
            Citizen.Wait(10)
            for _, door in ipairs(doorLocations) do
                coords = GetEntityCoords(door['obj'])
                local dist = #(GetEntityCoords(PlayerPedId()) - coords)
                if dist <= 3.0 then
                    local str = '~r~[Locked]'
                    if door['isLocked'] == 0 then str = '~g~[Unlocked]' else
                        FreezeEntityPosition(door['obj'], door['isLocked'] or 1)
                        SetEntityHeading(door['obj'], door['heading'] + 0.0001)
                    end
                    local textPos = GetOffsetFromEntityInWorldCoords(door['obj'], -0.65, 0, 0)
                    ESX.Game.Utils.DrawText3D(textPos, str, 1.2, 4)
                    if dist <= 1.3 then
                        if IsControlJustReleased(0, 38) then
                            if isAllowed then
                                if door['isLocked'] == 0 then door['isLocked'] = 1 else door['isLocked'] = 0 end
                                TSE('opod-evidencelocker:setDoorLock', door['obj'], door['isLocked'], door['pos'], door['heading'])
                            elseif not isAllowed and door['isLocked'] then
                                ESX.TriggerServerCallback('opod-evidencelocker:checkForItem', function(canHack)
                                    if canHack then
                                        TE("mhacking:show")
                                        TE("mhacking:start", 7, 20, function(success, timeRemaining)
                                            TE('mhacking:hide')
                                            if success then
                                                if door['alarm'] then TSE('opod-evidencelocker:showRobberyAlert', door['alarm']) end
                                                door['isLocked'] = 0
                                                TSE('opod-evidencelocker:setDoorLock', door['obj'], door['isLocked'], door['pos'])
                                                TSE('opod-evidencelocker:removeItem', Config.HackingDevice)
                                            end
                                        end)
                                    else
                                        TE('opod-evidencelocker:ShowNotification', string.format(Lang['cannot_hack'], Config.HackingDevice))
                                    end
                                end, Config.HackingDevice)
                            end
                        end
                    end
                end
            end
        end
    end)
end

RNE('opod-evidencelocker:setDoorLock', function(door, state, heading)
    if state then SetEntityHeading(door, heading + 0.0001) end
    FreezeEntityPosition(door, state)
end)

RNE('opod-evidencelocker:setLockerLock', function(target, state)
    Config.LockerLocations[target].isLocked = state
end)

RNE('opod-evidencelocker:showRobberyAlert', function(job, curLocker, state, str)
    if state == 'started' then
        if job == 'police' then
            if Config.PlayDispatch then SendNUIMessage({ play = true }) end
        end
        if Config.UseBreakingNews then 
            local hour, min = GetNewsTime() 
            ESX.Scaleform.ShowBreakingNews(Lang['start-top-bar'], string.format(Lang['start-middle-bar'], (Config.LockerLocations[curLocker].label or curLocker)), hour .. ":" .. min , 5)
        end
    elseif state == 'stopped' then
        if Config.UseBreakingNews then 
            local hour, min = GetNewsTime() 
            ESX.Scaleform.ShowBreakingNews(Lang['stop-top-bar'], string.format(Lang['stop-middle-bar'], (Config.LockerLocations[curLocker].label or curLocker)), hour .. ":" .. min , 5)
        end
    elseif state == 'cancelled' then
        if Config.UseBreakingNews then 
            local hour, min = GetNewsTime()
            ESX.Scaleform.ShowBreakingNews(Lang['cancel-top-bar'], string.format(Lang['cancel-middle-bar'], (Config.LockerLocations[curLocker].label or curLocker)), hour .. ":" .. min , 5)
        end
    elseif state == 'custom' then
        if Config.UseBreakingNews then 
            local hour, min = GetNewsTime()
            ESX.Scaleform.ShowBreakingNews(Lang['start-top-bar'], str, hour .. ":" .. min , 5)
        end
    end
end)

function OpenEvidenceLocker(target)
    local elements = {}
    ESX.TriggerServerCallback('opod-evidencelocker:getLockerInventory', function(inventory)
        if inventory.items then
            for _, item in pairs(inventory.items) do
                if item.count > 0 then
                table.insert(elements, {label = ((item.label or string.gsub(item.name, '_', ' '):gsub('-', ' '):gsub("(%l)(%w*)", function(a,b) return string.upper(a)..b end) ) .. ' x' .. item.count), type = 'item_standard', value = item.name, count = item.count})
                end
            end
        end
        if inventory.weapons then
            for _, weapon in ipairs(inventory.weapons) do
                table.insert(elements, {label = ESX.GetWeaponLabel(weapon.name) .. ' (' .. weapon.ammo .. ')', type = 'item_weapon', value = weapon.name, count = weapon.ammo})
            end
        end
        if inventory.blackMoney > 0 then
            table.insert(elements, {label = Lang['dirty_money'] .. inventory.blackMoney, type = 'item_account', value = 'black_money'})
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'evidence_locker', {
            title = Lang['locker_name'],
            align = 'left',
            elements = elements
        }, function(data, menu)
            TSE('opod-evidencelocker:getItem', GetPlayerServerId(playerPed), data.current.type, data.current.value, data.current.count, target)
            menu.close()
            OpenEvidenceLocker(target)
        end,function(data, menu)
            menu.close()
        end)
    end, targetIndex)
    
end

function GetNewsTime() local hour, minute = GetClockHours(), GetClockMinutes() if hour == 0 or hour == 24 then hour = 12 elseif hour >= 13 then hour = hour - 12 end if hour <= 9 then hour = "0" .. hour end if minute <= 9 then minute = "0" .. minute end return hour, minute end

function ShowNotification(str)
    if Config.pNotify then
        local options = Config.pNotifyOptions
        options.text = str
        options.queue = 'evidence'

        exports['pNotify']:SendNotification(options)
    elseif Config.MythicNotify then
        local options = Config.MythicOptions
        exports['mythic_notify']:DoHudText(options.type, str, {['background-color'] = options.background, ['color'] = options.color})
    else
        ESX.ShowNotification(str)
    end
end

RNE('opod-evidencelocker:killBlip', function()
    RemoveBlip(EvidenceBlip)
end)


RNE('opod-evidencelocker:tooFar', function()
    DeleteObject(explosives)
    StopParticleFxLooped(explosiveEffect, 0)
    isRobbing, pCoords, explosives, explosiveEffect = false, nil, nil, nil
    SendNUIMessage({type = 'progressStop'})
    TE('opod-evidencelocker:ShowNotification', Lang['robbery_canceled'])
end)

RNE('opod-evidencelocker:robberyComplete', function(target, coords)
    TSE("opod-evidencelocker:setLockerLock", target, false)
    DeleteObject(explosives)
    if Config.UseC4 then 
        TSE('opod-evidencelocker:startC4Explosion', coords)
        AddExplosion(coords, 5, 5.0, true, false, 5.0, false)
    else
        StopParticleFxLooped(explosiveEffect, 0)
    end
    isRobbing, pCoords, explosives, explosiveEffect = false, nil, nil, nil
    SendNUIMessage({type = 'progressStop'})
    TE('opod-evidencelocker:ShowNotification', Lang['robbery_complete'])
end)


RNE('opod-evidencelocker:startThermiteEffect', function(entity)
    ESX.Streaming.RequestNamedPtfxAsset('scr_ornate_heist', function()
        if HasNamedPtfxAssetLoaded('scr_ornate_heist') then
            SetPtfxAssetNextCall("scr_ornate_heist")
            explosiveEffect = StartParticleFxLoopedOnEntity("scr_heist_ornate_thermal_burn", entity, 0.0, 2.0, 0.0, 0.0, 0.0, 0.0, 2.0, 0, 0, 0, 0)
        end
    end)
end)

RNE('opod-evidencelocker:startC4Explosion', function(coords)
    AddExplosion(coords, 5, 5.0, true, false, 5.0, false)
end)

CT(function()
    while true do
        Citizen.Wait(15)
        if isRobbing and IsEntityPlayingAnim(PlayerPedId(), 'anim@heists@ornate_bank@thermal_charge', 'thermal_charge', 2) then
            DisableControlAction(0, 73, true)
        end
    end
end)

RegisterNetEvent('opod-evidencelocker:checkSpace')
AddEventHandler('opod-evidencelocker:checkSpace', function(cb, amount, index)
    if index ~= nil and amount ~= nil then
    ESX.TriggerServerCallback("opod-evidencelocker:getLockerInventory", function(inventory)
        -- Weapons need to be counted
        local count = 0
        for _, item in pairs(inventory.items) do
            count = count + item.count
        end
        for _, weapon in pairs(inventory.weapons) do
            count = count + 1
        end
        if (inventory.blackMoney) > 0 then count = count + 1 end
        if (inventory.cashMoney) > 0 then count = count + 1 end

        if (Config.LockerLocations[index].limit ~= nil and (count + amount) > Config.LockerLocations[index].limit) and count ~= nil then
            cb(false, Config.LockerLocations[index].limit)
        else
            cb(true)
        end
    end, index)
    end
end)

RNE('opod-evidencelocker:ShowNotification', function(str)
    ShowNotification(str)
end)

RegisterNetEvent('opod-evidencelocker:confiscateItems')
AddEventHandler('opod-evidencelocker:confiscateItems', function(target, type, item, count)
    local amount, lockerFound, hasSpace = 0, false, false

    if type == 'item_weapon' then
        count = 260
        amount = 1
    elseif type == 'item_account' or type == 'item_money' then
        count = tonumber(count)
        amount = 1
    else
        count = tonumber(count)
        amount = count
    end
    for locker, _ in pairs(Config.LockerLocations) do
        if lockerFound == false and locker ~= 'MainLocker' then
            TE('opod-evidencelocker:checkSpace', function(space)
            if space then
                TSE("opod-evidencelocker:putItem", ESX.GetPlayerData().identifier, type, item, count, locker, target)
                lockerFound = true
                hasSpace = true
            end
        end, amount, locker)
        Wait(150)
        end
    end
    Wait(150)
    if not hasSpace then
        TE('opod-evidencelocker:ShowNotification', Lang['lockers_full'])
    end
end)


RNE('opod-evidencelocker:showRobberyBlip', function(coords)
    EvidenceBlip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(EvidenceBlip, 161)
    SetBlipDisplay(EvidenceBlip, 8)
    SetBlipScale(EvidenceBlip, 2.0)
    SetBlipColour(EvidenceBlip, 2)
end)