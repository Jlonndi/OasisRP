RNE = function(e, h) RegisterNetEvent(e) AddEventHandler(e, h) end

CT = function(h) Citizen.CreateThread(h) end

TE = function(e, h, h2, h3, h4, h5, h6) TriggerEvent(e, h, h2, h3, h4, h5, h6) end

TCE = function(e, s, h, h2, h3, h4, h5, h6) TriggerClientEvent(e, s, h, h2, h3, h4, h5, h6) end

TSE = function(e, h, h2, h3, h4, h5, h6) TriggerServerEvent(e, h, h2, h3, h4, h5, h6) end

AEH = function(e, h) AddEventHandler(e, h) end