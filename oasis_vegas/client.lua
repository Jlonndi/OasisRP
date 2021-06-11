_menuPool         = NativeUI.CreatePool()
local bossMenu
local clotheMenu
local carMenu   
local jobMenu  
local showMenu    
local pcMenu  



ESX = nil

local PlayerLoaded          = true
local hasJob                = false
local isBoss                = false
local inRing                = false
local PedSpawned            = false
local gotDataMoney          = false
local gotEmployees          = false
local ChangeColor           = false

local currentSocietyMoney   = nil
local timeToLiver           = nil

local nearBossMenuMarker    = false
local inBossMenuMarker      = false

local nearSpawnerMarker     = false
local inSpawnerMarker       = false

local inDeSpawnMarker       = false
local nearDeSpawnMarker     = false

local inClotheMarker        = false
local nearClotheMarker      = false

local inComputerMarker      = false
local nearComputerMarker    = false

local inShowroomMarker      = false

local cam
local cam2
local cam3
local cam4

local employees             = {}
local Vehicles              = {}
local SpawnLocation         = {}
local ShowRoomLocation      = {}

---- Job Check ----
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(0)
    end
	Citizen.Wait(1000)
    TriggerServerEvent('oasisvegas:getVehicles')
    --GetJob()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerLoaded = true
    ESX.PlayerData = ESX.GetPlayerData()
    PlayerData = xPlayer

    TriggerServerEvent('oasisvegas:getVehicles')
    GetJob()
end)



RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData = ESX.GetPlayerData()
    PlayerData.job = job
    ESX.PlayerData.job = job
	if ESX.PlayerData.job.name == Cfg.society then
		hasJob = true
		if ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade == 7 then
			isBoss = true
		end
	else
		hasJob = false
		isBoss = false
	end
	gotJob = true
end)

function GetJob()
    ESX.PlayerData = ESX.GetPlayerData()
    Citizen.Wait(1000)
    if ESX.PlayerData ~= nil then
        if ESX.PlayerData.job.name == Cfg.society then

            hasJob = true
            if ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade == 7 then
                isBoss = true
            end
        end
        gotJob = true
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(350)
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        inRing = false
        inShowroomMarker      = false
        for r,v in pairs(Cfg.Coords.Ring) do
            local Distance = Vdist(playerCoords, v.x, v.y, v.z)
            if Distance < 1.0 then
                inRing = true
            end
        end

        for s,v in pairs(Cfg.Coords.Showrooms) do
            local Distance = Vdist(playerCoords, v.menu.x, v.menu.y, v.menu.z)
            if Distance < 1.0 then
                ChangeColor = v.ChangeColor
                inShowroomMarker = true
                ShowRoomLocation = {
                    x = v.spawn.x,
                    y = v.spawn.y,
                    z = v.spawn.z,
                    rot = v.spawn.rot
                }
                SpawnLocation = {
                    x = v.spawn2.x,
                    y = v.spawn2.y,
                    z = v.spawn2.z,
                    rot = v.spawn2.rot
                }
            end
        end
        if (hasJob) then
            nearBossMenuMarker    = false
            nearClotheMarker      = false
            nearDeSpawnMarker     = false
            nearSpawnerMarker     = false
            inBossMenuMarker      = false
            inSpawnerMarker       = false
            inDeSpawnMarker       = false
            inComputerMarker      = false
            inClotheMarker        = false
            if isBoss then
                for b,v in pairs(Cfg.Coords.Boss) do
                    local Distance = Vdist(playerCoords, v.x, v.y, v.z)
                    if Distance <= 50.0 then
                        nearBossMenuMarker = true
                    end
                    if  Distance < 1.0 then
                        inBossMenuMarker = true
                    end
                end
            end

            for c,v in pairs(Cfg.Coords.Computer) do
                local Distance = Vdist(playerCoords, v.x, v.y, v.z)
                if Distance <= 50.0 then
                    nearComputerMarker = true
                end
                if  Distance < 1.0 then
                    inComputerMarker = true
                    SpawnLocation = {
                        x = v.spawn.x,
                        y = v.spawn.y,
                        z = v.spawn.z,
                        rot = v.spawn.rot
                    }
                end
            end

            for c,v in pairs(Cfg.Coords.Clothe) do
                local Distance = Vdist(playerCoords, v.x, v.y, v.z)
                if Distance <= 50.0 then
                    nearClotheMarker = true
                end
                if  Distance < 1.0 then
                    inClotheMarker = true
                end
            end
            for g,v in pairs(Cfg.Coords.Garage) do
                local Distance = Vdist(playerCoords, v.x, v.y, v.z)
                if Distance <= 30.0 then 
                    nearSpawnerMarker = true
                    if PedSpawned == false then
                        RequestModel(GetHashKey(Cfg.GaragePed))
                        while not HasModelLoaded(GetHashKey(Cfg.GaragePed)) do
                            Wait(1)
                        end
                        npc = CreatePed(4, GetHashKey(Cfg.GaragePed), v.x, v.y, v.z - 1.0, 0, false, true)
                        FreezeEntityPosition(npc, true)	
                        SetEntityHeading(npc, v.rot)
                        SetEntityInvincible(npc, true)
                        SetBlockingOfNonTemporaryEvents(npc, true) 
                        PedSpawned = true  
                    end 
                end
                if  Distance < 2 then
                    SpawnLocation = {
                        x = v.spawn.x,
                        y = v.spawn.y,
                        z = v.spawn.z,
                        rot = v.spawn.rot
                    }
                    inSpawnerMarker = true
                end
            end

            if PedSpawned and not nearSpawnerMarker then
                DeleteEntity(npc)
                SetModelAsNoLongerNeeded(GetHashKey("ig_trafficwarden"))
                PedSpawned = false
            end

            for d,v in pairs(Cfg.Coords.DeSpawn) do
                if IsPedInAnyVehicle(playerPed, false) then
                    local Distance = Vdist(playerCoords, v.x, v.y, v.z)
                    if Distance <= 50.0 then
                        nearDeSpawnMarker = true
                    end
                    if  Distance < 5.0 then
                        inDeSpawnMarker = true
                    end
                end
            end
        end
    end

end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if (hasJob) then

            if nearClotheMarker then
                for c2,v in pairs(Cfg.Coords.Clothe) do
                    DrawMarker(Cfg.Marker.id, v.x, v.y, v.z-0.989, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Cfg.Marker.radius*1.5, Cfg.Marker.radius*1.5, Cfg.Marker.radius, Cfg.Marker.colour.r, Cfg.Marker.colour.g, Cfg.Marker.colour.b, Cfg.Marker.colour.a, false, false, 2, false, false, false, false)
                end
            end

            if nearBossMenuMarker and isBoss then
                for b2,v in pairs(Cfg.Coords.Boss) do
                    DrawMarker(Cfg.Marker.id, v.x, v.y, v.z-0.989, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Cfg.Marker.radius*1.5, Cfg.Marker.radius*1.5, Cfg.Marker.radius, Cfg.Marker.colour.r, Cfg.Marker.colour.g, Cfg.Marker.colour.b, Cfg.Marker.colour.a, false, false, 2, false, false, false, false)
                end
            end

            if nearDeSpawnMarker then
                for d2,v in pairs(Cfg.Coords.DeSpawn) do
                    DrawMarker(Cfg.Marker.id, v.x, v.y, v.z-0.989, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Cfg.Marker.radius*6, Cfg.Marker.radius*6, Cfg.Marker.radius, Cfg.Marker.colour.r, Cfg.Marker.colour.g, Cfg.Marker.colour.b, Cfg.Marker.colour.a, false, false, 2, false, false, false, false)
                end
            end

        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if _menuPool:IsAnyMenuOpen() then
            _menuPool:ProcessMenus()
        end
        if (inRing) then
            ShowInputNotification(Translation[Cfg.Locale]['ring_infobar'])
            if IsControlJustReleased(1, 38) then --38 = E Key
               TriggerServerEvent('oasisvegas:RingRing')
            end
        end

        if inShowroomMarker then
            ShowInputNotification(Translation[Cfg.Locale]['showroom_infobar'])
            if IsControlJustReleased(1, 38) then --38 = E Key
                if (showMenu ~= nil and showMenu:Visible()) then
                    showMenu:Visible(false)
                else
                    GenerateShowMenu(ShowRoomLocation.x, ShowRoomLocation.y, ShowRoomLocation.z, ShowRoomLocation.rot, SpawnLocation.x, SpawnLocation.y, SpawnLocation.z, SpawnLocation.rot)
                    showMenu:Visible(true)
                end
            end
        elseif showMenu ~= nil and showMenu:Visible() then
            _menuPool:CloseAllMenus()
        end
        if (hasJob) then
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            
            if IsControlJustReleased(0, 177) then
                if pcMenu ~= nil and not pcMenu:Visible() and cam ~= nil and IsCamActive(cam) then
                    RenderScriptCams(false, true, 500, true, true)
                    SetCamActive(cam, false)
                    DestroyCam(cam, true)
                    SetCamActive(cam2, false)
                    DestroyCam(cam2, true)
                    SetCamActive(cam3, false)
                    DestroyCam(cam3, true)
                    SetCamActive(cam4, false)
                    DestroyCam(cam4, true)
                end
            end


            if inBossMenuMarker then
                ShowInputNotification(Translation[Cfg.Locale]['boss_infobar'])
                if IsControlJustReleased(1, 38) then --38 = E Key
                    if bossMenu ~= nil and bossMenu:Visible() then
                    else
                        GenerateBossMenu()
                    end
                end
            end

            if inClotheMarker then
                ShowInputNotification(Translation[Cfg.Locale]['wardrobe_infobar'])
                if IsControlJustReleased(1, 38) then --38 = E Key
                    if (clotheMenu ~= nil and clotheMenu:Visible()) then
                        clotheMenu:Visible(false)
                    else
                        GenerateClotheMenu()
                        clotheMenu:Visible(true)
                    end
                end
            elseif clotheMenu ~= nil and clotheMenu:Visible() then
                _menuPool:CloseAllMenus()
            end

            if inSpawnerMarker then
                ShowInputNotification(Translation[Cfg.Locale]['garage_infobar'])
                if IsControlJustReleased(1, 38) then --38 = E Key
                    if (carMenu ~= nil and carMenu:Visible()) then
                        carMenu:Visible(false)
                    else
                        GenerateGarageMenu(SpawnLocation.x, SpawnLocation.y, SpawnLocation.z, SpawnLocation.rot)
                        carMenu:Visible(true)
                    end
                end
            elseif carMenu ~= nil and carMenu:Visible() then
                _menuPool:CloseAllMenus()
            end

            if inComputerMarker then
                ShowInputNotification(Translation[Cfg.Locale]['computer_infobar'])
                if IsControlJustReleased(1, 38) then --38 = E Key
                    if (pcMenu ~= nil and pcMenu:Visible()) then
                        pcMenu:Visible(false)
                    else
                        GenerateComputerMenu(SpawnLocation.x, SpawnLocation.y, SpawnLocation.z, SpawnLocation.rot)
                        pcMenu:Visible(true)
                    end
                end
            elseif pcMenu ~= nil and pcMenu:Visible() then
                _menuPool:CloseAllMenus()
            end

            if (inDeSpawnMarker) and IsPedInAnyVehicle(playerPed, false) then
                ShowInputNotification(Translation[Cfg.Locale]['delete_vehicle'])
                if IsControlJustReleased(1, 38) then --38 = E Key
                    local veh = GetVehiclePedIsIn(playerPed, false)
                    GiveCarBack(veh)
                end
            end

        end
    end
end)
---- Client Events ----
RegisterNetEvent('oasisvegas:ShowMSG')
AddEventHandler('oasisvegas:ShowMSG', function(msg, OnlyForJob)
    if OnlyForJob == true then
        if hasJob == true then
            ShowNotification(msg)
        end
    else
        ShowNotification(msg)
    end
end)


RegisterNetEvent('oasisvegas:ResultSocietyMoney')
AddEventHandler('oasisvegas:ResultSocietyMoney', function(money)
    currentSocietyMoney = money
    gotDataMoney = true
end)

RegisterNetEvent('oasisvegas:getEmployeesResult')
AddEventHandler('oasisvegas:getEmployeesResult', function(employee)
    employees = {}
    employees = employee
    gotEmployees = true
end)


RegisterNetEvent('oasisvegas:ShowAdvancedMSG')
AddEventHandler('oasisvegas:ShowAdvancedMSG', function(pic, title, subtitle, msg)
    ShowAdvancedNotification(pic, title, subtitle, msg)
end)

RegisterNetEvent('oasisvegas:getVehiclesResult')
AddEventHandler('oasisvegas:getVehiclesResult', function(Data)
    Vehicles = {}
    Vehicles = Data
    GetJob()
end)

RegisterNetEvent('oasisvegas:CheckTimeResult')
AddEventHandler('oasisvegas:CheckTimeResult', function(data)
    timeToLiver = data
end)
---- functions ----
function ShowInputNotification(text)
    SetTextComponentFormat('STRING')
    AddTextComponentString(text)
    EndTextCommandDisplayHelp(0, 0, 1, -1)
end

function ShowNotification(text)
	SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
	DrawNotification(false, true)
end

function ShowAdvancedNotification(pic, title, subtitle, msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    SetNotificationMessage(pic, pic, true, 1, title, subtitle)
    DrawNotification(false, true)
end

function GetAllPlayers()
    local players = {}

    for k, v in ipairs(GetActivePlayers()) do
        table.insert(players, v)
    end

    return players
end

function SpawnVehicle(modelHash, x, y, z, rot, WarpPlayerInVeh, plate, tunig)
    local model = modelHash
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1)
    end
    local vehicle = CreateVehicle(model, x, y, z, rot, true, false)
    -- SetModelAsNoLongerNeeded(model)
    SetVehicleOnGroundProperly(vehicle)
    if WarpPlayerInVeh then
        SetPedIntoVehicle(GetPlayerPed(-1), vehicle, - 1)
    end

    local props = {
        modEngine       = -1,
        modBrakes       = -1,
        modTransmission = -1,
        modSuspension   = -1,
        modTurbo        = false,
    }
    
    if tunig then
        ESX.Game.SetVehicleProperties(vehicle, props)
        SetVehicleColours(vehicle, 13, 13)
        SetVehicleExtraColours(vehicle, 13)
    end
    if plate then
        SetVehicleNumberPlateText(vehicle, Cfg.NumberPlate)
    end
    return vehicle
end

function CreateDialog(OnScreenDisplayTitle_shopmenu) --general OnScreenDisplay for KeyboardInput
	AddTextEntry(OnScreenDisplayTitle_shopmenu, OnScreenDisplayTitle_shopmenu)
	DisplayOnscreenKeyboard(1, OnScreenDisplayTitle_shopmenu, "", "", "", "", "", 32)
	while (UpdateOnscreenKeyboard() == 0) do
		DisableAllControlActions(0);
		Wait(0);
	end
	if (GetOnscreenKeyboardResult()) then
		local displayResult = GetOnscreenKeyboardResult()
		return displayResult
	end
end

function GetColors()
	local colors = {}
    colors = {
        submenu = {
            {label = firstToUpper(Cfg.Colors['black']), value = 1},
            {label = firstToUpper(Cfg.Colors['white']), value = 2},
            {label = firstToUpper(Cfg.Colors['grey']), value = 3},
            {label = firstToUpper(Cfg.Colors['red']), value = 4},
            {label = firstToUpper(Cfg.Colors['pink']), value = 5},
            {label = firstToUpper(Cfg.Colors['blue']), value = 6},
            {label = firstToUpper(Cfg.Colors['yellow']), value = 7},
            {label = firstToUpper(Cfg.Colors['green']), value = 8},
            {label = firstToUpper(Cfg.Colors['orange']), value = 9},
            {label = firstToUpper(Cfg.Colors['brown']), value = 10},
            {label = firstToUpper(Cfg.Colors['purple']), value = 11},
            {label = firstToUpper(Cfg.Colors['chrome']), value = 12},
            {label = firstToUpper(Cfg.Colors['gold']), value = 13},
        },
        { index = 0, label = firstToUpper(Cfg.Colors['black']), value = 1},
        { index = 1, label = firstToUpper(Cfg.Colors['graphite']), value = 1},
        { index = 2, label = firstToUpper(Cfg.Colors['black_metallic']), value = 1},
        { index = 3, label = firstToUpper(Cfg.Colors['caststeel']), value = 1},
        { index = 11, label = firstToUpper(Cfg.Colors['black_anth']), value = 1},
        { index = 12, label = firstToUpper(Cfg.Colors['matteblack']), value = 1},
        { index = 15, label = firstToUpper(Cfg.Colors['darknight']), value = 1},
        { index = 16, label = firstToUpper(Cfg.Colors['deepblack']), value = 1},
        { index = 21, label = firstToUpper(Cfg.Colors['oil']), value = 1},
        { index = 147, label = firstToUpper(Cfg.Colors['carbon']), value = 1},

        { index = 106, label = firstToUpper(Cfg.Colors['vanilla']), value = 2},
        { index = 107, label = firstToUpper(Cfg.Colors['creme']), value = 2},
        { index = 111, label = firstToUpper(Cfg.Colors['white']), value = 2},
        { index = 112, label = firstToUpper(Cfg.Colors['polarwhite']), value = 2},
        { index = 113, label = firstToUpper(Cfg.Colors['beige']), value = 2},
        { index = 121, label = firstToUpper(Cfg.Colors['mattewhite']), value = 2},
        { index = 122, label = firstToUpper(Cfg.Colors['snow']), value = 2},
        { index = 131, label = firstToUpper(Cfg.Colors['cotton']), value = 2},
        { index = 132, label = firstToUpper(Cfg.Colors['alabaster']), value = 2},
        { index = 134, label = firstToUpper(Cfg.Colors['purewhite']), value = 2},

        { index = 4, label = firstToUpper(Cfg.Colors['silver']), value = 3},
        { index = 5, label = firstToUpper(Cfg.Colors['metallicgrey']), value = 3},
        { index = 6, label = firstToUpper(Cfg.Colors['laminatedsteel']), value = 3},
        { index = 7, label = firstToUpper(Cfg.Colors['darkgray']), value = 3},
        { index = 8, label = firstToUpper(Cfg.Colors['rockygray']), value = 3},
        { index = 9, label = firstToUpper(Cfg.Colors['graynight']), value = 3},
        { index = 10, label = firstToUpper(Cfg.Colors['aluminum']), value = 3},
        { index = 13, label = firstToUpper(Cfg.Colors['graymat']), value = 3},
        { index = 14, label = firstToUpper(Cfg.Colors['lightgrey']), value = 3},
        { index = 17, label = firstToUpper(Cfg.Colors['asphaltgray']), value = 3},
        { index = 18, label = firstToUpper(Cfg.Colors['grayconcrete']), value = 3},
        { index = 19, label = firstToUpper(Cfg.Colors['darksilver']), value = 3},
        { index = 20, label = firstToUpper(Cfg.Colors['magnesite']), value = 3},
        { index = 22, label = firstToUpper(Cfg.Colors['nickel']), value = 3},
        { index = 23, label = firstToUpper(Cfg.Colors['zinc']), value = 3},
        { index = 24, label = firstToUpper(Cfg.Colors['dolomite']), value = 3},
        { index = 25, label = firstToUpper(Cfg.Colors['bluesilver']), value = 3},
        { index = 26, label = firstToUpper(Cfg.Colors['titanium']), value = 3},
        { index = 66, label = firstToUpper(Cfg.Colors['steelblue']), value = 3},
        { index = 93, label = firstToUpper(Cfg.Colors['champagne']), value = 3},
        { index = 144, label = firstToUpper(Cfg.Colors['grayhunter']), value = 3},
        { index = 156, label = firstToUpper(Cfg.Colors['grey']), value = 3},

        { index = 27, label = firstToUpper(Cfg.Colors['red']), value = 4},
        { index = 28, label = firstToUpper(Cfg.Colors['torino_red']), value = 4},
        { index = 29, label = firstToUpper(Cfg.Colors['poppy']), value = 4},
        { index = 30, label = firstToUpper(Cfg.Colors['copper_red']), value = 4},
        { index = 31, label = firstToUpper(Cfg.Colors['cardinal']), value = 4},
        { index = 32, label = firstToUpper(Cfg.Colors['brick']), value = 4},
        { index = 33, label = firstToUpper(Cfg.Colors['garnet']), value = 4},
        { index = 34, label = firstToUpper(Cfg.Colors['cabernet']), value = 4},
        { index = 35, label = firstToUpper(Cfg.Colors['candy']), value = 4},
        { index = 39, label = firstToUpper(Cfg.Colors['matte_red']), value = 4},
        { index = 40, label = firstToUpper(Cfg.Colors['dark_red']), value = 4},
        { index = 43, label = firstToUpper(Cfg.Colors['red_pulp']), value = 4},
        { index = 44, label = firstToUpper(Cfg.Colors['bril_red']), value = 4},
        { index = 46, label = firstToUpper(Cfg.Colors['pale_red']), value = 4},
        { index = 143, label = firstToUpper(Cfg.Colors['wine_red']), value = 4},
        { index = 150, label = firstToUpper(Cfg.Colors['volcano']), value = 4},

        { index = 135, label = firstToUpper(Cfg.Colors['electricpink']), value = 5},
        { index = 136, label = firstToUpper(Cfg.Colors['salmon']), value = 5},
        { index = 137, label = firstToUpper(Cfg.Colors['sugarplum']), value = 5},

        { index = 54, label = firstToUpper(Cfg.Colors['topaz']), value = 6},
        { index = 60, label = firstToUpper(Cfg.Colors['light_blue']), value = 6},
        { index = 61, label = firstToUpper(Cfg.Colors['galaxy_blue']), value = 6},
        { index = 62, label = firstToUpper(Cfg.Colors['dark_blue']), value = 6},
        { index = 63, label = firstToUpper(Cfg.Colors['azure']), value = 6},
        { index = 64, label = firstToUpper(Cfg.Colors['navy_blue']), value = 6},
        { index = 65, label = firstToUpper(Cfg.Colors['lapis']), value = 6},
        { index = 67, label = firstToUpper(Cfg.Colors['blue_diamond']), value = 6},
        { index = 68, label = firstToUpper(Cfg.Colors['surfer']), value = 6},
        { index = 69, label = firstToUpper(Cfg.Colors['pastel_blue']), value = 6},
        { index = 70, label = firstToUpper(Cfg.Colors['celeste_blue']), value = 6},
        { index = 73, label = firstToUpper(Cfg.Colors['rally_blue']), value = 6},
        { index = 74, label = firstToUpper(Cfg.Colors['blue_paradise']), value = 6},
        { index = 75, label = firstToUpper(Cfg.Colors['blue_night']), value = 6},
        { index = 77, label = firstToUpper(Cfg.Colors['cyan_blue']), value = 6},
        { index = 78, label = firstToUpper(Cfg.Colors['cobalt']), value = 6},
        { index = 79, label = firstToUpper(Cfg.Colors['electric_blue']), value = 6},
        { index = 80, label = firstToUpper(Cfg.Colors['horizon_blue']), value = 6},
        { index = 82, label = firstToUpper(Cfg.Colors['metallic_blue']), value = 6},
        { index = 83, label = firstToUpper(Cfg.Colors['aquamarine']), value = 6},
        { index = 84, label = firstToUpper(Cfg.Colors['blue_agathe']), value = 6},
        { index = 85, label = firstToUpper(Cfg.Colors['zirconium']), value = 6},
        { index = 86, label = firstToUpper(Cfg.Colors['spinel']), value = 6},
        { index = 87, label = firstToUpper(Cfg.Colors['tourmaline']), value = 6},
        { index = 127, label = firstToUpper(Cfg.Colors['paradise']), value = 6},
        { index = 140, label = firstToUpper(Cfg.Colors['bubble_gum']), value = 6},
        { index = 141, label = firstToUpper(Cfg.Colors['midnight_blue']), value = 6},
        { index = 146, label = firstToUpper(Cfg.Colors['forbidden_blue']), value = 6},
        { index = 157, label = firstToUpper(Cfg.Colors['glacier_blue']), value = 6},

        { index = 42, label = firstToUpper(Cfg.Colors['yellow']), value = 7},
        { index = 88, label = firstToUpper(Cfg.Colors['wheat']), value = 7},
        { index = 89, label = firstToUpper(Cfg.Colors['raceyellow']), value = 7},
        { index = 91, label = firstToUpper(Cfg.Colors['paleyellow']), value = 7},
        { index = 126, label = firstToUpper(Cfg.Colors['lightyellow']), value = 7},

        { index = 49, label = firstToUpper(Cfg.Colors['met_dark_green']), value = 8},
        { index = 50, label = firstToUpper(Cfg.Colors['rally_green']), value = 8},
        { index = 51, label = firstToUpper(Cfg.Colors['pine_green']), value = 8},
        { index = 52, label = firstToUpper(Cfg.Colors['olive_green']), value = 8},
        { index = 53, label = firstToUpper(Cfg.Colors['light_green']), value = 8},
        { index = 55, label = firstToUpper(Cfg.Colors['lime_green']), value = 8},
        { index = 56, label = firstToUpper(Cfg.Colors['forest_green']), value = 8},
        { index = 57, label = firstToUpper(Cfg.Colors['lawn_green']), value = 8},
        { index = 58, label = firstToUpper(Cfg.Colors['imperial_green']), value = 8},
        { index = 59, label = firstToUpper(Cfg.Colors['green_bottle']), value = 8},
        { index = 92, label = firstToUpper(Cfg.Colors['citrus_green']), value = 8},
        { index = 125, label = firstToUpper(Cfg.Colors['green_anis']), value = 8},
        { index = 128, label = firstToUpper(Cfg.Colors['khaki']), value = 8},
        { index = 133, label = firstToUpper(Cfg.Colors['army_green']), value = 8},
        { index = 151, label = firstToUpper(Cfg.Colors['dark_green']), value = 8},
        { index = 152, label = firstToUpper(Cfg.Colors['hunter_green']), value = 8},
        { index = 155, label = firstToUpper(Cfg.Colors['matte_foilage_green']), value = 8},

        { index = 36, label = firstToUpper(Cfg.Colors['tangerine']), value = 9},
        { index = 38, label = firstToUpper(Cfg.Colors['orange']), value = 9},
        { index = 41, label = firstToUpper(Cfg.Colors['matteorange']), value = 9},
        { index = 123, label = firstToUpper(Cfg.Colors['lightorange']), value = 9},
        { index = 124, label = firstToUpper(Cfg.Colors['peach']), value = 9},
        { index = 130, label = firstToUpper(Cfg.Colors['pumpkin']), value = 9},
        { index = 138, label = firstToUpper(Cfg.Colors['orangelambo']), value = 9},

        { index = 45, label = firstToUpper(Cfg.Colors['copper']), value = 10},
        { index = 47, label = firstToUpper(Cfg.Colors['lightbrown']), value = 10},
        { index = 48, label = firstToUpper(Cfg.Colors['darkbrown']), value = 10},
        { index = 90, label = firstToUpper(Cfg.Colors['bronze']), value = 10},
        { index = 94, label = firstToUpper(Cfg.Colors['brownmetallic']), value = 10},
        { index = 96, label = firstToUpper(Cfg.Colors['chocolate']), value = 10},
        { index = 97, label = firstToUpper(Cfg.Colors['terracotta']), value = 10},
        { index = 98, label = firstToUpper(Cfg.Colors['marble']), value = 10},
        { index = 99, label = firstToUpper(Cfg.Colors['sand']), value = 10},
        { index = 100, label = firstToUpper(Cfg.Colors['sepia']), value = 10},
        { index = 101, label = firstToUpper(Cfg.Colors['bison']), value = 10},
        { index = 102, label = firstToUpper(Cfg.Colors['palm']), value = 10},
        { index = 103, label = firstToUpper(Cfg.Colors['caramel']), value = 10},
        { index = 104, label = firstToUpper(Cfg.Colors['rust']), value = 10},
        { index = 105, label = firstToUpper(Cfg.Colors['chestnut']), value = 10},
        { index = 108, label = firstToUpper(Cfg.Colors['brown']), value = 10},
        { index = 109, label = firstToUpper(Cfg.Colors['hazelnut']), value = 10},
        { index = 110, label = firstToUpper(Cfg.Colors['shell']), value = 10},
        { index = 114, label = firstToUpper(Cfg.Colors['mahogany']), value = 10},
        { index = 115, label = firstToUpper(Cfg.Colors['cauldron']), value = 10},
        { index = 116, label = firstToUpper(Cfg.Colors['blond']), value = 10},
        { index = 129, label = firstToUpper(Cfg.Colors['gravel']), value = 10},
        { index = 153, label = firstToUpper(Cfg.Colors['darkearth']), value = 10},
        { index = 154, label = firstToUpper(Cfg.Colors['desert']), value = 10},

        { index = 71, label = firstToUpper(Cfg.Colors['indigo']), value = 11},
        { index = 72, label = firstToUpper(Cfg.Colors['deeppurple']), value = 11},
        { index = 76, label = firstToUpper(Cfg.Colors['darkviolet']), value = 11},
        { index = 81, label = firstToUpper(Cfg.Colors['amethyst']), value = 11},
        { index = 142, label = firstToUpper(Cfg.Colors['mysticalviolet']), value = 11},
        { index = 145, label = firstToUpper(Cfg.Colors['purplemetallic']), value = 11},
        { index = 148, label = firstToUpper(Cfg.Colors['matteviolet']), value = 11},
        { index = 149, label = firstToUpper(Cfg.Colors['mattedeeppurple']), value = 11},

        { index = 118, label = firstToUpper(Cfg.Colors['blackchrome']), value = 12},
        { index = 119, label = firstToUpper(Cfg.Colors['brushedaluminum']), value = 12},
        { index = 120, label = firstToUpper(Cfg.Colors['chrome']), value = 12},

        { index = 37, label = firstToUpper(Cfg.Colors['gold']), value = 13},
        { index = 158, label = firstToUpper(Cfg.Colors['puregold']), value = 13},
        { index = 159, label = firstToUpper(Cfg.Colors['brushedgold']), value = 13},
        { index = 160, label = firstToUpper(Cfg.Colors['lightgold']), value = 13}
    }
	return colors
end

function GiveCarBack(veh)
	SetEntityAsMissionEntity(veh)
	DeleteVehicle(veh)
end
-- Menus --

function GenerateClotheMenu()
    _menuPool:Remove()
    _menuPool = NativeUI.CreatePool()
    collectgarbage()
    
    clotheMenu = NativeUI.CreateMenu(Translation[Cfg.Locale]['wardrobe'], nil)
    _menuPool:Add(clotheMenu)

    _menuPool:RefreshIndex()
    _menuPool:MouseControlsEnabled (false)
    _menuPool:MouseEdgeEnabled (false)
    _menuPool:ControlDisablingEnabled(false)
    local clothe_civ = NativeUI.CreateItem(Translation[Cfg.Locale]['private_clothes'], '')
    clotheMenu:AddItem(clothe_civ)
    local playerPed = PlayerPedId()

    clothe_civ.Activated = function(sender, item)
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            TriggerEvent('skinchanger:loadSkin', skin)
        end)
    end

    for h, clothe in pairs(Cfg.Clothes) do
        if ESX.PlayerData.job.grade == clothe.grade then
            local clothe_item = NativeUI.CreateItem(clothe.name, '')
            clotheMenu:AddItem(clothe_item)
            clothe_item.Activated = function(sender, item)
                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                    if skin.sex == 0 then
                        SetPedComponentVariation(playerPed, 3, clothe.Male.Arms.id, clothe.Male.Arms.id2, 0)
                        SetPedComponentVariation(playerPed, 4, clothe.Male.Leg.id, clothe.Male.Leg.id2, 0)
                        SetPedComponentVariation(playerPed, 5, clothe.Male.bag.id, clothe.Male.bag.id2, 0)
                        SetPedComponentVariation(playerPed, 6, clothe.Male.Shoes.id, clothe.Male.Shoes.id2, 0)
                        SetPedComponentVariation(playerPed, 7, clothe.Male.Accessory.id, clothe.Male.Accessory.id2, 0)
                        SetPedComponentVariation(playerPed, 8, clothe.Male.Tshirt.id, clothe.Male.Tshirt.id2, 0)
                        SetPedComponentVariation(playerPed, 11, clothe.Male.Torso.id, clothe.Male.Torso.id2, 0)
                        SetPedPropIndex(playerPed, 6, clothe.Male.Watch.id, clothe.Male.Watch.id2, 0)
                        ClearPedProp(playerPed, 0)
                        ClearPedProp(playerPed, 1)
                        ClearPedProp(playerPed, 2)
                    else
                        SetPedComponentVariation(playerPed, 3, clothe.Female.Arms.id, clothe.Female.Arms.id2, 0)
                        SetPedComponentVariation(playerPed, 4, clothe.Female.Leg.id, clothe.Female.Leg.id2, 0)
                        SetPedComponentVariation(playerPed, 5, clothe.Female.bag.id, clothe.Female.bag.id2, 0)
                        SetPedComponentVariation(playerPed, 6, clothe.Female.Shoes.id, clothe.Female.Shoes.id2, 0)
                        SetPedComponentVariation(playerPed, 7, clothe.Female.Accessory.id, clothe.Female.Accessory.id2, 0)
                        SetPedComponentVariation(playerPed, 8, clothe.Female.Tshirt.id, clothe.Female.Tshirt.id2, 0)
                        SetPedComponentVariation(playerPed, 11, clothe.Female.Torso.id, clothe.Female.Torso.id2, 0)
                        SetPedPropIndex(playerPed, 6, clothe.Female.Watch.id, clothe.Female.Watch.id2, 0)
                        ClearPedProp(playerPed, 0)
                        ClearPedProp(playerPed, 1)
                        ClearPedProp(playerPed, 2)
                    end
                end)
            end
        end
    end
    _menuPool:RefreshIndex()
end

function GenerateBossMenu()

    bossMenu = NativeUI.CreateMenu(Translation[Cfg.Locale]['bossmenu'], nil)
    _menuPool:Add(bossMenu)

    gotDataMoney = false
    gotEmployees = false
    
    TriggerServerEvent('oasisvegas:getSocietyMoney')
    TriggerServerEvent('oasisvegas:getEmployeesDB')

    while gotDataMoney == false or gotEmployees == false do
        Wait(10)
    end

    players = {}
    players = GetAllPlayers()


    -- Finanzen --
    local money = _menuPool:AddSubMenu(bossMenu, Translation[Cfg.Locale]['finance_management'])
    local personal = _menuPool:AddSubMenu(bossMenu, Translation[Cfg.Locale]['staff'])
    currentMoney = NativeUI.CreateItem(Translation[Cfg.Locale]['society_money'], '')
    currentMoney:RightLabel('~HUD_COLOUR_GREENDark~' .. math.floor(currentSocietyMoney) .. '$')
    local withdraw = NativeUI.CreateItem(Translation[Cfg.Locale]['withdraw_money'], Translation[Cfg.Locale]['withdraw_desc'])
    local deposit = NativeUI.CreateItem(Translation[Cfg.Locale]['deposit_money'], Translation[Cfg.Locale]['deposit_desc'])
    money:AddItem(currentMoney)
    money:AddItem(withdraw)
    money:AddItem(deposit)
    deposit.Activated = function(sender, item)
        if item == deposit then
		local onScreenDisplayResult_shopmenu_amount = CreateDialog(Translation[Cfg.Locale]['how_much'])
			if (onScreenDisplayResult_shopmenu_amount ~= nil) then
				if tonumber(onScreenDisplayResult_shopmenu_amount) then
					local value = onScreenDisplayResult_shopmenu_amount
					local amount = tonumber(value)
                    TriggerServerEvent('oasisvegas:addSocietyMoney', amount)
                    ShowAdvancedNotification('CHAR_BANK_FLEECA', 'Fleeca Bank', Translation[Cfg.Locale]['company_money'], Translation[Cfg.Locale]['deposit_msg'] .. amount .. Translation[Cfg.Locale]['deposit_msg2'])
				else
					ShowAdvancedNotification('CHAR_BANK_FLEECA', Translation[Cfg.Locale]['unknown_amount'], 'Fleeca Bank', Translation[Cfg.Locale]['company_money'])
				end
			end
        end
    end

    withdraw.Activated = function(sender, item)
        if item == withdraw then
			local onScreenDisplayResult_shopmenu_amount = CreateDialog(Translation[Cfg.Locale]['how_much'])
			if (onScreenDisplayResult_shopmenu_amount ~= nil) then
				if tonumber(onScreenDisplayResult_shopmenu_amount) then
					local value = onScreenDisplayResult_shopmenu_amount
					local amount = tonumber(value)
                    TriggerServerEvent('esx_society:withdrawMoney',Cfg.society, amount)
                    ShowAdvancedNotification('CHAR_BANK_FLEECA', Translation[Cfg.Locale]['withdraw_msg'] .. amount .. Translation[Cfg.Locale]['withdraw_msg2'], 'Fleeca Bank', Translation[Cfg.Locale]['company_money'])
				else
					ShowAdvancedNotification('CHAR_BANK_FLEECA', Translation[Cfg.Locale]['unknown_amount'], 'Fleeca Bank', Translation[Cfg.Locale]['company_money'])
				end
			end
         end
    end
    -- Finanzen --
    -- Mitarbeiter --
    local hire = _menuPool:AddSubMenu(personal, Translation[Cfg.Locale]['hire'])
    local edit = _menuPool:AddSubMenu(personal, Translation[Cfg.Locale]['staff_management'])

    for j, ply in pairs(players) do

        local hirePlayerItem = NativeUI.CreateItem(GetPlayerName(ply), '')
        hire:AddItem(hirePlayerItem)

        hirePlayerItem.Activated = function(sender, index)
            TriggerServerEvent('oasisvegas:hire', GetPlayerServerId(ply), GetPlayerName(ply))
        end
    end

    for i, emp in pairs(employees) do
        local EmployeeSubMenu = _menuPool:AddSubMenu(edit, emp.firstname .. ' ' .. emp.lastname)
        local currentGrade = NativeUI.CreateItem(Translation[Cfg.Locale]['job_rank'], '')
        local fire = NativeUI.CreateItem(Translation[Cfg.Locale]['fire'], Translation[Cfg.Locale]['fire_msg'] ..emp.firstname .. ' ' .. emp.lastname .. Translation[Cfg.Locale]['fire_msg2'])
        fire:SetRightBadge(BadgeStyle.Alert)
        EmployeeSubMenu:AddItem(currentGrade)
        local tograde = _menuPool:AddSubMenu(EmployeeSubMenu, Translation[Cfg.Locale]['promote'])
        EmployeeSubMenu:AddItem(fire)
        for i2, grade in pairs(Cfg.Grades) do
            if emp.job_grade == grade.number then
                currentGrade:RightLabel(grade.label)
            end
        end
        for o, grade in pairs(Cfg.Grades) do
            local grade_item = NativeUI.CreateItem(grade.label, Translation[Cfg.Locale]['promote_msg'] .. emp.firstname .. ' ' .. emp.lastname .. Translation[Cfg.Locale]['promote_msg2'] .. grade.label .. Translation[Cfg.Locale]['promote_msg3'])
            tograde:AddItem(grade_item)
            grade_item.Activated = function(sender, item)
                TriggerServerEvent('oasisvegas:promote', emp.identifier, emp.firstname, emp.lastname, grade.number, grade.label)
            end
        end
        fire.Activated = function(sender, item)
            TriggerServerEvent('oasisvegas:fire', emp.identifier, emp.firstname, emp.lastname)
            TriggerServerEvent('oasisvegas:getEmployeesDB')
        end
    end

    bossMenu:Visible(true)

    _menuPool:RefreshIndex()
    _menuPool:MouseControlsEnabled (false)
    _menuPool:MouseEdgeEnabled (false)
    _menuPool:ControlDisablingEnabled(false)
end

function GenerateGarageMenu(spawnx, spawny, spawnz, spawnrot)
    _menuPool:Remove()
    _menuPool = NativeUI.CreatePool()
    collectgarbage()
    
    carMenu = NativeUI.CreateMenu('Garage', '~b~Autos')
    _menuPool:Add(carMenu)
    _menuPool:RefreshIndex()
    _menuPool:MouseControlsEnabled (false)
    _menuPool:MouseEdgeEnabled (false)
    _menuPool:ControlDisablingEnabled(false)

    for k,v in pairs(Vehicles) do
        if v.storage > 0 then
            local car_item = NativeUI.CreateItem(v.manufacturer .. ' ' .. v.label, '')
            carMenu:AddItem(car_item)
            car_item.Activated = function(sender, item)
                local vehicle = SpawnVehicle(v.model, spawnx, spawny, spawnz, spawnrot, true, true, true)
            end
        end
    end
    _menuPool:RefreshIndex()
end

function GenerateShowMenu(x, y, z, rot, x2, y2, z2, rot2)
    _menuPool:Remove()
    _menuPool = NativeUI.CreatePool()
    collectgarbage()
    
    showMenu = NativeUI.CreateMenu(Translation[Cfg.Locale]['showroom'],'')
    _menuPool:Add(showMenu)
    _menuPool:RefreshIndex()
    _menuPool:MouseControlsEnabled (false)
    _menuPool:MouseEdgeEnabled (false)
    _menuPool:ControlDisablingEnabled(false)

    -- Color Change
    if ChangeColor or hasJob then
        local colorsubmenu = _menuPool:AddSubMenu(showMenu, Translation[Cfg.Locale]['change_color'])

        local colortabel = GetColors()
        for k3,v3 in pairs(colortabel.submenu) do
            local submenu1 = _menuPool:AddSubMenu(colorsubmenu, v3.label)
            for k2,v2 in pairs(colortabel) do
                if v2.value == v3.value then
                    local submenu = _menuPool:AddSubMenu(submenu1, v2.label)
                    local primary = NativeUI.CreateItem(Translation[Cfg.Locale]['primary_color'], Translation[Cfg.Locale]['primary_color_msg'])
                    local secondary = NativeUI.CreateItem(Translation[Cfg.Locale]['secondary_color'], Translation[Cfg.Locale]['secondary_color_msg'])
                    local pearl = NativeUI.CreateItem(Translation[Cfg.Locale]['pearl'], Translation[Cfg.Locale]['pearl_msg'])
                    submenu:AddItem(primary)
                    submenu:AddItem(secondary)
                    submenu:AddItem(pearl)
                    primary.Activated = function(sender, item)
                        local veh = GetClosestVehicle(x, y, z, 1.0, 0, 2175)
                        local probs = {
                            color1 = v2.index
                        }
                        ESX.Game.SetVehicleProperties(veh, probs)
                    end
                    secondary.Activated = function(sender, item)
                        local veh = GetClosestVehicle(x, y, z, 1.0, 0, 2175)
                        local probs = {
                            color2 = v2.index
                        }
                        ESX.Game.SetVehicleProperties(veh, probs)
                    end
                    pearl.Activated = function(sender, item)
                        local veh = GetClosestVehicle(x, y, z, 1.0, 0, 2175)
                        local pearlescentColor, wheelColor = GetVehicleExtraColours(veh)
                        local probs = {
                            pearlescentColor = v2.index
                        }
                        ESX.Game.SetVehicleProperties(veh, probs)
                    end
                end
            end
        end
    end
    -- Color Change

    for k, v in pairs(Vehicles) do 
        local veh = GetClosestVehicle(x, y, z, 1.0, 0, 2175)
        local vehHash = GetEntityModel(veh)
        
        if GetHashKey(v.model) == vehHash and v.storage > 0 then
            local vehsubmenu = _menuPool:AddSubMenu(showMenu, Translation[Cfg.Locale]['presented_prefix'] .. v.manufacturer .. ' ' .. v.label)
            local manufacturer_item = NativeUI.CreateItem(Translation[Cfg.Locale]['show_manufacturer'], '')
            local price_item = NativeUI.CreateItem(Translation[Cfg.Locale]['show_price'], '')
            local model_item = NativeUI.CreateItem(Translation[Cfg.Locale]['show_model'], '')
            local park_item = NativeUI.CreateItem(Translation[Cfg.Locale]['show_park_item'], '')
            local placeholder = NativeUI.CreateItem('', '')
            local ps_item = NativeUI.CreateItem(Translation[Cfg.Locale]['show_performance'], '')
            local maxSpeed_item = NativeUI.CreateItem(Translation[Cfg.Locale]['show_maxSpeed'], '')
            local speedup = NativeUI.CreateItem(Translation[Cfg.Locale]['show_speedup'], '')
            local modifikation = NativeUI.CreateItem(Translation[Cfg.Locale]['show_modifications'], '')
            local tankcapacity = NativeUI.CreateItem(Translation[Cfg.Locale]['show_fuelcapacity'], '')
           
            manufacturer_item:RightLabel(v.manufacturer)
            price_item:RightLabel('~HUD_COLOUR_GREENDARK~$' .. v.price)
            model_item:RightLabel(v.label)
            ps_item:RightLabel(v.ps .. Translation[Cfg.Locale]['show_suffix_performance'])
            maxSpeed_item:RightLabel(v.maxSpeed .. Translation[Cfg.Locale]['show_suffix_maxSpeed'])
            speedup:RightLabel(v.speedUp .. Translation[Cfg.Locale]['show_suffix_speedup'])
            modifikation:RightLabel(v.modification .. Translation[Cfg.Locale]['show_suffix_modifications'])
            tankcapacity:RightLabel(v.tankcapacity .. Translation[Cfg.Locale]['show_suffix_fuelcapacity'])

            vehsubmenu:AddItem(manufacturer_item)
            vehsubmenu:AddItem(model_item)
            vehsubmenu:AddItem(price_item)       
            vehsubmenu:AddItem(placeholder)
            vehsubmenu:AddItem(ps_item)
            vehsubmenu:AddItem(maxSpeed_item)
            vehsubmenu:AddItem(speedup)
            vehsubmenu:AddItem(modifikation)
            vehsubmenu:AddItem(tankcapacity)
            break
        end
    end
    
    if hasJob then
        local spawn_item = NativeUI.CreateItem(Translation[Cfg.Locale]['test_drive'], '')
        showMenu:AddItem(spawn_item)

        spawn_item.Activated = function(sender, item)
            local veh = GetClosestVehicle(x, y, z, 1.0, 0, 2175)
            local props = ESX.Game.GetVehicleProperties(veh)
            local veh = SpawnVehicle(props.model, x2, y2, z2, rot2, true, true, false)
            props.plate = 'LUXURY'
            ESX.Game.SetVehicleProperties(veh, props)
        end
        for k, v in pairs(Vehicles) do 
            if v.storage > 0 then
                local vehsubmenu = _menuPool:AddSubMenu(showMenu, v.manufacturer .. ' ' .. v.label)
                local manufacturer_item = NativeUI.CreateItem(Translation[Cfg.Locale]['show_manufacturer'], '')
                local price_item = NativeUI.CreateItem(Translation[Cfg.Locale]['show_price'], '')
                local model_item = NativeUI.CreateItem(Translation[Cfg.Locale]['show_model'], '')
                local storage = NativeUI.CreateItem(Translation[Cfg.Locale]['amount_cardealer'], '')
                local bigstorage = NativeUI.CreateItem(Translation[Cfg.Locale]['amount_storage'], '')
                local park_item = NativeUI.CreateItem(Translation[Cfg.Locale]['set_to_showroom'], '')
                local placeholder = NativeUI.CreateItem('', '')
                local ps_item = NativeUI.CreateItem(Translation[Cfg.Locale]['show_performance'], '')
                local maxSpeed_item = NativeUI.CreateItem(Translation[Cfg.Locale]['show_maxSpeed'], 'ungetuned')
                local speedup = NativeUI.CreateItem(Translation[Cfg.Locale]['show_speedup'], 'ungetuned')
                local modifikation = NativeUI.CreateItem(Translation[Cfg.Locale]['show_modifications'], '')
                local tankcapacity = NativeUI.CreateItem(Translation[Cfg.Locale]['show_fuelcapacity'], '')
                local placeholder2 = NativeUI.CreateItem('', '')
                
                
                manufacturer_item:RightLabel(v.manufacturer)
                price_item:RightLabel('~HUD_COLOUR_GREENDARK~$' .. v.price)
                model_item:RightLabel(v.label)
                storage:RightLabel(v.storage .. Translation[Cfg.Locale]['amount_cars'])
                bigstorage:RightLabel(v.bigstorage .. Translation[Cfg.Locale]['amount_cars'])
                ps_item:RightLabel(v.ps .. Translation[Cfg.Locale]['show_suffix_performance'])
                maxSpeed_item:RightLabel(v.maxSpeed .. Translation[Cfg.Locale]['show_suffix_maxSpeed'])
                speedup:RightLabel(v.speedUp .. Translation[Cfg.Locale]['show_suffix_speedup'])
                modifikation:RightLabel(v.modification .. Translation[Cfg.Locale]['show_suffix_modifications'])
                tankcapacity:RightLabel(v.tankcapacity .. Translation[Cfg.Locale]['show_suffix_fuelcapacity'])

                vehsubmenu:AddItem(manufacturer_item)
                vehsubmenu:AddItem(model_item)
                vehsubmenu:AddItem(price_item)
                vehsubmenu:AddItem(storage)
                vehsubmenu:AddItem(bigstorage)
                vehsubmenu:AddItem(placeholder)
                vehsubmenu:AddItem(ps_item)
                vehsubmenu:AddItem(maxSpeed_item)
                vehsubmenu:AddItem(speedup)
                vehsubmenu:AddItem(modifikation)
                vehsubmenu:AddItem(tankcapacity)
                vehsubmenu:AddItem(placeholder2)
                vehsubmenu:AddItem(park_item)

            
                park_item.Activated = function(sender, item)
                    local veh = GetClosestVehicle(x, y, z, 1.0, 0, 2175)
                    GiveCarBack(veh)
                    local veh = SpawnVehicle(v.model, x, y, z, rot, false, false, false)
                    FreezeEntityPosition(veh, true)
                    SetDisableVehicleEngineFires(veh, true)
                    SetDisableVehiclePetrolTankDamage(veh, true)
                    SetDisableVehiclePetrolTankFires(veh, true)
                    SetDisableVehicleWindowCollisions(veh, true)
                    SetEntityCanBeDamaged(veh, false)
                    SetVehicleDirtLevel(veh, 0)
                    SetVehicleFixed(veh)
                    curretnVehId = v.id
                end
            end
        end
    end
    _menuPool:RefreshIndex()
    _menuPool:MouseControlsEnabled (false)
    _menuPool:MouseEdgeEnabled (false)
    _menuPool:ControlDisablingEnabled(false)
end

function GenerateComputerMenu(x, y, z, rot)
    _menuPool:Remove()
    _menuPool = NativeUI.CreatePool()
    collectgarbage()
    
    pcMenu = NativeUI.CreateMenu(Translation[Cfg.Locale]['computer'],'')
    _menuPool:Add(pcMenu)

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    local sellVehicle = _menuPool:AddSubMenu(pcMenu, Translation[Cfg.Locale]['sell_vehicle'], '~b~')

    local playersInArea = ESX.Game.GetPlayersInArea(playerCoords, 10.0)

    local gotOSResult = false
    if Cfg.useOneSyncInfinity then
        ESX.TriggerServerCallback('oasisvegas:getPlayersInArea', function(playersInArea_res)
            playersInArea = playersInArea_res
            gotOSResult = true
        end, playerCoords, 10.0)
    end

    for i=1, 10, 1 do
        if not gotOSResult then
            Citizen.Wait(100)
        end
    end
	
    for k, player in pairs(playersInArea) do
	
		local playerInvite
		if Cfg.useOneSyncInfinity then
			playerInvite = _menuPool:AddSubMenu(sellVehicle, player.name, '~b~')
		else
			playerInvite = _menuPool:AddSubMenu(sellVehicle, GetPlayerName(player), '~b~')
		end

        for k,v in pairs(Vehicles) do
            local vehsubmenu = _menuPool:AddSubMenu(playerInvite, v.manufacturer .. ' ' .. v.label)
            local price_item = NativeUI.CreateItem(Translation[Cfg.Locale]['show_price'], '')
            local model_item = NativeUI.CreateItem(Translation[Cfg.Locale]['show_model'], '')
            local storage = NativeUI.CreateItem(Translation[Cfg.Locale]['amount_cars'], '')
            local bigstorage = NativeUI.CreateItem(Translation[Cfg.Locale]['amount_storage'], '')

            local buy_item = NativeUI.CreateItem(v.manufacturer .. ' ' .. v.label .. Translation[Cfg.Locale]['car_sell'], '')

            price_item:RightLabel('~HUD_COLOUR_GREENDARK~$' .. v.price)
            model_item:RightLabel(v.label)
            storage:RightLabel(v.storage .. Translation[Cfg.Locale]['amount_cars'])
            bigstorage:RightLabel(v.bigstorage .. Translation[Cfg.Locale]['amount_cars'])

            vehsubmenu:AddItem(model_item)
            vehsubmenu:AddItem(price_item)
            vehsubmenu:AddItem(storage)
            vehsubmenu:AddItem(bigstorage)
            vehsubmenu:AddItem(buy_item)
            
            buy_item.Activated = function(sender, item)
                local ServerIdtargetPlayer
                if Cfg.useOneSyncInfinity then
                    ServerIdtargetPlayer = player.id
                else
                    ServerIdtargetPlayer = GetPlayerServerId(player)
                end

                if v.storage > 0 then
                    local price = CreateDialog(Translation[Cfg.Locale]['dialog_price'])
                    if tonumber(price) then
                        --
                        if price ~= nil then
                            price = tonumber(price)
                            -- MONEY Check
                            ESX.TriggerServerCallback('oasisvegas:hasEnoughMoney', function(hasEnoughMoney)
                                
                                if hasEnoughMoney then
                                    local veh = SpawnVehicle(v.model, SpawnLocation.x, SpawnLocation.y, SpawnLocation.z, SpawnLocation.rot, false, false, false)
                                    --print('SpawnVehicle')
                                    TriggerServerEvent('oasisvegas:removeMoney', ServerIdtargetPlayer, price)
                                    local generatedPlate = GeneratePlate()
    
                                    local vehProps = ESX.Game.GetVehicleProperties(veh)
                                    --print('oldplate: ' .. vehProps.plate)
                                    vehProps.plate = generatedPlate
    
                                    --TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                                    SetVehicleNumberPlateText(veh, generatedPlate)
    
                                    FreezeEntityPosition(PlayerPedId(), false)
                                    SetEntityVisible(PlayerPedId(), true)
    
                                    TriggerServerEvent('oasisvegas:BuyVeh', ServerIdtargetPlayer, v.manufacturer, v.label, vehProps, v.storage, v.model, price, NetworkGetNetworkIdFromEntity(veh), GetEntityCoords(veh), GetEntityHeading(veh))
                                    v.storage = v.storage - 1
                                else
                                    ShowNotification(Translation[Cfg.Locale]['customer_not_enough_money'])
                                end
                                
                            end, price, ServerIdtargetPlayer)
                        end
                    end
                else
                    ShowNotification(Translation[Cfg.Locale]['not_enough_vehicles_in_storage'])
                end


            end
        end
		
	end

    local VehiclesList = _menuPool:AddSubMenu(pcMenu, Translation[Cfg.Locale]['vehicles_list'], '')

    for k,v in pairs(Vehicles) do
        local vehsubmenu = _menuPool:AddSubMenu(VehiclesList, v.manufacturer .. ' ' .. v.label)
        local manufacturer_item = NativeUI.CreateItem(Translation[Cfg.Locale]['show_manufacturer'], '')
        local price_item = NativeUI.CreateItem(Translation[Cfg.Locale]['show_price'], '')
        local model_item = NativeUI.CreateItem(Translation[Cfg.Locale]['show_model'], '')
        local storage = NativeUI.CreateItem(Translation[Cfg.Locale]['amount_cars'], '')
        local bigstorage = NativeUI.CreateItem(Translation[Cfg.Locale]['amount_storage'], '')
        local park_item = NativeUI.CreateItem(Translation[Cfg.Locale]['set_to_showroom'], '')
        local placeholder = NativeUI.CreateItem('', '')
        local ps_item = NativeUI.CreateItem(Translation[Cfg.Locale]['show_performance'], Translation[Cfg.Locale]['click_to_change'])
        local maxSpeed_item = NativeUI.CreateItem(Translation[Cfg.Locale]['show_maxSpeed'], Translation[Cfg.Locale]['click_to_change'])
        local speedup = NativeUI.CreateItem(Translation[Cfg.Locale]['show_speedup'], Translation[Cfg.Locale]['click_to_change'])
        local modifikation = NativeUI.CreateItem(Translation[Cfg.Locale]['show_modifications'], Translation[Cfg.Locale]['click_to_change'])
        local tankcapacity = NativeUI.CreateItem(Translation[Cfg.Locale]['show_fuelcapacity'], Translation[Cfg.Locale]['click_to_change'])
        local placeholder2 = NativeUI.CreateItem('', '')

        manufacturer_item:RightLabel(v.manufacturer)
        price_item:RightLabel('~HUD_COLOUR_GREENDARK~$' .. v.price)
        model_item:RightLabel(v.label)
        storage:RightLabel(v.storage .. Translation[Cfg.Locale]['amount_cars'])
        bigstorage:RightLabel(v.bigstorage .. Translation[Cfg.Locale]['amount_cars'])
        ps_item:RightLabel(v.ps .. Translation[Cfg.Locale]['show_suffix_performance'])
        maxSpeed_item:RightLabel(v.maxSpeed .. Translation[Cfg.Locale]['show_suffix_maxSpeed'])
        speedup:RightLabel(v.speedUp .. Translation[Cfg.Locale]['show_suffix_speedup'])
        modifikation:RightLabel(v.modification .. Translation[Cfg.Locale]['show_suffix_modifications'])
        tankcapacity:RightLabel(v.tankcapacity .. Translation[Cfg.Locale]['show_suffix_fuelcapacity'])
        

        vehsubmenu:AddItem(manufacturer_item)
        vehsubmenu:AddItem(model_item)
        vehsubmenu:AddItem(price_item)
        vehsubmenu:AddItem(storage)
        vehsubmenu:AddItem(bigstorage)        
        vehsubmenu:AddItem(placeholder)
        vehsubmenu:AddItem(ps_item)
        vehsubmenu:AddItem(maxSpeed_item)
        vehsubmenu:AddItem(speedup)
        vehsubmenu:AddItem(modifikation)
        vehsubmenu:AddItem(tankcapacity)
        vehsubmenu:AddItem(placeholder2)
        
        ps_item.Activated = function(sender, index)
            local newValue = CreateDialog(Translation[Cfg.Locale]['insert_new_value'])
            if newValue then
                ps_item:RightLabel(newValue .. Translation[Cfg.Locale]['show_suffix_performance'])
                TriggerServerEvent('oasisvegas:updateInfo', v.id, 'ps', newValue)
            end
        end

        maxSpeed_item.Activated = function(sender, index)
            local newValue = CreateDialog(Translation[Cfg.Locale]['insert_new_value'])
            if newValue then
                maxSpeed_item:RightLabel(newValue .. Translation[Cfg.Locale]['show_suffix_maxSpeed'])
                TriggerServerEvent('oasisvegas:updateInfo', v.id, 'maxSpeed', newValue)
            end
        end

        speedup.Activated = function(sender, index)
            local newValue = CreateDialog(Translation[Cfg.Locale]['insert_new_value'])
            if newValue then
                speedup:RightLabel(newValue .. Translation[Cfg.Locale]['show_suffix_speedup'])
                TriggerServerEvent('oasisvegas:updateInfo', v.id, 'speedUp', newValue)
            end
        end

        modifikation.Activated = function(sender, index)
            local newValue = CreateDialog(Translation[Cfg.Locale]['insert_new_value'])
            if newValue then
                modifikation:RightLabel(newValue .. Translation[Cfg.Locale]['show_suffix_modifications'])
                TriggerServerEvent('oasisvegas:updateInfo', v.id, 'modification', newValue)
            end
        end

        tankcapacity.Activated = function(sender, index)
            local newValue = CreateDialog(Translation[Cfg.Locale]['insert_new_value'])
            if newValue then
                tankcapacity:RightLabel(newValue .. Translation[Cfg.Locale]['show_suffix_fuelcapacity'])
                TriggerServerEvent('oasisvegas:updateInfo', v.id, 'fuelcapacity', newValue)
            end
        end

        if isBoss then
            local liver = NativeUI.CreateItem(Translation[Cfg.Locale]['car_deliver'], '')
            local produce = NativeUI.CreateItem(Translation[Cfg.Locale]['car_craft'], '')
            liver:RightLabel('~HUD_COLOUR_GREENDARK~$' .. math.floor(v.price*0.65))
            produce:RightLabel('~HUD_COLOUR_GREENDARK~$' .. math.floor(v.price*0.1))
            vehsubmenu:AddItem(liver)
            vehsubmenu:AddItem(produce)

            liver.Activated = function(sender, item)
                local ordertotal = CreateDialog(Translation[Cfg.Locale]['amount'])
                if tonumber(ordertotal) then
                    ordertotal = tonumber(ordertotal)
                    TriggerServerEvent('oasisvegas:liverVehicle', v.model, ordertotal, v.label, v.manufacturer)
                end
            end

            produce.Activated = function(sender, item)
                local producetotal = CreateDialog(Translation[Cfg.Locale]['amount'])
                if tonumber(producetotal) then
                    producetotal = tonumber(producetotal)
                    TriggerServerEvent('oasisvegas:produceVehicle', v.model, producetotal, v.label, v.manufacturer)
                end
            end
            if v.orderd == 1 then
                local liver2 = NativeUI.CreateItem(Translation[Cfg.Locale]['ordered'], '')
                liver2:RightLabel(v.ordertotal .. 'x')
                vehsubmenu:AddItem(liver2)
            end
            if v.produced == 1 then
                local liver3 = NativeUI.CreateItem(Translation[Cfg.Locale]['reserved'], '')
                liver3:RightLabel(v.producetotal .. 'x')
                vehsubmenu:AddItem(liver3)
            end
        end
    end

    if isBoss then
        local order_sub = _menuPool:AddSubMenu(pcMenu, Translation[Cfg.Locale]['orders'])
        for k,v in pairs(Vehicles) do
            if v.produced == 1 then
                local vehsubmenu = _menuPool:AddSubMenu(order_sub, v.manufacturer .. ' ' .. v.label)
                local time = NativeUI.CreateItem(Translation[Cfg.Locale]['required_order_time'], '')
                local time2 = NativeUI.CreateItem(Translation[Cfg.Locale]['total_production_time'], '')
                local ordertotal = NativeUI.CreateItem(Translation[Cfg.Locale]['current_production_time'], '')
                local check = NativeUI.CreateItem(Translation[Cfg.Locale]['refresh_time'], '')

                time:RightLabel(v.time .. Translation[Cfg.Locale]['hours'])
                time2:RightLabel(timeToLiver)
                ordertotal:RightLabel(v.producetotal)

                vehsubmenu:AddItem(time)
                vehsubmenu:AddItem(time2)
                vehsubmenu:AddItem(ordertotal)
                vehsubmenu:AddItem(check)

                check.Activated = function(sender, item)
                    TriggerServerEvent('oasisvegas:CheckTime', v.time, v.lastorder, v.model, v.storage, v.producetotal)
                end
            end
        end
    end

    
    _menuPool:RefreshIndex()
    _menuPool:MouseControlsEnabled (false)
    _menuPool:MouseEdgeEnabled (false)
    _menuPool:ControlDisablingEnabled(false)
end

Citizen.CreateThread(function()
    -- while PlayerLoaded == false do
    --     Wait(10)
    -- end
    for k, v in pairs(Cfg.MapBlip) do
        if v.OnlyHasJob then
            if hasJob then
                local blip2 = AddBlipForCoord( v.Pos.x,  v.Pos.y,  v.Pos.z)
                SetBlipSprite (blip2,  v.Sprite)
                SetBlipDisplay(blip2,  v.Display)
                SetBlipScale  (blip2,  v.Scale)
                SetBlipColour (blip2,  v.Colour)
                SetBlipAsShortRange(blip2, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(v.Name)
                EndTextCommandSetBlipName(blip2)
            end
        else
            local blip = AddBlipForCoord( v.Pos.x,  v.Pos.y,  v.Pos.z)
            SetBlipSprite (blip,  v.Sprite)
            SetBlipDisplay(blip,  v.Display)
            SetBlipScale  (blip,  v.Scale)
            SetBlipColour (blip,  v.Colour)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(v.Name)
            EndTextCommandSetBlipName(blip)
        end
    end
end)


RegisterCommand("Clientvegas", function(source, args, rawCommand)
    TriggerServerEvent('oasisvegas:getVehicles')
end, false)


-- CARDEALER UTILS

local NumberCharset = {}
local Charset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end

for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

function GeneratePlate()
	local generatedPlate
	local doBreak = false

	while true do
		Citizen.Wait(2)
		math.randomseed(GetGameTimer())
		if Cfg.PlateUseSpace then
			--[[generatedPlate = string.upper(GetRandomLetter(Cfg.PlateLetters) .. ' ' .. GetRandomNumber(Cfg.PlateNumbers))
		else
			generatedPlate = string.upper(GetRandomLetter(Cfg.PlateLetters) .. GetRandomNumber(Cfg.PlateNumbers))
		end]]
            generatedPlate = string.upper(GetRandomLetter(Cfg.PlateLetters) .. ' ' .. GetRandomNumber(Cfg.PlateNumbers))
        else
            generatedPlate = string.upper(GetRandomNumber(Cfg.PlateNumbersPrim) .. GetRandomLetter(Cfg.PlateLetters) .. GetRandomNumber(Cfg.PlateNumbers))
        end

		ESX.TriggerServerCallback('esx_vehicleshop:isPlateTaken', function(isPlateTaken)
			if not isPlateTaken then
				doBreak = true
			end
		end, generatedPlate)

		if doBreak then
			break
		end
	end

	return generatedPlate
end

-- mixing async with sync tasks
function IsPlateTaken(plate)
	local callback = 'waiting'

	ESX.TriggerServerCallback('esx_vehicleshop:isPlateTaken', function(isPlateTaken)
		callback = isPlateTaken
	end, plate)

	while type(callback) == 'string' do
		Citizen.Wait(0)
	end

	return callback
end

function GetRandomNumber(length)
	Citizen.Wait(0)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Citizen.Wait(0)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end


--


function CreateDialog(OnScreenDisplayTitle_shopmenu) --general OnScreenDisplay for KeyboardInput
	AddTextEntry(OnScreenDisplayTitle_shopmenu, OnScreenDisplayTitle_shopmenu)
	DisplayOnscreenKeyboard(1, OnScreenDisplayTitle_shopmenu, "", "", "", "", "", 32)
	while (UpdateOnscreenKeyboard() == 0) do
		DisableAllControlActions(0);
		Wait(0);
	end
	if (GetOnscreenKeyboardResult()) then
		local displayResult = GetOnscreenKeyboardResult()
		return displayResult
	end
end

function showInfobar(msg)

	CurrentActionMsg  = msg
	SetTextComponentFormat('STRING')
	AddTextComponentString(CurrentActionMsg)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)

end

function ShowNotification(text)
	SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
	DrawNotification(false, true)
end

function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end