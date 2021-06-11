RegisterNetEvent("Al_Trucking:Init")
AddEventHandler("Al_Trucking:Init",function(data) 
    ky = data -- Do not remove / edit this

    if Trucking.UsingESX then
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end) 
    else
        -- If you are using another framework, put your version here
    end
end)

-- Init process
if Trucking.UsingESX then
    ESX = nil

    Citizen.CreateThread(function()
        while ESX == nil do
            TriggerServerEvent("Al_Trucking:Init")
            Citizen.Wait(100)
        end
    
        RegisterNetEvent("esx:playerLoaded")
        AddEventHandler("esx:playerLoaded", function(xPlayer)
            ESX.PlayerData = xPlayer
        end)
    
        RegisterNetEvent("esx:setJob")
        AddEventHandler("esx:setJob", function(job)
            ESX.PlayerData.job = job
        end)
        
        while ESX.PlayerData.job == nil do Citizen.Wait(0) end

        Citizen.Wait(500)
        
        Init()
    
        TriggerServerCallback('Al_Trucking:HasSyncData', function(data)
            Trucking.Vars.Data = data
            Citizen.Wait(5000)
    
            if Trucking.Vars.Data.Models.Trailer then
                Trucking.Vars.Data.DeliveryRoute = {}; Trucking.Vars.Data.Models = {}; Trucking.Vars.Data.Rental = {}; Trucking.Vars.Data.Trailer = {}
                TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)
    
                Trucking.Notify('success', Trucking.Translation['jonCancelSync'])
            end
        end, GetSpecifiedIdentifier())
    end)
else
    while ky == nil do
        TriggerServerEvent("Al_Trucking:Init")
        Citizen.Wait(100)
    end

    Citizen.Wait(500)

    Init()
    
    TriggerServerCallback('Al_Trucking:HasSyncData', function(data)
        Trucking.Vars.Data = data
        Citizen.Wait(5000)

        if Trucking.Vars.Data.Models.Trailer then
            Trucking.Vars.Data.DeliveryRoute = {}; Trucking.Vars.Data.Models = {}; Trucking.Vars.Data.Rental = {}; Trucking.Vars.Data.Trailer = {}
            TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)

            Trucking.Notify('success', Trucking.Translation['jonCancelSync'])
        end
    end, GetSpecifiedIdentifier())
end

function GetSpecifiedIdentifier()
    local identifier = false

    if Trucking.UsingESX then
        ESX.PlayerData = ESX.GetPlayerData()

        identifier = ESX.PlayerData.identifier
    else
        -- If you are using another framework, put your version here
    end

    return identifier
end

function GetPlayerJob()
    local job = {
        name = false,
        grade = false,
    }

    if Trucking.UsingESX then
        job.name = ESX.PlayerData.job.name
        job.grade = ESX.PlayerData.job.grade
    else
        -- If you are using another framework, put your version here (be sure to use the same table format from the var "jobData")
    end

    return job
end

function GetPlayerMoney()
    local money = 0
    local start = GetGameTimer()

    if Trucking.UsingESX then
        ESX.PlayerData = ESX.GetPlayerData()
        ESX.PlayerData.accounts = {}

        if #ESX.PlayerData.accounts < 1 then
            money = false

            ESX.TriggerServerCallback('al_trucking:getmoney', function(cash)
                money = cash or 0
            end)

            while money == false do
                Citizen.Wait(0)
        
                if GetGameTimer() - start > 2000 then
                    money = 0
                end
            end
        else
            for i=1, #ESX.PlayerData.accounts, 1 do
                if ESX.PlayerData.accounts[i].name == 'money' then
                    money = ESX.PlayerData.accounts[i].money or ESX.PlayerData.accounts[i].amount
                    break
                end
            end
        end
    else
        -- If you are using another framework, put your version here
    end

    return money
end