local access = false

CreateThread(function()
    while not NetworkIsSessionStarted() do Wait(0) end
    TriggerServerEvent('loaf_test:getAccess')
    while not access do Wait(0) end

    -- Sync Car Key Table from server to client:
    RegisterNetEvent('addon_keys:syncTableKeys')
    AddEventHandler('addon_keys:syncTableKeys', function(keysData, identifier, keysMenuData)
        carKeys = keysData
        carKeysMenu = keysMenuData
        plyIdentifier = identifier
    end)

    RegisterNetEvent('addon_keys:syncAddedKeys')
    AddEventHandler('addon_keys:syncAddedKeys', function(keys, identifier)
        addedKeys = keys
        plyId = identifier
    end)

    -- Check if player has lended car keys:
    function HasTempCarKeys(plate)
        if carKeys[plate] ~= nil then
            for k,v in pairs(carKeys[plate]) do
                if v.identifier == plyIdentifier then
                    return true
                end
            end
            return false
        else
            return false
        end
    end

    function HasAddedCarKeys(plate)
        if addedKeys[plate] ~= nil then
            for k,v in pairs(addedKeys[plate]) do
                if v.identifier == plyId then
                    return true
                end
            end
            return false
        else
            return false
        end
    end

end)

RegisterNetEvent('loaf_test:setAccess')
AddEventHandler('loaf_test:setAccess', function(res)
    access = res
end)