local access = false

CreateThread(function()
    while not NetworkIsSessionStarted() do Wait(0) end
    TriggerServerEvent('loaf_test:getAccess')
	while not access do Wait(0) end

	RegisterNetEvent('oasis_mechjob:liftStateCL')
	AddEventHandler('oasis_mechjob:liftStateCL', function(k, id, val, vehicle, state, identifier)
		Config.MechanicShops[k].lifts[id] = val
		Config.MechanicShops[k].lifts[id].currentVeh = vehicle
		Config.MechanicShops[k].lifts[id].inUse = state
		Config.MechanicShops[k].lifts[id].player = identifier
	end)

	RegisterNetEvent('oasis_mechjob:syncVehicleBodyCL')
	AddEventHandler('oasis_mechjob:syncVehicleBodyCL', function(plate)
		RefreshVehicleDamage(vehicleData[plate].entity, plate)
	end)

	function GetBodyRepairProgression(vehicleEntity)
		if DoesEntityExist(vehicleEntity) then
			local numWheels = GetVehicleNumberOfWheels(vehicleEntity)
			local numDoors = (GetNumberOfVehicleDoors(vehicleEntity) - 2)
			local plate = GetVehicleNumberPlateText(vehicleEntity):gsub("^%s*(.-)%s*$", "%1")
			local numHood, numTrunk = 0, 0
			local totalValue = numDoors + numWheels + numHood + numTrunk + 2
			numWheels, numDoors = 0, 0
			for i = 0, (GetNumberOfVehicleDoors(vehicleEntity) - 2) - 1 do
				if vehicleData[plate].report.doors[i + 1] == false then 
					numDoors = numDoors + 1
				end
			end
			if vehicleData[plate].report.doors[5] == false then 
				numHood = numHood + 1
			end
			if vehicleData[plate].report.doors[6] == false then 
				numTrunk = numTrunk + 1
			end
			for i = 0, GetVehicleNumberOfWheels(vehicleEntity) - 1 do
				if vehicleData[plate].report.wheels[i + 1] == false then 
					numWheels = numWheels + 1
				end
			end
			local newValue = numWheels + numDoors + numHood + numTrunk
			return (math.floor((newValue / totalValue) * 100))
		end
	end
	
	function GetControlOfEntity(entity)
		local netTime = 15
		NetworkRequestControlOfEntity(entity)
		while not NetworkHasControlOfEntity(entity) and netTime > 0 do 
			NetworkRequestControlOfEntity(entity)
			Citizen.Wait(100)
			netTime = netTime -1
		end
	end

	RegisterNetEvent('oasis_mechjob:JobDataCL')
	AddEventHandler('oasis_mechjob:JobDataCL',function(data)
		Config.NPC_RepairJobs = data
	end)

end)

RegisterNetEvent('loaf_test:setAccess')
AddEventHandler('loaf_test:setAccess', function(res)
    access = res
end)