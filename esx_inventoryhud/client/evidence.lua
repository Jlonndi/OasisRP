local targetEvidence = nil
RegisterNetEvent("esx_inventoryhud:openEvidenceInventory")
AddEventHandler(
    "esx_inventoryhud:openEvidenceInventory",
    function(data, target)
        targetEvidence = target
        setEvidenceInventoryData(data)
        refreshEvidenceInventory()
        openEvidenceInventory()
    end
)

function refreshEvidenceInventory()
    ESX.TriggerServerCallback(
        "opod-evidencelocker:getLockerInventory",
        function(inventory)
            setEvidenceInventoryData(inventory)
        end,
        targetEvidence
    )
end

function setEvidenceInventoryData(data)
    items = {}

    local blackMoney = data.blackMoney
    local evidenceItems = data.items
    local cash          = data.cashMoney
    local evidenceWeapons = data.weapons

    if blackMoney > 0 then
        local accountData = {
            label = _U("black_money"),
            count = blackMoney,
            type = "item_account",
            name = "black_money",
            usable = false,
            rare = false,
            weight = -1,
            canRemove = false
        }
        table.insert(items, accountData)
    end

    if cash > 0 then
        local accountData = {
            label = _U("cash"),
            count = cash,
            type = "item_money",
            name = "cash",
            usable = false,
            rare = false,
            weight = -1,
            canRemove = false
        }
        table.insert(items, accountData)
    end

    for i = 1, #evidenceItems, 1 do
        local item = evidenceItems[i]
        local label  = item['label'] or string.gsub(item.name, '_', ' '):gsub('-', ' '):gsub("(%l)(%w*)", function(a,b) return string.upper(a)..b end)

        if item.count > 0 then
            item.type = "item_standard"
            item.usable = false
            item.rare = false
            item.weight = -1
            item.canRemove = false
            item.label = label

            table.insert(items, item)
        end
    end

    for i = 1, #evidenceWeapons, 1 do
        local weapon = evidenceWeapons[i]

        if evidenceWeapons[i].name ~= "WEAPON_UNARMED" then
            table.insert(
                items,
                {
                    label = ESX.GetWeaponLabel(weapon.name),
                    count = weapon.ammo,
                    weight = -1,
                    type = "item_weapon",
                    name = weapon.name,
                    usable = false,
                    rare = false,
                    canRemove = false
                }
            )
        end
    end

    SendNUIMessage(
        {
            action = "setSecondInventoryItems",
            itemList = items
        }
    )
end

function openEvidenceInventory()
    loadPlayerInventory()
    isInInventory = true

    SendNUIMessage(
        {
            action = "display",
            type = "evidence"
        }
    )

    SetNuiFocus(true, true)
end

RegisterNUICallback(
    "PutIntoEvidence",
    function(data, cb)
        local canPut, eLimit = true, 0
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        

        if type(data.number) == "number" and math.floor(data.number) == data.number then
            local count = tonumber(data.number)
            TriggerEvent('opod-evidencelocker:checkSpace', function(space, limit)
                canPut = space
                eLimit = limit
            end, count, targetEvidence)
            if data.item.type == "item_weapon" then
                count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
            end
            Wait(150)
            if canPut then
                TriggerServerEvent("opod-evidencelocker:putItem", ESX.GetPlayerData().identifier, data.item.type, data.item.name, count, targetEvidence)
            else
                TriggerEvent('opod-evidencelocker:ShowNotification', 'There is not enough room, the limit is ' .. eLimit)
            end
        end

        Wait(150)
        refreshEvidenceInventory()
        Wait(150)
        loadPlayerInventory()

        cb("ok")
    end
)

RegisterNUICallback(
    "TakeFromEvidence",
    function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        if type(data.number) == "number" and math.floor(data.number) == data.number then
            TriggerServerEvent("opod-evidencelocker:getItem", ESX.GetPlayerData().identifier, data.item.type, data.item.name, tonumber(data.number), targetEvidence)
            openEvidenceInventory()
        end

        Wait(150)
        refreshEvidenceInventory()
        Wait(150)
        loadPlayerInventory()

        cb("ok")
    end
)
