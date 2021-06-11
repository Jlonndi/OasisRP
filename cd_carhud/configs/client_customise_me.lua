------------------------------------------------------------------------------------------------------
--------------------------------------------- COMMANDS -----------------------------------------------
------------------------------------------------------------------------------------------------------
if Config.Settings.ENABLE then
    RegisterKeyMapping(Config.Settings.command, Config.Settings.description, 'keyboard', Config.Settings.key)
    TriggerEvent('chat:addSuggestion', '/'..Config.Settings.command, Config.Settings.description)
    RegisterCommand(Config.Settings.command, function()
        TriggerEvent('cd_carhud:OpenSettingsUI')
    end)
end
if Config.Seatbelt.ENABLE then
    RegisterKeyMapping(Config.Seatbelt.command, Config.Seatbelt.description, 'keyboard', Config.Seatbelt.key)
    TriggerEvent('chat:addSuggestion', '/'..Config.Seatbelt.command, Config.Seatbelt.description)
    RegisterCommand(Config.Seatbelt.command, function()
        TriggerEvent('cd_carhud:ToggleSeatbelt')
    end)
end
if Config.Cruise.ENABLE then
    RegisterKeyMapping(Config.Cruise.command, Config.Cruise.description, 'keyboard', Config.Cruise.key)
    TriggerEvent('chat:addSuggestion', '/'..Config.Cruise.command, Config.Cruise.description)
    RegisterCommand(Config.Cruise.command, function()
        TriggerEvent('cd_carhud:ToggleCruise')
    end)
end

if Config.ToggleCarhud.ENABLE then
    TriggerEvent('chat:addSuggestion', '/'..Config.ToggleCarhud.command, Config.ToggleCarhud.description)
    RegisterCommand(Config.ToggleCarhud.command, function()
        TriggerEvent('cd_carhud:ToggleHud')
    end)
end
------------------------------------------------------------------------------------------------------
------------------------------------------ NOTIFICATIONS ---------------------------------------------
------------------------------------------------------------------------------------------------------
function Notification(notif_type, message)
    if notif_type ~= nil and message ~= nil then
        if Config.NotificationType.client == 'chat' then
            TriggerEvent('chatMessage', message)

        elseif Config.NotificationType.client == 'mythic_old' then
            if notif_type == 1 then
                exports['mythic_notify']:DoCustomHudText('success', message, 10000)
            elseif notif_type == 2 then
                exports['mythic_notify']:DoCustomHudText('inform', message, 10000)
            elseif notif_type == 3 then
                exports['mythic_notify']:DoCustomHudText('error', message, 10000)
            end

        elseif Config.NotificationType.client == 'mythic_new' then
            if notif_type == 1 then
                exports['mythic_notify']:SendAlert('success', message, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
            elseif notif_type == 2 then
                exports['mythic_notify']:SendAlert('inform', message, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
            elseif notif_type == 3 then
                exports['mythic_notify']:SendAlert('error', message, { ['background-color'] = '#ffffff', ['color'] = '#000000' })
            end

        elseif Config.NotificationType.client == 'esx' then
            ESXShowNotification(message)

        elseif Config.NotificationType.client == 'custom' then
            --enter custom notification here

        end
    end
end
------------------------------------------------------------------------------------------------------
----------------------------------------- VEHICLE CHECKS ---------------------------------------------
------------------------------------------------------------------------------------------------------
function GetFuel(vehicle)
    --return GetVehicleFuelLevel(vehicle) --Default fivem native example.
    return DecorGetFloat(vehicle, '_FUEL_LEVEL') --Legacy Fuel example.
    --return math.ceil((100 / GetVehicleHandlingFloat(vehicle, "CHandlingData", "fPetrolTankVolume")) * math.ceil(GetVehicleFuelLevel(vehicle))) --FRFuel example.
end