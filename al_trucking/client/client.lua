-- Init | Clock In/Out Marker --
function Init()
    Citizen.CreateThread(function()
        while not GetPlayerJob().name do Citizen.Wait(0) end
        local playerJob = GetPlayerJob()

        if Trucking.RequireJob then
            Citizen.CreateThread(function()
                while true do Citizen.Wait(2500)
                    playerJob = GetPlayerJob()
                end
            end)
        end

        local sleep = 1000
        while true do Citizen.Wait(sleep)
            if Trucking.RequireJob and playerJob.name == Trucking.JobName or not Trucking.RequireJob then
                local playerDistance = #(GetEntityCoords(PlayerPedId()) - Trucking.Locations.ClockInSpot)
                if playerDistance <= 10 then
                    if sleep ~= 0 then sleep = 0 end
                    DrawMarker(23, Trucking.Locations.ClockInSpot.x, Trucking.Locations.ClockInSpot.y, Trucking.Locations.ClockInSpot.z - 0.95, 0, 0, 0, 0, 0, 0, 0.6, 0.6, 0.6, Trucking.Color['marker'].r, Trucking.Color['marker'].g, Trucking.Color['marker'].b, 80, false, true, 0, 0)
                    if playerDistance <= 1 then
                        Trucking.HelpNotification(Trucking.Translation['clock_in_out'])
                        if IsControlJustReleased(0, 38) then
                            Trucking_Blip(not Trucking.Vars.OnShift)
                        end
                    end
                elseif sleep == 0 then
                    sleep = 1000
                end
            elseif sleep == 0 then
                sleep = 1000
            end
        end
    end)

    Citizen.CreateThread(function()
        local coord = Trucking.Locations.ClockInSpot
        local blip = AddBlipForCoord(coord.x, coord.y, coord.z)
        SetBlipSprite(blip, 477)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.7)
        SetBlipCategory(blip, 3)
        SetBlipColour(blip, Trucking.Color['blip'])
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Truck Depot')
        EndTextCommandSetBlipName(blip)
    end)
end

-- Clock In/Out Functionality | Misc. Markers
function ClockInOut()
    Citizen.CreateThread(function()
        local sleep = 0
        while Trucking.Vars.OnShift do Citizen.Wait(sleep)
            local playerCoords = GetEntityCoords(PlayerPedId())
            local isInMarker = false

            local playerDistance = #(playerCoords - Trucking.Locations.RentTruck)
            if playerDistance <= 10 then
                if sleep ~= 0 then sleep = 0 end; isInMarker = true
                DrawMarker(23, Trucking.Locations.RentTruck.x, Trucking.Locations.RentTruck.y, Trucking.Locations.RentTruck.z - 0.95, 0, 0, 0, 0, 0, 0, 0.6, 0.6, 0.6, Trucking.Color['marker'].r, Trucking.Color['marker'].g, Trucking.Color['marker'].b, 80, false, true, 0, 0)
                if playerDistance <= 1 then
                    Trucking.HelpNotification(Trucking.Translation['rent_truck'])
                    if IsControlJustReleased(0, 38) then
                        if Trucking.UsingESX and next(ESX.UI.Menu.GetOpenedMenus()) == nil or Trucking.UsingNativeUI and (menuPool and not menuPool:IsAnyMenuOpen() or not menuPool) then
                            OpenRentalMenu()
                        end
                    end
                end
            end

            playerDistance = #(playerCoords - Trucking.Locations.ReturnTruck)
            if playerDistance <= 20 and IsPedInAnyVehicle(PlayerPedId()) and Trucking.Vars.Data.Rental.model and GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1) == PlayerPedId() then
                if sleep ~= 0 then sleep = 0 end; isInMarker = true
                DrawMarker(23, Trucking.Locations.ReturnTruck.x, Trucking.Locations.ReturnTruck.y, Trucking.Locations.ReturnTruck.z - 0.95, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 2.0, Trucking.Color['marker'].r, Trucking.Color['marker'].g, Trucking.Color['marker'].b, 80, false, true, 0, 0)
                if playerDistance <= 3 then
                    Trucking.HelpNotification(Trucking.Translation['return_truck'])
                    if IsControlJustReleased(0, 38) then
                        ReturnRental()
                    end
                end
            end

            playerDistance = #(playerCoords - Trucking.Locations.GetTrailer)
            if playerDistance <= 10 then
                if sleep ~= 0 then sleep = 0 end; isInMarker = true
                DrawMarker(23, Trucking.Locations.GetTrailer.x, Trucking.Locations.GetTrailer.y, Trucking.Locations.GetTrailer.z - 0.95, 0, 0, 0, 0, 0, 0, 0.6, 0.6, 0.6, Trucking.Color['marker'].r, Trucking.Color['marker'].g, Trucking.Color['marker'].b, 80, false, true, 0, 0)
                if playerDistance <= 3 then
                    if not Trucking.Vars.hasPrimaryNotification and not Trucking.Vars.isFetchingInfo then
                        Trucking.HelpNotification(Trucking.Translation['traileroptions'])
                    end
                    
                    if IsControlJustReleased(0, 38) then
                        TrailerOptionsMenu()
                    end
                end
            end

            if not isInMarker then sleep = 1000 end
        end
    end)
end

-- Blips --
local BlipTable = {}

-- Trigger On/Off Duty
function Trucking_Blip(toggle)
    Citizen.Wait(500)
    if toggle then
        Trucking_deleteBlips()
        Trucking_refreshBlips()
        Trucking.Notify('success', Trucking.Translation['clocked_in'], 5000)
        Trucking.Vars.OnShift = true
        ClockInOut()
    else
        Trucking_deleteBlips()
        Trucking.Notify('success', Trucking.Translation['clocked_out'], 5000)
        Trucking.Vars.OnShift = false
    end
end

function Trucking_deleteBlips()
    if BlipTable[1] ~= nil then
        for i=1, #BlipTable, 1 do
            RemoveBlip(BlipTable[i])
            BlipTable[i] = nil
        end
    end
end

function Trucking_refreshBlips()
    for _, info in pairs(Trucking.Blips) do
        if info.coords.x then
            local blip = AddBlipForCoord(info.coords.x, info.coords.y, info.coords.z)
            SetBlipSprite(blip, (info.id or 477))
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, (info.scale or 0.5))
            SetBlipCategory(blip, 3)
            SetBlipColour(blip, (info.color or Trucking.Color['blip']))
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(info.title)
            EndTextCommandSetBlipName(blip)
            table.insert(BlipTable, blip)
        end
    end
end

function Trucking_addBlip(coords, sprite, color, text, entity)
    local blip;

    if not coords and entity then
        blip = AddBlipForEntity(entity)
    else
        blip = AddBlipForCoord(coords)
    end
    SetBlipSprite(blip, (sprite or 477))
    SetBlipColour(blip, (color or Trucking.Color['blip']))
    SetBlipScale(blip, 0.7)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)
    return blip
end

-- Truck Rental --

-- Trunk Rental Menu
function OpenRentalMenu()
    
    -- ESX UI
    if Trucking.UsingESX and not Trucking.UsingNativeUI then
        local elements = {}
        for i,v in pairs(Trucking.Renting.Trucks) do
            table.insert(elements, {
                label = ('%s - $%s'):format(v.label, v.rentPrice),
                value = i,
                price = v.rentPrice
            })
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'rent_truck_menu', {
            title    = Trucking.Translation['menu_header'],
            align    = 'bottom-right',
            elements = elements
        }, function(data, menu)
            if Trucking.Renting.Trucks[data.current.value] then
                RentTruck(data.current.value, data.current.price)
                ESX.UI.Menu.CloseAll()
            end
        end, function(data, menu)
            menu.close()
        end)

    -- NativeUI
    elseif Trucking.UsingNativeUI then
        if menuPool then
            menuPool:CloseAllMenus()
        end
    
        local rentalMenu = CreateNativeUIMenu(Trucking.Translation['menu_header'], Trucking.Translation['nativeUI_rental_sub'])
        
        for i,v in pairs(Trucking.Renting.Trucks) do
            local _item = NativeUI.CreateItem(v.label, (Trucking.Translation['nativeUI_rental_item_sub']):format(v.rentPrice, Trucking.Renting.securityDeposit or 0))
            _item.Activated = function(...)
                if Trucking.Renting.Trucks[i] then
                    RentTruck(i, v.rentPrice)
                end
                menuPool:CloseAllMenus()
            end
            rentalMenu:AddItem(_item)
        end
    
        rentalMenu:RefreshIndex()
        rentalMenu:Visible(true)
    end
end

-- Return Rental
function ReturnRental()
    local player = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(player)

    -- If the entity is a rental truck
    if vehicle == Trucking.Vars.Data.Rental.entity then
        local vehicleHealth = {
            Body = math.floor(GetVehicleBodyHealth(vehicle)),
            Engine = math.floor(GetVehicleEngineHealth(vehicle)),
        }
        local totalDamage = (1000 - vehicleHealth.Body) + (1000 - vehicleHealth.Engine)

        if totalDamage > 50 and Trucking.Renting.securityDeposit then
            if totalDamage >= 900 then totalDamage = 1000 end
            Trucking.Notify('error', (Trucking.Translation['damaged_truck']):format(tostring(math.floor(Trucking.Renting.securityDeposit * (totalDamage / 1000)))), 10000)
            if math.floor(Trucking.Renting.securityDeposit * (totalDamage / 1000)) > 0 then
                Trucking.addMoney(Trucking.Renting.securityDeposit - math.floor(Trucking.Renting.securityDeposit * (totalDamage / 1000)))
            end
        else
            Trucking.Notify('success', Trucking.Translation['returned_truck'], 5000)
            if Trucking.Renting.securityDeposit then
                Trucking.addMoney(Trucking.Renting.securityDeposit)
            end
        end

        Trucking.Vars.Data.Rental = {model = false, timeOfRent = false, entity = false}
        TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)

        Trucking.DeleteVehicle(vehicle)
    else
        Trucking.Notify('error', Trucking.Translation['not_a_rental_truck'], 5000)
    end
end

-- Rent Truck (Functionality)
function RentTruck(model, price)
    local playerMoney = GetPlayerMoney()
    local canRent = false

    if Trucking.Renting.securityDeposit and playerMoney >= (Trucking.Renting.securityDeposit + price) or not Trucking.Renting.securityDeposit and playerMoney >= price then
        if Trucking.Renting.securityDeposit then price = Trucking.Renting.securityDeposit + price end
        Trucking.removeMoney(price)
        canRent = true
    else
        Trucking.Notify('error', Trucking.Renting.securityDeposit and (Trucking.Translation['no_money_rent_security']):format(Trucking.Renting.securityDeposit) or Trucking.Translation['no_money_rent'], 5000)
    end

    if not Trucking.Vars.Data.Rental.model and model and canRent then
        local availableSpots = {}

        for i=1, #Trucking.Locations.TruckSpawns, 1 do
            local closevehicle = GetClosestVehicle(Trucking.Locations.TruckSpawns[i].x, Trucking.Locations.TruckSpawns[i].y, Trucking.Locations.TruckSpawns[i].z, 2.0,  0,  71)

            if not DoesEntityExist(closevehicle) then
                table.insert(availableSpots, Trucking.Locations.TruckSpawns[i])
            end
        end
        
        for i=1, #availableSpots, 1 do
            local closevehicle = GetClosestVehicle(availableSpots[i].x, availableSpots[i].y, availableSpots[i].z, 2.0,  0,  71)
            local available = true

            while DoesEntityExist(closevehicle) and available do Wait(0)
                if not IsEntityAMissionEntity(closevehicle) then
                    DeleteVehicle(closevehicle)
                else
                    available = false
                end
            end

            if available then
                Trucking.SpawnVehicle(model,{
                    x = availableSpots[i].x,
                    y = availableSpots[i].y,
                    z = availableSpots[i].z + 1							
                    }, availableSpots[i].w, function(vehicle2)
                    SetVehRadioStation(vehicle2, "OFF")
                    SetEntityAsMissionEntity(vehicle2, false, false)
                    SetVehicleFuelLevel(vehicle2, 100.0)
            
                    Trucking.Vars.Data.Rental = {model = model, timeOfRent = GetGameTimer(), entity = vehicle2}
                    TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)
                end)

                if Trucking.Renting.securityDeposit then
                    Trucking.Notify('success', (Trucking.Translation['rented_truck_deposit']):format(Trucking.Renting.securityDeposit), 10000)
                else
                    Trucking.Notify('success', Trucking.Translation['rented_truck'], 10000)
                end
                break
            end

        end

        -- Routine check-up to check if the truck is not destroyed
        Citizen.CreateThread(function()
            Citizen.Wait(5000)
            while Trucking.Vars.Data.Rental.entity do Citizen.Wait(2000)
                local truckHealth = GetVehicleEngineHealth(Trucking.Vars.Data.Rental.entity)
                
                if truckHealth <= 0 or not DoesEntityExist(Trucking.Vars.Data.Rental.entity) then
                    Citizen.Wait(250)
                    if Trucking.Vars.Data.Rental.entity then
                        DoScreenFadeOut(1000)
                        Citizen.Wait(1000)
                        Trucking.Notify('error', Trucking.Renting.securityDeposit and (Trucking.Translation['truckdestroyed_security']):format(Trucking.Renting.securityDeposit) or Trucking.Translation['truckdestroyed'])
                        Trucking.removeMoney(Trucking.Renting.securityDeposit)
                        if Trucking.DeleteDestroyedEntity then
                            Trucking.DeleteVehicle(Trucking.Vars.Data.Rental.entity)
                        end
                        Trucking.Vars.Data.Rental = {}; Trucking.Vars.Data.Models.Truck = false
                        TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)
                        DoScreenFadeIn(1000)
                        Citizen.Wait(1000)
                        break
                    else
                        -- Break loop if the entity no longer exists (or similar reason)
                        break
                    end
                end
            end
        end)
    elseif Trucking.Vars.Data.Rental.model then
        Trucking.Notify('error', Trucking.Translation['already_renting'], 5000)
    end
end

-- Trailers --

-- Trailer menu
function TrailerOptionsMenu()
    if Trucking.Vars.isFetchingInfo then
        Trucking.Notify('inform', Trucking.Translation['escort_fetching'])
    else
        if next(Trucking.Vars.Data.Trailer) == nil then
            local xpData = false
            if not Trucking.RequireJob then
                xpData = Trucking.GetXPLevel()
            end

            -- ESX UI
            if Trucking.UsingESX and not Trucking.UsingNativeUI then
                local elements = {}
                for i=1, #Trucking.Trailers, 1 do
                    if Trucking.Trailers[i].routeType - 1 <= (Trucking.RequireJob and GetPlayerJob().grade or not Trucking.RequireJob and xpData.grade) then
                        table.insert(elements, {
                            label = Trucking.Trailers[i].label,
                            value = 'selectTrailer',
                            data = Trucking.Trailers[i]
                        })
                    end
                end

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'trailer_options', {
                    title    = Trucking.Translation['menu_header'],
                    align    = 'bottom-right',
                    elements = elements
                }, function(data, menu)
                    if data.current.value == 'selectTrailer' then
                        if data.current.data.routeType == 5 then
                            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'escort_options', {
                                title    = Trucking.Translation['menu_header'],
                                align    = 'bottom-right',
                                elements = {
                                    {
                                        label = Trucking.Translation['menu_label_escort_info'],
                                    },
                                    {
                                        label = Trucking.Translation['menu_label_escort_yes'],
                                        value = 'yes',
                                    },
                                    {
                                        label = Trucking.Translation['menu_label_escort_no'],
                                        value = 'no',
                                    },
                                }
                            }, function(data2, menu2)
                                if data2.current.value == 'yes' then
                                    local el = {}
                                    local players, nearbyPlayer = Trucking.GetPlayersInArea(false, 5.0)
                                    local foundPlayers = false

                                    for i = 1, #players, 1 do
                                        if players[i] ~= PlayerId() then
                                            foundPlayers = true
                                            local serverId = GetPlayerServerId(players[i])

                                            table.insert(el,{
                                                label = ('[%s] %s'):format(serverId, GetPlayerName(players[i])),
                                                player = serverId
                                            })
                                        end
                                    end

                                    if foundPlayers then
                                        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_selection', {
                                            title    = Trucking.Translation['menu_header'],
                                            align    = 'bottom-right',
                                            elements = el
                                        }, function(data3, menu3)
                                            if data3.current.player and type(data3.current.player) == 'number' then
                                                ESX.UI.Menu.CloseAll()

                                                Trucking.Vars.isFetchingInfo = true
                                                TriggerServerCallback('Al_Trucking:PrepEscort', function(escortIdentifier, errorMessage)
                                                    if escortIdentifier then
                                                        Trucking.Vars.escortDriverIdentifier = escortIdentifier
                                                        Trucking.Vars.isFetchingInfo = false

                                                        local timer = GetGameTimer()
                                                        while Trucking.Vars.escortToDriverUpdate == nil and type(Trucking.Vars.escortToDriverUpdate) ~= 'boolean' do
                                                            local timeLeft = Trucking.Escort.timeToRespond - math.floor((GetGameTimer() - timer) / 1000)
                                                            if timeLeft < 0 then
                                                                Trucking.Notify('error', Trucking.Translation['escort_request_cancelled'])
                                                                break
                                                            else
                                                                Trucking.HelpNotification((Trucking.Translation['escort_request_waiting']):format(timeLeft))
                                                            end

                                                            Citizen.Wait(0)
                                                        end

                                                        if Trucking.Vars.escortToDriverUpdate then
                                                            Trucking.Notify('success', Trucking.Translation['escort_request_accepted'])
                                                            
                                                            Trucking.Vars.Data.Trailer = {}
                                                            Trucking.TrailerSpawnAvailability(data.current.data.model)
                                                            Trucking.Vars.Data.Trailer = data.current.data
                                                            TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)
                                                        elseif type(Trucking.Vars.escortToDriverUpdate) == 'boolean' and not Trucking.Vars.escortToDriverUpdate then
                                                            Trucking.Notify('error', Trucking.Translation['escort_request_denied'])
                                                        end
                                                        
                                                        Trucking.Vars.escortToDriverUpdate = nil
                                                    else
                                                        Trucking.Vars.isFetchingInfo = false
                                                        
                                                        Trucking.Notify('error', errorMessage)
                                                    end
                                                end, data3.current.player, GetSpecifiedIdentifier())

                                                local timer = GetGameTimer()
                                                while not Trucking.Vars.escortDriverIdentifier and Trucking.Vars.isFetchingInfo do
                                                    local currentTime = GetGameTimer()

                                                    if currentTime - timer > 5000 then
                                                        Trucking.Notify('error', Trucking.Translation['escort_not_available'])
                                                        Trucking.Vars.isFetchingInfo = false
                                                        break
                                                    end
                                                    Citizen.Wait(50)
                                                end
                                            end
                                        end, function(data3, menu3)
                                            menu3.close()
                                        end)
                                    else
                                        ESX.UI.Menu.CloseAll()
                                        Trucking.Notify('error', Trucking.Translation['no_players_nearby'], 5000)
                                    end
                                elseif data2.current.value == 'no' then
                                    menu2.close()
                                end
                            end, function(data2, menu2)
                                menu2.close()
                            end)
                        else
                            Trucking.Vars.Data.Trailer = {}
                            Trucking.TrailerSpawnAvailability(data.current.data.model)
                            Trucking.Vars.Data.Trailer = data.current.data
                            TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)
                            menu.close()
                        end
                    end
                end, function(data, menu)
                    menu.close()
                end)

            -- NativeUI
            elseif Trucking.UsingNativeUI then
                if menuPool then
                    menuPool:CloseAllMenus()
                end
            
                local trailerMenu = CreateNativeUIMenu(Trucking.Translation['menu_header'], Trucking.Translation['nativeUI_trailer_sub'])
                local playerJob = GetPlayerJob()

                for i=1, #Trucking.Trailers, 1 do
                    if Trucking.Trailers[i].routeType - 1 <= (Trucking.RequireJob and playerJob.grade or not Trucking.RequireJob and xpData.grade) then
                        
                        if Trucking.Trailers[i].routeType == 5 then
                            local specialCargo = menuPool:AddSubMenu(trailerMenu, Trucking.Trailers[i].label, Trucking.Translation['nativeUI_escort_info'], true)
                            local confirm = menuPool:AddSubMenu(specialCargo, Trucking.Translation['nativeUI_escort_check_nearby_players'], '', true)
                            specialCargo:RefreshIndex()

                            -- Check for nearby players
                            local players, nearbyPlayer = Trucking.GetPlayersInArea(false, 5.0)
                            local foundPlayers = false

                            for i = 1, #players, 1 do
                                if players[i] ~= PlayerId() then
                                    foundPlayers = true
                                    local serverId = GetPlayerServerId(players[i])

                                    local _item = NativeUI.CreateItem(('[%s] %s'):format(serverId, GetPlayerName(players[i])), Trucking.Translation['nativeUI_escort_request_escort'])
                                    _item.Activated = function(...)
                                        menuPool:CloseAllMenus()

                                        Trucking.Vars.isFetchingInfo = true
                                        TriggerServerCallback('Al_Trucking:PrepEscort', function(escortIdentifier, errorMessage)
                                            if escortIdentifier then
                                                Trucking.Vars.escortDriverIdentifier = escortIdentifier
                                                Trucking.Vars.isFetchingInfo = false

                                                local timer = GetGameTimer()
                                                while Trucking.Vars.escortToDriverUpdate == nil and type(Trucking.Vars.escortToDriverUpdate) ~= 'boolean' do
                                                    local timeLeft = Trucking.Escort.timeToRespond - math.floor((GetGameTimer() - timer) / 1000)
                                                    if timeLeft < 0 then
                                                        Trucking.Notify('error', Trucking.Translation['escort_request_cancelled'])
                                                        break
                                                    else
                                                        Trucking.HelpNotification((Trucking.Translation['escort_request_waiting']):format(timeLeft))
                                                    end

                                                    Citizen.Wait(0)
                                                end

                                                if Trucking.Vars.escortToDriverUpdate then
                                                    Trucking.Notify('success', Trucking.Translation['escort_request_accepted'])
                                                    
                                                    Trucking.Vars.Data.Trailer = {}
                                                    Trucking.TrailerSpawnAvailability(data.model)
                                                    Trucking.Vars.Data.Trailer = data
                                                    TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)
                                                elseif type(Trucking.Vars.escortToDriverUpdate) == 'boolean' and not Trucking.Vars.escortToDriverUpdate then
                                                    Trucking.Notify('error', Trucking.Translation['escort_request_denied'])
                                                end
                                                
                                                Trucking.Vars.escortToDriverUpdate = nil
                                            else
                                                Trucking.Vars.isFetchingInfo = false
                                                
                                                Trucking.Notify('error', errorMessage)
                                            end
                                        end, serverId, GetSpecifiedIdentifier())

                                        local timer = GetGameTimer()
                                        while not Trucking.Vars.escortDriverIdentifier and Trucking.Vars.isFetchingInfo do
                                            local currentTime = GetGameTimer()

                                            if currentTime - timer > 5000 then
                                                Trucking.Notify('error', Trucking.Translation['escort_not_available'])
                                                Trucking.Vars.isFetchingInfo = false
                                                break
                                            end
                                            Citizen.Wait(50)
                                        end
                                    end
                                    giveKeys.SubMenu:AddItem(_item)
                                end
                            end

                            if not foundPlayers then
                                local _item = NativeUI.CreateItem("No players nearby","")
                            confirm:AddItem(_item)
                            end

                            local reject = NativeUI.CreateItem(Trucking.Translation['nativeUI_escort_cancel'], '')
                            reject.Activated = function(...)
                                menuPool:CloseAllMenus()
                            end
                            specialCargo:AddItem(reject)
                        else
                            local _item = NativeUI.CreateItem(Trucking.Trailers[i].label, '')
                            _item.Activated = function(...)
                                if Trucking.Trailers[i] then
                                    local data = Trucking.Trailers[i]

                                    Trucking.Vars.Data.Trailer = {}
                                    Trucking.TrailerSpawnAvailability(data.model)
                                    Trucking.Vars.Data.Trailer = data
                                    TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)

                                    menuPool:CloseAllMenus()
                                end
                            end
                            trailerMenu:AddItem(_item)
                        end
                    end
                end

                trailerMenu:RefreshIndex()
                trailerMenu:Visible(true)
            end
        else
            Trucking.Notify('error', Trucking.Translation['alreadygottrailer'])
        end
    end
end
