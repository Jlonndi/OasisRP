-------------------------------------
------- Created by T1GER#9080 -------
------------------------------------- 

Config = {}

Config.ESXSHAREDOBJECT = 'esx:getSharedObject'
Config.ItemLabelESX	= true	-- set to false if your ESX vers. doesn't support this

-- Buttons:
Config.KeyToManageShop			= 38		-- Default: [E]
Config.KeyToBuyMechShop			= 38		-- Default: [E]		
Config.KeyToPushPickUpObjs 		= 305		-- Set key to push or pick up/place props in prop emotes
Config.KeyToMechActionMenu 		= 289		-- Default: [F2]

-- General Settings:
Config.PurchasableMechBlip 	    = true		-- Blip to show mechanic shops forsale
Config.PayMechShopWithCash		= true		-- Set to false to pay mech shop with bank
Config.RecieveSoldMechShopCash	= true		-- Set to false to receive bank money on sale of drug lab
Config.SellPercent				= 0.75		-- Means player gets 75% in return from original paid price
Config.BillingToMechAccount		= true		-- Set to false to let the mechanic keep all the money from the billing.
Config.BillingPercentToAcc		= 0.70		-- Set percantage of billing (0.50 means 50%) amount to go to mechanic shop account, works only if BillingToMechAccount is set to true.

-- Vehicle Damage Snippet:
Config.UseKMH 					= false		-- Set to false to use MPH system for calculations with speed.
Config.SlashTires				= false		-- Set to false to disable slashing random tires, upon vehicle collision. 
Config.EngineDisable			= false		-- Set to false to disable engine being disabled, upon vehicle collision.
Config.WaitCountForHealth		= 30		-- Set amount of seconds to wait, until health part damage effects applies to vehicle.
Config.AmountPartsDamage		= 3			-- Set amount of parts to take damage, upon crash. Default; 3 parts.
Config.DegradeValue = {min = 5, max = 20}	-- Set min and max degrade value, upon crash. 5 is 0.5, 25 is 2.5. Between 0 and 100.

Config.MechanicShops = {
        --auto exotica
		[1] = {	
			price = 650000,
			menuPos = {542.51,-200.47,54.49},  
			storage = {549.62,-168.47,54.49},
			workbench = {546.51,-166.66,54.49},
			lifts = {
				[1] = {
					entry = {545.25,-189.18,53.83,90.89},
					pos = {545.25,-189.18,53.83,90.89},
					control = {550.29,-188.63,54.49,85.33},
					marker = {enable = true, drawDist = 6.0, type = 36, scale = {x = 0.4, y = 0.4, z = 0.4}, color = {r = 240, g = 52, b = 52, a = 100}},
					minValue = 53.83, maxValue = 55.50,
					currentVeh = nil,
					inUse = false,
					player = nil
				},	
				[2] = {
					entry = {548.08,-175.59,53.83,139.52},
					pos = {548.08,-175.59,53.83,139.52},
					control = {548.63,-172.28,54.48,165.50},
					marker = {enable = true, drawDist = 6.0, type = 36, scale = {x = 0.4, y = 0.4, z = 0.4}, color = {r = 240, g = 52, b = 52, a = 100}},
					minValue = 53.83, maxValue = 55.50,
					currentVeh = nil,
					inUse = false,
					player = nil
				},	
				[3] = {
					entry = {541.98,-168.71,53.83,90.33},
					pos = {541.98,-168.71,53.83,90.33},
					control = {543.36,-165.80,54.48,190.84},
					marker = {enable = true, drawDist = 6.0, type = 36, scale = {x = 0.4, y = 0.4, z = 0.4}, color = {r = 240, g = 52, b = 52, a = 100}},
					minValue = 53.83, maxValue = 55.50,
					currentVeh = nil,
					inUse = false,
					player = nil
				},
			},
		},
		  --Dio's
	[2] = { 
		price = 1000000,
		menuPos = {-241.45,-1327.60,30.90},
		storage = {-241.95,-1333.33,30.90},
		workbench = {-242.08,-1338.51,30.90},
		lifts = {
			[1] = {
				entry = {-227.39,-1324.86,30.9,180.00},
				pos = {-227.38,-1322.48,30.14,180.00},
				control = {-229.58,-1322.47,30.9,265.00},
				marker = {enable = true, drawDist = 8.0, type = 36, scale = {x = 0.4, y = 0.4, z = 0.4}, color = {r = 240, g = 52, b = 52, a = 100}},
				minValue = 30.30, maxValue = 32.50,
				currentVeh = nil,
				inUse = false,
				player = nil
			},	
			[2] = {
				entry = {-234.48,-1323.29,30.9,270.00},
				pos = {-237.06,-1322.88,30.9,270.00},
				control = {-236.64,-1325.14,30.9,15.73},
				marker = {enable = true, drawDist = 8.0, type = 36, scale = {x = 0.4, y = 0.4, z = 0.4}, color = {r = 240, g = 52, b = 52, a = 100}},
				minValue = 30.30, maxValue = 32.50,
				currentVeh = nil,
				inUse = false,
				player = nil
			},	
			[3] = {
				entry = {-234.58,-1329.4,30.9,270.00},
				pos = {-236.83,-1329.24,30.9,270.00},
				control = {-236.56,-1331.49,30.9,14},
				marker = {enable = true, drawDist = 8.0, type = 36, scale = {x = 0.4, y = 0.4, z = 0.4}, color = {r = 240, g = 52, b = 52, a = 100}},
				minValue = 30.30, maxValue = 32.50,
				currentVeh = nil,
				inUse = false,
				player = nil
			},	
			[4] = {
				entry = {-238.35,-1336.35,30.9,359.99},
				pos = {-238.38,-1338.67,30.9,359.99},
				control = {-236.13,-1337.83,30.9,110.6},
				marker = {enable = true, drawDist = 8.0, type = 36, scale = {x = 0.4, y = 0.4, z = 0.4}, color = {r = 240, g = 52, b = 52, a = 100}},
				minValue = 30.30, maxValue = 32.50,
				currentVeh = nil,
				inUse = false,
				player = nil
			},

		},
	},
         --Noah's
	[3] = {
       		price = 1100000,
        	menuPos = {-345.29,-110.49,39.02},
        	storage = {-328.23,-157.55,39.02},
 	       workbench = {-322.04,-146.25,39.02},
 	       lifts = {
                 [1] = {
                	 entry = {-326.67,-144.38,38.56,70.73},
                	 pos = {-326.67,-144.38,38.56,70.73},
                	 control = {-324.06,-147.30,39.02,67.34},
                	 marker = {enable = true, drawDist = 6.0, type = 36, scale = {x = 0.4, y = 0.4, z = 0.4}, color = {r = 240, g = 52, b = 52, a = 100}},
                	 minValue = 38.3, maxValue = 40.3,
                	 currentVeh = nil,
                	 inUse = false,
                	 player = nil
            },
                 [2] = {
               		 entry = {-323.02,-134.06,38.56,69.71},
              		 pos = {-323.02,-134.06,38.56,69.71},
             		 control = {-320.37,-136.81,39.02,72.57},
             		 marker = {enable = true, drawDist = 6.0, type = 36, scale = {x = 0.4, y = 0.4, z = 0.4}, color = {r = 240, g = 52, b = 52, a = 100}},
             		 minValue = 38.56, maxValue = 40.56,
              		 currentVeh = nil,
             		 inUse = false,
              		 player = nil
            },
                 [3] = {
                	 entry = {-319.23,-123.72,38.56,70.22},
                	 pos = {-319.23,-123.72,38.56,70.22},
                	 control = {-316.52,-126.72,39.02,65.18},
                	 marker = {enable = true, drawDist = 6.0, type = 36, scale = {x = 0.4, y = 0.4, z = 0.4}, color = {r = 240, g = 52, b = 52, a = 100}},
                	 minValue = 38.56, maxValue = 40.56,
                	 currentVeh = nil,
                	 inUse = false,
                	 player = nil            
            },
                 [4] = {
                	 entry = {-315.87,-113.13,38.56,70.07},
                	 pos = {-315.87,-113.13,38.56,70.07},
                	 control = {-312.6,-116.24,39.02,76.38},
                	 marker = {enable = true, drawDist = 6.0, type = 36, scale = {x = 0.4, y = 0.4, z = 0.4}, color = {r = 240, g = 52, b = 52, a = 100}},
                	 minValue = 38.56, maxValue = 40.56,
                	 currentVeh = nil,
                	 inUse = false,
                	 player = nil
            },
                 [5] = {
                	 entry = {-311.87,-102.93,38.56,70.38},
                	 pos = {-311.87,-102.93,38.56,70.38},
                	 control = {-309.08,-106.1,39.02,60.49},
                	 marker = {enable = true, drawDist = 6.0, type = 36, scale = {x = 0.4, y = 0.4, z = 0.4}, color = {r = 240, g = 52, b = 52, a = 100}},
                	 minValue = 38.56, maxValue = 40.56,
                	 currentVeh = nil,
                	 inUse = false,
                	 player = nil
           },
				[6] = {
					entry = {-339.19,-95.02,39.07,248.92},
					pos = {-339.19,-95.02,39.07,248.92},
					control = {-336.83,-90.58,39.02,187.34},
					marker = {enable = true, drawDist = 6.0, type = 36, scale = {x = 0.4, y = 0.4, z = 0.4}, color = {r = 240, g = 52, b = 52, a = 100}},
					minValue = 39.07, maxValue = 40.07,
					currentVeh = nil,
					inUse = false,
					player = nil
			},
        },
    },
	      --Soul Reapers Mech
		  [4] = {
			price = 600000,
			menuPos = {1765.73,3332.84,41.44},
			workbench = {1761.89,3331.19,41.44},
			storage = {1763.40,3324.77,41.44},
		 lifts = {
			[1] = {
					entry = {1750.80,3313.55,40.61,328.54},
					pos = {1750.80,3313.55,40.61,328.54},
					control = {1751.60,3311.96,41.14,332.80},
					marker = {enable = true, drawDist = 6.0, type = 36, scale = {x = 0.4, y = 0.4, z = 0.4}, color = {r = 240, g = 52, b = 52, a = 100}},
					minValue = 41.14, maxValue = 42.50,
					currentVeh = nil,
					inUse = false,
					player = nil
		 },
			[2] = {
					entry = {1748.81,3318.12,40.76,241.89},
					pos = {1748.81,3318.12,40.76,241.89},
					control = {1747.97,3316.84,41.24,273.95},
					marker = {enable = true, drawDist = 6.0, type = 36, scale = {x = 0.4, y = 0.4, z = 0.4}, color = {r = 240, g = 52, b = 52, a = 100}},
					minValue = 41.14, maxValue = 42.50,
					currentVeh = nil,
					inUse = false,
					player = nil
		 },
	   		[3] = {
					entry = {1750.25,3333.47,40.64,205.26},
					pos = {1750.25,3333.47,40.64,205.26},
					control = {1748.33,3333.27,41.13,231.21},
					marker = {enable = true, drawDist = 6.0, type = 36, scale = {x = 0.4, y = 0.4, z = 0.4}, color = {r = 240, g = 52, b = 52, a = 100}},
					minValue = 41.14, maxValue = 42.50,
					currentVeh = nil,
					inUse = false,
					player = nil
		 },
	   		[4] = {
                	 entry = {1768.47,3341.46,41.21,307.26},
                	 pos = {1768.47,3341.46,41.21,307.26},
                	 control = {1769.64,3337.43,41.43,191.14},
                	 marker = {enable = true, drawDist = 6.0, type = 36, scale = {x = 0.4, y = 0.4, z = 0.4}, color = {r = 240, g = 52, b = 52, a = 100}},
                	 minValue = 40.95, maxValue = 42.95,
                	 currentVeh = nil,
                	 inUse = false,
                	 player = nil
			},

		},
	},
	--bpm
	[5] = {	
		price = 750000,
		menuPos = {935.24,-983.49,39.50},  
		storage = {931.79,-983.20,39.50},
		workbench = {921.96,-985.97,39.50},
		lifts = {
			[1] = {
				entry = {927.22,-979.89,39.20,4.41},
				pos = {927.22,-979.89,39.20,4.41},
				control = {929.33,-979.67,39.20,4.41},
				marker = {enable = true, drawDist = 6.0, type = 36, scale = {x = 0.4, y = 0.4, z = 0.4}, color = {r = 240, g = 52, b = 52, a = 100}},
				minValue = 39.20, maxValue = 41.20,
				currentVeh = nil,
				inUse = false,
				player = nil
			},	
			[2] = {
				entry = {921.54,-980.36,39.20,4.41},
				pos = {921.54,-980.36,39.20,4.41},
				control = {923.52,-980.29,39.20,4.41},
				marker = {enable = true, drawDist = 6.0, type = 36, scale = {x = 0.4, y = 0.4, z = 0.4}, color = {r = 240, g = 52, b = 52, a = 100}},
				minValue = 39.20, maxValue = 41.20,
				currentVeh = nil,
				inUse = false,
				player = nil
			},	
			[3] = {
				entry = {916.08,-981.02,39.20,4.41},
				pos = {916.08,-981.02,39.20,4.41},
				control = {918.36,-980.92,39.20,4.41},
				marker = {enable = true, drawDist = 6.0, type = 36, scale = {x = 0.4, y = 0.4, z = 0.4}, color = {r = 240, g = 52, b = 52, a = 100}},
				minValue = 39.20, maxValue = 41.20,
				currentVeh = nil,
				inUse = false,
				player = nil
			},
		},
	},
}
-- Blip Settings:
Config.BlipSettings = { enable = true, sprite = 446, display = 4, scale = 0.65 } 

-- Marker settings::
Config.MarkerSettings = { enable = true, drawDist = 10.0, type = 20, scale = {x = 0.7, y = 0.7, z = 0.7}, color = {r = 240, g = 52, b = 52, a = 100} }

-- Repair Kit:
Config.RepairKits = {
	[1] = { label = "Repair Kit", item = "repairkit", chanceToKeep = 50, repairTime = 5000, progbar = Lang['repairing_veh_kit'] },
	[2] = { label = "Adv Reapir Kit", item = "advrepairkit", chanceToKeep = 80, repairTime = 3000, progbar = Lang['repairing_veh_kit'] },
}

-- Item name for carjack:
Config.CarJackItem = "carjack"

-- BODY PARTS FOR VEHICLE REPAIR:
Config.BodyParts = {
	[1] = {item = "car_door", prop = "prop_car_door_01", pos = {0.0, 0.0, 0.0}, rot = {0.0, 0.0, 0.0}},
	[2] = {item = "car_hood", prop = "prop_car_bonnet_01", pos = {0.0, 0.0, 0.0}, rot = {0.0, 0.0, 0.0}},
	[3] = {item = "car_trunk", prop = "prop_car_bonnet_02", pos = {0.0, 0.0, 0.0}, rot = {0.0, 0.0, 0.0}},
	[4] = {item = "car_wheel", prop = "prop_wheel_03", pos = {0.0, 0.0, 0.0}, rot = {0.0, 0.0, 0.0}},
}

-- CRAFTING PART:
Config.CraftTime = 4		-- set time in seconds, to craft item.

Config.Workbench = {
	[1] = {
		label = "Door", item = "car_door", 
		recipe = { [1] = {id = 2, qty = 5}, [2] = {id = 1, qty = 2}, [3] = {id = 4, qty = 4}, [4] = {id = 5, qty = 2} }
	},
	[2] = {
		label = "Hood", item = "car_hood", 
		recipe = { [1] = {id = 2, qty = 3}, [2] = {id = 4, qty = 2}, [3] = {id = 5, qty = 1} }
	},
	[3] = {
		label = "Trunk", item = "car_trunk", 
		recipe = { [1] = {id = 2, qty = 2}, [2] = {id = 1, qty = 1}, [3] = {id = 4, qty = 2}, [4] = {id = 3, qty = 1}, [5] = {id = 5, qty = 1} }
	},
	[4] = {
		label = "Wheel", item = "car_wheel", 
		recipe = { [1] = {id = 2, qty = 5}, [2] = {id = 1, qty = 8} }
	},
}

-- Materials used throughout the script:
Config.Materials = {
	[1] = {label = "Rubber", item = "rubber"},
	[2] = {label = "Scrap Metal", item = "scrap_metal"},
	[3] = {label = "Electric Scrap", item = "electric_scrap"},
	[4] = {label = "Plastic", item = "plastic"},
	[5] = {label = "Glass", item = "glass"},
	[6] = {label = "Aluminium", item = "aluminium"},
	[7] = {label = "Copper", item = "copper"},
	[8] = {label = "Steel", item = "steel"}
}

-- Available Health Parts to repair and required materials and amounts:
Config.HealthParts = {
	[1] = { label = "Brakes", degName = "brakes", materials = { [1] = {id = 2, qty = 2} } },
	[2] = { label = "Radiator", degName = "radiator", materials = { [1] = {id = 6, qty = 2} } },
	[3] = { label = "Clutch", degName = "clutch", materials = { [1] = {id = 2, qty = 2} } },
	[4] = { label = "Transmission", degName = "transmission", materials = { [1] = {id = 6, qty = 2} } },
	[5] = { label = "Electronics", degName = "electronics", materials = {[1] = {id = 3, qty = 2}, [2] = {id = 4, qty = 2}}},
	[6] = { label = "Drive Shaft", degName = "driveshaft", materials = {  [1] = {id = 1, qty = 2}, [2] = {id = 2, qty = 2} } },
	[7] = { label = "Fuel Injector", degName = "fuelinjector", materials = { [1] = {id = 7, qty = 2} } },
	[8] = { label = "Engine", degName = "engine", materials = { [1] = {id = 2, qty = 2}, [2] = {id = 8, qty = 2} } },
}

-- NPC Jobs Position:
Config.NPC_RepairJobs = {
	[1] = { pos = {879.88,-33.99,78.76,238.22}, inUse = false, ped = "s_m_y_dealer_01", payout = {min = 400, max = 600}},
	[2] = { pos = {1492.09,758.45,77.45,288.26}, inUse = false, ped = "s_m_y_dealer_01", payout = {min = 400, max = 600}},
	[3] = { pos = {387.67,-767.56,29.29,358.94}, inUse = false, ped = "s_m_y_dealer_01", payout = {min = 400, max = 600}},
	[4] = { pos = {-583.75,-239.55,36.08,33.14}, inUse = false, ped = "s_m_y_dealer_01", payout = {min = 400, max = 600}},
        [5] = { pos = {-1319.76,-651.57,26.57,128.14}, inUse = false, ped = "s_m_y_dealer_01", payout = {min = 400, max = 600}},
        [6] = { pos = { 1160.93,501.53,86.9,127.6}, inUse = false, ped = "s_m_y_dealer_01", payout = {min = 450, max = 700}},
        [7] = { pos = { 1708.86,1460.3,85.6,0.61}, inUse = false, ped = "s_m_y_dealer_01", payout = {min = 450, max = 850}},
        [8] = { pos = { 1991.85,3670.42,32.67,288.84}, inUse = false, ped = "s_m_y_dealer_01", payout = {min = 600, max = 1100}},
        [9] = { pos = { 2773.29,3305.61,55.94,334.61}, inUse = false, ped = "s_m_y_dealer_01", payout = {min = 600, max = 1150}},
        [1] = { pos = { 1701.01,4913.84,41.99,56.08}, inUse = false, ped = "s_m_y_dealer_01", payout = {min = 600, max = 1250}},
        [11] = { pos = { 359.83,4431.78,63.08,358.61}, inUse = false, ped = "s_m_y_dealer_01", payout = {min = 700, max = 1322}},
        [12] = { pos = { -121.36,6449.64,31.36,318.13}, inUse = false, ped = "s_m_y_dealer_01", payout = {min = 800, max = 1330}},

}




-- Vehicle scrambler for npc jobs:
Config.RepairVehicles = {"sonata", "camry55", "4c", "8c" , "cla45" , "gt500" , "s15" , "r35" , "nc1" , "roushstang", "na1", "nsexrb", "arsx", "acutypes"}

-- Prop Emotes:
Config.PropEmotes = {
	["prop_roadcone02a"] = {label = "Road Cone", model = "prop_roadcone02a", bone = 28422, pos = {0.6,-0.15,-0.1}, rot = {315.0,288.0,0.0}},
	["prop_cs_trolley_01"] = {label = "Tool Trolley", model = "prop_cs_trolley_01", bone = 28422, pos = {-0.1,-0.6,-0.85}, rot = {-180.0,-165.0,90.0}},
	["prop_tool_box_04"] = {label = "Tool Box", model = "prop_tool_box_04", bone = 28422, pos = {0.4,-0.1,-0.1}, rot = {315.0,288.0,0.0}},
	["prop_engine_hoist"] = {label = "Engine Hoist", model = "prop_engine_hoist", bone = 28422, pos = {0.0,-0.5,-1.3}, rot = {-195.0,-180.0,180.0}}
}

