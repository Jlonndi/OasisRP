local access = false

CreateThread(function()
    while not NetworkIsSessionStarted() do Wait(0) end
    TriggerServerEvent('loaf_test:getAccess')
    while not access do Wait(0) end
	
    -- Create Scrapyard:
    curYard = nil
    scrap_list = {}
    
    RegisterNetEvent('oasis_junkyard:createScrapyard')
    AddEventHandler('oasis_junkyard:createScrapyard', function(num, scrapList)
        curYard = num
        scrap_list = scrapList
        if scrap_NPC ~= nil then
            DeleteEntity(scrap_NPC)
            Citizen.Wait(200)
            CreateScrapNPC(curYard.NPC1)
            CreateScrapBlip(curYard.NPC1, curYard.blip)
        else
            CreateScrapNPC(curYard.NPC1)
            CreateScrapBlip(curYard.NPC1, curYard.blip)
        end
        gotCarList = false
    end)

    -- Check if inside a car from the car-list:
    function isInsideScrapCar(hashkey)
        for k,v in pairs(scrap_list) do
            if hashkey == v.hash then
                return true
            end
            if k == #scrap_list then
                return false
            end
        end
    end


    -- Get the  current scrap vehicle:
    function getCurrentScrapVeh(hashkey)
        local finalCar = {}
        for k,v in pairs(scrap_list) do
            if hashkey == v.hash then
                finalCar = {label = v.label, hash = v.hash, price = v.price}
                return finalCar
            end
        end
    end

end)

RegisterNetEvent('loaf_test:setAccess')
AddEventHandler('loaf_test:setAccess', function(res)
    access = res
end)