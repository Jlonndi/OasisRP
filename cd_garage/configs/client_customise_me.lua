------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------- MAIN THREAD ----------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
local pausemenuopen = false
Citizen.CreateThread(function()
    local alreadyEnteredZone = false
    local GlobalText = nil
    local GlobalText_last = nil
    while IsAuthorised == false do Wait(100) end
    while true do
        wait = 5
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local in_vehicle = IsPedInAnyVehicle(ped, true)
        local inZone = false

        for cd = 1, #Config.Locations do
            local dist = #(coords-vector3(Config.Locations[cd].x_1, Config.Locations[cd].y_1, Config.Locations[cd].z_1))
            if dist <= Config.Locations[cd].Dist then
                wait = 5
                inZone = true
                GlobalText = Config.Locations[cd].Name
                if in_vehicle then
                    GlobalText = '<b>'..Locales[Config.Language]['garage']..'</b></p>'..Locales[Config.Language]['notif_storevehicle']
                end

                if not CooldownActive then
                    if IsControlJustReleased(0, Config.QuickChoose_Key) then
                        TriggerEvent('cd_garage:EnterGarage_Outside', cd)
                    elseif IsControlJustReleased(0, Config.EnterGarage_Key) and Config.Locations[cd].EventName2 == 'cd_garage:EnterGarage' then
                        TriggerEvent('cd_garage:Cooldown', 7000)
                        TriggerEvent('cd_garage:EnterGarage_Inside', cd)
                    end
                end
                if not pausemenuopen and IsPauseMenuActive() then
                    pausemenuopen = true
                    DrawTextUI('hide')
                elseif pausemenuopen and not IsPauseMenuActive() then
                    pausemenuopen = false
                    DrawTextUI('show', GlobalText)
                end
                break
            else
                wait = 1000
            end
        end
        
        if not pausemenuopen then
            if inZone and not alreadyEnteredZone then
                alreadyEnteredZone = true
                DrawTextUI('show', GlobalText)
            end

            if GlobalText_last ~= GlobalText then
                DrawTextUI('show', GlobalText)
            end

            if not inZone and alreadyEnteredZone then
                alreadyEnteredZone = false
                DrawTextUI('hide')
            end
            GlobalText_last = GlobalText
        end
        Citizen.Wait(wait)
    end
end)
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
---------------------------------------- JOB SPAWN THREAD --------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
if Config.UseJobVehicles then
    Citizen.CreateThread(function()
        local alreadyEnteredZone = false
        local GlobalText = nil
        local GlobalText_last = nil
        while IsAuthorised == false do Wait(100) end
        Citizen.Wait(1000)
        while true do
            wait = 5
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local in_vehicle = IsPedInAnyVehicle(ped, true)
            local job = GetJob()
            local inZone = false
            if Config.JobVehicles_SpawnLocations[job] ~= nil then
                for cd = 1, #Config.JobVehicles_SpawnLocations[job] do
                    local dist = #(coords-vector3(Config.JobVehicles_SpawnLocations[job][cd].coords.x, Config.JobVehicles_SpawnLocations[job][cd].coords.y, Config.JobVehicles_SpawnLocations[job][cd].coords.z))
                    if dist <= Config.JobVehicles_SpawnLocations[job][cd].distance then
                        wait = 5
                        inZone = true
                        GlobalText = '<b>'..Locales[Config.Language]['job_garage']..'</b></p>'..Locales[Config.Language]['open_garage_1']
                        if in_vehicle then
                            GlobalText = '<b>'..Locales[Config.Language]['job_garage']..'</b></p>'..Locales[Config.Language]['notif_storevehicle']
                        end

                        if not CooldownActive then
                            if IsControlJustReleased(0, Config.QuickChoose_Key) then
                                TriggerEvent('cd_garage:Cooldown', 3000)
                                if not in_vehicle then
                                    local garage_type = Config.JobVehicles_SpawnLocations[job][cd].garage_type
                                    if Config.UseJobVehicles and Config.JobVehicles_SpawnLocations[job][cd].method == 'societyowned' then
                                        TriggerEvent('cd_garage:JobVehicleSpawn', 'owned', job, garage_type, true)
                                    elseif Config.UseJobVehicles and Config.JobVehicles_SpawnLocations[job][cd].method == 'personalowned' then
                                        TriggerEvent('cd_garage:JobVehicleSpawn', 'owned', job, garage_type, false)
                                    elseif Config.JobVehicles_SpawnLocations[job][cd].method == 'regular' then
                                        TriggerEvent('cd_garage:JobVehicleSpawn', 'not_owned', job, garage_type, Config.JobVehicles_RegularMethod[job])
                                    end
                                else
                                    local vehicle = GetVehiclePedIsIn(ped, false)
                                    if Config.UseJobVehicles and Config.JobVehicles_SpawnLocations[job][cd].method == 'societyowned' then
                                        TriggerEvent('cd_garage:StoreVehicle_Main', false, job)
                                    elseif Config.UseJobVehicles and Config.JobVehicles_SpawnLocations[job][cd].method == 'personalowned' then
                                        TriggerEvent('cd_garage:StoreVehicle_Main', false, false)
                                    elseif Config.JobVehicles_SpawnLocations[job][cd].method == 'regular' then
                                        TaskLeaveVehicle(ped, vehicle, 0) while IsPedInVehicle(ped, vehicle, true) do Wait(0) end
                                        CD_DeleteVehicle(vehicle)
                                    end
                                end
                            end
                        end
                        if not pausemenuopen and IsPauseMenuActive() then
                            pausemenuopen = true
                            DrawTextUI('hide')
                        elseif pausemenuopen and not IsPauseMenuActive() then
                            pausemenuopen = false
                            DrawTextUI('show', GlobalText)
                        end
                        break
                    else
                        wait = 1000
                    end
                end
                
                if not pausemenuopen then
                    if inZone and not alreadyEnteredZone then
                        alreadyEnteredZone = true
                        DrawTextUI('show', GlobalText)
                    end

                    if GlobalText_last ~= GlobalText then
                        DrawTextUI('show', GlobalText)
                    end

                    if not inZone and alreadyEnteredZone then
                        alreadyEnteredZone = false
                        DrawTextUI('hide')
                    end
                    GlobalText_last = GlobalText
                end
            else
                if alreadyEnteredZone or inZone then
                    alreadyEnteredZone, inZone, pausemenuopen = false, false, false
                    DrawTextUI('hide')
                end
                wait = 5000
            end
            Citizen.Wait(wait)
        end
    end)
end
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------ CHAT COMMANDS ---------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    if Config.UseImpound then
        TriggerEvent('chat:addSuggestion', '/'..Config.ImpoundCommand, 'Impound a vehicle')
    end
    if Config.UseMileage then
        TriggerEvent('chat:addSuggestion', '/'..Config.CheckMilesCommand, 'Check the mileage of your vehicle')
    end
    if Config.UseGarageSpace then
        TriggerEvent('chat:addSuggestion', '/'..Config.GarageSpaceCommand, 'Check your garage limit', {{ name="add", help='CARDEALERS ONLY - Purchase an extra garage slot for a customer'}, { name="playerid", help='CARDEALERS ONLY - The ID of the player'}})
    end
    if UseTransferVehicle then
        TriggerEvent('chat:addSuggestion', '/'..Config.TransferVehicleCommand, 'Transfer your vehicle to another player', {{ name="serverid", help='The players server ID'}})
    end
    TriggerEvent('chat:addSuggestion', '/closeall', 'This command force closes all menu\'s and UI\'s. - You can also use this command in F8 just without the /')
    TriggerEvent('chat:addSuggestion', '/vehicle-add', 'Staff Only - Add a vehicle to a players garage', {{ name='playerid', help='The ID of the player (keep empty to give the car to yourself)'}})
    TriggerEvent('chat:addSuggestion', '/vehicle-delete', 'Staff Only - Delete a vehicle from a players garage')
    TriggerEvent('chat:addSuggestion', '/vehicle-plate', 'Staff Only - Change the plate of a vehicle')
end)

if Config.UseImpound then
    RegisterCommand(Config.ImpoundCommand, function()
        if IsAllowed() then
            TriggerEvent('cd_garage:ImpoundVehicle')
        else
            Notif(3, 'no_permissions_impounding')
        end
    end)
end

if Config.UseMileage then
    RegisterCommand(Config.CheckMilesCommand, function()
        TriggerEvent('cd_garage:checkmileage')
    end)
end

if Config.UseTransferVehicle then
    RegisterCommand(Config.TransferVehicleCommand, function(source, args)
        TransferVehicle(false, tonumber(args[1]))
    end)
end

RegisterCommand('closeall', function()
    CloseAllNUI()
end)

RegisterCommand('vehicle-add', function(source, args)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    if args[1] == nil then
        args[1] = GetPlayerServerId(PlayerId())
    end
    if IsPedInAnyVehicle(ped) then
        local plate = tostring(GetVehicleNumberPlateText(vehicle))
        local target = tonumber(args[1])
        local props = GetVehicleProperties(vehicle)
        local garage_type = GetGarageType(vehicle)
        TriggerServerEvent('cd_garage:VehicleManagement', 'add', plate, target, props, garage_type)
    else
        Notif(3, 'get_inside_veh')
    end
end)

RegisterCommand('vehicle-delete', function(source)
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped) then
        local vehicle = GetVehiclePedIsIn(ped, false)
        local plate = tostring(GetVehicleNumberPlateText(vehicle))
        TriggerServerEvent('cd_garage:VehicleManagement', 'delete', plate)
    else
        local plate = OpenTextBox()
        if plate then
            TriggerServerEvent('cd_garage:VehicleManagement', 'delete', plate)
        end
    end
end)

RegisterCommand('vehicle-plate', function(source)
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped) then
        local vehicle = GetVehiclePedIsIn(ped, false)
        local old_plate = tostring(GetVehicleNumberPlateText(vehicle))
        local new_plate = OpenTextBox()
        if new_plate then
            TriggerServerEvent('cd_garage:VehicleManagement', 'plate', old_plate, new_plate)
        end
    else
        Notif(3, 'get_inside_veh')
    end
end)
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------ NOTIFICATIONS ---------------------------------------------
------------------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------------------
-------------------------------------- FRAMEWORK FUNCTIONS -------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
function IsAllowed()
    if Config.AllowedJobsImpound[GetJob()] then
        return true
    else
        return false
    end
end

function GetJob()
    if Config.UseESX then
        while ESX.PlayerData == nil or ESX.PlayerData.job == nil or ESX.PlayerData.job.name == nil do
            Wait(0)
        end
        return ESX.PlayerData.job.name
    else
        return --add your non esx job checks here - (return the jobname as a string).
    end
end

function GetJob_grade()
    if Config.UseESX then
        while ESX.PlayerData == nil or ESX.PlayerData.job == nil or ESX.PlayerData.job.grade == nil do
            Wait(0)
        end
        return ESX.PlayerData.job.grade
    else
        return --add your non esx job checks here - (return the job grade as a number).
    end
end

function CheckJob(job)
    if type(job) == 'string' then
        if GetJob() == job then
            return true
        else
            return false
        end
    elseif type(job) == 'table' then
        local myjob = GetJob()
        for _, j in ipairs(job) do
            if myjob == j then
                return true
            end
        end
        return false
    end
end
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
--------------------------------------------- OTHER --------------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
function ToggleShellTime(toggle)
    if toggle == 'enter' then
        if Config.ShellTimeScript == 'easytime' then
            TriggerEvent('cd_easytime:PauseSync', true)
        elseif Config.ShellTimeScript == 'vsync' then
            TriggerEvent('vSync:toggle',false)
            NetworkOverrideClockTime(23, 00, 00)
        elseif Config.ShellTimeScript == 'other' then
            --enter other here
        end
    elseif toggle == 'exit' then
        if Config.ShellTimeScript == 'easytime' then
            TriggerEvent('cd_easytime:PauseSync', false)
        elseif Config.ShellTimeScript == 'vsync' then
            TriggerEvent('vSync:toggle',true)
            TriggerServerEvent('vSync:requestSync')
        elseif Config.ShellTimeScript == 'other' then
            --enter other here
        end
    end
end

Citizen.CreateThread(function()
    while IsAuthorised == false do Wait(100) end
    Wait(1000)
    for k, v in pairs (Config.Locations) do
        if v.Type ~= nil then
            if CheckBlips(v.EnableBlip, v.JobRestricted) then
                local blip = AddBlipForCoord(v.x_1, v.y_1, v.z_1)
                SetBlipSprite(blip, Config.Blip[v.Type].sprite)
                SetBlipDisplay(blip, 4)
                SetBlipScale(blip, Config.Blip[v.Type].scale)
                SetBlipColour(blip, Config.Blip[v.Type].colour)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName('STRING')
                if Config.BlipNames and not v.JobRestricted then
                    AddTextComponentSubstringPlayerName(Config.Blip[v.Type].name:sub(1, -2)..': '..v.Garage_ID)
                elseif v.JobRestricted then
                    AddTextComponentSubstringPlayerName(Config.Blip[v.Type].name:sub(1, -2)..': '..v.Garage_ID..' ['..JobRestrictNotif(v.JobRestricted, true)..']')
                else
                    AddTextComponentSubstringPlayerName(Config.Blip[v.Type].name:sub(1, -2))
                end
                EndTextCommandSetBlipName(blip)
            end
        end
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        TriggerEvent('cd_drawtextui:HideUI')
        if MyCars ~= nil then
            for g=1, #MyCars do
                if MyCars[g] ~= nil then
                    SetEntityAsNoLongerNeeded(MyCars[g].vehicle)
                    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(MyCars[g].vehicle))
                    DeleteEntity(MyCars[g].vehicle)
                    DeleteVehicle(MyCars[g].vehicle)
                end
            end
        end
        SetNuiFocus(false, false)
        if shell then
            DeleteGarage()
        end
    end
end)
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
--------------------------------------- VEHICLE RELATED ----------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
function GetFuel(vehicle, plate)
    --return nil --return nil if you want to use the default one in esx vehicle props.
    -- OR
    --return GetVehicleFuelLevel(vehicle) --Default fivem native example.
    return exports["LegacyFuel"]:GetFuel(vehicle) --Legacy Fuel example.
    --return math.ceil((100 / GetVehicleHandlingFloat(vehicle, "CHandlingData", "fPetrolTankVolume")) * math.ceil(GetVehicleFuelLevel(vehicle))) --FRFuel example.
end

function SetFuel(vehicle, plate, fuel_level)
    --SetVehicleFuelLevel(vehicle, fuel_level+0.0)
    exports["LegacyFuel"]:SetFuel(vehicle, fuel_level) --Legacy Fuel example.
end

function VehicleStored(vehicle, plate, props) --This will be triggered after you have stored a vehicle, you can add in your custom events here.
    
end

function TransferVehicle(fromui, targetID, plate, garage_type)
    if fromui then
        TriggerServerEvent('cd_garage:TransferVehicle', plate, targetID, garage_type, 'N/A', fromui)
    else
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped, false) then
            local vehicle = GetVehiclePedIsUsing(ped)
            local plate = tostring(GetVehicleNumberPlateText(vehicle))
            local hash = GetEntityModel(vehicle)

            if Config.Blasklist_transfer[hash] == nil or Config.Blasklist_transfer[hash] ~= true then
                if not fromui then
                    garage_type = GetGarageType(vehicle)
                end
                local label
                if Config.UseDatabaseVehiclesTable and PriceData and PriceData[hash] ~= nil then
                    label = PriceData[hash].name
                else
                    label = VehicleChecks('vehicle_label_model', hash)
                end
                if garage_type ~= nil then
                    TriggerServerEvent('cd_garage:TransferVehicle', plate, targetID, garage_type, label, fromui)
                else
                    Notif(3, 'no_vehicle_found')
                end
            else
                Notif(3, 'transfer_blacklisted')
            end
        else
            Notif(3, 'get_inside_veh')
        end
    end
end
