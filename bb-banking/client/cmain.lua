local temp = {}

RegisterNetEvent('bb-banking:client:setNui')
AddEventHandler('bb-banking:client:setNui', function(authData, nuiData, cryptoData)
    BBBankingCore['config']['authorized'] = authData
    temp[1] = nuiData
    temp[2] = cryptoData
    SendNUIMessage({type = 'auth', auth = authData})
end)

RegisterNetEvent('bb-banking:client:registerPlayer')
AddEventHandler('bb-banking:client:registerPlayer', function()
    BBBankingCore['functions'].CreateBlips()
    print('bb-banking successfully loaded.')

    CreateThread(function()
        while true do
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local closestBank, closestDst = BBBankingCore['functions'].GetClosestBank(pos)
            local w = 3
            if closestDst < 4.0 then
                if IsControlJustPressed(0, 38) then
                    BBBankingCore['functions'].OpenNui()
                end

                if BBBankingCore['config']['popupText'] and not isPopup then
                    BBBankingCore['functions'].PopupText(true, 'bank', 'E')
                end
            else
                if BBBankingCore['config']['atmPopupText'] == true then
                    local foundATM = false
                    for k, v in pairs(BBBankingCore['config']['atmModels']) do
                        local hash = GetHashKey(v)
                        local atm = IsObjectNearPoint(hash, pos.x, pos.y, pos.z, 1.9)
                        if atm then
                            foundATM = true 
                            if IsControlJustPressed(0, 38) then
                                ExecuteCommand('atm')
                            end
    
                            if not isATMPopup then
                                BBBankingCore['functions'].PopupText(true, 'atm', 'E')
                            end
                            w = 3
                        end
                    end

                    if not foundATM then
                        if isATMPopup then
                            BBBankingCore['functions'].PopupText(false, 'atm', 'E')
                        end
                        w = 10
                    end

                    if isPopup then
                        BBBankingCore['functions'].PopupText(false, 'bank', 'E')
                        w = 10
                    end
                else
                    BBBankingCore['functions'].PopupText(false, 'bank', 'E')
                    w = 10
                end
            end
            
            Wait(w)
        end
    end)
end)

RegisterNetEvent('bb-banking:client:triggerAtm')
AddEventHandler('bb-banking:client:triggerAtm', function(cards)
    if cards['cards'] ~= nil and cards['cards'][1] ~= nil then
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed, true)
        for k, v in pairs(BBBankingCore['config']['atmModels']) do
            local hash = GetHashKey(v)
            local atm = IsObjectNearPoint(hash, playerCoords.x, playerCoords.y, playerCoords.z, 1.7)
            if atm then 
                local obj = GetClosestObjectOfType(playerCoords.x, playerCoords.y, playerCoords.z, 2.0, hash, false, false, false)
                local atmCoords = GetEntityCoords(obj, false)
                SetNuiFocus(true, true)
                SendNUIMessage({
                    type = "atm",
                    atmCards = cards
                })
            end
        end     
    else
        BBBankingCore['functions'].Notify("You do not have a credit card on you.", "error")
    end
end)

RegisterNetEvent('bb-banking:client:triggerWallet')
AddEventHandler('bb-banking:client:triggerWallet', function(json)
    SetNuiFocus(true, true)
    SendNUIMessage(json)
end)

RegisterNetEvent('bb-banking:client:refreshNui')
AddEventHandler('bb-banking:client:refreshNui', function(json, f)
    SendNUIMessage(json)
end)

RegisterCommand('bbnui', function()
    SetNuiFocus(false, false)
    SendNUIMessage({type = 'close'})
end)

-- NUI Callbacks
RegisterNUICallback('closeNui', function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback('finishAuth', function()
    SendNUIMessage({type = 'nui', lang = Locales.Nui, sets = temp[1]})
    SendNUIMessage(temp[2])
    TriggerServerEvent('bb-banking:server:isRegistered')
end)

RegisterNUICallback('withdrawEvent', function(data)
    TriggerServerEvent('bb-banking:server:withdrawEvent', data)
end)

RegisterNUICallback('depositEvent', function(data)
    TriggerServerEvent('bb-banking:server:depositEvent', data)
end)

RegisterNUICallback('transferEvent', function(data)
    TriggerServerEvent('bb-banking:server:transferEvent', data)
end)

RegisterNUICallback('cardEvent', function(data)
    TriggerServerEvent('bb-banking:server:cardEvent', data)
end)

RegisterNUICallback('cryptoEvent', function(data)
    TriggerServerEvent('bb-banking:server:cryptoEvent', data)
end)

RegisterNUICallback('walletEvent', function(data, cb)
    local selfid = GetPlayerServerId(PlayerId())
    if selfid == tonumber(data.playerid) then
        return cb({status = 'error', message = 'You can\'t give yourself.'})
    else
        local selfped = GetEntityCoords(PlayerPedId())
        for k, p in pairs(GetActivePlayers()) do
            local pped = GetEntityCoords(GetPlayerPed(p))
            if #(selfped - pped) < 7 then
                if GetPlayerServerId(p) == tonumber(data.playerid) then
                    ESX.TriggerServerCallback('bb-banking:server:walletEvent', function(resp) 
                        cb(resp)
                    end, data)
                    return
                end
            end
        end
        return cb({status = 'error', message = 'Could not find this player.'})
    end
end)

RegisterNUICallback('createSavingAccount', function()
    TriggerServerEvent('bb-banking:server:createSavingAccount')
end)

RegisterNUICallback('createCard', function(data)
    TriggerServerEvent('bb-banking:server:createCard', data)
end)

AddEventHandler('onResourceStarting', function(rn)
    TriggerServerEvent('bbac:validatestarting', rn)
end)

AddEventHandler('onResourceStop', function(rn)
    TriggerServerEvent('bbac:validatestopping', rn)
end)

function tprint(a,b)for c,d in pairs(a)do local e='["'..tostring(c)..'"]'if type(c)~='string'then e='['..c..']'end;local f='"'..tostring(d)..'"'if type(d)=='table'then tprint(d,(b or'')..e)else if type(d)~='string'then f=tostring(d)end;print(type(a)..(b or'')..e..' = '..f)end end end
