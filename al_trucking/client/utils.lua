-- Vars
Trucking.Vars = {
	Data = {},
	OnShift = false,
	attachedEntity = nil,
	escortDriverIdentifier = false,
	isFetchingInfo = false,
	driverToEscortUpdate = false,
	escortToDriverUpdate = nil,
	hasPrimaryNotification = false,
}; s = tostring; Callbacks = {}; CallbackId = 0

function TriggerServerCallback(name, cb, ...)
	Callbacks[CallbackId] = cb

	TriggerServerEvent('al_trucking:TriggerServerCallback', name, CallbackId, ...)

	if CallbackId < 65535 then
		CallbackId = CallbackId + 1
	else
		CallbackId = 0
	end
end

RegisterNetEvent('al_trucking:ServerCallback')
AddEventHandler('al_trucking:ServerCallback', function(requestId, ...)
	Callbacks[requestId](...)
	Callbacks[requestId] = nil
end)

RegisterNetEvent('Al_Trucking:Notify')
AddEventHandler('Al_Trucking:Notify', function(type, msg, time)
    Trucking.Notify(type, msg, time)
end)

RegisterNetEvent("Al_Trucking:Sync")
AddEventHandler("Al_Trucking:Sync",function(data)
    Trucking.Vars.Data = data
end)

Trucking.DeleteVehicle = function(veh)
	SetEntityAsMissionEntity(veh, false, true)
	DeleteVehicle(veh)
end

Trucking.SpawnVehicle = function(veh, coords, heading, cb)
	local model = GetHashKey(veh)

	Citizen.CreateThread(function()
		if not HasModelLoaded(model) and IsModelInCdimage(model) then
			RequestModel(model)
	
			while not HasModelLoaded(model) do
				Citizen.Wait(1)
			end
		end

		local vehicle = CreateVehicle(model, coords.x, coords.y, coords.z, heading, true, false)
		local networkId = NetworkGetNetworkIdFromEntity(vehicle)
		local timeout = 0

		SetNetworkIdCanMigrate(networkId, true)
		SetEntityAsMissionEntity(vehicle, true, false)
		SetVehicleHasBeenOwnedByPlayer(vehicle, true)
		SetVehicleNeedsToBeHotwired(vehicle, false)
		SetVehRadioStation(vehicle, 'OFF')
		SetModelAsNoLongerNeeded(model)
		RequestCollisionAtCoord(coords.x, coords.y, coords.z)

		while not HasCollisionLoadedAroundEntity(vehicle) and timeout < 2000 do
			Citizen.Wait(0)
			timeout = timeout + 1
		end

		if cb then
			cb(vehicle)
		end
	end)
end

Trucking.GetPlayers = function(onlyOtherPlayers, returnKeyValue, returnPeds)
	local players, Player = {}, PlayerId()

	for _,player in ipairs(GetActivePlayers()) do
		local ped = GetPlayerPed(player)

		if DoesEntityExist(ped) and ((onlyOtherPlayers and player ~= Player) or not onlyOtherPlayers) then
			if returnKeyValue then
				players[player] = ped
			else
				table.insert(players, returnPeds and ped or player)
			end
		end
	end

	return players
end

Trucking.GetPlayersInArea = function(coords, maxDistance)
	local nearbyEntities = {}

	if coords then
		coords = vector3(coords.x, coords.y, coords.z)
	else
		local playerPed = PlayerPedId()
		coords = GetEntityCoords(playerPed)
	end

	for k,entity in pairs(Trucking.GetPlayers(true, true)) do
		local distance = #(coords - GetEntityCoords(entity))

		if distance <= maxDistance then
			table.insert(nearbyEntities, k or entity)
		end
	end

	return nearbyEntities
end

Trucking.SetVehProps = function(veh, props)
	if DoesEntityExist(veh) then
		local colorPrimary, colorSecondary = GetVehicleColours(veh); local pearlescentColor, wheelColor = GetVehicleExtraColours(veh); SetVehicleModKit(veh, 0)
		if props.plate then SetVehicleNumberPlateText(veh, props.plate) end
		if props.plateIndex then SetVehicleNumberPlateTextIndex(veh, props.plateIndex) end
		if props.bodyHealth then SetVehicleBodyHealth(veh, props.bodyHealth + 0.0) end
		if props.engineHealth then SetVehicleEngineHealth(veh, props.engineHealth + 0.0) end
		if props.tankHealth then SetVehiclePetrolTankHealth(veh, props.tankHealth + 0.0) end
		if props.fuelLevel then SetVehicleFuelLevel(veh, props.fuelLevel + 0.0) end
		if props.dirtLevel then SetVehicleDirtLevel(veh, props.dirtLevel + 0.0) end
		if props.color1 then SetVehicleColours(veh, props.color1, colorSecondary) end
		if props.color2 then SetVehicleColours(veh, props.color1 or colorPrimary, props.color2) end
		if props.pearlescentColor then SetVehicleExtraColours(veh, props.pearlescentColor, wheelColor) end
		if props.wheelColor then SetVehicleExtraColours(veh, props.pearlescentColor or pearlescentColor, props.wheelColor) end
		if props.wheels then SetVehicleWheelType(veh, props.wheels) end
		if props.windowTint then SetVehicleWindowTint(veh, props.windowTint) end
		if props.neonEnabled then SetVehicleNeonLightEnabled(veh, 0, props.neonEnabled[1]); SetVehicleNeonLightEnabled(veh, 1, props.neonEnabled[2]); SetVehicleNeonLightEnabled(veh, 2, props.neonEnabled[3]); SetVehicleNeonLightEnabled(veh, 3, props.neonEnabled[4]) end
		if props.extras then for extraId,enabled in pairs(props.extras) do if enabled then SetVehicleExtra(veh, tonumber(extraId), 0) else SetVehicleExtra(veh, tonumber(extraId), 1) end; end; end
		if props.neonColor then SetVehicleNeonLightsColour(veh, props.neonColor[1], props.neonColor[2], props.neonColor[3]) end
		if props.xenonColor then SetVehicleXenonLightsColour(veh, props.xenonColor) end
		if props.modSmokeEnabled then ToggleVehicleMod(veh, 20, true) end
		if props.tyreSmokeColor then SetVehicleTyreSmokeColor(veh, props.tyreSmokeColor[1], props.tyreSmokeColor[2], props.tyreSmokeColor[3]) end
		if props.modSpoilers then SetVehicleMod(veh, 0, props.modSpoilers, false) end
		if props.modFrontBumper then SetVehicleMod(veh, 1, props.modFrontBumper, false) end
		if props.modRearBumper then SetVehicleMod(veh, 2, props.modRearBumper, false) end
		if props.modSideSkirt then SetVehicleMod(veh, 3, props.modSideSkirt, false) end
		if props.modExhaust then SetVehicleMod(veh, 4, props.modExhaust, false) end
		if props.modFrame then SetVehicleMod(veh, 5, props.modFrame, false) end
		if props.modGrille then SetVehicleMod(veh, 6, props.modGrille, false) end
		if props.modHood then SetVehicleMod(veh, 7, props.modHood, false) end
		if props.modFender then SetVehicleMod(veh, 8, props.modFender, false) end
		if props.modRightFender then SetVehicleMod(veh, 9, props.modRightFender, false) end
		if props.modRoof then SetVehicleMod(veh, 10, props.modRoof, false) end
		if props.modEngine then SetVehicleMod(veh, 11, props.modEngine, false) end
		if props.modBrakes then SetVehicleMod(veh, 12, props.modBrakes, false) end
		if props.modTransmission then SetVehicleMod(veh, 13, props.modTransmission, false) end
		if props.modHorns then SetVehicleMod(veh, 14, props.modHorns, false) end
		if props.modSuspension then SetVehicleMod(veh, 15, props.modSuspension, false) end
		if props.modArmor then SetVehicleMod(veh, 16, props.modArmor, false) end
		if props.modTurbo then ToggleVehicleMod(veh,  18, props.modTurbo) end
		if props.modXenon then ToggleVehicleMod(veh,  22, props.modXenon) end
		if props.modFrontWheels then SetVehicleMod(veh, 23, props.modFrontWheels, false) end
		if props.modBackWheels then SetVehicleMod(veh, 24, props.modBackWheels, false) end
		if props.modPlateHolder then SetVehicleMod(veh, 25, props.modPlateHolder, false) end
		if props.modVanityPlate then SetVehicleMod(veh, 26, props.modVanityPlate, false) end
		if props.modTrimA then SetVehicleMod(veh, 27, props.modTrimA, false) end
		if props.modOrnaments then SetVehicleMod(veh, 28, props.modOrnaments, false) end
		if props.modDashboard then SetVehicleMod(veh, 29, props.modDashboard, false) end
		if props.modDial then SetVehicleMod(veh, 30, props.modDial, false) end
		if props.modDoorSpeaker then SetVehicleMod(veh, 31, props.modDoorSpeaker, false) end
		if props.modSeats then SetVehicleMod(veh, 32, props.modSeats, false) end
		if props.modSteeringWheel then SetVehicleMod(veh, 33, props.modSteeringWheel, false) end
		if props.modShifterLeavers then SetVehicleMod(veh, 34, props.modShifterLeavers, false) end
		if props.modAPlate then SetVehicleMod(veh, 35, props.modAPlate, false) end
		if props.modSpeakers then SetVehicleMod(veh, 36, props.modSpeakers, false) end
		if props.modTrunk then SetVehicleMod(veh, 37, props.modTrunk, false) end
		if props.modHydrolic then SetVehicleMod(veh, 38, props.modHydrolic, false) end
		if props.modEngineBlock then SetVehicleMod(veh, 39, props.modEngineBlock, false) end
		if props.modAirFilter then SetVehicleMod(veh, 40, props.modAirFilter, false) end
		if props.modStruts then SetVehicleMod(veh, 41, props.modStruts, false) end
		if props.modArchCover then SetVehicleMod(veh, 42, props.modArchCover, false) end
		if props.modAerials then SetVehicleMod(veh, 43, props.modAerials, false) end
		if props.modTrimB then SetVehicleMod(veh, 44, props.modTrimB, false) end
		if props.modTank then SetVehicleMod(veh, 45, props.modTank, false) end
		if props.modWindows then SetVehicleMod(veh, 46, props.modWindows, false) end
		if props.modLivery then SetVehicleMod(veh, 48, props.modLivery, false); SetVehicleLivery(veh, props.modLivery) end
	end
end

Trucking.HelpNotification = function(notification, sp)
    if sp then
        BeginTextCommandDisplayHelp(Trucking.Translation['escort_request'][1])
        EndTextCommandDisplayHelp(false, false, false, -1)
    else
        BeginTextCommandDisplayHelp('STRING')
        AddTextComponentSubstringPlayerName(notification)
        EndTextCommandDisplayHelp(0, false, false, -1)
    end
end

Trucking.GetVehicles = function()
	local vehicles        = {}
	local handle, vehicle = FindFirstVehicle()
	local success         = nil

	repeat
		table.insert(vehicles, vehicle)
		success, vehicle = FindNextVehicle(handle)
	until not success

	EndFindVehicle(handle)
	return vehicles
end

Trucking.TrailerSpawnAvailability = function(trailerModel)
	local veh = Trucking.GetVehicles()
    local trailerSpawned = false
    local unavailableSpawns = {}

    for i=1, #Trucking.Locations.TrailerSpawns, 1 do
        for k=1, #veh, 1 do
            local distance = #(GetEntityCoords(veh[k]) - vector3(Trucking.Locations.TrailerSpawns[i].x, Trucking.Locations.TrailerSpawns[i].y, Trucking.Locations.TrailerSpawns[i].z))

            if distance <= 4 then
                table.insert(unavailableSpawns, {
                    SpawnId = i,
                    distance = distance
                })
            end
        end
    end

    for i=1, #Trucking.Locations.TrailerSpawns, 1 do
        local canSpawn = true

        if #unavailableSpawns < 1 then 
            Trucking.SpawnTrailer(Trucking.Locations.TrailerSpawns[i].x, Trucking.Locations.TrailerSpawns[i].y, Trucking.Locations.TrailerSpawns[i].z, Trucking.Locations.TrailerSpawns[i].w, trailerModel)
            trailerSpawned = true
        end

        if trailerSpawned then break end
        for k=1, #unavailableSpawns, 1 do
            if unavailableSpawns[k].SpawnId == i then
                canSpawn = false
            end
        end

        if canSpawn then
            Trucking.SpawnTrailer(Trucking.Locations.TrailerSpawns[i].x, Trucking.Locations.TrailerSpawns[i].y, Trucking.Locations.TrailerSpawns[i].z, Trucking.Locations.TrailerSpawns[i].w, trailerModel)
            trailerSpawned = true
        end
    end

    if not trailerSpawned then
		print('^8ERROR: NO SPAWNS AVAILABLE^7')
    end
end

Trucking.SpawnTrailer = function(x, y, z, heading, vehicle)
    Trucking.SpawnVehicle(vehicle,{
        x = x,
        y = y,
        z = z + 1
        }, heading, function(trailer)
        SetEntityAsMissionEntity(trailer, false, false)
        Citizen.Wait(1000); FreezeEntityPosition(trailer, true)
        local trailerBlip = Trucking_addBlip(GetEntityCoords(trailer), 479, false, Trucking.Translation['blip_trailer'])
        local trailerAttached = false
        
        while not trailerAttached do Citizen.Wait(0)
            if not IsPedInAnyVehicle(PlayerPedId()) then
                Trucking.HelpNotification(Trucking.Translation['get_in_truck'])
            else
                Trucking.HelpNotification(Trucking.Translation['attach_trailer'])

                local vehicleCoords = GetEntityCoords(trailer)
                local distance = #(vehicleCoords - GetEntityCoords(PlayerPedId()))
                DrawMarker(20, vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 3, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 3.0, 3.0, 3.0, Trucking.Color['marker'].r, Trucking.Color['marker'].g, Trucking.Color['marker'].b, 80, false, true, 2, nil, nil, false)

                if IsVehicleAttachedToTrailer(GetVehiclePedIsIn(PlayerPedId())) and distance < 9 then
                    RemoveBlip(trailerBlip)
                    trailerAttached = true
                end
            end
        end

        if trailerAttached then
            local truck = GetVehiclePedIsIn(PlayerPedId())
            Citizen.Wait(250)
            FreezeEntityPosition(truck, true)

            while true do Citizen.Wait(0)
                if IsPedInAnyVehicle(PlayerPedId()) then
                    Trucking.HelpNotification(Trucking.Translation['get_out_truck'])
                else
                    Trucking.Vars.Data.Models = {
                        Trailer = trailer,
                        Truck = truck,
                    }
                    TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)
                    DoTask()
                    break
                end
            end
        end
    end)
end

-- Add & Remove Money
Trucking.addMoney = function(amount) local data = {data={amount=s(amount),k=ky}} TriggerServerEvent('Al_Trucking:Payment:Add', data) end
Trucking.removeMoney = function(data) TriggerServerEvent('Al_Trucking:Payment:Remove', data) end

-- Get XP from server
Trucking.GetXPLevel = function()
    xpLevel = false
    TriggerServerCallback('Al_Trucking:GetXP', function(xp)
        xpLevel = xp
    end, GetSpecifiedIdentifier())

    while xpLevel == false do Citizen.Wait(5) end

    local grade = 0

    if xpLevel >= Trucking.XP_Config.XPForPromotion[1] then
        for i=1, #Trucking.XP_Config.XPForPromotion, 1 do
            local current = Trucking.XP_Config.XPForPromotion[i]
            
            if i == #Trucking.XP_Config.XPForPromotion and xpLevel >= current then
                grade = i
                break
            elseif xpLevel >= current and xpLevel < Trucking.XP_Config.XPForPromotion[i + 1] then
                grade = i
                break
            end
        end
    end

    return {
        grade = grade,
        xp = xpLevel
    }
end

-- Random Number
Trucking.MathRandom = function(...)
	math.randomseed(GetGameTimer())
	return math.random(...)
end

-- Clipboard Animation
Trucking.AttachClipboardToPlayer = function()
    if Trucking.Vars.attachedEntity ~= nil then return end; RequestAnimDict("missfam4")
    while not HasAnimDictLoaded("missfam4") do Citizen.Wait(0) end; TaskPlayAnim(PlayerPedId(), "missfam4", "base", 4.0, 4.0, -1, 51)
    local ModelHash = GetHashKey('p_amb_clipboard_01'); RequestModel(ModelHash); while not HasModelLoaded(ModelHash) do Citizen.Wait(0) end
    local PlayerPed = PlayerPedId(); local PlayerPos = GetEntityCoords(PlayerPed)
    local Object = CreateObject(ModelHash, PlayerPos.x, PlayerPos.y, PlayerPos.z, true, false, false)
    AttachEntityToEntity(Object, PlayerPed, GetPedBoneIndex(PlayerPed, 36029), 0.16, 0.08, 0.1, -130.0, -50.0, 0.0, true, false, false, true, 1, true)
    Trucking.Vars.attachedEntity = Object
end

Trucking.RemoveClipboardFromPlayer = function()
    DetachEntity(Trucking.Vars.attachedEntity); DeleteEntity(Trucking.Vars.attachedEntity); ClearPedTasks(PlayerPedId()); Trucking.Vars.attachedEntity = nil;
end