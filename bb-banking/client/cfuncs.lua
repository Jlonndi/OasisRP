ESX = nil 
CreateThread(function()
    while ESX == nil do 
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 
        Wait(0) 
    end

    while not ESX.GetPlayerData().job do Wait(0) end
    while not BBBankingCore['config']['authorized'] do
        TriggerServerEvent('bb-banking:server:setNui')
        Wait(500)
    end
end)

local createdBlips = {}
isPopup = false
isATMPopup = false

BBBankingCore['functions'] = {
    CreateBlips = function()
        for k, v in pairs(BBBankingCore['config']['banks']) do
            local newBlip = AddBlipForCoord(tonumber(v.x), tonumber(v.y), tonumber(v.z))
            SetBlipSprite(newBlip, BBBankingCore['config']['blip']['blipType'])
            SetBlipDisplay(newBlip, 4)
            SetBlipScale(newBlip, BBBankingCore['config']['blip']['blipScale'])
            SetBlipColour(newBlip, BBBankingCore['config']['blip']['blipColor'])
            SetBlipAsShortRange(newBlip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(BBBankingCore['config']['blip']['blipName'])
            EndTextCommandSetBlipName(newBlip)
            table.insert(createdBlips, newBlip)
        end
        return true
    end,

    DeleteBlips = function()
        for k, v in pairs(createdBlips) do
            RemoveBlip(v)
        end
        createdBlips = {}
        return true
    end,

    GetClosestBank = function(pos)
        local closestBank, closestDst = 0, 999999.9
        for k, v in pairs(BBBankingCore['config']['banks']) do
            local dst = #(pos - v)
            if dst < closestDst then
                closestDst, closestBank = dst, k
            end
        end
        return closestBank, closestDst
    end,

    OpenNui = function(message)
        print('reached here')
        ESX.TriggerServerCallback('bb-banking:server:getPlayerData', function(playerData)
            while not playerData do Wait(0) end

            SetNuiFocus(true, true)
            SendNUIMessage({
                type = 'create',
                data = playerData,
                message = message,
            })
        end)
    end,

    PopupText = function(enable, type, key)
        if type == 'bank' then
            isPopup = enable
            SendNUIMessage({
                type = 'popup',
                popupTrigger = enable,
                popupType = type,
                popupKey = key
            })
        elseif type == 'atm' then
            isATMPopup = enable
            SendNUIMessage({
                type = 'popup',
                popupTrigger = enable,
                popupType = type,
                popupKey = key
            })
        end
    end,

    Notify = function(txt, typ)
        -- Your noticiation trigger
        -- Args: 
        --      -   txt: String - Notification content
        --      -   typ: String['error', 'success'] - Notification type
        TriggerEvent('notification', txt, typ)
    end
}