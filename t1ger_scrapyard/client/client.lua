-------------------------------------
------- Created by T1GER#9080 -------
------------------------------------- 
player = nil
coords = {}
curVehicle = nil
driver = nil

Citizen.CreateThread(function()
    while true do
		player = GetPlayerPed(-1)
		coords = GetEntityCoords(player)
        curVehicle = GetVehiclePedIsIn(player, false)
        driver = GetPedInVehicleSeat(curVehicle, -1)
        Citizen.Wait(500)
    end
end)

scrap_NPC = nil
scrap_blip = nil
gotCarList = false
interacting = false
Citizen.CreateThread(function()
    while true do
		Citizen.Wait(1)
		if DoesEntityExist(scrap_NPC) then 
			local NPC_coords = GetEntityCoords(scrap_NPC)
			if GetDistanceBetweenCoords(coords, NPC_coords.x, NPC_coords.y, NPC_coords.z, false) < 2.0 and not interacting then
				DrawText3Ds(NPC_coords.x, NPC_coords.y, NPC_coords.z, Lang['press_to_talk'])
				if IsControlJustPressed(0, 38) and not interacting then
					ESX.TriggerServerCallback('t1ger_scrapyard:getCopsCount', function(copsOnline)
						if copsOnline then
							ESX.TriggerServerCallback('t1ger_scrapyard:getCarListTimer', function(cooldown)
								if not cooldown then 
									if Config.AllowPolice then 
										RetrieveScrapCarList()
									else
										if not IsPlayerJobCop() then 
											RetrieveScrapCarList()
										else
											ShowNotifyESX(Lang['police_not_allowed'])
										end
									end
								end
							end)
						end
					end)
				end
			end
		end
	end	
end)

-- Retrieve the scrap car list:
function RetrieveScrapCarList()
	interacting = true
	local anim_lib = "missheistdockssetup1ig_5@base"
	local anim_dict = "workers_talking_base_dockworker1"
	LoadAnim(anim_lib)
	FreezeEntityPosition(player, true)
	TaskPlayAnim(player, anim_lib, anim_dict, 1.0, 0.5, -1, 31, 1.0, 0, 0)
	exports['progressBars']:startUI((3000), Lang['progbar_getting_list'])
	Citizen.Wait(3000)
	ClearPedTasks(player)
	FreezeEntityPosition(player, false)
	local carNames = {}
	for k,v in pairs(scrap_list) do
		carNames[k] = v.label
	end
	if not gotCarList then
		if Config.UsePhoneMSG then
			JobNotifyMSG((Lang['get_these_cars_1']:format(table.concat(carNames, ", "))))
		else
			TriggerEvent('chat:addMessage', { args = {Lang['get_these_cars_2']:format(table.concat(carNames, ", "))}})
		end
		gotCarList = true	
	else
		if Config.UsePhoneMSG then
			JobNotifyMSG((Lang['still_same_list_1']:format(table.concat(carNames, ", "))))
		else
			TriggerEvent('chat:addMessage', { args = {Lang['still_same_list_2']:format(table.concat(carNames, ", "))}})
		end
	end
	interacting = false
end

scrap_man = nil
scrappingCar = false
inspectingCar = false
carInspected = false
carScrapped = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		local carHash = GetEntityModel(curVehicle)
		if curYard ~= nil then
			local mk = curYard.marker
			local distance = GetDistanceBetweenCoords(coords, curYard.vehPos[1], curYard.vehPos[2], curYard.vehPos[3], true)
			if distance < mk.drawDist then
				if isInsideScrapCar(carHash) then 
					DrawMarker(mk.type, curYard.vehPos[1], curYard.vehPos[2], curYard.vehPos[3]-0.975, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, mk.scale.x, mk.scale.y, mk.scale.z, mk.color.r, mk.color.g, mk.color.b, mk.color.a, false, true, 2, false, false, false, false)
					if scrap_man == nil then
						LoadModel(curYard.NPC2.ped)
						local scrap_ped = CreatePed(4, curYard.NPC2.ped, curYard.NPC2.startPos[1], curYard.NPC2.startPos[2], curYard.NPC2.startPos[3]-0.975, curYard.NPC2.startPos[4], false)
						FreezeEntityPosition(scrap_ped, true)
						SetEntityInvincible(scrap_ped, true)
						scrap_man = scrap_ped
						SetBlockingOfNonTemporaryEvents(scrap_ped, true)
						TaskStartScenarioInPlace(scrap_ped, curYard.NPC2.IdleScenario, 0, false)
					end
				end
			end
			if distance > mk.drawDist and scrap_man ~= nil then
				DeleteEntity(scrap_man)
				scrap_man = nil
			end
			if distance < 2.0 and not scrappingCar then
				if isInsideScrapCar(carHash) then
					DrawText3Ds(curYard.vehPos[1], curYard.vehPos[2], curYard.vehPos[3], Lang['press_to_scrap'])
					if IsControlJustPressed(0, 38) then
						local scrapAllowed = false
						local plate = GetVehicleNumberPlateText(curVehicle):gsub("^%s*(.-)%s*$", "%1")
						ESX.TriggerServerCallback('t1ger_scrapyard:isVehicleOwned', function(vehOwned)
							if Config.AllowScrapOwnedVeh then
								scrapAllowed = true
							else
								if vehOwned then
									ShowNotifyESX(Lang['cannot_scrap_owned'])
									scrapAllowed = false
								else
									scrapAllowed = true
								end
							end
						end, plate)
						while not scrapAllowed do Wait(5) end
						if scrapAllowed then
							if driver then 
								scrappingCar = true 
								SetEntityAsMissionEntity(curVehicle, true)
								SetVehicleForwardSpeed(curVehicle, 0)
								SetVehicleEngineOn(curVehicle, false, false, true)
								if IsPedInAnyVehicle(player, true) then
									TaskLeaveVehicle(player, curVehicle, 4160)
									SetVehicleDoorsLockedForAllPlayers(curVehicle, true)
								end
								Citizen.Wait(250)
								FreezeEntityPosition(curVehicle, true)
							else
								scrappingCar = false
								ShowNotifyESX(Lang['must_be_driver'])
							end
							if scrap_man ~= nil and not inspectingCar then
								FreezeEntityPosition(scrap_man, false)
								SetBlockingOfNonTemporaryEvents(scrap_man, true)
								SetEntityInvincible(scrap_man, true)
								TaskGoToCoordAnyMeans(scrap_man, curYard.NPC2.endPos[1], curYard.NPC2.endPos[2], curYard.NPC2.endPos[3], 1.0, 0, 0, 786603, 0xbf800000)
								SetEntityHeading(scrap_man, curYard.NPC2.endPos[4])
								Citizen.Wait(curYard.NPC2.timer.walkToCar * 1000)
								inspectingCar = true
							end	
							if scrap_man ~= nil and inspectingCar and not carInspected then	
								FreezeEntityPosition(scrap_man, true)
								SetEntityHeading(scrap_man, curYard.NPC2.endPos[4])
								SetBlockingOfNonTemporaryEvents(scrap_man, true)
								TaskStartScenarioInPlace(scrap_man, curYard.NPC2.workScenario, 0, false)
								Citizen.Wait(curYard.NPC2.timer.decidePrice * 1000)
								carInspected = true
							end
						else
							break
						end
					end
				end
			end
		end
		if scrappingCar and scrap_man ~= nil and carInspected and not carScrapped then
			local currentPedPos = GetEntityCoords(scrap_man)
			if GetDistanceBetweenCoords(coords, currentPedPos[1], currentPedPos[2], currentPedPos[3], true) < 6.0 then
				DrawText3Ds(currentPedPos[1], currentPedPos[2], currentPedPos[3], Lang['press_to_receive_cash'])
				if curYard ~= nil then 
					if IsControlJustPressed(0, 38) then
						carScrapped = true
						local plate = GetVehicleNumberPlateText(GetClosestVehicle(curYard.vehPos[1], curYard.vehPos[2], curYard.vehPos[3], 5.0, 0, 70)):gsub("^%s*(.-)%s*$", "%1")
						TriggerServerEvent("AdvancedParking:deleteVehicle", plate)
						ESX.TriggerServerCallback('t1ger_scrapyard:isVehicleOwned', function(vehOwned)
							if vehOwned then
								if Config.DeleteOwnedVehicles then 
									TriggerServerEvent('t1ger_scrapyard:deleteOwnedVehicle', plate)
                                                                        TriggerEvent('cd_garage:ImpoundVehicle')								end
							end
							local scrapCar = GetClosestVehicle(curYard.vehPos[1], curYard.vehPos[2], curYard.vehPos[3], 5.0, 0, 70)
							local carFinal = getCurrentScrapVeh(GetEntityModel(scrapCar))
							TriggerServerEvent('t1ger_scrapyard:getPayment', carFinal, round(GetEntityHealth(scrapCar)/10, 0))
							DeleteEntity(scrapCar)
							DeleteVehicle(scrapCar)
							FreezeEntityPosition(scrap_man, false)
							SetBlockingOfNonTemporaryEvents(scrap_man, true)
							SetEntityInvincible(scrap_man, true)
							TaskGoToCoordAnyMeans(scrap_man, curYard.NPC2.startPos[1], curYard.NPC2.startPos[2], curYard.NPC2.startPos[3], 1.0, 0, 0, 786603, 0xbf800000)
							SetEntityHeading(scrap_man, curYard.NPC2.startPos[4])
							if Config.UsePhoneMSG then JobNotifyMSG(Lang['car_delivered_1']) else TriggerEvent('chat:addMessage', { args = {Lang['car_delivered_2']}}) end
							Citizen.Wait(curYard.NPC2.timer.walkBack * 1000)
							DeleteEntity(scrap_man)
							inspectingCar = false
							scrappingCar = false
							carInspected = false
							carScrapped	= false
							curVehicle = nil
							scrap_man = nil
						end, plate)
					end
				end
			end
		end
	end
end)

-- Function for lockpicking car:
RegisterNetEvent('t1ger_scrapyard:lockpickCL')
AddEventHandler('t1ger_scrapyard:lockpickCL',function(k,v)
	local vehicle = ESX.Game.GetVehicleInDirection()
	local veh_coords = GetEntityCoords(vehicle)
	if DoesEntityExist(vehicle) then
		if GetDistanceBetweenCoords(coords, veh_coords.x, veh_coords.y, veh_coords.z, true) < 2.0 then
			if GetVehicleDoorLockStatus(vehicle) ~= 2 or not GetVehicleDoorsLockedForPlayer(vehicle) then
				ESX.TriggerServerCallback('t1ger_scrapyard:removeLockpick', function(lockpickRemoved)
					if lockpickRemoved then
						LoadAnim(v.anim_dict)
						if v.policeAlert then
							AlertPoliceFunction()
						end
						SetCurrentPedWeapon(player, GetHashKey("WEAPON_UNARMED"),true)
						Citizen.Wait(250)
						FreezeEntityPosition(player, true)
						TaskPlayAnim(player, v.anim_dict, v.anim_name, 3.0, 1.0, -1, 31, 0, 0, 0)
						if v.alarm.enable then
							SetVehicleAlarm(vehicle, true)
							SetVehicleAlarmTimeLeft(vehicle, (v.alarm.time * 1000))
							StartVehicleAlarm(vehicle)
						end
						exports['progressBars']:startUI((v.timer * 1000), Lang['progbar_lockpicking'])
						Citizen.Wait(v.timer * 1000)
						SetVehicleNeedsToBeHotwired(vehicle, true)
						IsVehicleNeedsToBeHotwired(vehicle)
						ClearPedTasks(player)
						FreezeEntityPosition(player, false)
						SetVehicleDoorsLockedForAllPlayers(vehicle, false)
						SetVehicleDoorsLocked(vehicle, 1)
						ShowNotifyESX(Lang['veh_lockpicked'])
					end	
				end)
			else
				ShowNotifyESX(Lang['veh_not_locked'])
			end
		else
			ShowNotifyESX(Lang['not_close_to_veh'])
		end
	else
		ShowNotifyESX(Lang['no_veh_in_that_dir'])
	end 
end)

-- Create scrap NPC:
function CreateScrapNPC(scrapyard)
	LoadModel(scrapyard.ped)
	scrap_NPC = CreatePed(7, GetHashKey(scrapyard.ped), scrapyard.pos[1], scrapyard.pos[2], scrapyard.pos[3]-0.97, scrapyard.pos[4], 0, true, true)
	FreezeEntityPosition(scrap_NPC,true)
	SetBlockingOfNonTemporaryEvents(scrap_NPC, true)
	TaskStartScenarioInPlace(scrap_NPC, scrapyard.scenario, 0, false)
	SetEntityInvincible(scrap_NPC, true)
	SetEntityAsMissionEntity(scrap_NPC)
end

-- Crate scrapyard blip:
function CreateScrapBlip(entity, blip)
	if DoesBlipExist(scrap_blip) then 
		RemoveBlip(scrap_blip)
	end
	local pos = entity.pos
	if blip.enable then
		Citizen.CreateThread(function()
			scrap_blip = AddBlipForCoord(pos[1], pos[2], pos[3])
			SetBlipSprite (scrap_blip, blip.sprite)
			SetBlipDisplay(scrap_blip, 4)
			SetBlipScale  (scrap_blip, blip.scale)
			SetBlipColour (scrap_blip, blip.color)
			SetBlipAsShortRange(scrap_blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(blip.label)
			EndTextCommandSetBlipName(scrap_blip)
		end)
	end
end

loopedThrough = false
Citizen.CreateThread(function()
    while not loopedThrough and gotCarList do
		Citizen.Wait(1)
		for k,v in pairs(scrap_list) do
			print("label: "..v.label.." | hash: "..v.hash.."| price: "..v.price)
		end
		loopedThrough = true
		break
	end	
end)