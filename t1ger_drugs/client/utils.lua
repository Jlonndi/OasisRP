-------------------------------------
------- Created by T1GER#9080 -------
------------------------------------- 
ESX 		= nil
PlayerData 	= {}

-- Police Notify:
isCop = false
local streetName
local _

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent(Config.ESXSHAREDOBJECT, function(obj) ESX = obj end)
		Citizen.Wait(5)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = ESX.GetPlayerData()
	isCop = IsPlayerJobCop()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	isCop = IsPlayerJobCop()
end)

-- [[ ESX SHOW ADVANCED NOTIFICATION ]] --
RegisterNetEvent('t1ger_drugs:ShowAdvancedNotifyESX')
AddEventHandler('t1ger_drugs:ShowAdvancedNotifyESX', function(title, subject, msg, icon, iconType)
	ESX.ShowAdvancedNotification(title, subject, msg, icon, iconType)
	-- If you want to switch ESX.ShowNotification with something else:
	-- 1) Comment out the function
	-- 2) add your own
	
end)

-- [[ ESX SHOW NOTIFICATION ]] --
RegisterNetEvent('t1ger_drugs:ShowNotifyESX')
AddEventHandler('t1ger_drugs:ShowNotifyESX', function(msg)
	ShowNotifyESX(msg)
end)

function ShowNotifyESX(msg)
	ESX.ShowNotification(msg)
	-- If you want to switch ESX.ShowNotification with something else:
	-- 1) Comment out the function
	-- 2) add your own
end

--[[function AlertPoliceFunction(sale)
	local label = Lang['police_notify']
	if sale then label = Lang['police_d_sale_notify'] end
	TriggerServerEvent('t1ger_drugs:PoliceNotifySV',GetEntityCoords(GetPlayerPed(-1)),streetName,label)
	exports['core_dispach']:addCall("10-17", "Suspicious Person", {
		{icon="fa-cannabis", info="Possible Drug Sale"},
		{icon="fa-cannabis", info= streetName},
		}, {streetName,_}, "police", 3000, 11, 5 )
	-- If you want to use your own alert:
	-- 1) Comment out the 'TriggerServerEvent('t1ger_carthief:OutlawNotifySV',GetEntityCoords(PlayerPedId()),streetName)'
	-- 2) replace whatever even you use to trigger your alert.
	
end]]

function AlertPoliceFunction(sale)
	local label = Lang['police_notifydispach']
	local pos = GetEntityCoords(GetPlayerPed(-1), false)
	if sale then label = Lang['police_d_sale_notifydispach'] end
	--TriggerServerEvent('t1ger_drugs:PoliceNotifySV',GetEntityCoords(GetPlayerPed(-1)),streetName,label)
	exports['core_dispach']:addCall("10-17", "Suspicious Person", {
		{icon="fa-cannabis", info= label},
		{icon="fa-cannabis", info= streetName},
		}, {pos.x, pos.y, pos.z}, "police", 6000, 11, 5 )
	-- If you want to use your own alert:
	-- 1) Comment out the 'TriggerServerEvent('t1ger_carthief:OutlawNotifySV',GetEntityCoords(PlayerPedId()),streetName)'
	-- 2) replace whatever even you use to trigger your alert.
	
end

RegisterNetEvent('t1ger_drugs:PoliceNotifyCL')
AddEventHandler('t1ger_drugs:PoliceNotifyCL', function(alert)
	if isCop then
		TriggerEvent('chat:addMessage', { args = {(Lang['dispatch_name']).. alert}})
	end
end)

-- [[ PHONE MESSAGES ]] --
function JobNotifyMSG(msg)
	local phoneNr = "T1GER#9080"
    PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", true)
	ShowNotifyESX(Lang['new_msg_from']:format(phoneNr))
	TriggerServerEvent('gcPhone:sendMessage', phoneNr, msg)
	-- If you use GCPhone and have not changed in it, do not touch this!
	-- If you use another phone or customized gcphone functions etc:
	-- 1) Edit the TriggerServerEvent to your likings
end

-- Thread for Police Notify
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3000)
		local pos = GetEntityCoords(GetPlayerPed(-1), false)
		streetName,_ = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
		streetName = GetStreetNameFromHashKey(streetName)
	end
end)

RegisterNetEvent('t1ger_drugs:PoliceNotifyBlip')
AddEventHandler('t1ger_drugs:PoliceNotifyBlip', function(targetCoords)
	if isCop and Config.AlertBlipShow then 
		local alpha = Config.AlertBlipAlpha
		local alertBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, Config.AlertBlipRadius)
		SetBlipHighDetail(alertBlip, true)
		SetBlipColour(alertBlip, Config.AlertBlipColor)
		SetBlipAlpha(alertBlip, alpha)
		SetBlipAsShortRange(alertBlip, true)
		while alpha ~= 0 do
			Citizen.Wait(Config.AlertBlipTime * 4)
			alpha = alpha - 1
			SetBlipAlpha(alertBlip, alpha)
			if alpha == 0 then
				RemoveBlip(alertBlip)
				return
			end
		end
	end
end)

-- Is Player A cop?
function IsPlayerJobCop()	
	if not PlayerData then return false end
	if not PlayerData.job then return false end
	for k,v in pairs(Config.PoliceJobs) do
		if PlayerData.job.name == v then return true end
	end
	return false
end

-- Function for Mission text:
function DrawMissionText(text)
    SetTextScale(0.5, 0.5)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextOutline()
    AddTextComponentString(text)
    DrawText(0.5,0.955)
end

-- Function for 3D text:
function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 500
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end

-- Round Fnction:
function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

-- Load Anim
function LoadAnim(animDict)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(10)
	end
end

-- Load Model
function LoadModel(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(10)
	end
end

