Config = {
  UsingESX = true,

--[[
 ██╗ ██╗  ██╗ ██╗     ██╗██╗     ██╗     ███████╗ ██████╗  █████╗ ██╗         ███████╗██╗███████╗██╗  ██╗██╗███╗   ██╗ ██████╗     ███╗   ██╗ ██████╗ ████████╗██╗███████╗███████╗     ██╗ ██╗  ██╗ ██╗ 
████████╗████████╗    ██║██║     ██║     ██╔════╝██╔════╝ ██╔══██╗██║         ██╔════╝██║██╔════╝██║  ██║██║████╗  ██║██╔════╝     ████╗  ██║██╔═══██╗╚══██╔══╝██║██╔════╝██╔════╝    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ██║██║     ██║     █████╗  ██║  ███╗███████║██║         █████╗  ██║███████╗███████║██║██╔██╗ ██║██║  ███╗    ██╔██╗ ██║██║   ██║   ██║   ██║█████╗  ███████╗    ╚██╔═██╔╝╚██╔═██╔╝
████████╗████████╗    ██║██║     ██║     ██╔══╝  ██║   ██║██╔══██║██║         ██╔══╝  ██║╚════██║██╔══██║██║██║╚██╗██║██║   ██║    ██║╚██╗██║██║   ██║   ██║   ██║██╔══╝  ╚════██║    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ██║███████╗███████╗███████╗╚██████╔╝██║  ██║███████╗    ██║     ██║███████║██║  ██║██║██║ ╚████║╚██████╔╝    ██║ ╚████║╚██████╔╝   ██║   ██║██║     ███████║    ╚██╔═██╔╝╚██╔═██╔╝
 ╚═╝ ╚═╝  ╚═╝ ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝    ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚═╝  ╚═══╝ ╚═════╝    ╚═╝   ╚═╝╚═╝     ╚══════╝     ╚═╝ ╚═╝  ╚═╝ ╚═╝ 

    You will need to make sure you fill in the notify cops function yourself in client/functions. Use whatever notification system you use. 
                                                                                                                                                                                                        
--]]


  NotifyCopChance = 5, --## Chance Cops will be notified of illegal fishing. This Notification will happen at the time the fish gets hooked and the fight begins(Adds RP when they show up mid way through you hauling out a shark)
  Cops = {'police'}, --## The job names of people you want notified. 
--[[
 ██╗ ██╗  ██╗ ██╗     ███████╗██╗███████╗██╗  ██╗██╗███╗   ██╗ ██████╗     ███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗     ██╗ ██╗  ██╗ ██╗ 
████████╗████████╗    ██╔════╝██║██╔════╝██║  ██║██║████╗  ██║██╔════╝     ██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    █████╗  ██║███████╗███████║██║██╔██╗ ██║██║  ███╗    ███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗    ╚██╔═██╔╝╚██╔═██╔╝
████████╗████████╗    ██╔══╝  ██║╚════██║██╔══██║██║██║╚██╗██║██║   ██║    ╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ██║     ██║███████║██║  ██║██║██║ ╚████║╚██████╔╝    ███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║    ╚██╔═██╔╝╚██╔═██╔╝
 ╚═╝ ╚═╝  ╚═╝ ╚═╝     ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝     ╚═╝ ╚═╝  ╚═╝ ╚═╝                                                                                                                                                                 
--]]
  ChanceWhalePullsYouIn        = 75, --## Percent chance you will get to hear my custom whale noises.... e.g Pulled in by a whale.
  TimeToHackUpWhale            = math.random(20,35), --## How many times to chop up the whale?
  ReturnRodFromWhale           = false, --## Will the player find their rod and equiopment in the whales belly?
  ChanceOfCopNotifyWhaleChop   = 80, --## How likely is some runner to call the cops on you for hacking the shit out of a whale on the beach.
  ChanceOfEquipmentBreakOnFail = 100, --## Random chance equipment breaks when you fail
  RemoveBaitOnFail = true, --## Remove bait every time a fish gets away? If false will only remove if you catch the fish. Or break equipment.
  MinTimeToCatch   = 15, --## The min time you will wait for a fish to bite in seconds.
  MaxTimeToCatch   = 90, --## The max time you will wait for a fish to bite in seconds.
--[[
 ██╗ ██╗  ██╗ ██╗     ███████╗███████╗██╗     ██╗         ███████╗██╗███████╗██╗  ██╗    ███████╗██████╗  ██████╗ ████████╗███████╗     ██╗ ██╗  ██╗ ██╗ 
████████╗████████╗    ██╔════╝██╔════╝██║     ██║         ██╔════╝██║██╔════╝██║  ██║    ██╔════╝██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ███████╗█████╗  ██║     ██║         █████╗  ██║███████╗███████║    ███████╗██████╔╝██║   ██║   ██║   ███████╗    ╚██╔═██╔╝╚██╔═██╔╝
████████╗████████╗    ╚════██║██╔══╝  ██║     ██║         ██╔══╝  ██║╚════██║██╔══██║    ╚════██║██╔═══╝ ██║   ██║   ██║   ╚════██║    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ███████║███████╗███████╗███████╗    ██║     ██║███████║██║  ██║    ███████║██║     ╚██████╔╝   ██║   ███████║    ╚██╔═██╔╝╚██╔═██╔╝
 ╚═╝ ╚═╝  ╚═╝ ╚═╝     ╚══════╝╚══════╝╚══════╝╚══════╝    ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝    ╚══════╝╚═╝      ╚═════╝    ╚═╝   ╚══════╝     ╚═╝ ╚═╝  ╚═╝ ╚═╝                                                                                                                                                         
--]]
  TimeToResetLimits = 120, --## Time in minutes for the limits of the shop to reset.
  SellingLocations = {
     ['PierSideFishMarket'] = { --##ShopName
      Render    = false, --## Used for markers please dont touch.
      Scale     = {1.0,1.0,1.0}, --## Size of the marker
      Text      = "Sell Fish", --## What does it say on the marker.
      FishTypes = { --## The types of fish they will buy.
        ['minnow'] = {
          MinPrice = 30, --## Min Price they will pay for this fish.
          MaxPrice = 40, --## Max Price they will pay for this fish.
        },
        ['crappie'] = {
          MinPrice = 40, 
          MaxPrice = 50,
        },
        ['garfish'] = {
          MinPrice = 50, 
          MaxPrice = 60, 
        },
        ['rainbowtrout'] = {
          MinPrice = 60,
          MaxPrice = 70, 
        },
        ['trout'] = {
          MinPrice = 80, 
          MaxPrice = 90,
        },
        ['garfish'] = {
          MinPrice = 90, 
          MaxPrice = 100, 
        },
        ['northernpike'] = {
          MinPrice = 110, 
          MaxPrice = 120,
        },
        ['salmon'] = {
          MinPrice = 120, 
          MaxPrice = 130, 
        },
        ['stripedbass'] = {
          MinPrice = 130,
          MaxPrice = 140, 
        },
        ['pollock'] = {
          MinPrice = 140, 
          MaxPrice = 150, 
        },
        ['haddock'] = {
          MinPrice = 150, 
          MaxPrice = 160, 
        },
        ['tuna'] = {
          MinPrice = 160, 
          MaxPrice = 170,
        },
      },
      Limit       = 350, --## How many fish will this place buy before they say no more. 
      OpeningTime = 06, --## The time this shop opens. (24Hrs)
      ClosingTime = 19, --## The time this shop closes. (24Hrs)
      Location    = vector3(-1644.06,-1057.44,13.15), --## The location of this shop.
      Blip = { --## https://docs.fivem.net/docs/game-references/blips/
        Scale      = 0.75, --## Blip Size
        Sprite     = 68, --## Blip Sprite
        Color      = 2, --## Blip Color
        Name       = 'Del Perro Pier Fish Market', --## Blip Name
        Display    = 4,  -- ## Blip Display: Does it show up on all maps, minimap, just main map
        ShortRange = false --## Blip only shows when you are nearby if true.
      }
    },


    ['ShadyFishMarket'] = { 
      Render    = false, 
      Scale     = {1.0,1.0,1.0}, 
      Text      = "Sell Illegal Fish", 
      FishTypes = { 
        ['turtle'] = {
          MinPrice = 300,
          MaxPrice = 450,
        },
        ['dolphin'] = {
          MinPrice = 500, 
          MaxPrice = 750, 
        },
        ['shark'] = {
          MinPrice = 750, 
          MaxPrice = 1000, 
        },
        ['whale'] = {
          MinPrice = 4500, 
          MaxPrice = 5000, 
        },
      },
      Limit       = 100, 
      OpeningTime = 00,
      ClosingTime = 24, 
      Location    = vector3(1299.64,4217.96,33.91), 
      Blip = { 
        Scale      = 0.75, 
        Sprite     = 427, 
        Color      = 45, 
        Name       = 'Nakamura Fish Market', 
        Display    = 0,  
        ShortRange = true 
      }
    },
  },

--[[
 ██╗ ██╗  ██╗ ██╗     ███████╗██╗███████╗██╗  ██╗██╗███╗   ██╗ ██████╗     ███████╗ ██████╗ ██╗   ██╗██╗██████╗ ███╗   ███╗███████╗███╗   ██╗████████╗    ███████╗████████╗ ██████╗ ██████╗ ███████╗███████╗     ██╗ ██╗  ██╗ ██╗ 
████████╗████████╗    ██╔════╝██║██╔════╝██║  ██║██║████╗  ██║██╔════╝     ██╔════╝██╔═══██╗██║   ██║██║██╔══██╗████╗ ████║██╔════╝████╗  ██║╚══██╔══╝    ██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗██╔════╝██╔════╝    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    █████╗  ██║███████╗███████║██║██╔██╗ ██║██║  ███╗    █████╗  ██║   ██║██║   ██║██║██████╔╝██╔████╔██║█████╗  ██╔██╗ ██║   ██║       ███████╗   ██║   ██║   ██║██████╔╝█████╗  ███████╗    ╚██╔═██╔╝╚██╔═██╔╝
████████╗████████╗    ██╔══╝  ██║╚════██║██╔══██║██║██║╚██╗██║██║   ██║    ██╔══╝  ██║▄▄ ██║██║   ██║██║██╔═══╝ ██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║       ╚════██║   ██║   ██║   ██║██╔══██╗██╔══╝  ╚════██║    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ██║     ██║███████║██║  ██║██║██║ ╚████║╚██████╔╝    ███████╗╚██████╔╝╚██████╔╝██║██║     ██║ ╚═╝ ██║███████╗██║ ╚████║   ██║       ███████║   ██║   ╚██████╔╝██║  ██║███████╗███████║    ╚██╔═██╔╝╚██╔═██╔╝
 ╚═╝ ╚═╝  ╚═╝ ╚═╝     ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚══════╝ ╚══▀▀═╝  ╚═════╝ ╚═╝╚═╝     ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝       ╚══════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝     ╚═╝ ╚═╝  ╚═╝ ╚═╝ 
                                                                                                                                                                                                                                  
--]]
  EquipmentStores= {

     ['MasterBaiter'] = { --##ShopName
      Render    = false, --## Used for markers please dont touch.
      Scale     = {1.0,1.0,1.0}, --## Size of the marker
      Text      = "Buy Equipment", --## What does it say on the marker.
      Stock = { --## The equipment they will sell.
        ['magnumxlrod'] = {
          Label    = 'Magnum XL Rod', --## Label in the store
          Description = 'High end rod', --## Description given for this item in the store. Use this to give people rough ideas of the equipments properties.
          MinPrice = 20, --## Min Price they will charge for this item.
          MaxPrice = 25, --## Max Price they will charge for this item.
        },
        ['zeusrod'] = {
          Label    = 'Zeus Rod', 
          Description = 'High end rod', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['brutasrod'] = {
          Label    = 'Brutas Rod', 
          Description = 'Mid range rod', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['nerorod'] = {
          Label    = 'Nero Rod', 
          Description = 'Mid range rod', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['elementalrod'] = {
          Label    = 'Elemntal Rod', 
          Description = 'Low end rod', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['valuecastrod'] = {
          Label    = 'Value Cast Rod', 
          Description = 'Low end rod', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        --- Reels
        ['zillareel'] = {
          Label    = 'Zilla Reel', 
          Description = 'The fastest reel with a maximum depth of 1000m', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['thunderreel'] = {
          Label    = 'Thunder Reel', 
          Description = 'A High tier reel with a maximum depth of 500m', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['fishrusreel'] = {
          Label    = 'Fish R Us Reel', 
          Description = 'A mid range reel with a maximum depth of 140m', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['rockbottomreel'] = {
          Label    = 'Rock Bottom Reel', 
          Description = 'A mid range reel with a maximum depth of 200m', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['linesnifferreel'] = {
          Label    = 'Line Sniffer Reel', 
          Description = 'A low end reel with a maximum depth of 90m', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['brokeassreel'] = {
          Label    = 'Broke Ass Reel', 
          Description = 'A low end reel with a maximum depth of 50m', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        -- Lines
        ['kingbraid'] = {
          Label    = 'King Braid Line', 
          Description = 'The strongest fishing line availables', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['lightningbraid'] = {
          Label    = 'Lightning Braid Line', 
          Description = 'Strong and Expensive Line', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['noodlebraid'] = {
          Label    = 'Noodle Braid Line', 
          Description = 'Tough and Durable Line', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['mobeymono'] = {
          Label    = 'Mobey Mono Line', 
          Description = 'Decent Mid Range Line', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['bitesizemono'] = {
          Label    = 'Bite Size Mono Line', 
          Description = 'Low end branded line', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['cheapmono'] = {
          Label    = 'Cheap Mono Line', 
          Description = 'Cheap no brand line not very strong', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        -- Hooks 
        ['towhook'] = {
          Label    = 'Tow Hook', 
          Description = 'I dont even know if you can fish with this?', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['no10'] = {
          Label    = '#10 Hook', 
          Description = 'A Large hook designed to catch: Tuna,Shark,Dolphin and Turtles', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['no6'] = {
          Label    = '#6 Hook', 
          Description = 'A Mid size hook designed to catch: Northern Pike and Salmon', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['no3'] = {
          Label    = '#3 Hook', 
          Description = 'A smaller hook designed to catch: Northern Pike, Striped Bass, Pollock, Haddock, Trout and GarFish', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['no2'] = {
          Label    = '#2 Hook', 
          Description = 'A smaller hook designed to catch: Striped Bass, Pollock, Haddock, Trout and GarFish', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['no1'] = {
          Label    = '#1 Hook', 
          Description = 'A tiny hook designed for catching: Minnow, Crappie, Garfish, Rainbow Trout and Trout', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        -- Baits
        ['nightworms'] = {
          Label    = 'Nightworms', 
          Description = 'This rod is very strong made for large fish such as tuna and sharks', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['redworms'] = {
          Label    = 'Red worms', 
          Description = 'This rod is very strong made for large fish such as tuna and sharks', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['mealworms'] = {
          Label    = 'Mealworms', 
          Description = 'This rod is very strong made for large fish such as tuna and sharks', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['leech'] = {
          Label    = 'Leech', 
          Description = 'This rod is very strong made for large fish such as tuna and sharks', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['minnow'] = {
          Label    = 'Minnow', 
          Description = 'This rod is very strong made for large fish such as tuna and sharks', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['turtlemeat'] = {
          Label    = 'Turtle Meat', 
          Description = 'This rod is very strong made for large fish such as tuna and sharks', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },

        ['tunameat'] = {
          Label    = 'Tuna Meat', 
          Description = 'This rod is very strong made for large fish such as tuna and sharks', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['bread'] = {
          Label    = 'Bread', 
          Description = 'This rod is very strong made for large fish such as tuna and sharks', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['crab'] = {
          Label    = 'Crab', 
          Description = 'This rod is very strong made for large fish such as tuna and sharks', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['hugecutbait'] = {
          Label    = 'Huge Cut Bait', 
          Description = 'This rod is very strong made for large fish such as tuna and sharks', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['bacon'] = {
          Label    = 'Bacon', 
          Description = 'This rod is very strong made for large fish such as tuna and sharks', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['maggots'] = {
          Label    = 'Maggots', 
          Description = 'This rod is very strong made for large fish such as tuna and sharks', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },
        ['technoplankton'] = {
          Label    = 'TechnoPlankton', 
          Description = 'This rod is very strong made for large fish such as tuna and sharks', 
          MinPrice = 20, 
          MaxPrice = 25, 
        },




      },
      OpeningTime = 06, --## The time this shop opens. (24Hrs)
      ClosingTime = 19, --## The time this shop closes. (24Hrs)
      Location    = vector3(-678.64,5837.54,-17.33), --## The location of this shop.
      Blip = { --## https://docs.fivem.net/docs/game-references/blips/
        Scale      = 0.75, --## Blip Size
        Sprite     = 68, --## Blip Sprite
        Color      = 3, --## Blip Color
        Name       = 'MasterBaiter Fishing Equipment', --## Blip Name
        Display    = 4,  -- ## Blip Display: Does it show up on all maps, minimap, just main map
        ShortRange = false --## Blip only shows when you are nearby if true.
      }
    },

  },

--[[
 ██╗ ██╗  ██╗ ██╗     ███████╗██╗███████╗██╗  ██╗██╗███╗   ██╗ ██████╗     ███████╗ ██████╗ ██╗   ██╗██╗██████╗ ███╗   ███╗███████╗███╗   ██╗████████╗     ██╗ ██╗  ██╗ ██╗ 
████████╗████████╗    ██╔════╝██║██╔════╝██║  ██║██║████╗  ██║██╔════╝     ██╔════╝██╔═══██╗██║   ██║██║██╔══██╗████╗ ████║██╔════╝████╗  ██║╚══██╔══╝    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    █████╗  ██║███████╗███████║██║██╔██╗ ██║██║  ███╗    █████╗  ██║   ██║██║   ██║██║██████╔╝██╔████╔██║█████╗  ██╔██╗ ██║   ██║       ╚██╔═██╔╝╚██╔═██╔╝
████████╗████████╗    ██╔══╝  ██║╚════██║██╔══██║██║██║╚██╗██║██║   ██║    ██╔══╝  ██║▄▄ ██║██║   ██║██║██╔═══╝ ██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║       ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ██║     ██║███████║██║  ██║██║██║ ╚████║╚██████╔╝    ███████╗╚██████╔╝╚██████╔╝██║██║     ██║ ╚═╝ ██║███████╗██║ ╚████║   ██║       ╚██╔═██╔╝╚██╔═██╔╝
 ╚═╝ ╚═╝  ╚═╝ ╚═╝     ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚══════╝ ╚══▀▀═╝  ╚═════╝ ╚═╝╚═╝     ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝        ╚═╝ ╚═╝  ╚═╝ ╚═╝ 
                                                                                                                                                                            
    You can set up all sorts of fishing equipment with all different stregnth values. When you setup your rod all the different values will be added towards a total setup strength.
    This will determine how easy/hard it is to catch certain fish it will also determine how likely your weakest equipment breaking is.

    ----------------------------------------------------------------------
    Example: 
      Whale: Strength(45), Speed(12)

      Ideal Setup for Whale: 
        magnumxlrod : Strength(12)
        towhook     : Strength(12)
        kingbraid   : Strength(15)
        zillareel   : Strength(12) Speed(12)
        TotalEquipmentStrength(51)

    ----------------------------------------------------------------------


    So in this example the total strength is 51 which is clearly more than the strength of the fish at 45. This means the fish will have a 6 point disadvantage. We work out this difference as a percentage.
    Using: https://www.skillsyouneed.com/num/percent-change.html

    This percentage is how hard it'll be to fight reel in said fish with your reel. 

    The Speed of the reel will be used as a percentage to determine how quickly you will be pulling in the fish when it's not fighting. 

    The Speed of the fish will determine how quickly it will pull your rod out when it's fighting against you and you aren't defending successfully.

    If you lose the battle there is a random chance your weakest equipment will break if you do not have advantage over the fish(Fish has higher strength than your equipment total strenght).
]]


  FishingEquipment = {
    ['rodtype']  = { --## Fishing Equipment Type

      ['magnumxlrod'] = { --## Name in DB of your equipment.
        Name     = 'magnumxlrod', --## Must be same as above.
        Strength = 12, --## Adds to overall equipment strength.
      },

      ['zeusrod'] = {
        Name     = 'zeusrod',
        Strength = 9, 
      },
      ['brutasrod'] = {
        Name     = 'brutasrod',
        Strength = 7,
      },
      ['nerorod'] = {
        Name     = 'nerorod',
        Strength = 5,
      },
      ['elementalrod'] = {
        Name     = 'elementalrod',
        Strength = 3,
      },
      ['valuecastrod'] = {
        Name     = 'valuecastrod',
        Strength = 1,
      },
    },
    ['reel'] = {

      ['zillareel'] = { --## Name in DB of your equipment.
        Name     = 'zillareel',  --## Must be same as above.
        Strength = 12, --## Adds to overall equipment strength.
        Speed    = 2.0, --## Percentage Speed at which you will take the fish in when reeling successfully
        DepthLimit = 1000, --## The Depth limit of the reel. You can't lower below this depth.
      },

      ['thunderreel'] = {
        Name     = 'thunderreel',
        Strength = 9,
        Speed    = 1.2,
        DepthLimit = 500,
      },
      ['fishrusreel'] = {
        Name     = 'fishrusreel',
        Strength = 7,
        Speed    = 0.3,
        DepthLimit = 140,
      },
      ['rockbottomreel'] = {
        Name     = 'rockbottomreel',
        Strength = 5,
        Speed    = 1.2,
        DepthLimit = 200,
      },
      ['linesnifferreel'] = {
        Name     = 'linesnifferreel',
        Strength = 3,
        Speed    = 0.6,
        DepthLimit = 90,
      },
      ['brokeassreel'] = {
        Name     = 'brokeassreel',
        Strength = 1,
        Speed    = 0.2,
        DepthLimit = 50,
      },
    },
    ['line'] = {

      ['kingbraid'] = { --## Name in DB of your equipment.
        Name     = 'kingbraid',  --## Must be same as above.
        Strength = 15, --## Adds to overall equipment strength.
      },

      ['lightningbraid'] = {
        Name     = 'lightningbraid',
        Strength = 9, 
      },
      ['noodlebraid'] = {
        Name     = 'noodlebraid',
        Strength = 7, 
      },
      ['mobeymono'] = {
        Name     = 'mobeymono',
        Strength = 5, 
      },
      ['bitesizemono'] = {
        Name     = 'bitesizemono',
        Strength = 3, 
      },
      ['cheapmono'] = {
        Name     = 'cheapmono',
        Strength = 1, 
      },
    },
    ['hook'] = {  

      ['towhook'] = { --## Name in DB of your equipment.
        Name     = 'towhook', --## Must be same as above.
        Strength = 12, --## Adds to overall equipment strength.
      },

      ['no10'] = {
        Name     = 'no10',
        Strength = 9,
      },
      ['no6'] = {
        Name     = 'no6',
        Strength = 7,
      },
      ['no3'] = {
        Name     = 'no3',
        Strength = 5,
      },
      ['no2'] = {
        Name     = 'no2',
        Strength = 3,
      },
      ['no1'] = {
        Name     = 'no1',
        Strength = 1,
      },
    },
    ['bait']  = {

      ['nightworms'] = { --## Name in DB of your equipment.
        Name          = 'nightworms', 
      },

      ['redworms'] = {
        Name          = 'redworms',
      },
      ['mealworms'] = {
        Name          = 'mealworms',
      },
      ['leech'] = {
        Name          = 'leech',
      },
      ['waxworms'] = {
        Name          = 'waxworms',
      },
      ['minnow'] = {
        Name          = 'minnow',
      },
      ['turtlemeat'] = {
        Name          = 'turtlemeat',
      },
      ['tunameat'] = {
        Name          = 'tunameat',
      },
      ['bread'] = {
        Name          = 'bread',
      },
      ['crab'] = {
        Name          = 'crab',
      },
      ['hugecutbait'] = {
        Name          = 'hugecutbait',
      },
      ['bacon'] = {
        Name          = 'bacon',
      },
      ['maggots'] = {
        Name          = 'maggots',
      },
      ['technoplankton'] = {
        Name          = 'technoplankton',
      },      
    },
  },
--[[
 ██╗ ██╗  ██╗ ██╗     ███████╗██╗███████╗██╗  ██╗    ████████╗██╗   ██╗██████╗ ███████╗███████╗     ██╗ ██╗  ██╗ ██╗ 
████████╗████████╗    ██╔════╝██║██╔════╝██║  ██║    ╚══██╔══╝╚██╗ ██╔╝██╔══██╗██╔════╝██╔════╝    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    █████╗  ██║███████╗███████║       ██║    ╚████╔╝ ██████╔╝█████╗  ███████╗    ╚██╔═██╔╝╚██╔═██╔╝
████████╗████████╗    ██╔══╝  ██║╚════██║██╔══██║       ██║     ╚██╔╝  ██╔═══╝ ██╔══╝  ╚════██║    ████████╗████████╗
╚██╔═██╔╝╚██╔═██╔╝    ██║     ██║███████║██║  ██║       ██║      ██║   ██║     ███████╗███████║    ╚██╔═██╔╝╚██╔═██╔╝
 ╚═╝ ╚═╝  ╚═╝ ╚═╝     ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝       ╚═╝      ╚═╝   ╚═╝     ╚══════╝╚══════╝     ╚═╝ ╚═╝  ╚═╝ ╚═╝ 
    Fish Types: 
      Setup as many fish as you like and configure them how you like. 
      When setting their strength and speed make sure you have equipment to match it otherwise you will have no hope of catching them. Use the example above FishingEquipment for more info.
  ]]

  FishTypes = {
    ['minnow'] = { --## This is the name of the fish in your DB (Items Table)
      Name = 'Minnow',  --## This is the display name of said fish.
      Strength = 0.1, --## The Overall strength of the fish. This will determine wether you can easily catch it with your rod based off of your overall rod setup strength. Too strong and it could break your equipment.
      Speed = 0.2, --## If the fish is getting away how quickly will it get away.
      ChanceOfFight = 50, --## How likely is the fish to start fighting and adding tension to the line.
      Depth = 0, --## This is the minimum depth at which you will find said fish.
      DepthLimit = 2, --## This is the maximum depth at which you will find said fish.
      BaitTypes = {'maggots','bread'}, --## Types of bait used to catch this fish.
      HookTypes = {'no1'}, --## Types of hooks that you can use to catch this fish.
    },
    ['crab'] = {
      Name = 'Crab',
      Strength = 0.1,
      Speed = 0.7,
      ChanceOfFight = 30,
      Depth = 0,
      DepthLimit = 25,
      BaitTypes = {'technoplankton','bread','tunameat','turtlemeat'},
      HookTypes = {'no1'},
    },
    ['crappie'] = { 
      Name = 'Crappie',
      Strength = 0.1, 
      Speed = 0.2,
      ChanceOfFight = 60,
      Depth = 0,
      DepthLimit = 5,
      BaitTypes = {'maggots','bread','mealworms','redworms'},
      HookTypes = {'no1'},    
    },
    ['garfish'] = {
      Name = 'Gar Fish',
      Strength = 0.1,
      Speed = 0.7,
      ChanceOfFight = math.random(40,60),
      Depth = 10,
      DepthLimit = 50,
      BaitTypes = {'crab','minnow','tunameat'},
      HookTypes = {'no1','no2','no3'},    
    },
    ['rainbowtrout'] = {
      Name = 'Rainbow Trout',
      Strength = 0.1,
      Speed = 0.3,
      ChanceOfFight = 60,
      Depth = 0,
      DepthLimit = 20,
      BaitTypes = {'maggots','waxworms','mealworms'},
      HookTypes = {'no1','no2'},    
    },
    ['northernpike'] = {
      Name = 'Northern Pike',
      Strength = 0.1,
      Speed = 0.6,
      ChanceOfFight = 75,
      Depth = 40,
      DepthLimit = 100,
      BaitTypes = {'minnow','crab','tunameat','nightworms','redworms','leech'},
      HookTypes = {'no3','no6'},  
    },
    ['salmon'] = {
      Name = 'Salmon',
      Strength = 0.1,
      Speed = 0.8,
      ChanceOfFight = 75,
      Depth = 3,
      DepthLimit = 30,
      BaitTypes = {'minnow','redworms','nightworms'},
      HookTypes = {'no6'},     
    },
    ['stripedbass'] = {
      Name = 'Striped Bass',
      Strength = 0.15,
      Speed = 0.6,
      ChanceOfFight = 40,
      Depth = 10,
      DepthLimit = 30,
      BaitTypes = {'bread','leech','tunameat','redworms','nightworms','crab','minnow','maggots','waxworms'},
      HookTypes = {'no2','no3'},   
    },
    ['trout'] = {
      Name = 'Trout',
      Strength = 0.22,
      Speed = 0.3,
      ChanceOfFight = 65,
      Depth = 0,
      DepthLimit = 20,
      BaitTypes = {'maggots','waxworms','mealworms'},
      HookTypes = {'no1','no2','no3'},   
    },
    ['pollock'] = {
      Name = 'Pollock',
      Strength = 0.30,
      Speed = 0.2,
      ChanceOfFight = 30,
      Depth = 20,
      DepthLimit = 120,
      BaitTypes = {'redworms','nightworms','minnow','maggots','waxworms'},
      HookTypes = {'no2','no3'},  
    },
    ['haddock'] = {
      Name = 'Haddock',
      Strength = 0.40,
      Speed = 0.2,
      ChanceOfFight = 40,
      Depth = 40,
      DepthLimit = 120,
      BaitTypes = {'redworms','nightworms','minnow','maggots','waxworms'},
      HookTypes = {'no2','no3'},  
    },
    ['tuna'] = {
      Name = 'Tuna',
      Strength = 0.45,
      Speed = 1.0,
      ChanceOfFight = 60,
      Depth = 200,
      DepthLimit = 400,
      BaitTypes = {'leech','minnow'},
      HookTypes = {'no10'},
    },
    ['shark'] = {
      Name = 'Shark',
      Strength = 0.8,
      Speed = 1.0,
      ChanceOfFight = 100,
      Depth = 200,
      DepthLimit = 600,
      BaitTypes = {'hugecutbait'},
      HookTypes = {'no10'},
    },
    ['dolphin'] = {
      Name = 'Dolphin',
      Strength = 0.75,
      Speed = 1.2,
      ChanceOfFight = 76,
      Depth = 250,
      DepthLimit = 600,
      BaitTypes = {'tunameat','crab'},
      HookTypes = {'no10'}, 
    },
    ['turtle'] = {
      Name = 'Turtle',
      Strength = 0.65,
      Speed = 1.2,
      ChanceOfFight = 70,
      Depth = 250,
      DepthLimit = 350,
      BaitTypes = {'minnow','tunameat'},
      HookTypes = {'no10', 'no6'},
    },
    ['whale'] = {
      Name = 'Whale',
      Strength = 0.8,
      Speed = 0.8,
      ChanceOfFight = 90,
      Depth = 785,
      DepthLimit = 990,
      BaitTypes = {'technoplankton'},
      HookTypes = {'no10'},
    },  
  },
}

if Config.UsingESX then
  TriggerEvent("esx:getSharedObject", function(obj) ESX = obj; end)
else
  TriggerEvent("nCore:GetObject", function(obj) nCore = obj; end)
end