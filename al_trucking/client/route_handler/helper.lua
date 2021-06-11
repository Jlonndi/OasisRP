RegisterNetEvent('Al_Trucking:PrepEscort')
AddEventHandler('Al_Trucking:PrepEscort', function(driverIdentifier, driverName)
    BeginSpecialEscortRoute(driverIdentifier, driverName)
end)

RegisterNetEvent('Al_Trucking:DriverUpdateToEscort')
AddEventHandler('Al_Trucking:DriverUpdateToEscort', function(driverData)
    Trucking.Vars.driverToEscortUpdate = driverData
end)

RegisterNetEvent('Al_Trucking:EscortUpdateToDriver')
AddEventHandler('Al_Trucking:EscortUpdateToDriver', function(response)
    Trucking.Vars.escortToDriverUpdate = response
end)

-- Get (money) multiplier based on which trailer type is being used
function getMultiplier()
    local playerJob = GetPlayerJob()
    local tm = Trucking.Multipliers[Trucking.Vars.Data.Trailer.routeType]

    if Trucking.RequireJob and playerJob.name == Trucking.JobName or not Trucking.RequireJob then
        return tm or 1.0
    end
end

-- Get a "rough" estimate of travel distance
function GetRouteDistance(coords)
    return #(GetEntityCoords(PlayerPedId()).xy - coords.xy) / 1609.34
end

-- Prep Trucking Route
function PrepRoute(type, routeType)
    local self = {}

    if type == 1 then -- Regular Cargo

        self.deliveryRoutes = routeType
        self.numberOfStops = #self.deliveryRoutes <= 6 and Trucking.MathRandom(#self.deliveryRoutes) or Trucking.MathRandom(6)
        self.currentStop = 1
        self.stops = {}
        self.routeIndex = false
        self.route = {}
        self.routeBlip = false

        self.BeginRoute = function()
            self.routeIndex = Trucking.MathRandom(#self.deliveryRoutes)
            self.route= {
                vector3(self.deliveryRoutes[self.routeIndex].xyz), -- Vector3
                self.deliveryRoutes[self.routeIndex], -- Vector4
            }

            self.routeBlip = SetDeliveryPoint(self.route[1])

            table.remove(self.deliveryRoutes, self.routeIndex)
            table.insert(self.stops, {
                coords = self.route,
                distance = GetRouteDistance(self.route[1])
            })
            
            -- Sync Data To Server
            Trucking.Vars.Data.DeliveryRoute = {
                deliveryRoutes = self.deliveryRoutes,
                numberOfStops = self.numberOfStops,
                routeIndex = self.routeIndex,
                route = self.route,
                currentStop = self.currentStop,
                stops = self.stops
            }
            TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)
        end

        self.NextRoute = function()
            self.currentStop = self.currentStop + 1
            self.routeIndex = Trucking.MathRandom(#self.deliveryRoutes)
            self.route = {
                vector3(self.deliveryRoutes[self.routeIndex].xyz), -- Vector3
                self.deliveryRoutes[self.routeIndex], -- Vector4
            }
            self.routeBlip = SetDeliveryPoint(self.route[1], self.routeBlip)
            table.remove(self.deliveryRoutes, self.routeIndex)
            table.insert(self.stops, {
                coords = self.route,
                distance = GetRouteDistance(self.route[1])
            })
            Trucking.Notify('success', (Trucking.Translation['nextpoint']):format(self.currentStop, self.numberOfStops), 5000)
        end

        self.EndRoute = function()
            DoScreenFadeOut(1000)
            Citizen.Wait(1000)
            RemoveBlip(self.routeBlip)
            local trailerHealth = math.floor(GetVehicleBodyHealth(Trucking.Vars.Data.Models.Trailer))
            local totalDamage = 1000 - trailerHealth
            local totalDistance = 0
            local xpEarned = 0
            for i=1, #self.stops, 1 do
                totalDistance = totalDistance + self.stops[i].distance
            end
            local totalReserved = math.floor((totalDistance * Trucking.Payment) * getMultiplier())
    
            if totalDamage > 50 then
                local trailerDamageFees = math.floor(totalReserved * (totalDamage / 1000))
                local totalEarned = math.floor(totalReserved - trailerDamageFees)

                Trucking.Notify('error', (Trucking.Translation['damaged_trailer']):format(tostring(trailerDamageFees), tostring(totalEarned)))

                xpEarned = math.floor(math.floor(totalDistance * Trucking.XP_Config.XPPerMile) - math.floor(totalDistance * Trucking.XP_Config.XPPerMile) * (totalDamage / 1000))

                if trailerDamageFees > 0 then
                    Trucking.addMoney(totalEarned)
                end
            else
                xpEarned = math.floor(totalDistance * Trucking.XP_Config.XPPerMile)
                
                Trucking.addMoney(totalReserved)
                Trucking.Notify('success', (Trucking.Translation['moneyearned']):format(tostring(totalReserved)))
            end

            Trucking.DeleteVehicle(Trucking.Vars.Data.Models.Trailer)
            Trucking.Vars.Data.Trailer = {}; Trucking.Vars.Data.DeliveryRoute = {}
            TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)
            TriggerServerEvent('Al_Trucking:XP:Add', {data={k=ky,xp=xpEarned,identifier=GetSpecifiedIdentifier()}})
            DoScreenFadeIn(1000)
            Citizen.Wait(1000)
        end

        self.DeleteNearbyVehicles = function()
            local veh = Trucking.GetVehicles()

            for i=1, #veh, 1 do
                local distance = #(GetEntityCoords(veh[i]) - self.route[1])
    
                if distance <= 20 then
                    if DoesEntityExist(veh[i]) then
                        if not IsEntityAMissionEntity(veh[i]) then
                            DeleteEntity(veh[i])
                        end
                    end
                end
            end
        end

        self.Cancel = function()
            RemoveBlip(self.routeBlip)
            if Trucking.DeleteDestroyedEntity then
                Trucking.DeleteVehicle(Trucking.Vars.Data.Models.Trailer)
            end
            Trucking.Vars.Data.DeliveryRoute = {}; Trucking.Vars.Data.Trailer = {}
            TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)
        end

        return self

    elseif type == 2 then -- High Value Cargo
        
        self.deliveryRoutes = routeType
        self.numberOfStops = #self.deliveryRoutes <= 6 and Trucking.MathRandom(#self.deliveryRoutes) or Trucking.MathRandom(6)
        self.currentStop = 1
        self.routes = {}
        self.routeBlip = false
        self.stops = {}
        self.primaryLocation = false

        -- Prepare full route
        local currentRepeatCount = 0
        repeat
            local randomNumber = Trucking.MathRandom(#self.deliveryRoutes)
            local currentJob = self.deliveryRoutes[randomNumber]
            local routeData = {}

            -- Vehicle Cargo Data
            routeData.cargoData = {
                vehicle = currentJob.model,
                props = currentJob.vehProps,
                trailerOffset = currentJob.trailerOffset,
            }

            -- Route Data
            routeData.routeInfo = currentJob.deliveryScenarios[Trucking.MathRandom(#currentJob.deliveryScenarios)]

            -- Cargo Pickup/Dropoff points
            routeData.route = {
                -- Cargo pickup location
                {
                    vector3(routeData.routeInfo[1].xyz), -- Vector 3
                    routeData.routeInfo[1] -- Vector 4 
                },
                -- Cargo dropoff location
                {
                    vector3(routeData.routeInfo[2].xyz), -- Vector 3
                    routeData.routeInfo[2] -- Vector 4 
                },
            }

            -- Remove possibility of a repeat route
            table.remove(self.deliveryRoutes, randomNumber)

            currentRepeatCount = currentRepeatCount + 1
            table.insert(self.routes, routeData)
        until currentRepeatCount >= self.numberOfStops

        self.BeginRoute = function()
            self.routeBlip = SetDeliveryPoint(self.routes[self.currentStop].route[1][1])
            self.primaryLocation = self.routes[self.currentStop].route[1][1]

            table.insert(self.stops, {
                coords = self.routes[self.currentStop].route[1][1],
                distance = GetRouteDistance(self.routes[self.currentStop].route[1][1])
            })

            Trucking.Vars.Data.DeliveryRoute = {
                deliveryRoutes = self.deliveryRoutes,
                numberOfStops = self.numberOfStops,
                currentStop = self.currentStop,
                routes = self.routes,
                stops = self.stops,
            }
            TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)
        end

        self.PickupCargo = function()
            local vehicleHeightMin, vehicleHeightMax = GetModelDimensions(GetEntityModel(Trucking.Vars.Data.Models.VehCargo))
            local pos1 = self.routes[self.currentStop].cargoData.trailerOffset
            AttachEntityToEntity(Trucking.Vars.Data.Models.VehCargo, Trucking.Vars.Data.Models.Trailer, GetEntityBoneIndexByName(Trucking.Vars.Data.Models.Trailer, "bodyshell"), pos1.x, pos1.y, pos1.z - vehicleHeightMin.z - 0.525, 0, 0, 0, 1, 1, true, 1, 0, 1)

            self.routeBlip = SetDeliveryPoint(self.routes[self.currentStop].route[2][1], self.routeBlip)
            self.primaryLocation = self.routes[self.currentStop].route[2][1]

            table.insert(self.stops, {
                coords = self.routes[self.currentStop].route[2],
                distance = GetRouteDistance(self.routes[self.currentStop].route[2][1])
            })
        end

        self.SpawnCargoVehicle = function()
            Citizen.Wait(500)
            Trucking.SpawnVehicle(self.routes[self.currentStop].cargoData.vehicle, self.routes[self.currentStop].route[1][1], self.routes[self.currentStop].route[1][2].w, function(vehicle2)
                if self.routes[self.currentStop].cargoData.props then
                    local vehProps = json.decode(self.routes[self.currentStop].cargoData.props)
                    Trucking.SetVehProps(vehicle2, vehProps)
                end
                SetVehRadioStation(vehicle2, "OFF")
                SetEntityAsMissionEntity(vehicle2, false, false)
                SetVehicleDoorsLockedForAllPlayers(vehicle2, true)
                Trucking.Vars.Data.Models.VehCargo = vehicle2

                TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)
            end)
        end

        self.DeleteNearbyVehicles = function()
            local veh = Trucking.GetVehicles()

            for i=1, #veh, 1 do
                local distance = #(GetEntityCoords(veh[i]) - self.primaryLocation)
    
                if distance <= 20 then
                    if DoesEntityExist(veh[i]) then
                        if not IsEntityAMissionEntity(veh[i]) then
                            DeleteEntity(veh[i])
                        end
                    end
                end
            end
        end

        self.DropoffCargo = function()
            -- Delete cargo vehicle & blip
            RemoveBlip(self.routeBlip)
            Trucking.DeleteVehicle(Trucking.Vars.Data.Models.VehCargo)

            -- Set new route or end route
            self.currentStop = self.currentStop + 1

            if self.numberOfStops >= self.currentStop then

                self.primaryLocation = self.routes[self.currentStop].route[1][1]
                self.routeBlip = SetDeliveryPoint(self.primaryLocation)

                table.insert(self.stops, {
                    coords = self.routes[self.currentStop].route[1],
                    distance = GetRouteDistance(self.primaryLocation)
                })

                -- Notification
                Trucking.Notify('success', (Trucking.Translation['nextpoint']):format(self.currentStop, self.numberOfStops), 5000)
            else
                self.EndRoute()
            end

            -- Sync data with server
            Trucking.Vars.Data.DeliveryRoute.currentStop = self.currentStop
            Trucking.Vars.Data.DeliveryRoute.stops = self.stops
            TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)

        end

        self.EndRoute = function()
            DoScreenFadeOut(1000)
            Citizen.Wait(1000)
            RemoveBlip(self.routeBlip)
            local trailerHealth = math.floor(GetVehicleBodyHealth(Trucking.Vars.Data.Models.Trailer))
            local totalDamage = 1000 - trailerHealth
            local totalDistance = 0
            local xpEarned = 0
            for i=1, #self.stops, 1 do
                totalDistance = totalDistance + self.stops[i].distance
            end
            local totalReserved = math.floor((totalDistance * Trucking.Payment) * getMultiplier())
    
            if totalDamage > 50 then
                local trailerDamageFees = math.floor(totalReserved * (totalDamage / 1000))
                local totalEarned = math.floor(totalReserved - trailerDamageFees)

                Trucking.Notify('error', (Trucking.Translation['damaged_trailer']):format(tostring(trailerDamageFees), totalEarned))
                xpEarned = math.floor(math.floor(totalDistance * Trucking.XP_Config.XPPerMile) - math.floor(totalDistance * Trucking.XP_Config.XPPerMile) * (totalDamage / 1000))

                if trailerDamageFees > 0 then
                    Trucking.addMoney(totalEarned)
                end
            else
                xpEarned = math.floor(totalDistance * Trucking.XP_Config.XPPerMile)
                
                Trucking.addMoney(totalReserved)
                Trucking.Notify('success', (Trucking.Translation['moneyearned']):format(totalReserved))
            end

            Trucking.DeleteVehicle(Trucking.Vars.Data.Models.Trailer)
            Trucking.Vars.Data.Trailer = {}; Trucking.Vars.Data.DeliveryRoute = {}
            TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)
            TriggerServerEvent('Al_Trucking:XP:Add', {data={k=ky,xp=xpEarned,identifier=GetSpecifiedIdentifier()}})
            DoScreenFadeIn(1000)
            Citizen.Wait(1000)
        end

        self.Cancel = function()
            RemoveBlip(self.routeBlip)
            if Trucking.DeleteDestroyedEntity then
                if Trucking.Vars.Data.Models.VehCargo then
                    Trucking.DeleteVehicle(Trucking.Vars.Data.Models.VehCargo)
                end

                Trucking.DeleteVehicle(Trucking.Vars.Data.Models.Trailer)
            end
            Trucking.Vars.Data.DeliveryRoute = {}; Trucking.Vars.Data.Trailer = {}
            TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)
        end

        return self

    elseif type == 3 then -- Special/Military Cargo
        
        self.deliveryRoutes = routeType
        self.numberOfStops = #self.deliveryRoutes <= 6 and Trucking.MathRandom(#self.deliveryRoutes) or Trucking.MathRandom(6)
        self.currentStop = 1
        self.routes = {}
        self.routeBlip = false
        self.stops = {}
        self.primaryLocation = false
        self.escortDriver = Trucking.Vars.escortDriverIdentifier
        self.escortFailed = false
        self.escortData = {}

        -- Prepare full route
        local currentRepeatCount = 0
        repeat
            local randomNumber = Trucking.MathRandom(#self.deliveryRoutes)
            local currentJob = self.deliveryRoutes[randomNumber]
            local routeData = {}

            -- Vehicle Cargo Data
            routeData.cargoData = {
                vehicle = currentJob.model,
                props = currentJob.vehProps,
                trailerOffset = currentJob.trailerOffset,
            }

            -- Route Data
            routeData.routeInfo = currentJob.deliveryScenarios[Trucking.MathRandom(#currentJob.deliveryScenarios)]

            -- Cargo Pickup/Dropoff points
            routeData.route = {
                -- Cargo pickup location
                {
                    vector3(routeData.routeInfo[1].xyz), -- Vector 3
                    routeData.routeInfo[1] -- Vector 4 
                },
                -- Cargo dropoff location
                {
                    vector3(routeData.routeInfo[2].xyz), -- Vector 3
                    routeData.routeInfo[2] -- Vector 4 
                },
            }

            -- Remove possibility of a repeat route
            table.remove(self.deliveryRoutes, randomNumber)

            currentRepeatCount = currentRepeatCount + 1
            table.insert(self.routes, routeData)
        until currentRepeatCount >= self.numberOfStops

        self.BeginRoute = function()
            self.routeBlip = SetDeliveryPoint(self.routes[self.currentStop].route[1][1])
            self.primaryLocation = self.routes[self.currentStop].route[1][1]

            table.insert(self.stops, {
                coords = self.routes[self.currentStop].route[1][1],
                distance = GetRouteDistance(self.routes[self.currentStop].route[1][1])
            })

            Trucking.Vars.Data.DeliveryRoute = {
                deliveryRoutes = self.deliveryRoutes,
                numberOfStops = self.numberOfStops,
                currentStop = self.currentStop,
                routes = self.routes,
                stops = self.stops,
            }
            TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)

            self.UpdateEscort()
        end

        self.PickupCargo = function()
            local vehicleHeightMin, vehicleHeightMax = GetModelDimensions(GetEntityModel(Trucking.Vars.Data.Models.VehCargo))
            local pos1 = self.routes[self.currentStop].cargoData.trailerOffset
            AttachEntityToEntity(Trucking.Vars.Data.Models.VehCargo, Trucking.Vars.Data.Models.Trailer, GetEntityBoneIndexByName(Trucking.Vars.Data.Models.Trailer, "bodyshell"), pos1.x, pos1.y, pos1.z - vehicleHeightMin.z - 0.525, 0, 0, 0, 1, 1, true, 1, 0, 1)

            self.routeBlip = SetDeliveryPoint(self.routes[self.currentStop].route[2][1], self.routeBlip)
            self.primaryLocation = self.routes[self.currentStop].route[2][1]

            table.insert(self.stops, {
                coords = self.routes[self.currentStop].route[2],
                distance = GetRouteDistance(self.routes[self.currentStop].route[2][1])
            })

            self.UpdateEscort()
        end

        self.SpawnCargoVehicle = function()
            Citizen.Wait(500)
            Trucking.SpawnVehicle(self.routes[self.currentStop].cargoData.vehicle, self.routes[self.currentStop].route[1][1], self.routes[self.currentStop].route[1][2].w, function(vehicle2)
                if self.routes[self.currentStop].cargoData.props then
                    local vehProps = json.decode(self.routes[self.currentStop].cargoData.props)
                    Trucking.SetVehProps(vehicle2, vehProps)
                end
                SetVehRadioStation(vehicle2, "OFF")
                SetEntityAsMissionEntity(vehicle2, false, false)
                SetVehicleDoorsLockedForAllPlayers(vehicle2, true)
                Trucking.Vars.Data.Models.VehCargo = vehicle2

                TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)
            end)
        end

        self.DeleteNearbyVehicles = function()
            local veh = Trucking.GetVehicles()

            for i=1, #veh, 1 do
                local distance = #(GetEntityCoords(veh[i]) - self.primaryLocation)
    
                if distance <= 20 then
                    if DoesEntityExist(veh[i]) then
                        if not IsEntityAMissionEntity(veh[i]) then
                            DeleteEntity(veh[i])
                        end
                    end
                end
            end
        end

        self.DropoffCargo = function()
            -- Delete cargo vehicle & blip
            RemoveBlip(self.routeBlip)
            Trucking.DeleteVehicle(Trucking.Vars.Data.Models.VehCargo)

            -- Set new route or end route
            self.currentStop = self.currentStop + 1

            if self.numberOfStops >= self.currentStop then

                self.primaryLocation = self.routes[self.currentStop].route[1][1]
                self.routeBlip = SetDeliveryPoint(self.primaryLocation)

                table.insert(self.stops, {
                    coords = self.routes[self.currentStop].route[1],
                    distance = GetRouteDistance(self.primaryLocation)
                })

                self.UpdateEscort()

                -- Notification
                Trucking.Notify('success', (Trucking.Translation['nextpoint']):format(self.currentStop, self.numberOfStops), 5000)
            else
                self.EndRoute()
            end

            -- Sync data with server
            Trucking.Vars.Data.DeliveryRoute.currentStop = self.currentStop
            Trucking.Vars.Data.DeliveryRoute.stops = self.stops
            TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)

        end

        self.EndRoute = function()
            DoScreenFadeOut(1000)
            Citizen.Wait(1000)
            RemoveBlip(self.routeBlip)
            self.RemoveEscortBlip()
            local trailerHealth = math.floor(GetVehicleBodyHealth(Trucking.Vars.Data.Models.Trailer))
            local totalDamage = 1000 - trailerHealth
            local totalDistance = 0
            local xpEarned = 0
            for i=1, #self.stops, 1 do
                totalDistance = totalDistance + self.stops[i].distance
            end
            local totalReserved = math.floor((totalDistance * Trucking.Payment) * getMultiplier())
    
            if totalDamage > 50 then
                local trailerDamageFees = math.floor(totalReserved * (totalDamage / 1000))
                local totalEarned = math.floor(totalReserved - trailerDamageFees)

                Trucking.Notify('error', (Trucking.Translation['damaged_trailer']):format(tostring(trailerDamageFees), totalEarned))
                xpEarned = math.floor(math.floor(totalDistance * Trucking.XP_Config.XPPerMile) - math.floor(totalDistance * Trucking.XP_Config.XPPerMile) * (totalDamage / 1000))

                if trailerDamageFees > 0 then
                    Trucking.addMoney(totalEarned)
                end
            else
                xpEarned = math.floor(totalDistance * Trucking.XP_Config.XPPerMile)
                
                Trucking.addMoney(totalReserved)
                Trucking.Notify('success', (Trucking.Translation['moneyearned']):format(totalReserved))
            end

            self.UpdateEscort(true, totalDistance)

            Trucking.DeleteVehicle(Trucking.Vars.Data.Models.Trailer)
            Trucking.Vars.Data.Trailer = {}; Trucking.Vars.Data.DeliveryRoute = {}
            TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)
            TriggerServerEvent('Al_Trucking:XP:Add', {data={k=ky,xp=xpEarned,identifier=GetSpecifiedIdentifier()}})
            DoScreenFadeIn(1000)
            Citizen.Wait(1000)
        end

        self.Cancel = function()
            RemoveBlip(self.routeBlip)

            if Trucking.DeleteDestroyedEntity then
                if Trucking.Vars.Data.Models.VehCargo then
                    Trucking.DeleteVehicle(Trucking.Vars.Data.Models.VehCargo)
                end

                Trucking.DeleteVehicle(Trucking.Vars.Data.Models.Trailer)
            end

            if not self.escortFailed then
                self.UpdateEscort(false, false, true)
            end

            self.RemoveEscortBlip()
            Trucking.Vars.Data.DeliveryRoute = {}; Trucking.Vars.Data.Trailer = {}
            TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)
        end

        self.UpdateEscort = function(routeStatus, totalDistance, failed)
            local data = {
                primaryLocation = self.primaryLocation,
                hasCargo = Trucking.Vars.Data.Models.VehCargo,
                trailer = Trucking.Vars.Data.Models.Trailer,
                routeComplete = routeStatus or false,
                failed = failed or false,
                totalDistance = totalDistance or false,
            }

            TriggerServerEvent('Al_Trucking:DriverUpdateToEscort', self.escortDriver, data)
        end

        self.SetEscortBlip = function(entity)
            self.escortBlip = Trucking_addBlip(false, 225, false, Trucking.Translation['blip_escort'], entity)
        end
    
        self.RemoveEscortBlip = function()
            if self.escortBlip then
                RemoveBlip(self.escortBlip)
                self.escortBlip = nil
            end
        end

        self.UpdateEscortInfo = function(updateData)
            if updateData then
                self.escortData = updateData
            elseif not updateData then
                self.escortFailed = true
            end
        end

        return self

    end

    return false
end

-- Prep Escort
function EscortPrep(driverIdentifier)
    local self = {}

    self.driver = driverIdentifier
    self.driverData = {}
    self.blip = false
    self.failed = false

    self.UpdateDriverInfo = function(driverInfo)
        self.driverData = driverInfo
    end

    self.TransmitDataToDriver = function(data)
        TriggerServerEvent('Al_Trucking:EscortUpdateToDriver', self.driver, data)
    end

    self.SpawnEscort = function()
        local availableSpots = {}

        for i=1, #Trucking.Locations.EscortSpawns, 1 do
            local closevehicle = GetClosestVehicle(Trucking.Locations.EscortSpawns[i].x, Trucking.Locations.EscortSpawns[i].y, Trucking.Locations.EscortSpawns[i].z, 2.0,  0,  71)

            if not DoesEntityExist(closevehicle) then
                table.insert(availableSpots, Trucking.Locations.EscortSpawns[i])
            end
        end
        
        for i=1, #availableSpots, 1 do
            local closevehicle = GetClosestVehicle(availableSpots[i].x, availableSpots[i].y, availableSpots[i].z, 2.0,  0,  71)
            local available = true

            while DoesEntityExist(closevehicle) and available do Wait(0)
                if not IsEntityAMissionEntity(closevehicle) then
                    DeleteVehicle(closevehicle)
                else
                    available = false
                end
            end

            if available then
                Trucking.SpawnVehicle(Trucking.Escort.vehicle,{
                    x = availableSpots[i].x,
                    y = availableSpots[i].y,
                    z = availableSpots[i].z + 1							
                    }, availableSpots[i].w, function(vehicle2)
                    SetVehRadioStation(vehicle2, "OFF")
                    SetEntityAsMissionEntity(vehicle2, false, false)
                    SetVehicleFuelLevel(vehicle2, 100.0)
            
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle2, -1)
                    Trucking.Vars.Data.Escort = {model = Trucking.Escort.vehicle, entity = vehicle2}
                    TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)
                end)

                break
            end

        end

        Citizen.CreateThread(function()
            Citizen.Wait(5000)
            while next(Trucking.Vars.Data.Escort) ~= nil and Trucking.Vars.Data.Escort.entity do Citizen.Wait(2000)
                local vehHealth = GetVehicleEngineHealth(Trucking.Vars.Data.Escort.entity)
                local distance = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(Trucking.Vars.Data.Escort.entity))
                
                if vehHealth <= 0 or not DoesEntityExist(Trucking.Vars.Data.Escort.entity) then
                    Citizen.Wait(500)
                    if Trucking.Vars.Data.Escort.entity then
                        DoScreenFadeOut(1000)
                        Citizen.Wait(1000)

                        if Trucking.Escort.destructionFee then
                            Trucking.Notify('error', (Trucking.Translation['escortdestroyed']):format(Trucking.Escort.destructionFee))
                            Trucking.removeMoney(Trucking.Escort.destructionFee)
                        end

                        if Trucking.DeleteDestroyedEntity then
                            Trucking.DeleteVehicle(Trucking.Vars.Data.Escort.entity)
                        end

                        self.CancelFull()
                        Trucking.Vars.Data.Escort = {}
                        TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)
                        DoScreenFadeIn(1000)
                        Citizen.Wait(1000)
                        break
                    else
                        break
                    end
                end

                if distance > Trucking.Escort.radius then
                    DoScreenFadeOut(1000)
                    Citizen.Wait(1000)

                    if Trucking.Escort.cancellationFee then
                        Trucking.Notify('error', (Trucking.Translation['escort_distance_cancel_fee']):format(Trucking.Escort.cancellationFee))
                        Trucking.removeMoney(Trucking.Escort.cancellationFee)
                    else
                        Trucking.Notify('error', Trucking.Translation['escort_distance_cancel'])
                    end

                    if Trucking.DeleteDestroyedEntity then
                        if DoesEntityExist(Trucking.Vars.Data.Escort.entity) then
                            Trucking.DeleteVehicle(Trucking.Vars.Data.Escort.entity)
                            self.TransmitDataToDriver({
                                type = 'escort',
                                cancel = true
                            })
                        end
                    end

                    Trucking.Vars.Data.Escort = {}
                    TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)
                    DoScreenFadeIn(1000)
                    Citizen.Wait(1000)
                    break
                end
            end
        end)
    end

    self.SetPoint = function(destination)
        if not Trucking.Vars.Data.Escort.started then
            Trucking.Vars.Data.Escort.started = true
        end

        self.blip = SetDeliveryPoint(destination, self.blip)

        Trucking.Notify('inform', Trucking.Translation['escort_update_gps'])
    end

    self.SetDriverBlip = function(entity)
        self.driverBlip = Trucking_addBlip(false, 477, false, Trucking.Translation['blip_trucker'], entity)
    end

    self.RemoveDriverBlip = function()
        if self.driverBlip then
            RemoveBlip(self.driverBlip)
            self.driverBlip = nil
        end
    end

    self.ReturnToDepot = function()
        self.RemoveDriverBlip()
        self.SetPoint(Trucking.Locations.ReturnTruck)
    end

    self.FinishRoute = function()
        local vehHealth = math.floor(GetVehicleBodyHealth(Trucking.Vars.Data.Escort.entity))
        local totalDamage = 1000 - vehHealth
        local totalReserved = math.floor(((self.driverData.totalDistance * Trucking.Payment) * getMultiplier()) * (Trucking.Escort.payPercentage / 100))

        if totalDamage > 50 then
            local vehDamageFees = math.floor(totalReserved * (totalDamage / 1000))
            local totalEarned = math.floor(totalReserved - vehDamageFees)

            Trucking.Notify('error', (Trucking.Translation['damaged_escort']):format(tostring(trailerDamageFees), totalEarned))

            if vehDamageFees > 0 then
                Trucking.addMoney(totalEarned)
            end
        else
            Trucking.addMoney(totalReserved)
            Trucking.Notify('success', (Trucking.Translation['moneyearned']):format(totalReserved))
        end

        Trucking.DeleteVehicle(Trucking.Vars.Data.Escort.entity)

        RemoveBlip(self.blip)
    end

    self.CancelFull = function()
        if self.blip then
            RemoveBlip(self.blip)
        end

        if Trucking.DeleteDestroyedEntity then
            Trucking.DeleteVehicle(Trucking.Vars.Data.Escort.entity)
        end

        self.RemoveDriverBlip()
        Trucking.Vars.Data.Escort = {}
        TriggerServerEvent('Al_Trucking:UpdateSyncData', GetSpecifiedIdentifier(), Trucking.Vars.Data)
    end

    return self
end

-- Set GPS
function SetDeliveryPoint(coords, prev)
    if DoesBlipExist(prev) then
        RemoveBlip(prev)
    end

    local routeBlip = Trucking_addBlip(coords, 286, false, Trucking.Translation['blip_route']) 

    if DoesBlipExist(routeBlip) then
        PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
        SetBlipRoute(routeBlip, true)
        SetBlipRouteColour(routeBlip, Trucking.Color['blip'])
    end
    return routeBlip
end