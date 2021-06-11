Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(5)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(100)
    end

    while true do
        ESX.PlayerData = ESX.GetPlayerData()
        Citizen.Wait(1000)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)

        local ped = GetPlayerPed(-1)

        if not IsPedDeadOrDying(ped, 1) then
            if IsControlJustPressed(1, 57) and GetLastInputMethod(2) then
                OpenMobileAIOActionsMenu()
            end
        else
            Citizen.Wait(500)
        end
    end
end)

function OpenMobileAIOActionsMenu()

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mobile_aio_actions', {
        title    = _U('aiomenu'),
        align    = 'center',
        elements = {
            {label = _U('interactions_menu'), value = 'interactions_menu'},
            {label = _U('vehicle_menu'), value = 'vehicle_menu'},
            {label = _U('esx_menu'), value = 'esx_menu'},
            {label = _U('jobs_menu'), value = 'jobs_menu'}
        }
    }, function(data, menu)
        if data.current.value == 'interactions_menu' then
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'interactions_menu', {
                title    = _U('aiomenu'),
                align    = 'center',
                elements = {
                    {label = _U('my_phone_number'), value = 'my_phone_number'},
                    {label = _U('give_phone_number'), value = 'give_phone_number'},
                    {label = _U('my_id'), value = 'my_id'},
                    {label = _U('show_id'), value = 'show_id'}
                }
            }, function(data, menu)
                if data.current.value == 'my_phone_number' then
                        TriggerServerEvent('esx_aiomenu:givePhoneNumber', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
                        ESX.UI.Menu.CloseAll()
                elseif data.current.value == 'give_phone_number' then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                    if closestPlayer == -1 or closestDistance > 2.0 then
                        ESX.ShowNotification(_U('no_players'))
                    elseif closestPlayer ~= -1 and closestDistance <= 2.0 then
                        TriggerServerEvent('esx_aiomenu:givePhoneNumber', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer))
                    end

                    ESX.UI.Menu.CloseAll()
                elseif data.current.value == 'my_id' then
                    TriggerServerEvent('esx_aiomenu:showID', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
                    ESX.UI.Menu.CloseAll()					
                elseif data.current.value == 'show_id' then
                    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

                    if closestPlayer == -1 or closestDistance > 2.0 then
                        ESX.ShowNotification(_U('no_players'))
                    elseif closestPlayer ~= -1 and closestDistance <= 2.0 then
                        TriggerServerEvent('esx_aiomenu:showID', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer))
                        ESX.UI.Menu.CloseAll()
                    end
                 end
            end, function(data, menu)
                menu.close()
            end)
        elseif data.current.value == 'vehicle_menu' then
            local ped = GetPlayerPed(-1)
            if IsPedInAnyVehicle(ped, true) then 
                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_menu', {
                    title    = _U('aiomenu'),
                    align    = 'center',
                    elements = {
                    	{label = "Car Control", value = 'car_control'}
                        --{label = _U('window_controls'), value = 'window_controls'},
                        --{label = _U('door_controls'), value = 'door_controls'}
                    }
                }, function(data, menu)
                	if data.current.value == 'car_control' then
                		exports['carcontrol']:OpenUI()
                		ESX.UI.Menu.CloseAll()
                    elseif data.current.value == 'window_controls' then
                        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'window_controls', {
                            title    = _U('aiomenu'),
                            align    = 'center',
                            elements = {
                                {label = _U('windows_up'), value = 'windows_up'},
                                {label = _U('windows_down'), value = 'windows_down'},
                                {label = _U('individual_window_controls'), value = 'individual_window_controls'}
                            }
                        }, function(data, menu)
                            if data.current.value == 'windows_up' then
                                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
                                    local frontLeftWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lf')
                                    local frontRightWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rf')
                                    local rearLeftWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lr')
                                    local rearRightWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rr')
                                    local frontMiddleWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lm')
                                    local rearMiddleWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rm')
                                    if frontLeftWindow ~= -1 or frontRightWindow ~= -1 or rearLeftWindow ~= -1 or rearRightWindow ~= -1 or frontMiddleWindow ~= -1 or rearMiddleWindow ~= -1 then
                                        RollUpWindow(vehicle, 0)
                                        RollUpWindow(vehicle, 1)
                                        RollUpWindow(vehicle, 2)
                                        RollUpWindow(vehicle, 3)
                                        RollUpWindow(vehicle, 4)
                                        RollUpWindow(vehicle, 5)
                                    else
                                        ESX.ShowNotification('This vehicle has no windows.')
                                    end
                                else
                                    ESX.ShowNotification('You must be the driver of a vehicle to use this.')
                                end
                            elseif data.current.value == 'windows_down' then
                                    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                    if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
                                        local frontLeftWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lf')
                                        local frontRightWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rf')
                                        local rearLeftWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lr')
                                        local rearRightWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rr')
                                        local frontMiddleWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lm')
                                        local rearMiddleWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rm')
                                        if frontLeftWindow ~= -1 or frontRightWindow ~= -1 or rearLeftWindow ~= -1 or rearRightWindow ~= -1 or frontMiddleWindow ~= -1 or rearMiddleWindow ~= -1 then
                                            RollDownWindow(vehicle, 0)
                                            RollDownWindow(vehicle, 1)
                                            RollDownWindow(vehicle, 2)
                                            RollDownWindow(vehicle, 3)
                                            RollDownWindow(vehicle, 4)
                                            RollDownWindow(vehicle, 5)
                                        else
                                            ESX.ShowNotification('This vehicle has no windows.')
                                        end
                                    else
                                        ESX.ShowNotification('You must be the driver of a vehicle to use this.')
                                    end
                            elseif data.current.value == 'individual_window_controls' then
                                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'individual_window_controls', {
                                    title    = _U('aiomenu'),
                                    align    = 'center',
                                    elements = {
                                        {label = _U('lf_window_up'), value = 'lf_window_up'},
                                        {label = _U('lf_window_down'), value = 'lf_window_down'},
                                        {label = _U('rf_window_up'), value = 'rf_window_up'},
                                        {label = _U('rf_window_down'), value = 'rf_window_down'},
                                        {label = _U('lr_window_up'), value = 'lr_window_up'},
                                        {label = _U('lr_window_down'), value = 'lr_window_down'},
                                        {label = _U('rr_window_up'), value = 'rr_window_up'},
                                        {label = _U('rr_window_down'), value = 'rr_window_down'},
                                        {label = _U('mf_window_up'), value = 'mf_window_up'},
                                        {label = _U('mf_window_down'), value = 'mf_window_down'},
                                        {label = _U('mr_window_up'), value = 'mr_window_up'},
                                        {label = _U('mr_window_down'), value = 'mr_window_down'}
                                    }
                                }, function(data, menu)
                                    if data.current.value == 'lf_window_up' then
                                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                        if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
                                            local frontLeftWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lf')
                                            if frontLeftWindow ~= -1 then
                                                RollUpWindow(vehicle, 0)
                                            else
                                                ESX.ShowNotification('This vehicle has no front left window.')
                                            end
                                        else
                                            ESX.ShowNotification('You must be the driver of a vehicle to use this.')
                                        end
                                    elseif data.current.value == 'lf_window_down' then
                                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                        if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
                                            local frontLeftWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lf')
                                            if frontLeftWindow ~= -1 then
                                                RollDownWindow(vehicle, 0)
                                            else
                                                ESX.ShowNotification('This vehicle has no front left window.')
                                            end
                                        else
                                            ESX.ShowNotification('You must be the driver of a vehicle to use this.')
                                        end
                                    elseif data.current.value == 'rf_window_up' then
                                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                        if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
                                            local frontRightWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rf')
                                            if frontRightWindow ~= -1 then
                                                RollUpWindow(vehicle, 1)
                                            else
                                                ESX.ShowNotification('This vehicle has no front right window.')
                                            end
                                        else
                                            ESX.ShowNotification('You must be the driver of a vehicle to use this.')
                                        end
                                    elseif data.current.value == 'rf_window_down' then
                                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                        if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
                                            local frontRightWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rf')
                                            if frontRightWindow ~= -1 then
                                                RollDownWindow(vehicle, 1)
                                            else
                                                ESX.ShowNotification('This vehicle has no front right window.')
                                            end
                                        else
                                            ESX.ShowNotification('You must be the driver of a vehicle to use this.')
                                        end
                                    elseif data.current.value == 'lr_window_up' then
                                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                        if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
                                            local rearLeftWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lr')
                                            if rearLeftWindow ~= -1 then
                                                RollUpWindow(vehicle, 2)
                                            else
                                                ESX.ShowNotification('This vehicle has no rear left window.')
                                            end
                                        else
                                            ESX.ShowNotification('You must be the driver of a vehicle to use this.')
                                        end
                                    elseif data.current.value == 'lr_window_down' then
                                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                        if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
                                            local rearLeftWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lr')
                                            if rearLeftWindow ~= -1 then
                                                RollDownWindow(vehicle, 2)
                                            else
                                                ESX.ShowNotification('This vehicle has no rear left window.')
                                            end
                                        else
                                            ESX.ShowNotification('You must be the driver of a vehicle to use this.')
                                        end
                                    elseif data.current.value == 'rr_window_up' then
                                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                        if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
                                            local rearRightWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rr')
                                            if rearRightWindow ~= -1 then
                                                RollUpWindow(vehicle, 3)
                                            else
                                                ESX.ShowNotification('This vehicle has no rear right window.')
                                            end
                                        else
                                            ESX.ShowNotification('You must be the driver of a vehicle to use this.')
                                        end
                                    elseif data.current.value == 'rr_window_down' then
                                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                        if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
                                            local rearRightWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rr')
                                            if rearRightWindow ~= -1 then
                                                RollDownWindow(vehicle, 3)
                                            else
                                                ESX.ShowNotification('This vehicle has no rear right window.')
                                            end
                                        else
                                            ESX.ShowNotification('You must be the driver of a vehicle to use this.')
                                        end
                                    elseif data.current.value == 'mf_window_up' then
                                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                        if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
                                            local frontMiddleWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lm')
                                            if frontMiddleWindow ~= -1 then
                                                RollUpWindow(vehicle, 4)
                                            else
                                                ESX.ShowNotification('This vehicle has no front middle window.')
                                            end
                                        else
                                            ESX.ShowNotification('You must be the driver of a vehicle to use this.')
                                        end
                                    elseif data.current.value == 'mf_window_down' then
                                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                        if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
                                            local frontMiddleWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lm')
                                            if frontMiddleWindow ~= -1 then
                                                RollDownWindow(vehicle, 4)
                                            else
                                                ESX.ShowNotification('This vehicle has no front middle window.')
                                            end
                                        else
                                            ESX.ShowNotification('You must be the driver of a vehicle to use this.')
                                        end
                                    elseif data.current.value == 'mr_window_up' then
                                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                        if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
                                            local rearMiddleWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rm')
                                            if rearMiddleWindow ~= -1 then
                                                RollUpWindow(vehicle, 5)
                                            else
                                                ESX.ShowNotification('This vehicle has no rear middle window.')
                                            end
                                        else
                                            ESX.ShowNotification('You must be the driver of a vehicle to use this.')
                                        end
                                    elseif data.current.value == 'mr_window_down' then
                                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                        if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
                                            local rearMiddleWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rm')
                                            if rearMiddleWindow ~= -1 then
                                                RollDownWindow(vehicle, 5)
                                            else
                                                ESX.ShowNotification('This vehicle has no rear middle window.')
                                            end
                                        else
                                            ESX.ShowNotification('You must be the driver of a vehicle to use this.')
                                        end
                                    end
                                end, function(data, menu)
                                    menu.close()
                                end)
                            end
                        end, function(data, menu)
                            menu.close()
                        end)
                    elseif data.current.value == 'door_controls' then
                        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'window_controls', {
                            title    = _U('aiomenu'),
                            align    = 'center',
                            elements = {
                                {label = _U('toggle_all_doors'), value = 'toggle_all_doors'},
                                {label = _U('individual_door_controls'), value = 'individual_door_controls'}
                            }
                        }, function(data, menu)
                            if data.current.value == 'toggle_all_doors' then
                                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
                                    if GetVehicleDoorAngleRatio(vehicle, 0) > 0.0 then 
                                        SetVehicleDoorShut(vehicle, 0, false)
                                        SetVehicleDoorShut(vehicle, 1, false)
                                        SetVehicleDoorShut(vehicle, 2, false)	
                                        SetVehicleDoorShut(vehicle, 3, false)	
                                        SetVehicleDoorShut(vehicle, 4, false)	
                                        SetVehicleDoorShut(vehicle, 5, false)				
                                    else
                                        SetVehicleDoorOpen(vehicle, 0, false) 
                                        SetVehicleDoorOpen(vehicle, 1, false)   
                                        SetVehicleDoorOpen(vehicle, 2, false)   
                                        SetVehicleDoorOpen(vehicle, 3, false)   
                                        SetVehicleDoorOpen(vehicle, 4, false)   
                                        SetVehicleDoorOpen(vehicle, 5, false)               
                                    end
                                else
                                    ESX.ShowNotification('You must be the driver of a vehicle to use this.')
                                end
                            elseif data.current.value == 'individual_door_controls' then
                                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'individual_door_controls', {
                                    title    = _U('aiomenu'),
                                    align    = 'center',
                                    elements = {
                                        {label = _U('toggle_hood'), value = 'toggle_hood'},
                                        {label = _U('toggle_trunk'), value = 'toggle_trunk'},
                                        {label = _U('lf_toggle_door'), value = 'lf_toggle_door'},
                                        {label = _U('rf_toggle_door'), value = 'rf_toggle_door'},
                                        {label = _U('lr_toggle_door'), value = 'lr_toggle_door'},
                                        {label = _U('rr_toggle_door'), value = 'rr_toggle_door'}
                                    }
                                }, function(data, menu)
                                    if data.current.value == 'toggle_hood' then
                                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                        if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
                                            local bonnet = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'bonnet')
                                            if bonnet ~= -1 then
                                                if GetVehicleDoorAngleRatio(vehicle, 4) > 0.0 then 
                                                    SetVehicleDoorShut(vehicle, 4, false)            
                                                else
                                                    SetVehicleDoorOpen(vehicle, 4, false)             
                                                end
                                            else
                                                ESX.ShowNotification('This vehicle does not have a hood.')
                                            end
                                        else
                                            ESX.ShowNotification('You must be the driver of a vehicle to use this.')
                                        end
                                    elseif data.current.value == 'toggle_trunk' then
                                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                        if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
                                            local boot = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'boot')
                                            if boot ~= -1 then
                                                if GetVehicleDoorAngleRatio(vehicle, 5) > 0.0 then 
                                                    SetVehicleDoorShut(vehicle, 5, false)            
                                                else
                                                    SetVehicleDoorOpen(vehicle, 5, false)             
                                                end
                                            else
                                                ESX.ShowNotification('This vehicle does not have a trunk.')
                                            end
                                        else
                                            ESX.ShowNotification('You must be the driver of a vehicle to use this.')
                                        end
                                    elseif data.current.value == 'lf_toggle_door' then
                                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                        if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
                                            local frontLeftDoor = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'door_dside_f')
                                            if frontLeftDoor ~= -1 then
                                                if GetVehicleDoorAngleRatio(vehicle, 0) > 0.0 then 
                                                    SetVehicleDoorShut(vehicle, 0, false)            
                                                else
                                                    SetVehicleDoorOpen(vehicle, 0, false)             
                                                end
                                            else
                                                ESX.ShowNotification('This vehicle does not have a front driver-side door.')
                                            end
                                        else
                                            ESX.ShowNotification('You must be the driver of a vehicle to use this.')
                                        end
                                    elseif data.current.value == 'rf_toggle_door' then
                                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                        if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
                                            local frontRightDoor = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'door_pside_f')
                                            if frontRightDoor ~= -1 then
                                                if GetVehicleDoorAngleRatio(vehicle, 1) > 0.0 then 
                                                    SetVehicleDoorShut(vehicle, 1, false)            
                                                else
                                                    SetVehicleDoorOpen(vehicle, 1, false)             
                                                end
                                            else
                                                ESX.ShowNotification('This vehicle does not have a front passenger-side door.')
                                            end
                                        else
                                            ESX.ShowNotification('You must be the driver of a vehicle to use this.')
                                        end
                                    elseif data.current.value == 'lr_toggle_door' then
                                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                        if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
                                            local rearLeftDoor = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'door_dside_r')
                                            if rearLeftDoor ~= -1 then
                                                if GetVehicleDoorAngleRatio(vehicle, 2) > 0.0 then 
                                                    SetVehicleDoorShut(vehicle, 2, false)            
                                                else
                                                    SetVehicleDoorOpen(vehicle, 2, false)             
                                                end
                                            else
                                                ESX.ShowNotification('This vehicle does not have a rear driver-side door.')
                                            end
                                        else
                                            ESX.ShowNotification('You must be the driver of a vehicle to use this.')
                                        end
                                    elseif data.current.value == 'rr_toggle_door' then
                                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                                        if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
                                            local rearRightDoor = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'door_pside_r')
                                            if rearRightDoor ~= -1 then
                                                if GetVehicleDoorAngleRatio(vehicle, 3) > 0.0 then 
                                                    SetVehicleDoorShut(vehicle, 3, false)            
                                                else
                                                    SetVehicleDoorOpen(vehicle, 3, false)             
                                                end
                                            else
                                                ESX.ShowNotification('This vehicle does not have a rear passenger-side door.')
                                            end
                                        else
                                            ESX.ShowNotification('You must be the driver of a vehicle to use this.')
                                        end
                                    end
                                end, function(data, menu)
                                    menu.close()
                                end)
                            end
                        end, function(data, menu)
                            menu.close()
                        end)
                    end
                end, function(data, menu)
                    menu.close()
                end)
            else
                ESX.ShowNotification(_U('need_to_be_in_vehicle'))
            end
        elseif data.current.value == 'esx_menu' then
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'esx_menu', {
                title    = _U('aiomenu'),
                align    = 'center',
                elements = {
                    {label = _U('invoices_button'), value = 'invoices_button'},
                    --{label = _U('voice_range_button'), value = 'voice_range_button'},
                    {label = _U('animations_button'), value = 'animations_button'}
                }
            }, function(data, menu)
                if data.current.value == 'invoices_button' then
                                 ESX.UI.Menu.CloseAll()
                         TriggerEvent('myBills:openMenu')
                --elseif data.current.value == 'voice_range_button' then
                   -- exports['esx_voice']:setVoice()
                elseif data.current.value == 'animations_button' then
                    exports['esx_animations']:OpenAnimationsMenu()
                end
            end, function(data, menu)
                menu.close()
            end)
        elseif data.current.value == 'jobs_menu' then
            if ESX ~= nil then
                if ESX.PlayerData ~= nil then
                    if ESX.PlayerData.job ~= nil then
                       if ESX.PlayerData.job.name ~= nil then
                            if ESX.PlayerData.job.name == 'ambulance' then
                                ESX.UI.Menu.CloseAll()
                                exports['esx_ambulancejob']:OpenMobileAmbulanceActionsMenu()
                           -- elseif ESX.PlayerData.job.name == 'police' then
                            --    ESX.UI.Menu.CloseAll()
                            --    exports['esx_policejob']:OpenPoliceActionsMenu()
                              elseif ESX.PlayerData.job.name == 'mechanic' then
                                ESX.UI.Menu.CloseAll()
                                exports['esx_mechanicjob']:OpenMobileMechanicActionsMenu()
                            --elseif ESX.PlayerData.job.name == 'taxi' then
                            --    ESX.UI.Menu.CloseAll()
                            --    exports['esx_taxijob']:OpenMobileTaxiActionsMenu()
                            end
                        end
                   end
                end
            end
        end
    end, function(data, menu)
        menu.close()
    end)
end

RegisterNetEvent('esx_aiomenu:givePhoneNumber')
AddEventHandler('esx_aiomenu:givePhoneNumber', function(data)
    if data.phoneNumber ~= 'nil' then	
        ESX.ShowNotification(data.name .. '\'s number is ' .. data.phoneNumber .. '.')
    else
        ESX.ShowNotification(data.name .. '\'s phone isn\'t working properly.')
    end	
end)

RegisterNetEvent('esx_aiomenu:showID')
AddEventHandler('esx_aiomenu:showID', function(data)
    if data.name ~= 'Nil' then	
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'show_id', {
            title    = _U('aiomenu'),
            align    = 'center',
            elements = {
                {label = 'Name: ' .. tostring(data.name), value = 'nil'},
                {label = 'DOB: ' .. tostring(data.dob), value = 'nil'},
                {label = 'Sex: ' .. tostring(data.sex), value = 'nil'},
                {label = 'Height: ' .. tostring(data.height), value = 'nil'}
            }
        }, function(data, menu)

        end, function(data, menu)
            menu.close()
        end)
    else
        ESX.ShowNotification('Error with Show ID. Please contact the developer of ESX AIOMenu.')
    end	
end)
