------------------------------------------------------------------------------------------------------
------------------------------------------ CHAT COMMANDS ---------------------------------------------
------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/'..Config.RedeemCommand, L('redeem_description'), {{ name=L('enter_tebex_id_1'), help=L('enter_tebex_id_2')}})
    TriggerEvent('chat:addSuggestion', '/'..Config.StaffCommands.Add_Balance, L('addbalance_description'), {{ name=L('playerid_1'), help=L('playerid_2')}, { name=L('amount_1'), help=L('amount_2_add')}})
    TriggerEvent('chat:addSuggestion', '/'..Config.StaffCommands.Remove_Balance, L('removebalance_description'), {{ name=L('playerid_1'), help=L('playerid_2')}, { name=L('amount_1'), help=L('amount_2_remove')}})
end)
------------------------------------------------------------------------------------------------------
-------------------------------------------- MAIN THREAD ---------------------------------------------
------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    local alreadyEnteredZone = false
    local GlobalText = nil
    local GlobalText_last = nil
    while true do
        wait = 5
        local ped = PlayerPedId()
        local inZone = false
        if not DisablePurchase then
            for cd = 1, #Config.Locations do
                local dist = #(GetEntityCoords(ped)-vector3(Config.Locations[cd].x, Config.Locations[cd].y, Config.Locations[cd].z))
                if dist <= Config.Locations[cd].Distance then
                    wait = 5
                    inZone  = true
                    GlobalText = Config.Locations[cd].Text
                    if IsControlJustReleased(0, 38) then
                        TriggerEvent(Config.Locations[cd].EventName, false)
                        Wait(1000)
                    end
                    break
                else
                    wait = 2000
                end
            end

            if inZone and not alreadyEnteredZone then
                alreadyEnteredZone = true
                TriggerEvent('cd_drawtextui:ShowUI', 'show', GlobalText)
            end

            if GlobalText_last ~= GlobalText then
                TriggerEvent('cd_drawtextui:ShowUI', 'show', GlobalText)
            end

            if not inZone and alreadyEnteredZone then
                alreadyEnteredZone = false
                TriggerEvent('cd_drawtextui:HideUI')
            end
            GlobalText_last = GlobalText
        end
        Citizen.Wait(wait)
    end
end)
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
            ESX.ShowNotification(message)

        elseif Config.NotificationType.client == 'custom' then
            --enter custom notification here

        end
    end
end
------------------------------------------------------------------------------------------------------
----------------------------------------------- OTHER ------------------------------------------------
------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    local blip = AddBlipForCoord(Config.Locations[1].x, Config.Locations[1].y, Config.Locations[1].z)
    SetBlipSprite (blip, 546)
    SetBlipDisplay(blip, 4)
    SetBlipScale  (blip, 1.0)
    SetBlipColour (blip, 26)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(L('donator_shop'))
    EndTextCommandSetBlipName(blip)
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        TriggerEvent('cd_drawtextui:HideUI')
        SetModelAsNoLongerNeeded(SpawnedProp)
        DeleteEntity(SpawnedProp)
        if VehicleTable ~= nil then
            for g=1, #VehicleTable do
                if VehicleTable[g] and VehicleTable[g].vehicle then
                    SetEntityAsNoLongerNeeded(VehicleTable[g].vehicle)
                    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(VehicleTable[g].vehicle))
                    DeleteEntity(VehicleTable[g].vehicle)
                    DeleteVehicle(VehicleTable[g].vehicle)
                end
            end
        end
        SetNuiFocus(false, false)
    end
end)

------------------------------------------------------------------------------------------------------
-------------------------------------------- PURCHASE VEHICLE ----------------------------------------
------------------------------------------------------------------------------------------------------
function ConfirmPurchaseVehicle(data, pack_purchased, cd)
    DisablePurchase = true
    if (pack_purchased ~= nil and cd ~= nil) or Callback(data.Cost) then
        local vehicle = SpawnVehicle(data)
        local props = GetVehicleProperties(vehicle)
        local garage_type = nil

        if Config.Using_cdgarage then
            garage_type = exports['cd_garage']:GetGarageType(vehicle)
            props.plate = tostring(GetVehicleNumberPlateText(vehicle))
        else
            props.plate = GetVehicleNumberPlateText(vehicle):gsub('^%s(.-)%s$', '%1')
        end
        
        TriggerServerEvent('cd_donatorshop:Purchase_Vehicle', data, props, garage_type, GetVehicleLabel_model(props.model), pack_purchased, cd)
        DisablePurchase = false
    else
        DisablePurchase = false
        Notif(3, 'not_enough_credits')
    end
end

RegisterNetEvent('cd_donatorshop:VehiclePackPurchased')
AddEventHandler('cd_donatorshop:VehiclePackPurchased', function(model, pack_purchased, cd, last_vehicle)
    Wait(2000)
    local ped = PlayerPedId()
    local data = {}
    data.Model = model
    ConfirmPurchaseVehicle(data, pack_purchased, cd)
    if not last_vehicle then
        local vehicle = GetVehiclePedIsIn(ped)
        CD_DeleteVehicle(vehicle)
    end
end)