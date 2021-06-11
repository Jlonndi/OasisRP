Cfg = {}
Translation = {}

Cfg.Locale = 'en'

Cfg.useOneSyncInfinity = false

Cfg.DeliveryTime = {h = 18, m = 00} -- When should ordered vehicles arrive at the cardealer

Cfg.Society_Name = 'society_vegas'
Cfg.society = 'vegas' -- = Job MySQLName
Cfg.Society = 'Vegas'
Cfg.NotificationPicture = 'CHAR_CARSITE2'
Cfg.CompanyName = 'JDImports'
Cfg.GaragePed = 's_m_y_xmech_01'

Cfg.NumberPlate = 'GOSKRRTT'


Cfg.PlateNumbersPrim =2
Cfg.PlateLetters  = 3
Cfg.PlateNumbers  = 3
Cfg.PlateUseSpace = false
--vvvvvv Config coords below for your local dealership vvvvvvvvvvvv--------
--cam is a camera you can use, to see the display vehicle you're selling, from the computer 
-------pos is where it is situated
-------point is where it will face towards
--clothe is where you can setup uniform/wardrobe for clocking in/out
--Boss is the boss menu
--Garage is a ped where you can spawn cars in your dealer's inventory to show people for a test drive
-- Despawn is where cars go when you're done test driving them
--Ring is where customers can go to ping you a notification that someone is at your shop and needs help.
--Computer is where you go to order vehicles and sell to customers
--Showrooms is where your display cars will go
-------spawn is the actual display car
-------menu is where the salesperson can access the inventory to change display models
-------spawn 2 is where it will spawn for a test drive
Cfg.Coords = {

  Clothe = {
    {x = -213.51, y = -1328.08, z = 23.14}
  },

  Boss = {
    {x = -198.19, y = -1341.20, z = -50.90}
  },

  Garage = {
    {x = -240.75, y = -1313.82, z = 18.47, rot = 270.00, spawn = {x = -236.46, y = -1310.61, z = 17.74, rot = 180.00}}
  },

  DeSpawn = {
    {x = -213.69, y = -1315.87, z = 18.47}
  },

  Ring = {
    {x = -214.75, y = -1341.91, z = 34.89}
  },

  Computer = {
    {x = -209.03, y = -1307.63, z = 18.47, spawn = {x = -236.46, y = -1310.61, z = 17.74, rot = 180.00}}
  },

  Showrooms = {
    {
        spawn = {x = -216.46, y = -1309.30, z = 17.74, rot = 131.44},  --1
        menu = {x = -214.89, y = -1310.28, z = 18.47},
        ChangeColor = false,
        spawn2 = {x = -236.46, y = -1310.61, z = 17.74, rot = 180.00}
    },
    {
        spawn = {x = -221.46, y = -1309.30, z = 17.74, rot = 131.44}, --2
        menu = {x = -219.89, y = -1310.28, z = 18.47},
        ChangeColor = true,
        spawn2 = {x = -236.46, y = -1310.61, z = 17.74, rot = 180.00}
    },
    {
        spawn = {x = -226.46, y = -1309.30, z = 17.74, rot = 131.44}, --3
        menu = {x = -224.89, y = -1310.28, z = 18.47},
        ChangeColor = false,
        spawn2 = {x = -236.46, y = -1310.61, z = 17.74, rot = 180.00}
    },
    {
        spawn = {x = -231.46, y = -1309.30, z = 17.74, rot = 131.44}, --4
        menu = {x = -229.89, y = -1310.28, z = 18.47},
        ChangeColor = false,
        spawn2 = {x = -236.46, y = -1310.61, z = 17.74, rot = 180.00}
    },
    {
        spawn = {x = -216.46, y = -1320.54, z = 17.74, rot = 41.44}, --5
        menu = {x = -214.89, y = -1320.21, z = 18.47},
        ChangeColor = false,
        spawn2 = {x = -236.46, y = -1310.61, z = 17.74, rot = 180.00}
    },
    {
        spawn = {x = -221.46, y = -1320.54, z = 17.74, rot = 41.44}, --6
        menu = {x = -219.89, y = -1320.21, z = 18.47},
        ChangeColor = true,
        spawn2 = {x = -236.46, y = -1310.61, z = 17.74, rot = 180.00}
    },
    {
        spawn = {x = -226.46, y = -1320.54, z = 17.74, rot = 41.44}, --7
        menu = {x = -224.89, y = -1320.21, z = 18.47},
        ChangeColor = false,
        spawn2 = {x = -236.46, y = -1310.61, z = 17.74, rot = 180.00}
    },
    {
        spawn = {x = -231.46, y = -1320.54, z = 17.74, rot = 41.44}, --8
        menu = {x = -229.89, y = -1320.21, z = 18.47},
        ChangeColor = false,
        spawn2 = {x = -236.46, y = -1310.61, z = 17.74, rot = 180.00}
    },
  }
}

--do not change--
Cfg.Marker = {
  id          = 27,
  colour      = {r = 0, g = 0, b = 128, a = 125},
  isRotating  = false,
  radius      = 1.0,
}

Cfg.Grades = {
  {number = 0, label = 'Sales Associate In-Training'},
  {number = 1, label = 'Sales Associate'},
  {number = 2, label = 'Manager'},
  {number = 3, label = 'General Manager'},
  {number = 4, label = 'Owner'},
}

Cfg.MapBlip = {
  {
      Pos     	= {x = -225.95, y = -1314.73, z = 18.47},
      Sprite  	= 669,
      Display	    = 4,
      Scale  	    = 0.75,
      Colour  	= 50,
      Name        = 'Vegas JDImports',
      OnlyHasJob  = false
  },
}

Cfg.Clothes = {
  {
      name = 'Owner',
      grade = 4,
      Male = {
        Mask = {id = 121, id2 = 0},
        Arms = {id = 4, id2 = 0},
        Leg = {id = 22, id2 = 0},
        bag = {id = 0, id2 = 0},
        Shoes = {id = 51, id2 = 9},
        Accessory = {id = -1, id2 = 0},
        Tshirt = {id = 78, id2 = 0},
        Kevlar = {id = 0, id2 = 0},
        Badge = {id = 0, id2 = 0},
        Torso = {id = 177, id2 = 0},
        Watch = {id = -1, id2 = 0},
        Hat = {id = -1, id2 = 0},
        Glass = {id = 20, id2 = 1},
        Ear = {id = -1, id2 = 0}
      },
      Female = {
          Mask = {id = 121, id2 = 0},
          Arms = {id = 20, id2 = 0},
          Leg = {id = 47, id2 = 0},
          bag = {id = 0, id2 = 0},
          Shoes = {id = 29, id2 = 0},
          Accessory = {id = 23, id2 = 0},
          Tshirt = {id = 38, id2 = 2},
          Kevlar = {id = 0, id2 = 0},
          Badge = {id = 0, id2 = 0},
          Torso = {id = 53, id2 = 2},
          Watch = {id = 1, id2 = 0},
          Hat = {id = -1, id2 = 0},
          Glass = {id = -1, id2 = 3},
          Ear = {id = -1, id2 = 2}
      }
  },
  {
      name = 'Sales Associate In-Training',
      grade = 0,
      Male = {
        Mask = {id = 121, id2 = 0},
        Arms = {id = 20, id2 = 0},
        Leg = {id = 25, id2 = 0},
        bag = {id = 0, id2 = 0},
        Shoes = {id = 21, id2 = 0},
        Accessory = {id = 22, id2 = 0},
        Tshirt = {id = 33, id2 = 0},
        Kevlar = {id = 0, id2 = 0},
        Badge = {id = 0, id2 = 0},
        Torso = {id = 31, id2 = 0},
        Watch = {id = 1, id2 = 0},
        Hat = {id = -1, id2 = 0},
        Glass = {id = -1, id2 = 0},
        Ear = {id = -1, id2 = 0}
      },
      Female = {
        Mask = {id = 121, id2 = 0},
        Arms = {id = 20, id2 = 0},
        Leg = {id = 47, id2 = 0},
        bag = {id = 0, id2 = 0},
        Shoes = {id = 29, id2 = 0},
        Accessory = {id = 23, id2 = 0},
        Tshirt = {id = 38, id2 = 2},
        Kevlar = {id = 0, id2 = 0},
        Badge = {id = 0, id2 = 0},
        Torso = {id = 53, id2 = 0},
        Watch = {id = 1, id2 = 0},
        Hat = {id = -1, id2 = 0},
        Glass = {id = -1, id2 = 3},
        Ear = {id = -1, id2 = 2}
      }
  },
  {
      name = 'Sales Associate',
      grade = 1,
      Male = {
          Mask = {id = 121, id2 = 0},
          Arms = {id = 20, id2 = 0},
          Leg = {id = 25, id2 = 0},
          bag = {id = 0, id2 = 0},
          Shoes = {id = 21, id2 = 0},
          Accessory = {id = 22, id2 = 0},
          Tshirt = {id = 33, id2 = 0},
          Kevlar = {id = 0, id2 = 0},
          Badge = {id = 0, id2 = 0},
          Torso = {id = 31, id2 = 0},
          Watch = {id = 1, id2 = 0},
          Hat = {id = -1, id2 = 0},
          Glass = {id = -1, id2 = 0},
          Ear = {id = -1, id2 = 0}
        },
      Female = {
          Mask = {id = 121, id2 = 0},
          Arms = {id = 20, id2 = 0},
          Leg = {id = 47, id2 = 0},
          bag = {id = 0, id2 = 0},
          Shoes = {id = 29, id2 = 0},
          Accessory = {id = 23, id2 = 0},
          Tshirt = {id = 38, id2 = 2},
          Kevlar = {id = 0, id2 = 0},
          Badge = {id = 0, id2 = 0},
          Torso = {id = 53, id2 = 1},
          Watch = {id = 1, id2 = 0},
          Hat = {id = -1, id2 = 0},
          Glass = {id = -1, id2 = 3},
          Ear = {id = -1, id2 = 2}
      }
  },
  {
      name = 'Manager',
      grade = 2,
      Male = {
          Mask = {id = 121, id2 = 0},
          Arms = {id = 20, id2 = 0},
          Leg = {id = 25, id2 = 0},
          bag = {id = 0, id2 = 0},
          Shoes = {id = 21, id2 = 0},
          Accessory = {id = 22, id2 = 0},
          Tshirt = {id = 33, id2 = 0},
          Kevlar = {id = 0, id2 = 0},
          Badge = {id = 0, id2 = 0},
          Torso = {id = 31, id2 = 0},
          Watch = {id = 1, id2 = 0},
          Hat = {id = -1, id2 = 0},
          Glass = {id = -1, id2 = 0},
          Ear = {id = -1, id2 = 0}
        },
      Female = {
          Mask = {id = 121, id2 = 0},
          Arms = {id = 20, id2 = 0},
          Leg = {id = 47, id2 = 0},
          bag = {id = 0, id2 = 0},
          Shoes = {id = 29, id2 = 0},
          Accessory = {id = 23, id2 = 0},
          Tshirt = {id = 38, id2 = 2},
          Kevlar = {id = 0, id2 = 0},
          Badge = {id = 0, id2 = 0},
          Torso = {id = 53, id2 = 3},
          Watch = {id = 1, id2 = 0},
          Hat = {id = -1, id2 = 0},
          Glass = {id = -1, id2 = 3},
          Ear = {id = -1, id2 = 2}
      }
  },
  {
      name = 'General Manager',
      grade = 3,
      Male = {
          Mask = {id = 121, id2 = 0},
          Arms = {id = 11, id2 = 0},
          Leg = {id = 91, id2 = 2},
          bag = {id = 0, id2 = 0},
          Shoes = {id = 47, id2 = 2},
          Accessory = {id = -1, id2 = 0},
          Tshirt = {id = 15, id2 = 0},
          Kevlar = {id = 0, id2 = 0},
          Badge = {id = 0, id2 = 0},
          Torso = {id = 81, id2 = 0},
          Watch = {id = -1, id2 = 0},
          Hat = {id = -1, id2 = 0},
          Glass = {id = -1, id2 = 0},
          Ear = {id = -1, id2 = 0}
        },
      Female = {
          Mask = {id = 121, id2 = 0},
          Arms = {id = 20, id2 = 0},
          Leg = {id = 47, id2 = 0},
          bag = {id = 0, id2 = 0},
          Shoes = {id = 29, id2 = 0},
          Accessory = {id = 23, id2 = 0},
          Tshirt = {id = 38, id2 = 2},
          Kevlar = {id = 0, id2 = 0},
          Badge = {id = 0, id2 = 0},
          Torso = {id = 53, id2 = 3},
          Watch = {id = 1, id2 = 0},
          Hat = {id = -1, id2 = 0},
          Glass = {id = -1, id2 = 3},
          Ear = {id = -1, id2 = 2}
      }
  },
}

Translation = {
  ['en'] = {
      ['ring_infobar'] = 'Press ~b~E~s~ to notify a cardealer',
      ['showroom_infobar'] = 'Press ~b~E~w~, to access the ~o~Showroom~w~!',
      ['boss_infobar'] = 'Press ~b~E~w~, to access the ~o~Boss Menü~w~!',
      ['wardrobe_infobar'] = 'Press ~b~E~w~, to access the ~o~wardrobe~w~!',
      ['garage_infobar'] = 'Press ~b~E~w~, to access the ~o~garage~w~!',
      ['computer_infobar'] = 'Press ~b~E~w~, to access the ~o~Computer~w~!',
      ['delete_vehicle'] = 'Press ~b~E~w~, to ~o~store the vehicle~w~!',
      ['wardrobe'] = 'Wardrobe',
      ['private_clothes'] = 'Private clothes',
      ['bossmenu'] = 'Boss Menu',
      ['finance_management'] = 'Financial management',
      ['staff'] = 'Staff management',
      ['society_money'] = 'Society money',
      ['withdraw_money'] = 'Withdraw money',
      ['deposit_money'] = 'Deposit money',
      ['withdraw_desc'] = 'Do you want to ~g~withdraw~w~ money?',
      ['deposit_desc'] = 'Do you want to ~g~deposit~w~ money?',
      ['how_much'] = 'How much?',
      ['company_money'] = 'Society money',
      ['unknown_amount'] = '~r~Invlaid amount!',
      ['deposit_msg'] = 'You deposited ~g~',
      ['deposit_msg2'] = ' $~w~',
      ['withdraw_msg'] = 'You have withdrawn ~g~',
      ['withdraw_msg2'] = ' $~w~ from your society',
      ['hire'] = 'Hire somebody',
      ['staff_management'] = 'Staff management',
      ['job_rank'] = 'Job rank:',
      ['fire'] = '~r~Fire',
      ['fire_msg'] = 'Do you want to fire ~b~',
      ['fire_msg2'] = '~w~?',
      ['promote'] = 'Promote',
      ['promote_msg'] = 'Do you want to promote ~b~',
      ['promote_msg2'] = '~w~ to ~b~',
      ['promote_msg3'] = ' ~w~?',
      ['showroom'] = 'Showroom',
      ['change_color'] = '~b~Change color',
      ['primary_color'] = 'Primary color',
      ['primary_color_msg'] = 'Set as primary color',
      ['secondary_color'] = 'Secondary color',
      ['secondary_color_msg'] = 'Set as secondary color',
      ['pearl'] = 'Pearlescent',
      ['pearl_msg'] = 'Set as pearlescent',
      ['show_manufacturer'] = 'Manufacturer:',
      ['show_price'] = 'Price:',
      ['show_model'] = 'Model:',
      ['show_park_item'] = 'Exhibit at Showroom',
      ['show_performance'] = 'Performance:',
      ['show_maxSpeed'] = 'Max. speed:',
      ['show_speedup'] = 'Speedup 0-100:',
      ['show_modifications'] = 'Amount of modifications:',
      ['show_fuelcapacity'] = 'Fuel capacity:',
      ['show_suffix_performance'] = ' PS',
      ['show_suffix_maxSpeed'] = ' mp/h',
      ['show_suffix_speedup'] = ' seconds',
      ['show_suffix_modifications'] = ' parts',
      ['show_suffix_fuelcapacity'] = ' l',
      ['test_drive'] = '~b~Prepare for a test drive',
      ['amount_cardealer'] = 'Stock in cardealership:',
      ['amount_storage'] = 'Stock in warehouse:',
      ['set_to_showroom'] = 'Exhibit at Showroom',
      ['amount_cars'] = ' Cars available',
      ['computer'] = 'Computer',
      ['sell_vehicle'] = 'Sell vehicle',
      ['show_1'] = 'Showroom 1',
      ['show_2'] = 'Showroom 2',
      ['show_3'] = 'Showroom 3',
      ['show_4'] = 'Showroom 4',
      ['show_5'] = 'Showroom 5',
      ['show_6'] = 'Showroom 6',
      ['show_7'] = 'Showroom 7',
      ['show_8'] = 'Showroom 8',
      ['show_abort'] = '~r~Abort',
      ['yes'] = 'Yes',
      ['no'] = 'No',
      ['car_sell'] = ' (Press to sell)',
      ['bill_purchase_of'] = 'Purchase of a ',
      ['dialog_price'] = 'Price',
      ['no_customers'] = '~o~There is no customer next to you! There have to be a customer next to you to sell a car.',
      ['vehicles_list'] = 'Vehicles',
      ['car_deliver'] = 'Bring this car to the dealership: ',
      ['car_craft'] = 'Manufacture this vehicle: ',
      ['amount'] = 'Amount',
      ['ordered'] = 'Ordered: ',
      ['reserved'] = 'Reserved: ',
      ['orders'] = 'Orders',
      ['total_production_time'] = 'Remaining production time:',
      ['current_production_time'] = 'Ordered vehicles:',
      ['refresh_time'] = 'Refresh',
      ['hours'] = ' hours',
      ['hired'] = '~g~Hired~w~!',
      ['you_were_hired'] = 'You were ~g~hired!~w~',
      ['you_hired'] = 'You ~g~hired ~b~',
      ['you_hired2'] = '~g~~w~!',
      ['already_hired'] = '~r~Already hired!~w~',
      ['is_already_hired'] = ' is already ~r~hired~w~!',
      ['fired'] = '~r~Fired~w~!',
      ['you_are_fired'] = 'You were ~r~fired~w~!',
      ['you_fired'] = 'You ~r~fired ~b~',
      ['you_fired2'] = '~r~~w~!',
      ['error'] = '~r~Error~w~!',
      ['player_not_online'] = 'This ~b~player~w~ is not online!',
      ['promoted'] = '~g~Promoted~w~!',
      ['you_were_promoted'] = 'You were ~b~promoted ~s~to~b~',
      ['you_were_promoted2'] = '~g~~w~!',
      ['you_promoted'] = 'You ~b~promoted ~b~',
      ['you_promoted2'] = '~w~ to ~b~',
      ['you_promoted3'] = '~g~~w~!',
      ['ring_ring'] = '~b~There is a ~w~customer waiting ~b~at the dealership!',
      ['vehicle_purchased'] = '~g~Vehicle purchased~w~!',
      ['you_purchased'] = 'You got a ',
      ['you_purchased2'] = ', with the number plate ',
      ['you_purchased3'] = ' ~g~',
      ['vehicle_sold'] = '~g~Vehicle sold~w~!',
      ['you_sold'] = 'You sold a ',
      ['you_sold2'] = ' ~g~',
      ['vehicle_ordered'] = '~g~Vehicle ordered~w~!',
      ['you_ordered'] = 'You ~g~ordered ',
      ['you_ordered2'] = ' ~s~. In total you ~g~ordered ',
      ['you_ordered3'] = 'x ~s~!',
      ['you_applied'] = 'You ~g~reserved ',
      ['you_applied2'] = ' ~s~. In total you ~g~reserved ',
      ['you_applied3'] = 'x ~s~!',
      ['not_enough_money'] = 'There is ~r~not enough money~s~ on your society wallet!',
      ['vehicle_delivered_dealership'] = 'Vehicles ~g~Successfully Delivered to Dealership~s~!',
      ['vehicle_delivered_Storage'] = 'Vehicles ~g~Successfully Delivered to Storage~s~!',
      ['not_enough_vehicles_in_storage'] = 'There are not enough vehicles in the large warehouse',
      ['presented_prefix'] = '~y~Displayed: ~s~',
      ['insert_new_value'] = 'Insert a new value',
      ['click_to_change'] = '~b~click to change the value',
      ['not_enough_money_player'] = '~r~Not enough money!',
      ['required_order_time'] = 'Required manufacturing time:',
  ['customer_not_enough_money'] = '~r~The customer does not have enough money!',
  },
  ['de'] = {
      ['ring_infobar'] = 'Drücke ~b~E~s~ um einen Verkäufer zu rufen',
      ['showroom_infobar'] = 'Drücke ~b~E~w~, um den ~o~Showroom~w~ zu öffnen!',
      ['boss_infobar'] = 'Drücke ~b~E~w~, um das ~o~Boss Menü~w~ zu öffnen!',
      ['wardrobe_infobar'] = 'Drücke ~b~E~w~, um die ~o~Umkleide~w~ zu öffnen!',
      ['garage_infobar'] = 'Drücke ~b~E~w~, um die ~o~Garage~w~ zu öffnen!',
      ['computer_infobar'] = 'Drücke ~b~E~w~, um den ~o~Computer~w~ zu öffnen!',
      ['delete_vehicle'] = 'Drücke ~b~E~w~, um das ~o~einzuparken~w~!',
      ['wardrobe'] = 'Umkleide',
      ['private_clothes'] = 'Privatkleidung',
      ['bossmenu'] = 'Boss Menü',
      ['finance_management'] = 'Finanzverwaltung',
      ['staff'] = 'Personal',
      ['society_money'] = 'Firmenkonto',
      ['withdraw_money'] = 'Firmengeld abheben',
      ['deposit_money'] = 'Firmengeld einzahlen',
      ['withdraw_desc'] = 'Willst du ~g~Geld~w~ vom Firmenkonto abheben?',
      ['deposit_desc'] = 'Willst du ~g~Geld~w~ auf das Firmenkonto einzaheln?',
      ['how_much'] = 'Wie viel?',
      ['company_money'] = 'Firmenkonto',
      ['unknown_amount'] = '~r~Ungültiger Betrag!',
      ['deposit_msg'] = 'Du hast ~g~',
      ['deposit_msg2'] = ' $~w~ auf das Firmenkonto eingezahlt',
      ['withdraw_msg'] = 'Du hast ~g~',
      ['withdraw_msg2'] = ' $~w~ vom Firmenkonto abgehoben',
      ['hire'] = 'Mitarbeiter einstellen',
      ['staff_management'] = 'Mitarbeiterverwaltung',
      ['job_rank'] = 'Rang:',
      ['fire'] = '~r~Feuern',
      ['fire_msg'] = 'Willst du ~b~',
      ['fire_msg2'] = '~w~ ~r~feuern~w~?',
      ['promote'] = 'Befördern',
      ['promote_msg'] = 'Willst du ~b~',
      ['promote_msg2'] = '~w~ zum ~b~',
      ['promote_msg3'] = ' ~g~befördern~w~?',
      ['showroom'] = 'Showroom',
      ['change_color'] = '~b~Farbe ändern',
      ['primary_color'] = 'Primärfarbe',
      ['primary_color_msg'] = 'Als Primärfarbe setzen',
      ['secondary_color'] = 'Sekundärfarbe',
      ['secondary_color_msg'] = 'Als Sekundärfarbe setzen',
      ['pearl'] = 'Pearl-Effekt',
      ['pearl_msg'] = 'Als Pearl-Effekt setzen',
      ['show_manufacturer'] = 'Hersteller:',
      ['show_price'] = 'Preis:',
      ['show_model'] = 'Model:',
      ['show_park_item'] = 'Fahrzeug ausstellen',
      ['show_performance'] = 'Pferdestärke:',
      ['show_maxSpeed'] = 'Höchst Geschwindigkeit:',
      ['show_speedup'] = 'Beschleunigung 0-100:',
      ['show_modifications'] = 'Mögliche Modifikationen:',
      ['show_fuelcapacity'] = 'Tankkapazität:',
      ['show_suffix_performance'] = ' PS',
      ['show_suffix_maxSpeed'] = ' km/h',
      ['show_suffix_speedup'] = ' Sekunden',
      ['show_suffix_modifications'] = ' Teile',
      ['show_suffix_fuelcapacity'] = ' Liter',
      ['test_drive'] = '~b~Fahrzeug zur Probefahrt bereitstellen',
      ['amount_cardealer'] = 'Bestand im Autohaus:',
      ['amount_storage'] = 'Bestand im Lager:',
      ['set_to_showroom'] = 'Fahrzeug ausstellen',
      ['amount_cars'] = ' Exemplare',
      ['computer'] = 'Computer',
      ['sell_vehicle'] = 'Fahrzeug verkaufen',
      ['show_1'] = 'Stellplatz 1',
      ['show_2'] = 'Stellplatz 2',
      ['show_3'] = 'Stellplatz 3',
      ['show_4'] = 'Stellplatz 4',
      ['show_abort'] = 'Abbrechen',
      ['yes'] = 'Ja',
      ['no'] = 'Nein',
      ['car_sell'] = ' verkaufen',
      ['bill_purchase_of'] = 'Kauf von einem ',
      ['dialog_price'] = 'Preis',
      ['no_customers'] = '~r~Keine Kunden!',
      ['vehicles_list'] = 'Fahrzeugliste',
      ['car_deliver'] = 'Fahrzeug liefern lassen für: ',
      ['car_craft'] = 'Fahrzeug herstellen lassen für: ',
      ['amount'] = 'Menge',
      ['ordered'] = 'Bestellt: ',
      ['reserved'] = 'Beantragt: ',
      ['orders'] = 'Bestellungen',
      ['total_production_time'] = 'Verbleibende Produktionszeit:',
      ['current_production_time'] = 'Offene Aufträge:',
      ['refresh_time'] = 'Zeit aktualisieren',
      ['hours'] = ' Stunden',
      ['hired'] = '~g~Eingestellt~w~!',
      ['you_were_hired'] = 'Du wurdest ~g~eingestellt!~w~',
      ['you_hired'] = 'Du hast ~b~',
      ['you_hired2'] = ' ~g~eingestellt~w~!',
      ['already_hired'] = '~r~Schon Angestellt!~w~',
      ['is_already_hired'] = ' ist schon bei dir ~r~angestellt~w~!',
      ['fired'] = '~r~Gefeuert~w~!',
      ['you_are_fired'] = 'Du wurdest ~r~gefeuert~w~!',
      ['you_fired'] = 'Du hast ~b~',
      ['you_fired2'] = ' ~r~gefeuert~w~!',
      ['error'] = '~r~Error~w~!',
      ['player_not_online'] = 'Der ~b~Spieler~w~ ist nicht online!',
      ['promoted'] = '~g~Befördert~w~!',
      ['you_were_promoted'] = 'Du wurdest zum ~b~',
      ['you_were_promoted2'] = ' ~g~befördert~w~!',
      ['you_promoted'] = 'Du hast ~b~',
      ['you_promoted2'] = '~w~ zum ~b~',
      ['you_promoted3'] = ' ~g~befördert~w~!',
      ['ring_ring'] = '~b~Ein Kunde wartet im Autohaus!',
      ['vehicle_purchased'] = '~g~Fahrzeug gekauft~w~!',
      ['you_purchased'] = 'Du hast ein ',
      ['you_purchased2'] = ', mit dem Nummernschild ',
      ['you_purchased3'] = ' ~g~gekauft',
      ['vehicle_sold'] = '~g~Fahrzeug verkauft~w~!',
      ['you_sold'] = 'Du hast ein ',
      ['you_sold2'] = ' ~g~verkauft',
      ['vehicle_ordered'] = '~g~Fahrzeug bestellt~w~!',
      ['you_ordered'] = 'Du hast ',
      ['you_ordered2'] = ' ~g~bestelt~s~. Insgesamt hast du ',
      ['you_ordered3'] = 'x ~g~bestellt~s~!',
      ['you_applied'] = 'Du hast ',
      ['you_applied2'] = ' ~g~beantragt~s~. Insgesamt hast du ',
      ['you_applied3'] = 'x ~g~beantragt~s~!',
      ['not_enough_money'] = 'Es ist ~r~zu wenig Geld~s~ auf dem Firmenkonto, um die Fahrzeuge zu bezahlen!',
      ['vehicle_delivered'] = 'Fahrzeuge ~g~erfolgreich geliefert~s~!',
      ['not_enough_vehicles_in_storage'] = 'Es sind nicht so viele Fahrzeuge im Hauptlager',
      ['presented_prefix'] = '~y~Ausgestellt: ~s~',
      ['insert_new_value'] = 'Gebe einen neuen Wert ein',
      ['click_to_change'] = '~b~Klicke, um die Werte zu aktualisieren',
      ['not_enough_money_player'] = '~r~Nicht genügend Geld!',
      ['required_order_time'] = 'Benötigte Zeit zur Herstellung:',
  ['customer_not_enough_money'] = '~r~Der Kunde hat nicht genügend Geld!',
  },
}

Cfg.Colors = {
['black'] = 'black',
['graphite'] = 'graphite',
['black_metallic'] = 'black Metallic',
['caststeel'] = 'cast Steel',
['black_anth'] = 'black Anthracite',
['matteblack'] = 'matte Black',
['darknight'] = 'dark Night',
['deepblack'] = 'deep Black',
['oil'] = 'oil',
['carbon'] = 'carbon',
-- White
['white'] = 'white',
['vanilla'] = 'vanilla',
['creme'] = 'creme',
['polarwhite'] = 'polar White',
['beige'] = 'beige',
['mattewhite'] = 'matte White',
['snow'] = 'snow',
['cotton'] = 'cotton',
['alabaster'] = 'alabaster',
['purewhite'] = 'pure White',
-- Grey
['grey'] = 'grey',
['silver'] = 'silver',
['metallicgrey'] = 'metallic Grey',
['laminatedsteel'] = 'laminated Steel',
['darkgray'] = 'dark Grey',
['rockygray'] = 'rocky Grey',
['graynight'] = 'gray Night',
['aluminum'] = 'aluminum',
['graymat'] = 'matte Grey',
['lightgrey'] = 'light Grey',
['asphaltgray'] = 'asphalt Grey',
['grayconcrete'] = 'concrete Grey',
['darksilver'] = 'dark Silver',
['magnesite'] = 'magnesite',
['nickel'] = 'nickel',
['zinc'] = 'zinc',
['dolomite'] = 'dolomite',
['bluesilver'] = 'blue Silver',
['titanium'] = 'titanium',
['steelblue'] = 'steel Blue',
['champagne'] = 'champagne',
['grayhunter'] = 'grey Hunter',
-- Red
['red'] = 'red',
['torino_red'] = 'torino Red',
['poppy'] = 'poppy',
['copper_red'] = 'copper Red',
['cardinal'] = 'cardinal Red',
['brick'] = 'brick Red',
['garnet'] = 'Garnet',
['cabernet'] = 'cabernet Red',
['candy'] = 'candy Red',
['matte_red'] = 'matte Red',
['dark_red'] = 'dark Red',
['red_pulp'] = 'red Pulp',
['bril_red'] = 'brilliant Red',
['pale_red'] = 'pale Red',
['wine_red'] = 'wine Red',
['volcano'] = 'Volcano',
-- Pink
['pink'] = 'pink',
['electricpink'] = 'electric Pink',
['brightpink'] = 'bright Pink',
['salmon'] = 'salmon',
['sugarplum'] = 'sugar Plum',
-- Blue
['blue'] = 'blue',
['topaz'] = 'topaz',
['light_blue'] = 'light Blue',
['galaxy_blue'] = 'galaxy Blue',
['dark_blue'] = 'dark Blue',
['azure'] = 'azure',
['navy_blue'] = 'navy Blue',
['lapis'] = 'lapis Lazuli',
['blue_diamond'] = 'blue Diamond',
['surfer'] = 'surfer',
['pastel_blue'] = 'pastel Blue',
['celeste_blue'] = 'celeste Blue',
['rally_blue'] = 'rally Blue',
['blue_paradise'] = 'blue Paradise',
['blue_night'] = 'blue Night',
['cyan_blue'] = 'cyan Blue',
['cobalt'] = 'cobalt',
['electric_blue'] = 'electric Blue',
['horizon_blue'] = 'horizon Blue',
['metallic_blue'] = 'metallic Blue',
['aquamarine'] = 'aquamarine',
['blue_agathe'] = 'blue Agathe',
['zirconium'] = 'zirconium',
['spinel'] = 'spinel',
['tourmaline'] = 'tourmaline',
['paradise'] = 'paradise',
['bubble_gum'] = 'bubble Gum',
['midnight_blue'] = 'midnight Blue',
['forbidden_blue'] = 'forbidden Blue',
['glacier_blue'] = 'glacier Blue',
-- Yellow
['yellow'] = 'yellow',
['wheat'] = 'wheat',
['raceyellow'] = 'race Yellow',
['paleyellow'] = 'pale Yellow',
['lightyellow'] = 'light Yellow',
-- Green
['green'] = 'green',
['met_dark_green'] = 'metallic Dark Green',
['rally_green'] = 'Rally Green',
['pine_green'] = 'pine Green',
['olive_green'] = 'olive Green',
['light_green'] = 'Light Green',
['lime_green'] = 'lime green',
['forest_green'] = 'forest Green',
['lawn_green'] = 'lawn Green',
['imperial_green'] = 'imperial Green',
['green_bottle'] = 'breen Bottle',
['citrus_green'] = 'citrus Green',
['green_anis'] = 'green Anis',
['khaki'] = 'Khaki',
['army_green'] = 'army Green',
['dark_green'] = 'dark Green',
['hunter_green'] = 'hunter Green',
['matte_foilage_green'] = 'matte Foilage Green',
-- Orange
['orange'] = 'orange',
['tangerine'] = 'Tangerine',
['matteorange'] = 'Matte Orange',
['lightorange'] = 'Light Orange',
['peach'] = 'Peach',
['pumpkin'] = 'Pumpkin',
['orangelambo'] = 'Orange Lambo',
-- Brown
['brown'] = 'brown',
['copper'] = 'Copper',
['lightbrown'] = 'Light Brown',
['darkbrown'] = 'Dark Brown',
['bronze'] = 'Bronze',
['brownmetallic'] = 'Brown Metallic',
['espresso'] = 'Espresso',
['chocolate'] = 'Chocolate',
['terracotta'] = 'Terracotta',
['marble'] = 'Marble',
['sand'] = 'Sand',
['sepia'] = 'Sepia',
['bison'] = 'Bison',
['palm'] = 'Palm',
['caramel'] = 'Caramel',
['rust'] = 'Rust',
['chestnut'] = 'Chestnut',
['hazelnut'] = 'Hazelnut',
['shell'] = 'Shell',
['mahogany'] = 'Mahogany',
['cauldron'] = 'Cauldron',
['blond'] = 'Blond',
['gravel'] = 'Gravel',
['darkearth'] = 'Dark Earth',
['desert'] = 'Desert',
-- Purple
['purple'] = 'purple',
['indigo'] = 'Indigo',
['deeppurple'] = 'Deep Purple',
['darkviolet'] = 'Dark Violet',
['amethyst'] = 'Amethyst',
['mysticalviolet'] = 'Mystic Violet',
['purplemetallic'] = 'Purple Metallic',
['matteviolet'] = 'Matte Violet',
['mattedeeppurple'] = 'Matte Deep Purple',
-- Chrome
['chrome'] = 'chrome',
['brushedchrome'] = 'brushed Chrome',
['blackchrome'] = 'black Chrome',
['brushedaluminum'] = 'brushed Aluminum',
-- Metal
['gold'] = 'gold',
['puregold'] = 'pure Gold',
['brushedgold'] = 'brushed Gold',
['lightgold'] = 'light Gold',
}