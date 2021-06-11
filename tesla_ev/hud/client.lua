local function runHUD(vehicle, stop)
    Citizen.Wait(1)
    if not IsEV(GetVehicleDisplayName(vehicle)) then
        return stop()
    end

    local rpm = GetVehicleCurrentRpm(vehicle)
    local whr = math.ceil(math.max(0, (965 * rpm) - 195))
end

-- Vehicle detection thread
SIThreads:LoopUntilStopped('HUD_MAIN', function(_) -- we can't stop and we won't stop
    Citizen.Wait(1000)
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    if IsEV(GetVehicleDisplayName(vehicle)) then
        SIThreads:LoopUntilStopped('HUD_DRAW', function(stop) runHUD(vehicle, stop) end)
    end
end)