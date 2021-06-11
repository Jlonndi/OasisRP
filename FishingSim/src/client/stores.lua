--[[
 ██╗ ██╗  ██╗ ██╗     ███████╗██╗███████╗██╗  ██╗    ███████╗ █████╗ ██╗     ███████╗███████╗     ██╗ ██╗  ██╗ ██╗ 
████████╗████████╗    ██╔════╝██║██╔════╝██║  ██║    ██╔════╝██╔══██╗██║     ██╔════╝██╔════╝    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    █████╗  ██║███████╗███████║    ███████╗███████║██║     █████╗  ███████╗    ╚██╔═██╔╝╚██╔═██╔╝
████████╗████████╗    ██╔══╝  ██║╚════██║██╔══██║    ╚════██║██╔══██║██║     ██╔══╝  ╚════██║    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ██║     ██║███████║██║  ██║    ███████║██║  ██║███████╗███████╗███████║    ╚██╔═██╔╝╚██╔═██╔╝
 ╚═╝ ╚═╝  ╚═╝ ╚═╝     ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝    ╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝     ╚═╝ ╚═╝  ╚═╝ ╚═╝                                                                                                                 
--]]

Fishing.LoadSalesMarkers = function()
  for k,v in pairs(Config.SellingLocations) do
    if not v.Job then
      if not v.Drawing then
        local marker = {
          display  = v.Render,
          control  = 38,
          location = v.Location,
          maintext = v.Text,
          scale    = v.Scale,
          distance = 1.0,
          callback = Fishing.SalesInteract,
          args     = {k}
        }
        TriggerEvent("Markers:Add",marker,function(marker_id)
          v.Drawing = marker_id
        end)
      end
    else
      if v.Drawing then
        TriggerEvent("Markers:Remove",v.Drawing)
        v.Drawing = nil
      end
    end
  end
  Fishing.AddBlipsForSaleSpots()
end

Fishing.AddBlipsForSaleSpots = function()
  for k,v in pairs(Config.SellingLocations) do 
    if v.Blip then 
      local k = AddBlipForCoord(v.Location)
      SetBlipScale(k, v.Blip.Scale)
      SetBlipSprite(k, v.Blip.Sprite)
      SetBlipColour(k, v.Blip.Color)
      SetBlipDisplay(k, v.Blip.Display)
      SetBlipAsShortRange(k, v.Blip.ShortRange)
      BeginTextCommandSetBlipName('STRING')
      AddTextComponentSubstringPlayerName(tostring(v.Blip.Name))
      EndTextCommandSetBlipName(k)
    end 
  end
end

Fishing.SalesInteract = function(Index)
  if Fishing.AreSalesOpen(Index) then 
    Fishing.OpenSalesMenu(Index)
  end
end

Fishing.AreSalesOpen = function(ShopName)
  local TimeNow = GetClockHours()
  local OpeningTime = Config.SellingLocations[ShopName].OpeningTime
  local ClosingTime = Config.SellingLocations[ShopName].ClosingTime
  if TimeNow >= OpeningTime and TimeNow < ClosingTime then 
    return true
  else
    Fishing.ShowNotification(string.format("This store is closed. Opens: %i:00 Closes: %i:00", OpeningTime,ClosingTime))
    return false
  end
end

Fishing.OpenSalesMenu = function(ShopName)
  local elements = {}
  for k,v in pairs(Config.SellingLocations[ShopName].FishTypes) do 
    table.insert(elements,{label = string.format("%s: Min:%i Max:%i",Fishing.GetFishLabel(k),v.MinPrice,v.MaxPrice), value = k})
  end

  table.insert(elements,{
    label = "Close",
    value = "close"
  })

  Fishing.MenuHandler("Sell Fish", elements, 
    function(menu,element)
      if element.value == "close" then
        menu.close()
      else
        menu.close()
        if Config.UsingESX then
          TriggerEvent("Input:Open", "How many to sell?", false, function(amount)
            TriggerServerEvent("Fishing:SellToShop",ShopName, element.value, tonumber(amount))
          end) 
        else
          TriggerEvent("Input:Open", "How many to sell?", function(amount)
            TriggerServerEvent("Fishing:SellToShop",ShopName, element.value, tonumber(amount))
          end) 
        end 
      end 
    end
  )
end

Fishing.GetFishLabel = function(fish)
  return Config.FishTypes[fish].Name
end

--[[
 ██╗ ██╗  ██╗ ██╗     ███████╗ ██████╗ ██╗   ██╗██╗██████╗ ███╗   ███╗███████╗███╗   ██╗████████╗    ███████╗████████╗ ██████╗ ██████╗ ███████╗███████╗     ██╗ ██╗  ██╗ ██╗ 
████████╗████████╗    ██╔════╝██╔═══██╗██║   ██║██║██╔══██╗████╗ ████║██╔════╝████╗  ██║╚══██╔══╝    ██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗██╔════╝██╔════╝    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    █████╗  ██║   ██║██║   ██║██║██████╔╝██╔████╔██║█████╗  ██╔██╗ ██║   ██║       ███████╗   ██║   ██║   ██║██████╔╝█████╗  ███████╗    ╚██╔═██╔╝╚██╔═██╔╝
████████╗████████╗    ██╔══╝  ██║▄▄ ██║██║   ██║██║██╔═══╝ ██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║       ╚════██║   ██║   ██║   ██║██╔══██╗██╔══╝  ╚════██║    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ███████╗╚██████╔╝╚██████╔╝██║██║     ██║ ╚═╝ ██║███████╗██║ ╚████║   ██║       ███████║   ██║   ╚██████╔╝██║  ██║███████╗███████║    ╚██╔═██╔╝╚██╔═██╔╝
 ╚═╝ ╚═╝  ╚═╝ ╚═╝     ╚══════╝ ╚══▀▀═╝  ╚═════╝ ╚═╝╚═╝     ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝       ╚══════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝     ╚═╝ ╚═╝  ╚═╝ ╚═╝                                                                                                                                                                            
--]]

Fishing.LoadEquipmentStoreMarkers = function()
  for k,v in pairs(Config.EquipmentStores) do
    if not v.Job then
      if not v.Drawing then
        local marker = {
          display  = v.Render,
          control  = 38,
          location = v.Location,
          maintext = v.Text,
          scale    = v.Scale,
          distance = 1.0,
          callback = Fishing.EquipmentStoreInteract,
          args     = {k}
        }
        TriggerEvent("Markers:Add",marker,function(marker_id)
          v.Drawing = marker_id
        end)
      end
    else
      if v.Drawing then
        TriggerEvent("Markers:Remove",v.Drawing)
        v.Drawing = nil
      end
    end
  end
  Fishing.AddBlipsForEquipmentStores()
end

Fishing.AddBlipsForEquipmentStores = function()
  for k,v in pairs(Config.EquipmentStores) do 
    if v.Blip then 
      local k = AddBlipForCoord(v.Location)
      SetBlipScale(k, v.Blip.Scale)
      SetBlipSprite(k, v.Blip.Sprite)
      SetBlipColour(k, v.Blip.Color)
      SetBlipDisplay(k, v.Blip.Display)
      SetBlipAsShortRange(k, v.Blip.ShortRange)
      BeginTextCommandSetBlipName('STRING')
      AddTextComponentSubstringPlayerName(tostring(v.Blip.Name))
      EndTextCommandSetBlipName(k)
    end 
  end
end

Fishing.EquipmentStoreInteract = function(ShopName)
  if Fishing.IsStoreOpen(ShopName) then 
    Fishing.EquipmentStoreMenu(ShopName)
  end
end

Fishing.IsStoreOpen = function(ShopName)
  local TimeNow = GetClockHours()
  local OpeningTime = Config.EquipmentStores[ShopName].OpeningTime
  local ClosingTime = Config.EquipmentStores[ShopName].ClosingTime
  if TimeNow >= OpeningTime and TimeNow < ClosingTime then 
    return true
  else
    Fishing.ShowNotification(string.format("This store is closed. Opens: %i:00 Closes: %i:00", OpeningTime,ClosingTime))
    return false
  end
end

Fishing.EquipmentStoreMenu = function(ShopName)
  local elements = {}
  for k,v in pairs(Config.EquipmentStores[ShopName].Stock) do 
    local Price = math.random(v.MinPrice,v.MaxPrice)
    table.insert(elements,{label = string.format("%s: %i$", v.Label, Price), value = k, price = Price})
  end

  table.insert(elements,{
    label = "Close",
    value = "close"
  })

  Fishing.MenuHandler("Fishing Equipment Store", elements,
    function(menu,element)
      if element.value == "close" then
        menu.close()
      else
        menu.close()
        Fishing.EquipmentStoreChoice(ShopName, element.value, element.price)
      end
    end
  )
end

Fishing.EquipmentStoreChoice = function(ShopName, ItemName, ItemPrice)
  local Description = string.format("%s: %s", Config.EquipmentStores[ShopName].Stock[ItemName].Label, Config.EquipmentStores[ShopName].Stock[ItemName].Description)
  local elements = {
    {label = "Buy Item", value = "Buy"},
    {label = "Examine Item", value = "Examine"},
    {label = "Go Back", value = "Back"},
  }

  Fishing.MenuHandler("Buy/Examine", elements,
    function(menu,element)
      if element.value == "Examine" then 
        Fishing.ShowNotification(Description)
      elseif element.value == "Buy" then 
        menu.close()
        if Config.UsingESX then
          TriggerEvent("Input:Open", "How many to buy?", false, function(amount)
            local TotalPrice = ItemPrice * tonumber(amount)
            TriggerServerEvent("Fishing:BuyFromShop",ShopName,ItemName,tonumber(amount), TotalPrice)
          end) 
        else          
          TriggerEvent("Input:Open", "How many to buy?", function(amount)
            local TotalPrice = ItemPrice * tonumber(amount)
            TriggerServerEvent("Fishing:BuyFromShop",ShopName,ItemName,tonumber(amount), TotalPrice)
          end) 
        end
      elseif element.value == "Back" then 
        menu.close()
        Fishing.EquipmentStoreMenu(ShopName)
      end
    end
  )
end

Fishing.MenuHandler = function(title,elements,done,closed)
  if Config.UsingESX then    
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), "fishing_menu",{
        title    = title,
        align    = 'left',
        elements = elements,
      }, 
      function(data,menu)  
        if done then
          done(menu,data.current)
        end
      end,
      function(data,menu)
        if closed then
          closed(menu,data.current)
        end
      end
    ) 
  else
    nCore.UI.OpenMenu(title,elements,done,closed)
  end
end
