Config = {}

-- Pawn Shop Positions:
Config.PawnZones = {
	PawnShops = {
		Pos = {
			{x = 1207.28,  y = -3121.92, z = 5.54},
			{x = 2531.68,  y = 4114.18, z = 38.77},
		}
	}
}

-- Pawn Shop Blip Settings:
Config.EnablePawnShopBlip = false
Config.BlipSprite = 59
Config.BlipDisplay = 4
Config.BlipScale = 0.65
Config.BlipColour = 5
Config.BlipName = "Nunya"

-- Pawn Shop Marker Settings:
Config.KeyToOpenShop = 38														-- default 38 is E
Config.ShopMarker = 27 															-- marker type
Config.ShopMarkerColor = { r = 255, g = 255, b = 0, a = 100 } 					-- rgba color of the marker
Config.ShopMarkerScale = { x = 1.0, y = 1.0, z = 1.0 }  						-- the scale for the marker on the x, y and z axis
Config.ShopDraw3DText = "Press ~g~[E]~s~ to Sell ~y~Stolen Goods~s~."					-- set your desired text here

-- Pawn Shop Item List:
Config.ItemsInPawnShop = {
	-- buy

	-- sell
	{ itemName = 'accesscard', label = 'Access Card', BuyInPawnShop = false, BuyPrice = 0, SellInPawnShop = true, SellPrice = 2500 },
	{ itemName = 'jewels', label = 'Jewels', BuyInPawnShop = false, BuyPrice = 0, SellInPawnShop = true, SellPrice = 1000 },
	{ itemName = 'dia_box', label = 'Diamond Box', BuyInPawnShop = false, BuyPrice = 0, SellInPawnShop = true, SellPrice = 800 },
	{ itemName = 'goldbar', label = 'Gold Bar', BuyInPawnShop = false, BuyPrice = 0, SellInPawnShop = true, SellPrice = 750 },
	{ itemName = 'goldwatch', label = 'Gold Watch', BuyInPawnShop = false, BuyPrice = 0, SellInPawnShop = true, SellPrice = 500 },
	{ itemName = 'goldnecklace', label = 'Gold Necklace', BuyInPawnShop = false, BuyPrice = 0, SellInPawnShop = true, SellPrice = 400 },
}

