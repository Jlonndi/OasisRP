Config              = {}
Config.Locale       = 'en'
Config.Phones       = {
  "blue_phone",
  "green_phone",
  "white_phone",
  "phone"
}
Config.FourDigit = false
FixePhone = {
  -- Poste de police
  ['911'] = { name =  "Central Police", coords = { x = 441.97, y = -981.95, z = 30.69 } },
  
  -- Cabine proche du poste de police
  ['008-0001'] = { name = "Telephone Booth", coords = { x = 372.25, y = -965.75, z = 28.58 } },
}

ShowNumberNotification = true -- Show Number or Contact Name when you receive new SMS


Config.newsJobName = "journaliste"
Config.newsBlip = vector3(-595.67, -932.5, 28.0) -- News add blip, for news job
Config.valetPrice = 1750
Config.uberPriceMultiplier = 3.0 -- Means if items price $4, 4 * 1.5 = 6
Config.uberTipMin = 30 -- If player is a lucky get min tip on deliver
Config.uberTipMax = 150 -- If player is a lucky get max tip on deliver

-- Uber delivery adress
Config.uberDelivery = {
	[1] = {["x"] = 8.91, ["y"] = -242.82, ["z"] = 51.8},
    [2] = {["x"] = 113.74, ["y"] = -277.95, ["z"] = 54.51},
    [3] = {["x"] = 201.56, ["y"] = -148.76, ["z"] = 61.47},
    [4] = {["x"] = -206.84, ["y"] = 159.49, ["z"] = 74.08},
    [5] = {["x"] = 38.83, ["y"] = -71.64, ["z"] = 63.83},
    [6] = {["x"] = 47.84, ["y"] = -29.16, ["z"] = 73.71},
    [7] = {["x"] = -264.41, ["y"] = 98.82, ["z"] = 69.27},
    [8] = {["x"] = -419.34, ["y"] = 221.12, ["z"] = 83.6},
    [9] = {["x"] = -998.43, ["y"] = 158.42, ["z"] = 62.31},
    [10] = {["x"] = -1026.57, ["y"] = 360.64, ["z"] = 71.36},
    [11] = {["x"] = -967.06, ["y"] = 510.76, ["z"] = 82.07},
    [12] = {["x"] = -1009.64, ["y"] = 478.93, ["z"] = 79.41},
    [13] = {["x"] = -1308.05, ["y"] = 448.59, ["z"] = 100.86},
	[14] = {["x"] = 557.39, ["y"] = -1759.57, ["z"] = 29.31},
	[15] = {["x"] = 325.1, ["y"] = -229.59, ["z"] = 54.22},
	[16] = {["x"] = 414.82, ["y"] = -217.57, ["z"] = 59.91},
	[17] = {["x"] = 430.85, ["y"] = -941.91, ["z"] = 29.19},
	[18] = {["x"] = -587.79, ["y"] = -783.53, ["z"] = 25.4},
	[19] = {["x"] = -741.54, ["y"] = -982.28, ["z"] = 17.44},
	[20] = {["x"] = -668.23, ["y"] = -971.58, ["z"] = 22.34},
	[21] = {["x"] = -664.21, ["y"] = -1218.25, ["z"] = 11.81},
	[22] = {["x"] = 249.99, ["y"] = -1730.79, ["z"] = 29.67},
	[23] = {["x"] = 405.77, ["y"] = -1751.18, ["z"] = 29.71 },
	[24] = {["x"] = 454.96, ["y"] = -1580.25, ["z"] = 32.82},
	[25] = {["x"] = 278.81, ["y"] = -1117.96, ["z"] = 29.42},
	[26] = {["x"] = 101.82, ["y"] = -819.49, ["z"] = 31.31},
	[27] = {["x"] = -416.72, ["y"] = -186.79, ["z"] = 37.45},
}

-- Required uber items on deliver
Config.uberItems = {
	[1] = {["item"] = "bigwave", ["name"] = "Big Wave", ["price"] = 3},
	[2] = {["item"] = "budlight", ["name"] = "Bud Light", ["price"] = 3},
	[3] = {["item"] = "burger", ["name"] = "Burger", ["price"] = 2},
	[4] = {["item"] = "burger2", ["name"] = "Heart Attack", ["price"] = 5},
	[5] = {["item"] = "champagne", ["name"] = "Ace of Spades Champagne", ["price"] = 28},
	[6] = {["item"] = "champagne2", ["name"] = "Bollinger Champagne", ["price"] = 20},
	[7] = {["item"] = "budlight", ["name"] = "Bud Light", ["price"] = 5},
	[8] = {["item"] = "chicken", ["name"] = "Chicken Sandwich", ["price"] = 2},
	[9] = {["item"] = "chips", ["name"] = "Chips", ["price"] = 2},
	[10] = {["item"] = "chocolate", ["name"] = "Chocolate", ["price"] = 1},
	[11] = {["item"] = "corona", ["name"] = "Corona", ["price"] = 3},
	[12] = {["item"] = "cupnoodle", ["name"] = "Cup Noodle", ["price"] = 2},
	[13] = {["item"] = "fishchips", ["name"] = "Fish and Chips", ["price"] = 3},
	[14] = {["item"] = "fries", ["name"] = "French Fries", ["price"] = 2},
	[15] = {["item"] = "heineken", ["name"] = "Heineken", ["price"] = 3},
	[16] = {["item"] = "hotdog", ["name"] = "Chili Cheese Dog", ["price"] = 2},
	[17] = {["item"] = "icedcoffee", ["name"] = "Iced Coffee", ["price"] = 3},
	[18] = {["item"] = "icedtea", ["name"] = "Aloha Iced Tea", ["price"] = 2},
	[19] = {["item"] = "icee", ["name"] = "ICEE", ["price"] = 2},
	[20] = {["item"] = "lager", ["name"] = "Land Shark Lager", ["price"] = 3},
	[21] = {["item"] = "lemonade", ["name"] = "Lemonade", ["price"] = 2},
	[22] = {["item"] = "milkshake", ["name"] = "Milkshake", ["price"] = 3},
	[23] = {["item"] = "nachos", ["name"] = "Nachos", ["price"] = 2},
	[24] = {["item"] = "patron", ["name"] = "Patron Silver", ["price"] = 8},
	[25] = {["item"] = "popcorn", ["name"] = "Popcorn", ["price"] = 2},
	[26] = {["item"] = "tacos", ["name"] = "Tacos", ["price"] = 2},
	[27] = {["item"] = "vodka", ["name"] = "Smirnoff", ["price"] = 3},
	[28] = {["item"] = "water", ["name"] = "Water", ["price"] = 2},
	[29] = {["item"] = "wings", ["name"] = "Buffalo Chicken Wings", ["price"] = 2},
	[30] = {["item"] = "zombie", ["name"] = "Catawba White Zombie", ["price"] = 3}

}