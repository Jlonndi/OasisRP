local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}


--- action functions
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil


--- esx
local GUI = {}
ESX                           = nil
GUI.Time                      = 0
local PlayerData              = {}

Citizen.CreateThread(function ()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(5)
 	PlayerData = ESX.GetPlayerData()
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

----markers
AddEventHandler('esx_duty:hasEnteredMarker', function (zone)
  if zone == 'AmbulanceDuty' then
    CurrentAction     = 'ambulance_duty'
    CurrentActionMsg  = _U('duty')
    CurrentActionData = {}
  end
  if zone == 'PoliceDuty' then
    CurrentAction     = 'police_duty'
    CurrentActionMsg  = _U('duty')
    CurrentActionData = {}
  end
  if zone == 'Police2Duty' then
    CurrentAction     = 'police_duty'
    CurrentActionMsg  = _U('duty')
    CurrentActionData = {}
  end
  if zone == 'Police3Duty' then
    CurrentAction     = 'police_duty'
    CurrentActionMsg  = _U('duty')
    CurrentActionData = {}
  end
  if zone == 'Police4Duty' then
    CurrentAction     = 'police_duty'
    CurrentActionMsg  = _U('duty')
    CurrentActionData = {}
  end
  if zone == 'BcsoDuty' then
    CurrentAction     = 'bcso_duty'
    CurrentActionMsg  = _U('duty')
    CurrentActionData = {}
  end
  if zone == 'BolingDuty' then
    CurrentAction     = 'boling_duty'
    CurrentActionMsg  = _U('duty')
    CurrentActionData = {}
  end
  if zone == 'MechanicDuty' then
    CurrentAction     = 'mechanic_duty'
    CurrentActionMsg  = _U('duty')
    CurrentActionData = {}
  end
  if zone == 'Mechanic2Duty' then
    CurrentAction     = 'mechanic_duty'
    CurrentActionMsg  = _U('duty')
    CurrentActionData = {}
 end
  if zone == 'Mechanic3Duty' then
    CurrentAction     = 'mechanic_duty'
    CurrentActionMsg  = _U('duty')
    CurrentActionData = {}
  end
 if zone == 'Mechanic4Duty' then
    CurrentAction     = 'mechanic_duty'
    CurrentActionMsg  = _U('duty')
    CurrentActionData = {}
  end
 if zone == 'Mechanic5Duty' then
    CurrentAction     = 'mechanic_duty'
    CurrentActionMsg  = _U('duty')
    CurrentActionData = {}
  end
  if zone == 'Mechanic6Duty' then
    CurrentAction     = 'mechanic_duty'
    CurrentActionMsg  = _U('duty')
    CurrentActionData = {}
  end
  if zone == 'TaxiDuty' then
    CurrentAction     = 'taxi_duty'
    CurrentActionMsg  = _U('duty')
    CurrentActionData = {}
  end
end)

AddEventHandler('esx_duty:hasExitedMarker', function (zone)
  CurrentAction = nil
end)


--keycontrols
Citizen.CreateThread(function ()
  while true do
    Citizen.Wait(5)

      local playerPed = GetPlayerPed(-1)

    if CurrentAction ~= nil then
      SetTextComponentFormat('STRING')
      AddTextComponentString(CurrentActionMsg)
      DisplayHelpTextFromStringLabel(0, 0, 1, -1)

      if IsControlPressed(0, Keys['E']) then
        if CurrentAction == 'ambulance_duty' then
          if PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'offambulance' then
            TriggerServerEvent('duty:ambulance')
          if PlayerData.job.name == 'ambulance' then
            sendNotification(_U('offduty'), 'success', 2500)
            Wait(1000)
          else
            sendNotification(_U('onduty'), 'success', 2500)
            Wait(1000)
          end
        else
          sendNotification(_U('notamb'), 'error', 5000)
          Wait(1000)
        end
      end

        if CurrentAction == 'police_duty' then
          if PlayerData.job.name == 'police' or PlayerData.job.name == 'offpolice' then
            TriggerServerEvent('duty:police')
          if PlayerData.job.name == 'police' then
            sendNotification(_U('offduty'), 'success', 2500)
            Wait(1000)
          else
            sendNotification(_U('onduty'), 'success', 2500)
            Wait(1000)
          end
        else
          sendNotification(_U('notpol'), 'error', 5000)
          Wait(1000)
          end
        end
		
        if CurrentAction == 'mechanic_duty' then
          if PlayerData.job.name == 'mechanic' or PlayerData.job.name == 'offmechanic' then
            TriggerServerEvent('duty:mechanic')
          if PlayerData.job.name == 'mechanic' then
            sendNotification(_U('offduty'), 'success', 2500)
            Wait(1000)
          else
            sendNotification(_U('onduty'), 'success', 2500)
            Wait(1000)
          end
        else
          sendNotification(_U('notmech'), 'error', 5000)
          Wait(1000)
          end
        end
		
        if CurrentAction == 'taxi_duty' then
          if PlayerData.job.name == 'taxi' or PlayerData.job.name == 'offtaxi' then
            TriggerServerEvent('duty:taxi')
          if PlayerData.job.name == 'taxi' then
            sendNotification(_U('offduty'), 'success', 2500)
            Wait(1000)
          else
            sendNotification(_U('onduty'), 'success', 2500)
            Wait(1000)
          end
        else
          sendNotification(_U('nottaxi'), 'error', 5000)
          Wait(1000)
          end
        end

        if CurrentAction == 'bcso_duty' then
          if PlayerData.job.name == 'bcso' or PlayerData.job.name == 'offbcso' then
            TriggerServerEvent('duty:bcso')
          if PlayerData.job.name == 'bcso' then
            sendNotification(_U('offduty'), 'success', 2500)
            Wait(1000)
          else
            sendNotification(_U('onduty'), 'success', 2500)
            Wait(1000)
          end
        else
          sendNotification(_U('notbcso'), 'error', 5000)
          Wait(1000)
          end
        end

        if CurrentAction == 'boling_duty' then
          if PlayerData.job.name == 'boling' or PlayerData.job.name == 'offboling' then
            TriggerServerEvent('duty:boling')
          if PlayerData.job.name == 'boling' then
            sendNotification(_U('offduty'), 'success', 2500)
            Wait(1000)
          else
            sendNotification(_U('onduty'), 'success', 2500)
            Wait(1000)
          end
        else
          sendNotification(_U('notboling'), 'error', 5000)
          Wait(1000)
          end
        end
      end
    end
  end       
end)

-- Display markers
Citizen.CreateThread(function ()
  while true do
    Wait(0)

    local coords = GetEntityCoords(GetPlayerPed(-1))

    for k,v in pairs(Config.Zones) do
      if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance) then
        DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
      end
    end
  end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function ()
  while true do
    Wait(0)

    local coords      = GetEntityCoords(GetPlayerPed(-1))
    local isInMarker  = false
    local currentZone = nil

    for k,v in pairs(Config.Zones) do
      if(GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x) then
        isInMarker  = true
        currentZone = k
      end
    end

    if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
      HasAlreadyEnteredMarker = true
      LastZone                = currentZone
      TriggerEvent('esx_duty:hasEnteredMarker', currentZone)
    end

    if not isInMarker and HasAlreadyEnteredMarker then
      HasAlreadyEnteredMarker = false
      TriggerEvent('esx_duty:hasExitedMarker', LastZone)
    end
  end
end)

--notification
function sendNotification(message, messageType, messageTimeout)
	TriggerEvent("pNotify:SendNotification", {
		text = message,
		type = messageType,
		queue = "duty",
		timeout = messageTimeout,
		layout = "bottomCenter"
	})
end
