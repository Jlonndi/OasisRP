-------------------------------------
------- Created by T1GER#9080 -------
------------------------------------- 
Config 						= {}

-- General Settings:
Config.ESXSHAREDOBJECT 		= "esx:getSharedObject"	-- Change your getshared object event here, in case you are using anti-cheat.
Config.HasItemLabel			= true					-- set to false if your ESX doesn't support item labels.
Config.T1GER_DeliveryJob 	= true					-- set to false if u don't own this script. 

-- Settings:
Config.BuyShopWithCash 	 	= true		-- Set to false to purchase shops with bank.money.
Config.SellPercent		 	= 0.75		-- Means player gets 75% in return from original paid price.
Config.AccountsInCash		= true		-- Set to false to deposit/withdraw money into and from shop account with bank-money instead of cash money.
Config.ItemCompatibility	= true		-- If disabled, it doesnt check for type compatibility in Config.Items, meaning weapon shop owner could add bread, redgull etc.
Config.OrderItemPercent		= 25		-- Set percent between 1 and 100 of how much of the default item price is reduced, when ordering stock.
Config.BasketCommand		= 'basket'	-- Default command to open/view basket.
Config.InteractionMenuKey	= 289		-- Default [F6]-

Config.ItemWeightSystem		= false		-- Set this to true if you are using weight instead of limit.
Config.WeaponLoadout		= false		-- Set this to false if you are using weapons as items.

Config.ShelfCreateDist		= 10.0 		-- Max distance from cashier to be able to create shelves.

-- Shops:
Config.Shops = {
	-- Can Buy
	[1] = {owned = true, type = "normal", price = 1250000, buyable = true, b_menu = {-44.14,-1749.44,29.42}, cashier = {-47.29,-1756.7,29.42}, delivery = {-40.67,-1751.6,29.42}}, -- Davis Avenue, Davis Johnny Sinz
	[2] = {owned = true, type = "normal", price = 1250000, buyable = true, b_menu = {1159.77,-315.23,69.21}, cashier = {1163.39,-322.21,69.21}, delivery = {1163.9,-313.6,69.21}}, -- West Mirror Drive, Mirror Park Tyler Richards
	[3] = {owned = true, type = "normal", price = 1250000, buyable = true, b_menu = {-709.68,-904.9,19.22}, cashier = {-707.32,-912.9,19.22}, delivery = {-705.08,-904.4,19.22}}, -- Palomino Avenue, Little Seoul Don Kepler
	[4] = {owned = true, type = "normal", price = 1250000, buyable = true, b_menu = {-1417.63,-262.38,46.38}, cashier = {-1422.17,-269.04,46.32}, delivery = {-1415.09,-265.38,46.38}}, -- South Rockford Drive, Morningwood Cleveland Brown
	[5] = {owned = true, type = "normal", price = 1250000, buyable = true, b_menu = {95.03,-1292.9,29.27}, cashier = {128.07,-1284.86,29.28}, delivery = {133.4,-1278.4,29.27}}, -- Vanilla Unicorn Luna Cyprus
	[6] = {owned = true, type = "normal", price = 1250000, buyable = true, b_menu = {379.07,332.55,103.57}, cashier = {373.74,326.17,103.57}, delivery = {374.82,334.37,103.57}}, -- Vinewood 24/7 Charlie Brown
	-- Cant't Buy Automated
	[7] = {owned = true, type = "weapon", price = 1250000, buyable = false, b_menu = {-1220.90,-915.99,11.33}, cashier = {-1222.82,-907.11,12.33}, delivery = {-1220.47,-911.03,12.33}}, -- Vespucci Ace Liquor
	[8] = {owned = true, type = "weapon", price = 1250000, buyable = false, b_menu = {1735.31,6420.41,35.04}, cashier = {1728.97,6414.62,35.04}, delivery = {1732.43,6422.24,35.04}}, -- Paleto 24/7 by the diner
	[9] = {owned = true, type = "weapon", price = 1250000, buyable = false, b_menu = {2549.37,385.51,108.62}, cashier = {2557.18,382.12,108.62}, delivery = {2549.02,382.41,108.62}}, -- Route 15 Postal 402
	[10] = {owned = true, type = "weapon", price = 1250000, buyable = false, b_menu = {2549.37,3749.11,32.34}, cashier = {1961.13,3740.68,32.34}, delivery = {1956.88,3747.81,32.34}}, -- Sandy Shores 24/7
	[11] = {owned = true, type = "pawnshop", price = 1250000, buyable = false, b_menu = {-681.28,5838.93,17.33}, cashier = {-677.27,5839.52,17.33}, delivery = {-672.43,5835.81,17.33}}, -- Fishing Supply Store

}

Config.MarkerSettings = { -- Marker Settings:
	['boss'] = { enable = true, drawDist = 10.0, type = 20, scale = {x = 0.35, y = 0.35, z = 0.35}, color = {r = 240, g = 52, b = 52, a = 100} },
	['shelves'] = { enable = true, drawDist = 10.0, type = 20, scale = {x = 0.30, y = 0.30, z = 0.30}, color = {r = 240, g = 52, b = 52, a = 100} },
	['cashier'] = { enable = true, drawDist = 10.0, type = 20, scale = {x = 0.30, y = 0.30, z = 0.30}, color = {r = 0, g = 200, b = 70, a = 100} }
}
-- Blip Settings:
Config.BlipSettings = { -- Blip Settings:
	['normal'] = { enable = true, sprite = 52, display = 4, scale = 0.65, color = 2, name = "Shop" },
	['weapon'] = { enable = true, sprite = 52, display = 4, scale = 0.65, color = 2, name = "Shop" },
	['pawnshop'] = { enable = false, sprite = 59, display = 4, scale = 0.65, color = 5, name = "Fishing Shop" }
}

-- Shop Items:
Config.Items = {
	----- automated only -----
	{label = "Bandage", item = "bandage", type = {"weapon"}, price = 4},
	{label = "Phone", item = "blue_phone", type = {"weapon"}, price = 500},
	{label = "Chips", item = "chips", type = {"weapon"}, price = 2},
	{label = "Chili Cheese Dog", item = "hotdog", type = {"weapon"}, price = 2},
	{label = "Cup Noodle", item = "cupnoodle", type = {"weapon"}, price = 2},
	{label = "Water", item = "water", type = {"weapon"}, price = 2},
	{label = "Radio", item = "radio", type = {"weapon"}, price = 2500},

	----- convienience -----
	{label = "Bandage", item = "bandage", type = {"normal"}, price = 4},
	{label = "Phone", item = "blue_phone", type = {"normal"}, price = 500},
	{label = "Binoculars", item = "jumelles", type = {"normal"}, price = 50},
	{label = "Big Wave", item = "bigwave", type = {"normal"}, price = 3},
	{label = "Bud Light", item = "budlight", type = {"normal"}, price = 3},
	{label = "Smirnoff", item = "vodka", type = {"normal"}, price = 3},
	{label = "Catawba White Zombie", item = "zombie", type = {"normal"}, price = 3},
	{label = "Land Shark Lager", item = "lager", type = {"normal"}, price = 3},
	{label = "Heineken", item = "heineken", type = {"normal"}, price = 3},
	{label = "Corona", item = "corona", type = {"normal"}, price = 3},

	----- food -----
	{label = "Burger", item = "burger", type = {"food"}, price = 2},
	{label = "Heart Attack", item = "burger2", type = {"food"}, price = 5},
	{label = "Buffalo Chicken Wings", item = "wings", type = {"food"}, price = 2},
	{label = "Popcorn", item = "popcorn", type = {"food"}, price = 2},
	{label = "Slice of Pepperoni Pizza", item = "slice", type = {"food"}, price = 3},
	{label = "Spaghetti Marinara", item = "spaghetti", type = {"food"}, price = 3},
	{label = "Tacos", item = "tacos", type = {"food"}, price = 2},
	{label = "Nachos", item = "nachos", type = {"food"}, price = 2},
	{label = "Onion Rings", item = "onionrings", type = {"food"}, price = 2},
	{label = "Chicken Sandwich", item = "chicken", type = {"food"}, price = 2},
	{label = "Chips", item = "chips", type = {"food"}, price = 2},
	{label = "Full Pepperoni Pizza", item = "pizza", type = {"food"}, price = 5},
	{label = "Cup Noodle", item = "cupnoodle", type = {"food"}, price = 2},
	{label = "Fish and Chips", item = "fishchips", type = {"food"}, price = 3},
	{label = "French Fries", item = "fries", type = {"food"}, price = 2},
	{label = "Chili Cheese Dog", item = "hotdog", type = {"food"}, price = 2},
	{label = "Chocolate", item = "chocolate", type = {"candy"}, price = 1},

	----drink----
	{label = "Iced Coffee", item = "icedcoffee", type = {"drink"}, price = 3},
	{label = "Iced Tea", item = "icedtea", type = {"drink"}, price = 2},
	{label = "ICEE", item = "icee", type = {"drink"}, price = 2},
	{label = "Water", item = "water", type = {"drink"}, price = 2},
	{label = "Lemonade", item = "lemonade", type = {"drink"}, price = 2},
	{label = "Milkshake", item = "milkshake", type = {"drink"}, price = 3},

	------ Liquor -------
	{label = "Ace of Spades Champagne", item = "champagne", type = {"normal"}, price = 40},
	{label = "Bollinger Champagne", item = "champagne2", type = {"normal"}, price = 30},
	{label = "Champagne Cristal 2006 Mathusalem", item = "champagne3", type = {"normal"}, price = 1650},
	{label = "Chateau Montelena Napa Valley Chardonnay", item = "chardonnay", type = {"normal"}, price = 8},
	{label = "Patron Silver", item = "patron", type = {"normal"}, price = 8},
	{label = "Barefoot Cellars Pink Moscato", item = "moscato", type = {"normal"}, price = 2},
	{label = "Don Julio", item = "donjulio", type = {"normal"}, price = 45},
	{label = "Hennessy Cognac", item = "cognac", type = {"normal"}, price = 9},
	----- Fish Supply -----
	{label = "Magnum XL Rod", item = "magnumxlrod", type = {"pawnshop"}, price = 35},
	{label = "Zeus Rod", item = "zeusrod", type = {"pawnshop"}, price = 30},
	{label = "Brutas Rod", item = "brutasrod", type = {"pawnshop"}, price = 25},
	{label = "Nero Rod", item = "nerorod", type = {"pawnshop"}, price = 20},
	{label = "Elemental Rod", item = "elementalrod", type = {"pawnshop"}, price = 15},
	{label = "Value Cast Rod", item = "valuecastrod", type = {"pawnshop"}, price = 10},

	{label = "Zilla Reel", item = "zillareel", type = {"pawnshop"}, price = 35},
	{label = "Thunder Reel", item = "thunderreel", type = {"pawnshop"}, price = 30},
	{label = "Fish R Us Reel", item = "fishrusreel", type = {"pawnshop"}, price = 25},
	{label = "Rock Bottom Reel", item = "rockbottomreel", type = {"pawnshop"}, price = 20},
	{label = "Line Sniffer Reel", item = "linesnifferreel", type = {"pawnshop"}, price = 15},
	{label = "Broke Ass Reel", item = "brokeassreel", type = {"pawnshop"}, price = 10},

	{label = "King Braid Line", item = "kingbraid", type = {"pawnshop"}, price = 35},
	{label = "Lightning Braid Line", item = "lightningbraid", type = {"pawnshop"}, price = 30},
	{label = "Noodle Braid Line", item = "noodlebraid", type = {"pawnshop"}, price = 25},
	{label = "Mobey Mono Line", item = "mobeymono", type = {"pawnshop"}, price = 20},
	{label = "Bite Size Mono Line", item = "bitesizemono", type = {"pawnshop"}, price = 15},
	{label = "Cheap Mono Line", item = "cheapmono", type = {"pawnshop"}, price = 10},

	{label = "Tow Hook", item = "towhook", type = {"pawnshop"}, price = 35},
	{label = "#10 Hook", item = "no10", type = {"pawnshop"}, price = 30},
	{label = "#6 Hook", item = "no6", type = {"pawnshop"}, price = 25},
	{label = "#3 Hook", item = "no3", type = {"pawnshop"}, price = 20},
	{label = "#2 Hook", item = "no2", type = {"pawnshop"}, price = 15},
	{label = "#1 Hook", item = "no1", type = {"pawnshop"}, price = 10},

	{label = "Nightworms", item = "nightworms", type = {"pawnshop"}, price = 10},
	{label = "Redworms", item = "redworms", type = {"pawnshop"}, price = 10},
	{label = "Mealworms", item = "mealworms", type = {"pawnshop"}, price = 10},
	{label = "Leech", item = "leech", type = {"pawnshop"}, price = 10},
	{label = "Minnow", item = "minnow", type = {"pawnshop"}, price = 10},
	{label = "Turtle Meat", item = "turtlemeat", type = {"pawnshop"}, price = 10},
	{label = "Tuna Meat", item = "tunameat", type = {"pawnshop"}, price = 10},
	{label = "Bread", item = "bread", type = {"pawnshop"}, price = 10},
	{label = "Crab", item = "crab", type = {"pawnshop"}, price = 10},
	{label = "Huge Cut Bait", item = "hugecutbait", type = {"pawnshop"}, price = 10},
	{label = "Bacon", item = "bacon", type = {"pawnshop"}, price = 10},
	{label = "Maggots", item = "maggots", type = {"pawnshop"}, price = 10},
	{label = "Technoplankton", item = "technoplankton", type = {"pawnshop"}, price = 10},

	----- Alcohol -----
	{label = "Big Wave", item = "bigwave", type = {"normal"}, price = 3},
	{label = "Bud Light", item = "budlight", type = {"normal"}, price = 3},
	{label = "Smirnoff", item = "vodka", type = {"normal"}, price = 3},
	{label = "Catawba White Zombie", item = "zombie", type = {"normal"}, price = 3},
	{label = "Land Shark Lager", item = "lager", type = {"normal"}, price = 3},
	{label = "Heineken", item = "heineken", type = {"normal"}, price = 3},
	{label = "Corona", item = "corona", type = {"normal"}, price = 3},
	{label = "Ace of Spades Champagne", item = "champagne", type = {"normal"}, price = 40},
	{label = "Bollinger Champagne", item = "champagne2", type = {"normal"}, price = 30},
	{label = "Champagne Cristal 2006 Mathusalem", item = "champagne3", type = {"normal"}, price = 1650},
	{label = "Chateau Montelena Napa Valley Chardonnay", item = "chardonnay", type = {"normal"}, price = 8},
	{label = "Patron Silver", item = "patron", type = {"normal"}, price = 8},
	{label = "Barefoot Cellars Pink Moscato", item = "moscato", type = {"normal"}, price = 2},
	{label = "Don Julio", item = "donjulio", type = {"normal"}, price = 45},
	{label = "Hennessy Cognac", item = "cognac", type = {"normal"}, price = 9},

	----- mechanic -----
{label = "Aluminium", item = "aluminium", type = {"normal"}, price = 10},
{label = "Copper", item = "copper", type = {"normal"}, price = 10},
{label = "Electric Scrap", item = "electric_scrap", type = {"normal"}, price = 10},
{label = "Glass", item = "glass", type = {"normal"}, price = 10},


}

Config.AmmoTypes = {
	[1] = {label = "Pistol Ammo", hash = 1950175060},
	[2] = {label = "SMG Ammo", hash = 1820140472},
	[3] = {label = "Shotgun Ammo", hash = -1878508229},
	[4] = {label = "Rifle Ammo", hash = 218444191},
}






