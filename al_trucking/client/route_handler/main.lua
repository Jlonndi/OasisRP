-- Pre trip
function DoTask()
    local trailerOffsets = nil
    local currentTask = 1
    for i=1, #Trucking.Trailers, 1 do
        if GetHashKey(Trucking.Trailers[i].model) == GetEntityModel(Trucking.Vars.Data.Models.Trailer) then
            trailerOffsets = Trucking.Trailers[i].taskOffsets
        end
    end

    while true do Citizen.Wait(0)
        if trailerOffsets ~= nil then
            if not trailerOffsets[currentTask] then currentTask = currentTask + 1 end
            local coords = GetOffsetFromEntityInWorldCoords(Trucking.Vars.Data.Models.Trailer, trailerOffsets[currentTask])
            local distance = #(coords - GetEntityCoords(PlayerPedId()))

            if distance < 15 then
                DrawMarker(20, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.5, 0.5, 0.5, Trucking.Color['marker'].r, Trucking.Color['marker'].g, Trucking.Color['marker'].b, 80, false, true, 2, nil, nil, false)

                if distance < 2 then
                    Trucking.HelpNotification(Trucking.Translation['do_trailer_task'..currentTask])

                    if IsControlJustPressed(0, 38) then
                        if currentTask == 2 or currentTask == 4 then
                            Trucking.AttachClipboardToPlayer()
                        else
                            RequestAnimDict("mini@repair")
                            while not HasAnimDictLoaded("mini@repair") do Citizen.Wait(0) end; TaskPlayAnim(PlayerPedId(), "mini@repair", "fixing_a_player", 8.0, -8, -1, 49, 0, 0, 0, 0)
                        end
                        FreezeEntityPosition(PlayerPedId(), true)
                        Trucking.Progress('task_'..currentTask, Trucking.Timing['tasks'] * 1000, Trucking.Translation['doing_trailer_task'..currentTask], false, false, { disableMovement = false, disableCarMovement = false, disableMouse = false, disableCombat = true })
                        if currentTask == 2 or currentTask == 4 then
                            Trucking.RemoveClipboardFromPlayer()
                        else
                            ClearPedTasks(PlayerPedId())
                        end
                        FreezeEntityPosition(PlayerPedId(), false)
                        currentTask = currentTask + 1

                        if currentTask == 5 then
                            Trucking.Notify('success', Trucking.Translation['greenlight'], 5000)
                            FreezeEntityPosition(Trucking.Vars.Data.Models.Truck, false)
                            FreezeEntityPosition(Trucking.Vars.Data.Models.Trailer, false)

                            if Trucking.Vars.Data.Trailer.routeType == 5 then
                                BeginSpecialDeliveryRoute()
                            elseif Trucking.Vars.Data.Trailer.routeType == 4 then
                                BeginHighValueDeliveryRoute()
                            else
                                BeginDeliveryRoute()
                            end
                            break
                        end
                    end
                else
                    Trucking.HelpNotification(Trucking.Translation['trailer_task'..currentTask])
                end
            end
        else
            print('^8ERROR: INVALID TRAILER OFFSETS^7')
            break
        end
    end
end

-- Begin a "normal" route
function BeginDeliveryRoute()
    Citizen.CreateThread(function()
        local Route = PrepRoute(1, Trucking.Routes[Trucking.Vars.Data.Trailer.routeType])
        if not Route then
            return
        else
            Route.BeginRoute()
        end

        SetVehicleBodyHealth(Trucking.Vars.Data.Models.Trailer, 1000.0)
        local deletedNearbyVeh = false
        local sleep = 1000

        while true do Citizen.Wait(0)
            local distance = #(Route.route[1] - GetEntityCoords(PlayerPedId()))
            local trailerHealth = math.floor(GetVehicleBodyHealth(Trucking.Vars.Data.Models.Trailer))

            if IsVehicleAttachedToTrailer(Trucking.Vars.Data.Models.Truck) then
                if distance <= 60 then
                    if sleep ~= 0 then
                        sleep = 0
                    end

                    -- Approaching Route Destination
                    local offset = GetObjectOffsetFromCoords(Route.route[2], 0.0, 0.0, 3.0)
                    local offset2 = GetOffsetFromEntityInWorldCoords(Trucking.Vars.Data.Models.Trailer, vector3(0.0, -6.5, -1.5))
                    local distance2 = #(offset2 - Route.route[1])
                    DrawMarker(20, offset, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 3.0, 3.0, 3.0, Trucking.Color['marker'].r, Trucking.Color['marker'].g, Trucking.Color['marker'].b, 150, false, true, 2, nil, nil, false)

                    -- Delete nearby vehicles
                    if not deletedNearbyVeh then
                        Route.DeleteNearbyVehicles()
                        deletedNearbyVeh = true
                    end

                    -- Deliver / Drop off cargo
                    if distance2 <= 2 then
                        if Route.currentStop < Route.numberOfStops then
                            Trucking.HelpNotification(Trucking.Translation["unloadtrailer"])

                            if IsControlJustPressed(0, 38) then
                                Trucking.Progress('trucking_unloading', Trucking.Timing['tasks'] * 1000, Trucking.Translation['unloadingtrailer'], false, false, { disableMovement = false, disableCarMovement = true, disableMouse = false, disableCombat = true })
                                Route.NextRoute()
                                sleep = 1000
                                deletedNearbyVeh = false
                            end
                        elseif Route.currentStop == Route.numberOfStops then
                            Trucking.HelpNotification(Trucking.Translation["dropofftrailer"])

                            if IsControlJustPressed(0, 38) then
                                Route.EndRoute()
                                deletedNearbyVeh = false
                                break
                            end
                        end
                    else
                        Trucking.HelpNotification(Trucking.Translation["backtrailer"])
                    end
                elseif deletedNearbyVeh then
                    deletedNearbyVeh = false
                elseif sleep == 0 then
                    sleep = 1000
                end
            else
                if sleep ~= 0 then
                    sleep = 0
                end
                
                -- If trailer was detached
                Trucking.HelpNotification(Trucking.Translation["attachtrailer"])
                local d = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(Trucking.Vars.Data.Models.Trailer))

                if d > 200 then
                    Trucking.Notify('error', Trucking.Translation['trailerfaraway'])
                    
                    Route.Cancel()
                    break
                end
            end

            -- If trailer was destroyed
            if trailerHealth == 0 then
                DoScreenFadeOut(1000)
                Citizen.Wait(1000)

                if Trucking.DestroyedTrailerFee then
                    Trucking.Notify('error', (Trucking.Translation['trailerdestroyed']):format(Trucking.DestroyedTrailerFee))
                    Trucking.removeMoney(Trucking.DestroyedTrailerFee)
                end

                Route.Cancel()

                DoScreenFadeIn(1000)
                Citizen.Wait(1000)
                break
            end
        end
    end)
end

-- Begin a high value route (flatbed)
function BeginHighValueDeliveryRoute()
    Citizen.CreateThread(function()
        local Route = PrepRoute(2, Trucking.Routes[Trucking.Vars.Data.Trailer.routeType])

        if not Route then
            return
        else
            Route.BeginRoute()
        end

        SetVehicleBodyHealth(Trucking.Vars.Data.Models.Trailer, 1000.0)
        local deletedNearbyVeh = false
        local gotHighValueCargo = false
        local sleep = 1000

        while true do Citizen.Wait(0)
            local distance = #(Route.primaryLocation - GetEntityCoords(PlayerPedId()))
            local trailerHealth = math.floor(GetVehicleBodyHealth(Trucking.Vars.Data.Models.Trailer))

            if IsVehicleAttachedToTrailer(Trucking.Vars.Data.Models.Truck) then
                if distance <= 60 then
                    if sleep ~= 0 then
                        sleep = 0
                    end

                    local offset2 = GetOffsetFromEntityInWorldCoords(Trucking.Vars.Data.Models.Trailer, vector3(0.0, -6.5, -1.5))

                    if not deletedNearbyVeh then
                        Route.DeleteNearbyVehicles()
                        deletedNearbyVeh = true

                        if not gotHighValueCargo and not Trucking.Vars.Data.Models.VehCargo then
                            Route.SpawnCargoVehicle()
                        end
                    end

                    if Trucking.Vars.Data.Models.VehCargo ~= nil and deletedNearbyVeh then
                        -- Pickup High Value Cargo
                        if not gotHighValueCargo then
                            local distance2 = #(offset2 - GetEntityCoords(Trucking.Vars.Data.Models.VehCargo))
                            local offset = GetOffsetFromEntityInWorldCoords(Trucking.Vars.Data.Models.VehCargo, vector3(0.0, 0.0, 3.0))
                            DrawMarker(20, offset, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 3.0, 3.0, 3.0, Trucking.Color['marker'].r, Trucking.Color['marker'].g, Trucking.Color['marker'].b, 80, false, true, 2, nil, nil, false)

                            if distance2 <= 5 then
                                Trucking.HelpNotification(Trucking.Translation['attachspecialcargo'])

                                if IsControlJustPressed(0, 38) then
                                    Route.PickupCargo()
                                    sleep = 1000

                                    gotHighValueCargo = true
                                    deletedNearbyVeh = false
                                end
                            else
                                Trucking.HelpNotification(Trucking.Translation["backtrailer"])
                            end
                        else
                            -- Detach High Value Cargo
                            local distance2 = #(offset2 - Route.primaryLocation)
                            if distance2 <= 60 then
                                DrawMarker(20, Route.primaryLocation.x, Route.primaryLocation.y, Route.primaryLocation.z + 3, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 3.0, 3.0, 3.0, Trucking.Color['marker'].r, Trucking.Color['marker'].g, Trucking.Color['marker'].b, 80, false, true, 2, nil, nil, false)

                                if distance2 <= 2 then
                                    Trucking.HelpNotification(Trucking.Translation['detachspecialcargo'])

                                    if IsControlJustPressed(0, 38) then

                                        DoScreenFadeOut(1000)
                                        Citizen.Wait(1000)

                                        Route.DropoffCargo()
                                        sleep = 1000

                                        DoScreenFadeIn(1000)
                                        Citizen.Wait(1000)

                                        gotHighValueCargo = false
                                        Trucking.Vars.Data.Models.VehCargo = nil

                                        if not (Route.numberOfStops >= Route.currentStop) then
                                            break
                                        end
                                    end
                                else
                                    Trucking.HelpNotification(Trucking.Translation["backtrailer"])
                                end
                            end
                        end
                    end
                elseif deletedNearbyVeh then
                    deletedNearbyVeh = false
                elseif sleep == 0 then
                    sleep = 1000
                end
            else
                if sleep ~= 0 then
                    sleep = 0
                end

                Trucking.HelpNotification(Trucking.Translation["attachtrailer"])
                local d = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(Trucking.Vars.Data.Models.Trailer))

                if d > 200 then
                    Trucking.Notify('error', Trucking.Translation['trailerfaraway'])
                    
                    Route.Cancel()
                    break
                end
            end

            if trailerHealth == 0 then
                DoScreenFadeOut(1000)
                Citizen.Wait(1000)

                if Trucking.DestroyedTrailerFee then
                    Trucking.Notify('error', (Trucking.Translation['trailerdestroyed']):format(Trucking.DestroyedTrailerFee))
                    Trucking.removeMoney(Trucking.DestroyedTrailerFee)
                end
                
                Route.Cancel()
                
                DoScreenFadeIn(1000)
                Citizen.Wait(1000)
                break
            end
        end
    end)
end

-- Military route: Trucker portion
function BeginSpecialDeliveryRoute()
    Citizen.CreateThread(function()
        local Route = PrepRoute(3, Trucking.Routes[Trucking.Vars.Data.Trailer.routeType])

        if not Route then
            return
        else
            Route.BeginRoute()
        end

        SetVehicleBodyHealth(Trucking.Vars.Data.Models.Trailer, 1000.0)
        local deletedNearbyVeh = false
        local gotSpecialCargo = false
        local sleep = 1000

        Route.SetEscortBlip(GetPlayerPed(GetPlayerFromServerId(Route.escortDriver)))

        while true do Citizen.Wait(sleep)
            local distance = #(Route.primaryLocation - GetEntityCoords(PlayerPedId()))
            local trailerHealth = math.floor(GetVehicleBodyHealth(Trucking.Vars.Data.Models.Trailer))

            if IsVehicleAttachedToTrailer(Trucking.Vars.Data.Models.Truck) then
                if distance <= 60 then
                    if sleep ~= 0 then
                        sleep = 0
                    end

                    local offset2 = GetOffsetFromEntityInWorldCoords(Trucking.Vars.Data.Models.Trailer, vector3(0.0, -6.5, -1.5))

                    if not deletedNearbyVeh then
                        Route.DeleteNearbyVehicles()
                        deletedNearbyVeh = true

                        if not gotSpecialCargo and not Trucking.Vars.Data.Models.VehCargo then
                            Route.SpawnCargoVehicle()
                        end
                    end

                    if Trucking.Vars.Data.Models.VehCargo ~= nil and deletedNearbyVeh then
                        -- Pickup Special Cargo
                        if not gotSpecialCargo then
                            local distance2 = #(offset2 - GetEntityCoords(Trucking.Vars.Data.Models.VehCargo))
                            local offset = GetOffsetFromEntityInWorldCoords(Trucking.Vars.Data.Models.VehCargo, vector3(0.0, 0.0, 3.0))
                            DrawMarker(20, offset, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 3.0, 3.0, 3.0, Trucking.Color['marker'].r, Trucking.Color['marker'].g, Trucking.Color['marker'].b, 80, false, true, 2, nil, nil, false)

                            if distance2 <= 5 then
                                Trucking.HelpNotification(Trucking.Translation['attachspecialcargo'])

                                if IsControlJustPressed(0, 38) then
                                    Route.PickupCargo()
                                    sleep = 1000

                                    gotSpecialCargo = true
                                    deletedNearbyVeh = false
                                end
                            else
                                Trucking.HelpNotification(Trucking.Translation["backtrailer"])
                            end
                        else
                            -- Detach Special Cargo
                            local distance2 = #(offset2 - Route.primaryLocation)
                            if distance2 <= 60 then
                                DrawMarker(20, Route.primaryLocation.x, Route.primaryLocation.y, Route.primaryLocation.z + 3, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 3.0, 3.0, 3.0, Trucking.Color['marker'].r, Trucking.Color['marker'].g, Trucking.Color['marker'].b, 80, false, true, 2, nil, nil, false)

                                if distance2 <= 2 then
                                    Trucking.HelpNotification(Trucking.Translation['detachspecialcargo'])

                                    if IsControlJustPressed(0, 38) then

                                        DoScreenFadeOut(1000)
                                        Citizen.Wait(1000)

                                        Route.DropoffCargo()
                                        sleep = 1000

                                        DoScreenFadeIn(1000)
                                        Citizen.Wait(1000)

                                        gotSpecialCargo = false
                                        Trucking.Vars.Data.Models.VehCargo = nil

                                        if not (Route.numberOfStops >= Route.currentStop) then
                                            break
                                        end
                                    end
                                else
                                    Trucking.HelpNotification(Trucking.Translation["backtrailer"])
                                end
                            end
                        end
                    end
                elseif deletedNearbyVeh then
                    deletedNearbyVeh = false
                elseif sleep == 0 then
                    sleep = 1000
                end
            else
                if sleep ~= 0 then
                    sleep = 0
                end

                Trucking.HelpNotification(Trucking.Translation["attachtrailer"])
                local d = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(Trucking.Vars.Data.Models.Trailer))

                if d > 200 then
                    Trucking.Notify('error', Trucking.Translation['trailerfaraway'])
                    
                    Route.Cancel()
                    break
                end
            end

            if Trucking.Vars.escortToDriverUpdate then
                Route.UpdateEscortInfo(Trucking.Vars.escortToDriverUpdate)

                Trucking.Vars.escortToDriverUpdate = nil

                if Route.escortFailed then
                    DoScreenFadeOut(1000)
                    Citizen.Wait(1000)

                    Route.Cancel()
                    
                    DoScreenFadeIn(1000)
                    Citizen.Wait(1000)

                    Trucking.Notify('error', Trucking.Translation['escort_driver_failed'])
                elseif next(Route.escortData) ~= nil and Route.escortData.type then
                    if Route.escortData.type == 'distance' or Route.escortData.type == 'escort' then
                        Route.escortFailed = true

                        if Route.escortData.cancel then
                            DoScreenFadeOut(1000)
                            Citizen.Wait(1000)

                            Route.Cancel()
                            
                            DoScreenFadeIn(1000)
                            Citizen.Wait(1000)

                            Trucking.Notify('error', Trucking.Translation['escort_driver_distance_cancel'])
                        else
                            Trucking.Notify('error', Trucking.Translation['escort_driver_distance'])
                        end
                    end
                end
            end

            if trailerHealth == 0 then
                DoScreenFadeOut(1000)
                Citizen.Wait(1000)

                if Trucking.DestroyedTrailerFee then
                    Trucking.Notify('error', (Trucking.Translation['trailerdestroyed']):format(Trucking.DestroyedTrailerFee))
                    Trucking.removeMoney(Trucking.DestroyedTrailerFee)
                end
                
                Route.Cancel()
                
                DoScreenFadeIn(1000)
                Citizen.Wait(1000)
                break
            end
        end
    end)
end

-- Military route: Escort portion
function BeginSpecialEscortRoute(driverID, driverName)
    Citizen.CreateThread(function()
        local requestInput = false
        local ctimer = GetGameTimer()
        Trucking.Vars.hasPrimaryNotification = true
        AddTextEntry(Trucking.Translation['escort_request'][1], (Trucking.Translation['escort_request'][2]):format(driverName))
        while true do
            local timeLeft = Trucking.Escort.timeToRespond - math.floor((GetGameTimer() - ctimer) / 1000)
            if timeLeft < 0 then
                requestInput = false
                break
            else
                Trucking.HelpNotification(Trucking.Translation['escort_request'][2], true)

                if IsControlJustPressed(0, 194) then -- Backspace
                    requestInput = false
                    break
                elseif IsControlJustPressed(0, 191) then -- Enter
                    requestInput = true
                    break
                end
            end

            Citizen.Wait(0)
        end
        Trucking.Vars.hasPrimaryNotification = false

        TriggerServerEvent('Al_Trucking:EscortUpdateToDriver', driverID, requestInput)

        if requestInput then
            local Route = EscortPrep(driverID)
            local escortSpawned = false
            local sleep = 1000
            local driverUpdated = false

            Route.SetDriverBlip(GetPlayerPed(GetPlayerFromServerId(driverID)))
            while true do Citizen.Wait(sleep)
                if Trucking.Vars.Data.Escort and Trucking.Vars.Data.Escort.entity then 

                    if IsPedInVehicle(PlayerPedId(), Trucking.Vars.Data.Escort.entity) then
                        if not Route.driverData.routeComplete and Route.driverData.primaryLocation and not Route.failed and not Route.driverData.failed then
                            local driverDistance = #(GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(driverID)), true) - GetEntityCoords(PlayerPedId()))
                            local distance = #(Route.driverData.primaryLocation - GetEntityCoords(PlayerPedId()))
    
                            if driverDistance <= 200 then
                                if distance <= 80 then
                                    if sleep ~= 0 then
                                        sleep = 0
                                    end
        
                                    if not Route.driverData.hasCargo then
                                        Trucking.HelpNotification(Trucking.Translation["escort_standby_pickup"])
                                    else
                                        Trucking.HelpNotification(Trucking.Translation["escort_standby_dropoff"])
                                    end
                                elseif sleep == 0 then
                                    sleep = 1000
                                elseif driverUpdated then
                                    driverUpdated = false
                                end
                            elseif driverDistance > 200 and driverDistance < 300 then
                                if sleep ~= 0 then
                                    sleep = 0
                                end

                                Trucking.HelpNotification(Trucking.Translation["escort_get_closer"])
                                
                                if not driverUpdated then
                                    driverUpdated = true

                                    Route.TransmitDataToDriver({
                                        type = 'distance',
                                        cancel = false
                                    })
                                end
                            elseif driverDistance > 300 or not DoesEntityExist(GetPlayerFromServerId(driverID)) then
                                Route.failed = true
                                Route.TransmitDataToDriver({
                                    type = 'distance',
                                    cancel = true
                                })
                                Route.ReturnToDepot()
                                Trucking.Notify('error', Trucking.Translation['escort_far_driver'])
                            end
                        elseif Route.driverData.routeComplete or Route.failed or Route.driverData.failed then
                            local distance = #(Trucking.Locations.ReturnTruck - GetEntityCoords(PlayerPedId()))
        
                            if distance <= 20 then
                                if sleep ~= 0 then
                                    sleep = 0
                                end
    
                                DrawMarker(23, Trucking.Locations.ReturnTruck.x, Trucking.Locations.ReturnTruck.y, Trucking.Locations.ReturnTruck.z - 0.95, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 2.0, Trucking.Color['marker'].r, Trucking.Color['marker'].g, Trucking.Color['marker'].b, 80, false, true, 0, 0)
        
                                if distance <= 3 then
                                    Trucking.HelpNotification(Trucking.Translation['return_truck'])
                                    if IsControlJustReleased(0, 38) then
                                        DoScreenFadeOut(1000)
                                        Citizen.Wait(1000)

                                        if Route.failed or Route.driverData.failed then
                                            Route.CancelFull()
                                        else
                                            Route.FinishRoute()
                                        end

                                        Trucking.Vars.Data.Escort = {}
                                        TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)

                                        DoScreenFadeIn(1000)
                                        Citizen.Wait(1000)
                                        break
                                    end
                                end
                            elseif sleep == 0 then
                                sleep = 1000
                            end
                        else
                            if sleep ~= 0 then
                                sleep = 0
                            end
    
                            Trucking.HelpNotification(Trucking.Translation["escort_standby_trailer"])
                        end
                    else
                        if sleep ~= 0 then
                            sleep = 0
                        end
                        
                        local distance = #(GetEntityCoords(Trucking.Vars.Data.Escort.entity) - GetEntityCoords(PlayerPedId()))

                        if distance < 100 then
                            Trucking.HelpNotification(Trucking.Translation['escort_get_in_vehicle'])
                            --[[
                        else
                            Route.CancelFull()
                            Trucking.Notify('error', Trucking.Translation['escort_far'])
                            ]]
                        end
                    end

        
                elseif not escortSpawned then
                    escortSpawned = true

                    Route.SpawnEscort()

                    Citizen.Wait(1000)
                end

                if Trucking.Vars.driverToEscortUpdate then
                    Route.UpdateDriverInfo(Trucking.Vars.driverToEscortUpdate)

                    if Route.driverData.primaryLocation and not Route.driverData.failed and not Route.driverData.routeComplete then
                        Route.SetPoint(Route.driverData.primaryLocation)
                    else
                        Route.ReturnToDepot()
                    end

                    if Route.driverData.failed then
                        Trucking.Notify('error', Trucking.Translation['escort_trucker_failed'])
                    elseif Route.driverData.routeComplete then
                        Trucking.Notify('success', Trucking.Translation['escort_return_reward'])
                    end

                    Trucking.Vars.driverToEscortUpdate = false
                end

            end
        else
            Trucking.Notify('inform', Trucking.Translation['escort_request_deny'])
        end
    
    end)
end