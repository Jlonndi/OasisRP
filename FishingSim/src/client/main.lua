
Fishing = {}

Fishing.Init = function()
  if Config.UsingESX then
    while not ESX.IsPlayerLoaded() do Wait(500); end
  else
    while not nCore.IsPlayerReady() do Wait(500); end
  end

  Fishing.LoadSalesMarkers()
  Fishing.LoadEquipmentStoreMarkers()
end

Citizen.CreateThread(Fishing.Init)