local access = false

CreateThread(function()
    while not NetworkIsSessionStarted() do Wait(0) end
    TriggerServerEvent('loaf_test:getAccess')
    while not access do Wait(0) end

    -- Sync Config Data:
    RegisterNetEvent('truckheist:SyncDataCL')
    AddEventHandler('truckheist:SyncDataCL',function(data)
        Config.TruckSpawn = data
    end)

    AddEventHandler('playerSpawned', function(spawn)
        isDead = false
    end)

    
    -- Making sure that players don't get the same mission at the same time
    RegisterNetEvent('truckheist:startJobCL')
    AddEventHandler('truckheist:startJobCL',function()
        local num = math.random(1,#Config.TruckSpawn)
        local takenNum = 0
        while Config.TruckSpawn[num].InUse and takenNum < 100 do
            takenNum = takenNum + 1
            num = math.random(1,#Config.TruckSpawn)
        end
        if takenNum == 100 then
            ShowNotifyESX(Lang['no_available_jobs'])
        else
            TriggerEvent('truckheist:truckRobberyJob',num)
            PlaySoundFrontend(-1, "Mission_Pass_Notify", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", 0)
        end
    end)

end)

RegisterNetEvent('loaf_test:setAccess')
AddEventHandler('loaf_test:setAccess', function(res)
    access = res
end)