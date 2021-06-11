Cfg = {}
Translation = {}
-----------ATTENTION OASIS CAR DEALERS MAKE SURE YOU READ EVERYTHING IN THE COMMENTED SECTION LIKE THIS----------------
Cfg.Locale = 'en'

Cfg.useOneSyncInfinity = false

Cfg.DeliveryTime = {h = 18, m = 00} -- When should ordered vehicles arrive at the cardealer IN GAME TIME
--consult with GRIZZY for what to put where it says 'cardealer'
Cfg.Society_Name = 'society_src'
Cfg.society = 'src' -- = Job MySQLName
Cfg.Society = 'src'
Cfg.NotificationPicture = 'CHAR_CARSITE2'
----Company Name is the name of your business----
Cfg.CompanyName = 'src'
Cfg.GaragePed = 's_m_y_xmech_01'
--the plate that shows on the car when taken for a test drive--
Cfg.NumberPlate = 'SRC TEST'

-- DO NOT TOUCH
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
    {x = 1766.58, y = 3318.67, z = 41.44}
  },

  Boss = {
    {x = 1765.30, y = 3321.07, z = 41.44}
  },

  Garage = {
    {x = 1761.83, y = 3325.30, z = 41.42, rot = 124.12, spawn = {x = 1774.25, y = 3333.26, z = 40.81, rot = 300.83}}
  },

  DeSpawn = {
    {x = 1771.95, y = 3315.05, z = 41.38}
  },

  Ring = {
    {x = 1777.78, y = 3325.12, z = 41.43}
  },

  Computer = {
    {x = 1769.55, y = 3323.53, z = 41.44, spawn = {x = 1774.25, y = 3333.26, z = 40.81, rot = 300.83}}
  },

  Showrooms = {
      {
          spawn = {x = 1774.58, y = 3323.70, z = 40.93, rot = 145.91}, 
          menu = {x = 1773.52, y = 3322.55, z = 41.43},
          ChangeColor = true,
          spawn2 = {x = 1774.25, y = 3333.26, z = 40.81, rot = 300.83},
      },
      {
          spawn = {x = 1772.59, y = 3328.58, z = 40.93, rot = 325.45}, 
          menu = {x = 1771.84, y = 3328.85, z = 41.44},
          ChangeColor = true,
          spawn2 = {x = 1774.25, y = 3333.26, z = 40.81, rot = 300.83},
      },
      {
          spawn = {x = 1767.98, y = 3326.75, z = 40.91, rot = 8.04}, 
          menu = {x = 1767.77, y = 3328.12, z = 41.44},
          ChangeColor = true,
          spawn2 = {x = 1774.25, y = 3333.26, z = 40.81, rot = 300.83},
      },
      {
          spawn = {x = 1764.83, y = 3325.16, z = 40.90, rot = 0.62}, 
          menu = {x = 1764.84, y = 3326.60, z = 41.44},
          ChangeColor = true,
          spawn2 = {x = 1774.25, y = 3333.26, z = 40.81, rot = 300.83},
      },
      {
          spawn = {x = 1769.24, y = 3334.60, z = 40.92, rot = 265.98}, 
          menu = {x = 1769.19, y = 3333.66, z = 41.44},
          ChangeColor = true,
          spawn2 = {x = 1774.25, y = 3333.26, z = 40.81, rot = 300.83},
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
--consult Grizzy for your Cardealer job rankings MUST MATCH SQL--
Cfg.Grades = {
  {number = 0, label = 'Trainee Salesperson'},
  {number = 1, label = 'Salesperson'},
  {number = 2, label = 'Master Salesperson'},
  {number = 3, label = 'Boss'},
}
-- the blip that shows on the map DO NOT EDIT UNLESS YOU'RE FAMILIAR WITH THE VALUES --
-- Name change the name displayed on the blip to match your business.
Cfg.MapBlip = {
  {
      Pos     	= {x = 1766.67, y = 3329.43, z = 41.76},
      Sprite  	= 226,
      Display	    = 4,
      Scale  	    = 0.75,
      Colour  	= 76,
      Name        = 'Soul Reapers Customs',
      OnlyHasJob  = false
  },
}
-- Uniforms for the different job grades--
------MUST MATCH SQL JOB RANKINGS---------
Cfg.Clothes = {
  {
      name = 'Boss',
      grade = 3,
      Male = {
        Mask = {id = 121, id2 = 0},
        Arms = {id = 30, id2 = 0},
        Leg = {id = 25, id2 = 0},
        bag = {id = 0, id2 = 0},
        Shoes = {id = 21, id2 = 0},
        Accessory = {id = 11, id2 = 2},
        Tshirt = {id = 13, id2 = 2},
        Kevlar = {id = 0, id2 = 0},
        Badge = {id = 0, id2 = 0},
        Torso = {id = 60, id2 = 2},
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
          Torso = {id = 53, id2 = 2},
          Watch = {id = 1, id2 = 0},
          Hat = {id = -1, id2 = 0},
          Glass = {id = -1, id2 = 3},
          Ear = {id = -1, id2 = 2}
      }
  },
  {
      name = 'Trainee Salesperson',
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
      name = 'Salesperson',
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
      name = 'Master Salesperson',
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
}
---- DO NOT EDIT HERE UNLESS YOU KNOW WHAT TO TOUCH AND NOT TO TOUCH
Translation = {
  ['en'] = {
      ['ring_infobar'] = 'Press ~b~E~s~ to notify a SRC Salesperson',
      ['showroom_infobar'] = 'Press ~b~E~w~, to access the ~o~Showroom~w~!',
      ['boss_infobar'] = 'Press ~b~E~w~, to access the ~o~Boss Menu~w~!',
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
      ['no_customers'] = '~r~There is no customer next to you!',
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
      ['vehicle_delivered'] = 'Vehicles ~g~successfully delivered~s~!',
      ['not_enough_vehicles_in_storage'] = 'There are not enough vehicles in the large warehouse',
      ['presented_prefix'] = '~y~Displayed: ~s~',
      ['insert_new_value'] = 'Insert a new value',
      ['click_to_change'] = '~b~click to change the value',
      ['not_enough_money_player'] = '~r~Not enough money!',
      ['required_order_time'] = 'Required manufacturing time:',
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
  },
}
-- DO NOT EDIT THIS PERIOD----
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
