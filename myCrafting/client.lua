ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(200)
        TriggerEvent('esx:getSharedObject', function (obj) ESX = obj end)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

local open = false 

if (cfg.CraftingStation.enable) then
    Citizen.CreateThread(function()
        
        SetNuiFocus(false, false)
        while true do 
            Wait(500)
            local PlayerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(PlayerPed)
            if (open == false) then
                while (Vdist(playerCoords, cfg.CraftingStation.pos.x, cfg.CraftingStation.pos.y, cfg.CraftingStation.pos.z) <= 1.0) do
                    local playerCoords = GetEntityCoords(PlayerPed)
                        if (Vdist(playerCoords, cfg.CraftingStation.pos.x, cfg.CraftingStation.pos.y, cfg.CraftingStation.pos.z) <= 1.0) then
                            ShowHelpNotification(Translation[cfg.Locale]['help_notification'])
                            if (IsControlJustReleased(0, cfg.CraftingStation.control)) then
                                TriggerEvent('myCrafting:Open')
                            end
                        end
                    Wait(1)
                end
            end
        end
    end)
end

if (cfg.CraftingStation2.enable) then
    Citizen.CreateThread(function()
        
        SetNuiFocus(false, false)
        while true do 
            Wait(500)
            local PlayerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(PlayerPed)
            if (open == false) then
                while (Vdist(playerCoords, cfg.CraftingStation2.pos.x, cfg.CraftingStation2.pos.y, cfg.CraftingStation2.pos.z) <= 1.0) do
                    local playerCoords = GetEntityCoords(PlayerPed)
                        if (Vdist(playerCoords, cfg.CraftingStation2.pos.x, cfg.CraftingStation2.pos.y, cfg.CraftingStation2.pos.z) <= 1.0) then
                            ShowHelpNotification(Translation[cfg.Locale]['help_notification'])
                            if (IsControlJustReleased(0, cfg.CraftingStation2.control)) then
                                TriggerEvent('myCrafting:Open')
                            end
                        end
                    Wait(1)
                end
            end
        end
    end)
end

if cfg.Button.enable then
    Citizen.CreateThread(function()
        SetNuiFocus(false, false)
        while true do 
            Wait(1)
            if (IsControlJustReleased(0, cfg.Button.control)) then
                TriggerEvent('myCrafting:Open')
            end
        end
    end)
end

--[[RegisterNUICallback('closeUI', function(data, cb) 
    ClearPedTasks(PlayerPedId())
	SetNuiFocus(false, false)
    open = false
end)]]

--vvvvvvvvadded by Grizzy and Known
RegisterNUICallback('closeUI', function(data, cb)
    Citizen.Wait(5000) 
    SendNUIMessage({
        type = 'close'
    })
    SetNuiFocus(false, false)
    open = false
end)
-- ^^^^^^^^
RegisterNUICallback('showNoti', function(data, cb) 
	if data.nr == 0 then
        ShowNotification(Translation[cfg.Locale]['need_requireditem_part1'] .. data.label .. Translation[cfg.Locale]['need_requireditem_part2'])
    end
end)

RegisterNUICallback('startAnim', function(data, cb) 
    local animDict = "mini@repair"
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(500)
    end

    TaskPlayAnim(PlayerPedId(), animDict, "fixing_a_player", 2.0, 2.5, -1, 49, 0, 0, 0, 0 )
end)

RegisterNUICallback('craftItem', function(data, cb) 
    ClearPedTasks(PlayerPedId())
	TriggerServerEvent('myCrafting:Craft', data.item, data.removeItems, data.isAWeapon, data.quantity)
    ESX.TriggerServerCallback('myCrafting:getInventory', function(data)
        SendNUIMessage({type = 'open', inventory = data})
        print(ESX.PlayerData.job.name)
    end)
end)

function ShowNotification(text)
	SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
	DrawNotification(false, true)
end

function ShowHelpNotification(msg)
	CurrentActionMsg  = msg
	SetTextComponentFormat('STRING')
	AddTextComponentString(CurrentActionMsg)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNetEvent('myCrafting:Open')
AddEventHandler('myCrafting:Open', function()
    ESX.TriggerServerCallback('myCrafting:getInventory', function(data)
        open = true
        SetNuiFocus(true, true)
        SendNUIMessage({type = 'open', inventory = data})
        SendNUIMessage({type = 'sendRecipes', recipes = cfg.Recipes, job = ESX.PlayerData.job.name})
    end)
end)