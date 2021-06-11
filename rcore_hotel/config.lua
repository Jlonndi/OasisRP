Config = {}
Config.License = '1de585dace67cd2010872e3be1918e6e'
Config.Debug = false
Config.Locale = 'en'
Config.PayoutSociety = 'society_goverment'
Config.BillCallback = 'esx_billing:sendBill'
Config.Events = {
    ['esx:playerLoaded'] = 'esx:playerLoaded',
    ['esx:setJob'] = 'esx:setJob',
    ['esx:playerDropped'] = 'esx:playerDropped',
    ['esx:getSharedObject'] = 'esx:getSharedObject',
    ['esx_datastore:getDataStore'] = 'esx_datastore:getDataStore'
}

Config.UseOwnInventory = false --Turn on and look into server/extend/inventory.lua
Config.DeleteStorageAfterKick = true -- Delete room storage after kick player from room of player leave room
Config.OnlyOwnerCanStorage = true --Only owner can open storage
Config.CanPoliceOpenStorage = true --Can police open storage
Config.CanPoliceOpenDoors = true --Can police open doors
Config.PoliceJobs = {
    'police',
    'fbi',
    'goverment',
}
Config.KickoutInvoices = 3 --Amount of invoices to kick player from room
Config.MaxRoomsInOneHotel = 2 --Amount fo rooms that player can own in one hotel

Config.CheckPlayerPosition = 2000
Config.NearObjectDistance = 50

Config.PayoutTime = { --every day at 8:00
    {
        d = { -- can be nil for everyday or specify days with numbers
            1, --Monday
            2,
            3,
            4,
            5, --Friday
            6,
            7 --Sunday
        },
        h = 8,
        m = 0,
    },
}

Config.OutfitDatastore = 'property' --Datastore for your outfits

Config.Hotels = { 
    {
        displayName = 'Von Crastenburg Hotel',
        name = 'crastenburg', --Must be uniq for every hotel
        paymentType = 'standard', --Standard or invoice
        distance = 100.0,
        blip = {
            color = 15,
            sprite = 475,
            coords = vector3(-1237.40, -189.47, 41.62),
            scale = 0.8,
        },
        doorText = {
            size = 0.8,
            scale = 0.8,
            renderDistance = 3,
        },
        rooms = {
            {
                name = 'vc1', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1188.09, -180.99, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1190.00, -184.78, 47.79)
                },
                door = {
                    name = '#101',
                    objHash = -674469114,
                    position = vector3(-1188.32, -187.28, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc2', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1180.11, -179.61, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1183.55, -183.38, 47.78)
                },
                door = {
                    name = '#102',
                    objHash = -674469114,
                    position = vector3(-1180.50, -185.60, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc3', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1172.33, -177.92, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1175.38, -181.56, 47.78)
                },
                door = {
                    name = '#103',
                    objHash = -674469114,
                    position = vector3(-1172.68, -183.92, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc4', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1164.55, -176.23, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1167.60, -179.44, 47.78)
                },
                door = {
                    name = '#104',
                    objHash = -674469114,
                    position = vector3(-1164.18, -182.24, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc5', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1156.73, -174.55, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1159.78, -177.76, 47.78)
                },
                door = {
                    name = '#105',
                    objHash = -674469114,
                    position = vector3(-1156.36, -180.56, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc6', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1148.91, -172.87, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1151.96, -176.08, 47.78)
                },
                door = {
                    name = '#106',
                    objHash = -674469114,
                    position = vector3(-1148.54, -178.88, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc7', --Must be uniq per any room
                price = 700,
                storage = {
                    state = true,
                    position = vector3(-1151.43, -188.95, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1148.42, -185.37, 47.78)
                },
                door = {
                    name = '#107',
                    objHash = -674469114,
                    position = vector3(-1151.12, -183.01, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc8', --Must be uniq per any room
                price = 700,
                storage = {
                    state = true,
                    position = vector3(-1159.25, -190.63, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1156.24, -187.05, 47.78)
                },
                door = {
                    name = '#108',
                    objHash = -674469114,
                    position = vector3(-1158.94, -184.69, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc9', --Must be uniq per any room
                price = 700,
                storage = {
                    state = true,
                    position = vector3(-1167.07, -192.31, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1164.06, -188.73, 47.78)
                },
                door = {
                    name = '#109',
                    objHash = -674469114,
                    position = vector3(-1166.76, -186.37, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc10', --Must be uniq per any room
                price = 700,
                storage = {
                    state = true,
                    position = vector3(-1174.89, -193.99, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1171.88, -190.41, 47.78)
                },
                door = {
                    name = '#110',
                    objHash = -674469114,
                    position = vector3(-1174.54, -188.05, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc11', --Must be uniq per any room
                price = 700,
                storage = {
                    state = true,
                    position = vector3(-1182.71, -195.67, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1179.70, -192.09, 47.78)
                },
                door = {
                    name = '#111',
                    objHash = -674469114,
                    position = vector3(-1182.36, -189.73, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc12', --Must be uniq per any room
                price = 700,
                storage = {
                    state = true,
                    position = vector3(-1190.53, -197.35, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1187.52, -193.77, 47.78)
                },
                door = {
                    name = '#112',
                    objHash = -674469114,
                    position = vector3(-1190.18, -191.41, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc13', --Must be uniq per any room
                price = 700,
                storage = {
                    state = true,
                    position = vector3(-1197.82, -205.88, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1198.74, -201.30, 47.78)
                },
                door = {
                    name = '#113',
                    objHash = -674469114,
                    position = vector3(-1202.26, -201.78, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc14', --Must be uniq per any room
                price = 700,
                storage = {
                    state = true,
                    position = vector3(-1201.58, -212.94, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1202.50, -208.36, 47.78)
                },
                door = {
                    name = '#114',
                    objHash = -674469114,
                    position = vector3(-1206.02, -208.84, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc15', --Must be uniq per any room
                price = 700,
                storage = {
                    state = true,
                    position = vector3(-1205.34, -220.00, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1206.26, -215.42, 47.78)
                },
                door = {
                    name = '#115',
                    objHash = -674469114,
                    position = vector3(-1209.78, -215.90, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc16', --Must be uniq per any room
                price = 700,
                storage = {
                    state = true,
                    position = vector3(-1209.10, -227.06, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1210.02, -222.48, 47.78)
                },
                door = {
                    name = '#116',
                    objHash = -674469114,
                    position = vector3(-1213.54, -222.96, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc17', --Must be uniq per any room
                price = 700,
                storage = {
                    state = true,
                    position = vector3(-1212.86, -234.12, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1213.78, -229.54, 47.78)
                },
                door = {
                    name = '#117',
                    objHash = -674469114,
                    position = vector3(-1217.30, -230.02, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc18', --Must be uniq per any room
                price = 700,
                storage = {
                    state = true,
                    position = vector3(-1216.62, -241.18, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1217.54, -236.60, 47.78)
                },
                door = {
                    name = '#118',
                    objHash = -674469114,
                    position = vector3(-1221.06, -237.08, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc19', --Must be uniq per any room
                price = 600,
                storage = {
                    state = true,
                    position = vector3(-1226.78, -229.13, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1226.04, -233.71, 47.78)
                },
                door = {
                    name = '#119',
                    objHash = -674469114,
                    position = vector3(-1222.37, -233.31, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc20', --Must be uniq per any room
                price = 600,
                storage = {
                    state = true,
                    position = vector3(-1223.02, -222.07, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1222.28, -226.65, 47.78)
                },
                door = {
                    name = '#120',
                    objHash = -674469114,
                    position = vector3(-1218.62, -226.24, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc21', --Must be uniq per any room
                price = 600,
                storage = {
                    state = true,
                    position = vector3(-1219.24, -215.01, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1218.52, -219.59, 47.78)
                },
                door = {
                    name = '#121',
                    objHash = -674469114,
                    position = vector3(-1214.86, -219.18, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc22', --Must be uniq per any room
                price = 600,
                storage = {
                    state = true,
                    position = vector3(-1215.48, -207.95, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1214.76, -212.53, 47.78)
                },
                door = {
                    name = '#122',
                    objHash = -674469114,
                    position = vector3(-1211.10, -212.12, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc23', --Must be uniq per any room
                price = 600,
                storage = {
                    state = true,
                    position = vector3(-1211.72, -200.89, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1211.00, -205.47, 47.78)
                },
                door = {
                    name = '#123',
                    objHash = -674469114,
                    position = vector3(-1207.34, -205.06, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc24', --Must be uniq per any room
                price = 600,
                storage = {
                    state = true,
                    position = vector3(-1207.96, -193.83, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1207.24, -198.41, 47.78)
                },
                door = {
                    name = '#124',
                    objHash = -674469114,
                    position = vector3(-1203.58, -198.00, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc25', --Must be uniq per any room
                price = 600,
                storage = {
                    state = true,
                    position = vector3(-1213.37, -175.74, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1207.99, -183.86, 47.78)
                },
                door = {
                    name = '#125',
                    objHash = -674469114,
                    position = vector3(-1210.40, -177.93, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 307.50
                },
            },
            {
                name = 'vc26', --Must be uniq per any room
                price = 600,
                storage = {
                    state = true,
                    position = vector3(-1222.99, -162.96, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1217.61, -171.08, 47.78)
                },
                door = {
                    name = '#126',
                    objHash = -674469114,
                    position = vector3(-1220.02, -165.15, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 307.50
                },
            },
            {
                name = 'vc27', --Must be uniq per any room
                price = 600,
                storage = {
                    state = true,
                    position = vector3(-1232.61, -150.18, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1227.23, -159.02, 47.78)
                },
                door = {
                    name = '#127',
                    objHash = -674469114,
                    position = vector3(-1229.64, -152.37, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 307.50
                },
            },
            {
                name = 'vc28', --Must be uniq per any room
                price = 1600,
                storage = {
                    state = true,
                    position = vector3(-1222.60, -154.53, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1228.58, -145.06, 47.78)
                },
                door = {
                    name = '#128',
                    objHash = -674469114,
                    position = vector3(-1225.62, -152.38, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 127.50
                },
            },
            {
                name = 'vc29', --Must be uniq per any room
                price = 1600,
                storage = {
                    state = true,
                    position = vector3(-1212.97, -167.36, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1218.47, -159.28, 47.78)
                },
                door = {
                    name = '#129',
                    objHash = -674469114,
                    position = vector3(-1215.50, -165.16, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 127.50
                },
            },
            {
                name = 'vc30', --Must be uniq per any room
                price = 1600,
                storage = {
                    state = true,
                    position = vector3(-1203.35, -180.14, 47.78)
                },
                clothes = {
                    state = true,
                    position = vector3(-1208.85, -172.06, 47.78)
                },
                door = {
                    name = '#130',
                    objHash = -674469114,
                    position = vector3(-1205.88, -177.94, 47.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 127.50
                },
            },
            --2nd floor--
            {
                name = 'vc31', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1188.09, -180.99, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1190.00, -184.78, 51.79)
                },
                door = {
                    name = '#201',
                    objHash = -674469114,
                    position = vector3(-1188.32, -187.28, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc32', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1180.11, -179.61, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1183.55, -183.38, 51.79)
                },
                door = {
                    name = '#202',
                    objHash = -674469114,
                    position = vector3(-1180.50, -185.60, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc33', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1172.33, -177.92, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1175.38, -181.56, 51.79)
                },
                door = {
                    name = '#203',
                    objHash = -674469114,
                    position = vector3(-1172.68, -183.92, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc34', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1164.55, -176.23, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1167.60, -179.44, 51.79)
                },
                door = {
                    name = '#204',
                    objHash = -674469114,
                    position = vector3(-1164.18, -182.24, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc35', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1156.73, -174.55, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1159.78, -177.76, 51.79)
                },
                door = {
                    name = '#205',
                    objHash = -674469114,
                    position = vector3(-1156.36, -180.56, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc36', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1148.91, -172.87, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1151.96, -176.08, 51.79)
                },
                door = {
                    name = '#206',
                    objHash = -674469114,
                    position = vector3(-1148.54, -178.88, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc37', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1151.43, -188.95, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1148.42, -185.37, 51.79)
                },
                door = {
                    name = '#207',
                    objHash = -674469114,
                    position = vector3(-1151.12, -183.01, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc38', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1159.25, -190.63, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1156.24, -187.05, 51.79)
                },
                door = {
                    name = '#208',
                    objHash = -674469114,
                    position = vector3(-1158.94, -184.69, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc39', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1167.07, -192.31, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1164.06, -188.73, 51.79)
                },
                door = {
                    name = '#209',
                    objHash = -674469114,
                    position = vector3(-1166.76, -186.37, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc40', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1174.89, -193.99, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1171.88, -190.41, 51.79)
                },
                door = {
                    name = '#210',
                    objHash = -674469114,
                    position = vector3(-1174.54, -188.05, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc41', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1182.71, -195.67, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1179.70, -192.09, 51.79)
                },
                door = {
                    name = '#211',
                    objHash = -674469114,
                    position = vector3(-1182.36, -189.73, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc42', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1190.53, -197.35, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1187.52, -193.77, 51.79)
                },
                door = {
                    name = '#212',
                    objHash = -674469114,
                    position = vector3(-1190.18, -191.41, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc43', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1197.82, -205.88, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1198.74, -201.30, 51.79)
                },
                door = {
                    name = '#213',
                    objHash = -674469114,
                    position = vector3(-1202.26, -201.78, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc44', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1201.58, -212.94, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1202.50, -208.36, 51.79)
                },
                door = {
                    name = '#214',
                    objHash = -674469114,
                    position = vector3(-1206.02, -208.84, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc45', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1205.34, -220.00, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1206.26, -215.42, 51.79)
                },
                door = {
                    name = '#215',
                    objHash = -674469114,
                    position = vector3(-1209.78, -215.90, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc46', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1209.10, -227.06, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1210.02, -222.48, 51.79)
                },
                door = {
                    name = '#216',
                    objHash = -674469114,
                    position = vector3(-1213.54, -222.96, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc47', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1212.86, -234.12, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1213.78, -229.54, 51.79)
                },
                door = {
                    name = '#217',
                    objHash = -674469114,
                    position = vector3(-1217.30, -230.02, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc48', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1216.62, -241.18, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1217.54, -236.60, 51.79)
                },
                door = {
                    name = '#218',
                    objHash = -674469114,
                    position = vector3(-1221.06, -237.08, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc49', --Must be uniq per any room
                price = 700,
                storage = {
                    state = true,
                    position = vector3(-1226.78, -229.13, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1226.04, -233.71, 51.79)
                },
                door = {
                    name = '#219',
                    objHash = -674469114,
                    position = vector3(-1222.37, -233.31, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc50', --Must be uniq per any room
                price = 700,
                storage = {
                    state = true,
                    position = vector3(-1223.02, -222.07, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1222.28, -226.65, 51.79)
                },
                door = {
                    name = '#220',
                    objHash = -674469114,
                    position = vector3(-1218.62, -226.24, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc51', --Must be uniq per any room
                price = 700,
                storage = {
                    state = true,
                    position = vector3(-1219.24, -215.01, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1218.52, -219.59, 51.79)
                },
                door = {
                    name = '#221',
                    objHash = -674469114,
                    position = vector3(-1214.86, -219.18, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc52', --Must be uniq per any room
                price = 700,
                storage = {
                    state = true,
                    position = vector3(-1215.48, -207.95, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1214.76, -212.53, 51.79)
                },
                door = {
                    name = '#222',
                    objHash = -674469114,
                    position = vector3(-1211.10, -212.12, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc53', --Must be uniq per any room
                price = 700,
                storage = {
                    state = true,
                    position = vector3(-1211.72, -200.89, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1211.00, -205.47, 51.79)
                },
                door = {
                    name = '#223',
                    objHash = -674469114,
                    position = vector3(-1207.34, -205.06, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc54', --Must be uniq per any room
                price = 700,
                storage = {
                    state = true,
                    position = vector3(-1207.96, -193.83, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1207.24, -198.41, 51.79)
                },
                door = {
                    name = '#224',
                    objHash = -674469114,
                    position = vector3(-1203.58, -198.00, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc55', --Must be uniq per any room
                price = 1400,
                storage = {
                    state = true,
                    position = vector3(-1213.37, -175.74, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1207.99, -183.86, 51.79)
                },
                door = {
                    name = '#225',
                    objHash = -674469114,
                    position = vector3(-1210.40, -177.93, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 307.50
                },
            },
            {
                name = 'vc56', --Must be uniq per any room
                price = 1400,
                storage = {
                    state = true,
                    position = vector3(-1222.99, -162.96, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1217.61, -171.08, 51.79)
                },
                door = {
                    name = '#226',
                    objHash = -674469114,
                    position = vector3(-1220.02, -165.15, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 307.50
                },
            },
            {
                name = 'vc57', --Must be uniq per any room
                price = 1400,
                storage = {
                    state = true,
                    position = vector3(-1232.61, -150.18, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1227.23, -159.02, 51.79)
                },
                door = {
                    name = '#227',
                    objHash = -674469114,
                    position = vector3(-1229.64, -152.37, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 307.50
                },
            },
            {
                name = 'vc58', --Must be uniq per any room
                price = 1800,
                storage = {
                    state = true,
                    position = vector3(-1222.60, -154.53, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1228.58, -145.06, 51.79)
                },
                door = {
                    name = '#228',
                    objHash = -674469114,
                    position = vector3(-1225.62, -152.38, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 127.50
                },
            },
            {
                name = 'vc59', --Must be uniq per any room
                price = 1800,
                storage = {
                    state = true,
                    position = vector3(-1212.97, -167.36, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1218.47, -159.28, 51.79)
                },
                door = {
                    name = '#229',
                    objHash = -674469114,
                    position = vector3(-1215.50, -165.16, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 127.50
                },
            },
            {
                name = 'vc60', --Must be uniq per any room
                price = 1800,
                storage = {
                    state = true,
                    position = vector3(-1203.35, -180.14, 51.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1208.85, -172.06, 51.79)
                },
                door = {
                    name = '#230',
                    objHash = -674469114,
                    position = vector3(-1205.88, -177.94, 51.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 127.50
                },
            },
            --3rd floor--
            {
                name = 'vc61', --Must be uniq per any room
                price = 900,
                storage = {
                    state = true,
                    position = vector3(-1188.09, -180.99, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1190.00, -184.78, 55.79)
                },
                door = {
                    name = '#301',
                    objHash = -674469114,
                    position = vector3(-1188.32, -187.28, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc62', --Must be uniq per any room
                price = 900,
                storage = {
                    state = true,
                    position = vector3(-1180.11, -179.61, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1183.55, -183.38, 55.79)
                },
                door = {
                    name = '#302',
                    objHash = -674469114,
                    position = vector3(-1180.50, -185.60, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc63', --Must be uniq per any room
                price = 900,
                storage = {
                    state = true,
                    position = vector3(-1172.33, -177.92, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1175.38, -181.56, 55.79)
                },
                door = {
                    name = '#303',
                    objHash = -674469114,
                    position = vector3(-1172.68, -183.92, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc64', --Must be uniq per any room
                price = 900,
                storage = {
                    state = true,
                    position = vector3(-1164.55, -176.23, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1167.60, -179.44, 55.79)
                },
                door = {
                    name = '#304',
                    objHash = -674469114,
                    position = vector3(-1164.18, -182.24, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc65', --Must be uniq per any room
                price = 900,
                storage = {
                    state = true,
                    position = vector3(-1156.73, -174.55, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1159.78, -177.76, 55.79)
                },
                door = {
                    name = '#305',
                    objHash = -674469114,
                    position = vector3(-1156.36, -180.56, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc66', --Must be uniq per any room
                price = 900,
                storage = {
                    state = true,
                    position = vector3(-1148.91, -172.87, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1151.96, -176.08, 55.79)
                },
                door = {
                    name = '#306',
                    objHash = -674469114,
                    position = vector3(-1148.54, -178.88, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc67', --Must be uniq per any room
                price = 900,
                storage = {
                    state = true,
                    position = vector3(-1151.43, -188.95, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1148.42, -185.37, 55.79)
                },
                door = {
                    name = '#307',
                    objHash = -674469114,
                    position = vector3(-1151.12, -183.01, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc68', --Must be uniq per any room
                price = 900,
                storage = {
                    state = true,
                    position = vector3(-1159.25, -190.63, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1156.24, -187.05, 55.79)
                },
                door = {
                    name = '#308',
                    objHash = -674469114,
                    position = vector3(-1158.94, -184.69, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc69', --Must be uniq per any room
                price = 900,
                storage = {
                    state = true,
                    position = vector3(-1167.07, -192.31, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1164.06, -188.73, 55.79)
                },
                door = {
                    name = '#309',
                    objHash = -674469114,
                    position = vector3(-1166.76, -186.37, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc70', --Must be uniq per any room
                price = 900,
                storage = {
                    state = true,
                    position = vector3(-1174.89, -193.99, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1171.88, -190.41, 55.79)
                },
                door = {
                    name = '#310',
                    objHash = -674469114,
                    position = vector3(-1174.54, -188.05, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc71', --Must be uniq per any room
                price = 900,
                storage = {
                    state = true,
                    position = vector3(-1182.71, -195.67, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1179.70, -192.09, 55.79)
                },
                door = {
                    name = '#311',
                    objHash = -674469114,
                    position = vector3(-1182.36, -189.73, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc72', --Must be uniq per any room
                price = 900,
                storage = {
                    state = true,
                    position = vector3(-1190.53, -197.35, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1187.52, -193.77, 55.79)
                },
                door = {
                    name = '#312',
                    objHash = -674469114,
                    position = vector3(-1190.18, -191.41, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc73', --Must be uniq per any room
                price = 900,
                storage = {
                    state = true,
                    position = vector3(-1197.82, -205.88, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1198.74, -201.30, 55.79)
                },
                door = {
                    name = '#313',
                    objHash = -674469114,
                    position = vector3(-1202.26, -201.78, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc74', --Must be uniq per any room
                price = 900,
                storage = {
                    state = true,
                    position = vector3(-1201.58, -212.94, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1202.50, -208.36, 55.79)
                },
                door = {
                    name = '#314',
                    objHash = -674469114,
                    position = vector3(-1206.02, -208.84, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc75', --Must be uniq per any room
                price = 900,
                storage = {
                    state = true,
                    position = vector3(-1205.34, -220.00, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1206.26, -215.42, 55.79)
                },
                door = {
                    name = '#315',
                    objHash = -674469114,
                    position = vector3(-1209.78, -215.90, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc76', --Must be uniq per any room
                price = 900,
                storage = {
                    state = true,
                    position = vector3(-1209.10, -227.06, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1210.02, -222.48, 55.79)
                },
                door = {
                    name = '#316',
                    objHash = -674469114,
                    position = vector3(-1213.54, -222.96, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc77', --Must be uniq per any room
                price = 900,
                storage = {
                    state = true,
                    position = vector3(-1212.86, -234.12, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1213.78, -229.54, 55.79)
                },
                door = {
                    name = '#317',
                    objHash = -674469114,
                    position = vector3(-1217.30, -230.02, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc78', --Must be uniq per any room
                price = 900,
                storage = {
                    state = true,
                    position = vector3(-1216.62, -241.18, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1217.54, -236.60, 55.79)
                },
                door = {
                    name = '#318',
                    objHash = -674469114,
                    position = vector3(-1221.06, -237.08, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc79', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1226.78, -229.13, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1226.04, -233.71, 55.79)
                },
                door = {
                    name = '#319',
                    objHash = -674469114,
                    position = vector3(-1222.37, -233.31, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc80', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1223.02, -222.07, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1222.28, -226.65, 55.79)
                },
                door = {
                    name = '#320',
                    objHash = -674469114,
                    position = vector3(-1218.62, -226.24, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc81', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1219.24, -215.01, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1218.52, -219.59, 55.79)
                },
                door = {
                    name = '#321',
                    objHash = -674469114,
                    position = vector3(-1214.86, -219.18, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc82', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1215.48, -207.95, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1214.76, -212.53, 55.79)
                },
                door = {
                    name = '#322',
                    objHash = -674469114,
                    position = vector3(-1211.10, -212.12, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc83', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1211.72, -200.89, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1211.00, -205.47, 55.79)
                },
                door = {
                    name = '#323',
                    objHash = -674469114,
                    position = vector3(-1207.34, -205.06, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc84', --Must be uniq per any room
                price = 800,
                storage = {
                    state = true,
                    position = vector3(-1207.96, -193.83, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1207.24, -198.41, 55.79)
                },
                door = {
                    name = '#324',
                    objHash = -674469114,
                    position = vector3(-1203.58, -198.00, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc85', --Must be uniq per any room
                price = 1600,
                storage = {
                    state = true,
                    position = vector3(-1213.37, -175.74, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1207.99, -183.86, 55.79)
                },
                door = {
                    name = '#325',
                    objHash = -674469114,
                    position = vector3(-1210.40, -177.93, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 307.50
                },
            },
            {
                name = 'vc86', --Must be uniq per any room
                price = 1600,
                storage = {
                    state = true,
                    position = vector3(-1222.99, -162.96, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1217.61, -171.08, 55.79)
                },
                door = {
                    name = '#326',
                    objHash = -674469114,
                    position = vector3(-1220.02, -165.15, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 307.50
                },
            },
            {
                name = 'vc87', --Must be uniq per any room
                price = 1600,
                storage = {
                    state = true,
                    position = vector3(-1232.61, -150.18, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1227.23, -159.02, 55.79)
                },
                door = {
                    name = '#327',
                    objHash = -674469114,
                    position = vector3(-1229.64, -152.37, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 307.50
                },
            },
            {
                name = 'vc88', --Must be uniq per any room
                price = 2000,
                storage = {
                    state = true,
                    position = vector3(-1222.60, -154.53, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1228.58, -145.06, 55.79)
                },
                door = {
                    name = '#328',
                    objHash = -674469114,
                    position = vector3(-1225.62, -152.38, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 127.50
                },
            },
            {
                name = 'vc89', --Must be uniq per any room
                price = 2000,
                storage = {
                    state = true,
                    position = vector3(-1212.97, -167.36, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1218.47, -159.28, 55.79)
                },
                door = {
                    name = '#329',
                    objHash = -674469114,
                    position = vector3(-1215.50, -165.16, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 127.50
                },
            },
            {
                name = 'vc90', --Must be uniq per any room
                price = 2000,
                storage = {
                    state = true,
                    position = vector3(-1203.35, -180.14, 55.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1208.85, -172.06, 55.79)
                },
                door = {
                    name = '#330',
                    objHash = -674469114,
                    position = vector3(-1205.88, -177.94, 55.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 127.50
                },
            },
            --4th floor--
            {
                name = 'vc91', --Must be uniq per any room
                price = 1100,
                storage = {
                    state = true,
                    position = vector3(-1188.09, -180.99, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1190.00, -184.78, 59.79)
                },
                door = {
                    name = '#401',
                    objHash = -674469114,
                    position = vector3(-1188.32, -187.28, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc92', --Must be uniq per any room
                price = 1100,
                storage = {
                    state = true,
                    position = vector3(-1180.11, -179.61, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1183.55, -183.38, 59.79)
                },
                door = {
                    name = '#402',
                    objHash = -674469114,
                    position = vector3(-1180.50, -185.60, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc93', --Must be uniq per any room
                price = 1100,
                storage = {
                    state = true,
                    position = vector3(-1172.33, -177.92, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1175.38, -181.56, 59.79)
                },
                door = {
                    name = '#403',
                    objHash = -674469114,
                    position = vector3(-1172.68, -183.92, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc94', --Must be uniq per any room
                price = 1100,
                storage = {
                    state = true,
                    position = vector3(-1164.55, -176.23, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1167.60, -179.44, 59.79)
                },
                door = {
                    name = '#404',
                    objHash = -674469114,
                    position = vector3(-1164.18, -182.24, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc95', --Must be uniq per any room
                price = 1100,
                storage = {
                    state = true,
                    position = vector3(-1156.73, -174.55, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1159.78, -177.76, 59.79)
                },
                door = {
                    name = '#405',
                    objHash = -674469114,
                    position = vector3(-1156.36, -180.56, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc96', --Must be uniq per any room
                price = 1100,
                storage = {
                    state = true,
                    position = vector3(-1148.91, -172.87, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1151.96, -176.08, 59.79)
                },
                door = {
                    name = '#406',
                    objHash = -674469114,
                    position = vector3(-1148.54, -178.88, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc97', --Must be uniq per any room
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(-1151.43, -188.95, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1148.42, -185.37, 59.79)
                },
                door = {
                    name = '#407',
                    objHash = -674469114,
                    position = vector3(-1151.12, -183.01, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc98', --Must be uniq per any room
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(-1159.25, -190.63, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1156.24, -187.05, 59.79)
                },
                door = {
                    name = '#408',
                    objHash = -674469114,
                    position = vector3(-1158.94, -184.69, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc99', --Must be uniq per any room
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(-1167.07, -192.31, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1164.06, -188.73, 59.79)
                },
                door = {
                    name = '#409',
                    objHash = -674469114,
                    position = vector3(-1166.76, -186.37, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc100', --Must be uniq per any room
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(-1174.89, -193.99, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1171.88, -190.41, 59.79)
                },
                door = {
                    name = '#410',
                    objHash = -674469114,
                    position = vector3(-1174.54, -188.05, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc101', --Must be uniq per any room
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(-1182.71, -195.67, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1179.70, -192.09, 59.79)
                },
                door = {
                    name = '#411',
                    objHash = -674469114,
                    position = vector3(-1182.36, -189.73, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc102', --Must be uniq per any room
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(-1190.53, -197.35, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1187.52, -193.77, 59.79)
                },
                door = {
                    name = '#412',
                    objHash = -674469114,
                    position = vector3(-1190.18, -191.41, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc103', --Must be uniq per any room
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(-1197.82, -205.88, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1198.74, -201.30, 59.79)
                },
                door = {
                    name = '#413',
                    objHash = -674469114,
                    position = vector3(-1202.26, -201.78, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc104', --Must be uniq per any room
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(-1201.58, -212.94, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1202.50, -208.36, 59.79)
                },
                door = {
                    name = '#414',
                    objHash = -674469114,
                    position = vector3(-1206.02, -208.84, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc105', --Must be uniq per any room
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(-1205.34, -220.00, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1206.26, -215.42, 59.79)
                },
                door = {
                    name = '#415',
                    objHash = -674469114,
                    position = vector3(-1209.78, -215.90, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc106', --Must be uniq per any room
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(-1209.10, -227.06, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1210.02, -222.48, 59.79)
                },
                door = {
                    name = '#416',
                    objHash = -674469114,
                    position = vector3(-1213.54, -222.96, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc107', --Must be uniq per any room
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(-1212.86, -234.12, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1213.78, -229.54, 59.79)
                },
                door = {
                    name = '#417',
                    objHash = -674469114,
                    position = vector3(-1217.30, -230.02, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc108', --Must be uniq per any room
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(-1216.62, -241.18, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1217.54, -236.60, 59.79)
                },
                door = {
                    name = '#418',
                    objHash = -674469114,
                    position = vector3(-1221.06, -237.08, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc109', --Must be uniq per any room
                price = 900,
                storage = {
                    state = true,
                    position = vector3(-1226.78, -229.13, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1226.04, -233.71, 59.79)
                },
                door = {
                    name = '#419',
                    objHash = -674469114,
                    position = vector3(-1222.37, -233.31, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc110', --Must be uniq per any room
                price = 900,
                storage = {
                    state = true,
                    position = vector3(-1223.02, -222.07, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1222.28, -226.65, 59.79)
                },
                door = {
                    name = '#420',
                    objHash = -674469114,
                    position = vector3(-1218.62, -226.24, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc111', --Must be uniq per any room
                price = 900,
                storage = {
                    state = true,
                    position = vector3(-1219.24, -215.01, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1218.52, -219.59, 59.79)
                },
                door = {
                    name = '#421',
                    objHash = -674469114,
                    position = vector3(-1214.86, -219.18, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc112', --Must be uniq per any room
                price = 900,
                storage = {
                    state = true,
                    position = vector3(-1215.48, -207.95, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1214.76, -212.53, 59.79)
                },
                door = {
                    name = '#422',
                    objHash = -674469114,
                    position = vector3(-1211.10, -212.12, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc113', --Must be uniq per any room
                price = 900,
                storage = {
                    state = true,
                    position = vector3(-1211.72, -200.89, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1211.00, -205.47, 59.79)
                },
                door = {
                    name = '#423',
                    objHash = -674469114,
                    position = vector3(-1207.34, -205.06, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc114', --Must be uniq per any room
                price = 900,
                storage = {
                    state = true,
                    position = vector3(-1207.96, -193.83, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1207.24, -198.41, 59.79)
                },
                door = {
                    name = '#424',
                    objHash = -674469114,
                    position = vector3(-1203.58, -198.00, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc115', --Must be uniq per any room
                price = 1800,
                storage = {
                    state = true,
                    position = vector3(-1213.37, -175.74, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1207.99, -183.86, 59.79)
                },
                door = {
                    name = '#425',
                    objHash = -674469114,
                    position = vector3(-1210.40, -177.93, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 307.50
                },
            },
            {
                name = 'vc116', --Must be uniq per any room
                price = 1800,
                storage = {
                    state = true,
                    position = vector3(-1222.99, -162.96, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1217.61, -171.08, 59.79)
                },
                door = {
                    name = '#426',
                    objHash = -674469114,
                    position = vector3(-1220.02, -165.15, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 307.50
                },
            },
            {
                name = 'vc117', --Must be uniq per any room
                price = 1800,
                storage = {
                    state = true,
                    position = vector3(-1232.61, -150.18, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1227.23, -159.02, 59.79)
                },
                door = {
                    name = '#427',
                    objHash = -674469114,
                    position = vector3(-1229.64, -152.37, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 307.50
                },
            },
            {
                name = 'vc118', --Must be uniq per any room
                price = 2200,
                storage = {
                    state = true,
                    position = vector3(-1222.60, -154.53, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1228.58, -145.06, 59.79)
                },
                door = {
                    name = '#428',
                    objHash = -674469114,
                    position = vector3(-1225.62, -152.38, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 127.50
                },
            },
            {
                name = 'vc119', --Must be uniq per any room
                price = 2200,
                storage = {
                    state = true,
                    position = vector3(-1212.97, -167.36, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1218.47, -159.28, 59.79)
                },
                door = {
                    name = '#429',
                    objHash = -674469114,
                    position = vector3(-1215.50, -165.16, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 127.50
                },
            },
            {
                name = 'vc120', --Must be uniq per any room
                price = 2200,
                storage = {
                    state = true,
                    position = vector3(-1203.35, -180.14, 59.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1208.85, -172.06, 59.79)
                },
                door = {
                    name = '#430',
                    objHash = -674469114,
                    position = vector3(-1205.88, -177.94, 59.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 127.50
                },
            },
            -- 5th floor --
            {
                name = 'vc121', --Must be uniq per any room
                price = 1200,
                storage = {
                    state = true,
                    position = vector3(-1188.09, -180.99, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1190.00, -184.78, 63.79)
                },
                door = {
                    name = '#501',
                    objHash = -674469114,
                    position = vector3(-1188.32, -187.28, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc122', --Must be uniq per any room
                price = 1200,
                storage = {
                    state = true,
                    position = vector3(-1180.11, -179.61, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1183.55, -183.38, 63.79)
                },
                door = {
                    name = '#502',
                    objHash = -674469114,
                    position = vector3(-1180.50, -185.60, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc123', --Must be uniq per any room
                price = 1200,
                storage = {
                    state = true,
                    position = vector3(-1172.33, -177.92, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1175.38, -181.56, 63.79)
                },
                door = {
                    name = '#503',
                    objHash = -674469114,
                    position = vector3(-1172.68, -183.92, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc124', --Must be uniq per any room
                price = 1200,
                storage = {
                    state = true,
                    position = vector3(-1164.55, -176.23, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1167.60, -179.44, 63.79)
                },
                door = {
                    name = '#504',
                    objHash = -674469114,
                    position = vector3(-1164.18, -182.24, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc125', --Must be uniq per any room
                price = 1200,
                storage = {
                    state = true,
                    position = vector3(-1156.73, -174.55, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1159.78, -177.76, 63.79)
                },
                door = {
                    name = '#505',
                    objHash = -674469114,
                    position = vector3(-1156.36, -180.56, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc126', --Must be uniq per any room
                price = 1200,
                storage = {
                    state = true,
                    position = vector3(-1148.91, -172.87, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1151.96, -176.08, 63.79)
                },
                door = {
                    name = '#506',
                    objHash = -674469114,
                    position = vector3(-1148.54, -178.88, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc127', --Must be uniq per any room
                price = 1100,
                storage = {
                    state = true,
                    position = vector3(-1151.43, -188.95, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1148.42, -185.37, 63.79)
                },
                door = {
                    name = '#507',
                    objHash = -674469114,
                    position = vector3(-1151.12, -183.01, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc128', --Must be uniq per any room
                price = 1100,
                storage = {
                    state = true,
                    position = vector3(-1159.25, -190.63, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1156.24, -187.05, 63.79)
                },
                door = {
                    name = '#508',
                    objHash = -674469114,
                    position = vector3(-1158.94, -184.69, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc129', --Must be uniq per any room
                price = 1100,
                storage = {
                    state = true,
                    position = vector3(-1167.07, -192.31, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1164.06, -188.73, 63.79)
                },
                door = {
                    name = '#509',
                    objHash = -674469114,
                    position = vector3(-1166.76, -186.37, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc130', --Must be uniq per any room
                price = 1100,
                storage = {
                    state = true,
                    position = vector3(-1174.89, -193.99, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1171.88, -190.41, 63.79)
                },
                door = {
                    name = '#510',
                    objHash = -674469114,
                    position = vector3(-1174.54, -188.05, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc131', --Must be uniq per any room
                price = 1100,
                storage = {
                    state = true,
                    position = vector3(-1182.71, -195.67, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1179.70, -192.09, 63.79)
                },
                door = {
                    name = '#511',
                    objHash = -674469114,
                    position = vector3(-1182.36, -189.73, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc132', --Must be uniq per any room
                price = 1100,
                storage = {
                    state = true,
                    position = vector3(-1190.53, -197.35, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1187.52, -193.77, 63.79)
                },
                door = {
                    name = '#512',
                    objHash = -674469114,
                    position = vector3(-1190.18, -191.41, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc133', --Must be uniq per any room
                price = 1100,
                storage = {
                    state = true,
                    position = vector3(-1197.82, -205.88, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1198.74, -201.30, 63.79)
                },
                door = {
                    name = '#513',
                    objHash = -674469114,
                    position = vector3(-1202.26, -201.78, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc134', --Must be uniq per any room
                price = 1100,
                storage = {
                    state = true,
                    position = vector3(-1201.58, -212.94, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1202.50, -208.36, 63.79)
                },
                door = {
                    name = '#514',
                    objHash = -674469114,
                    position = vector3(-1206.02, -208.84, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc135', --Must be uniq per any room
                price = 1100,
                storage = {
                    state = true,
                    position = vector3(-1205.34, -220.00, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1206.26, -215.42, 63.79)
                },
                door = {
                    name = '#515',
                    objHash = -674469114,
                    position = vector3(-1209.78, -215.90, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc136', --Must be uniq per any room
                price = 1100,
                storage = {
                    state = true,
                    position = vector3(-1209.10, -227.06, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1210.02, -222.48, 63.79)
                },
                door = {
                    name = '#516',
                    objHash = -674469114,
                    position = vector3(-1213.54, -222.96, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc137', --Must be uniq per any room
                price = 1100,
                storage = {
                    state = true,
                    position = vector3(-1212.86, -234.12, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1213.78, -229.54, 63.79)
                },
                door = {
                    name = '#517',
                    objHash = -674469114,
                    position = vector3(-1217.30, -230.02, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc138', --Must be uniq per any room
                price = 1100,
                storage = {
                    state = true,
                    position = vector3(-1216.62, -241.18, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1217.54, -236.60, 63.79)
                },
                door = {
                    name = '#518',
                    objHash = -674469114,
                    position = vector3(-1221.06, -237.08, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc139', --Must be uniq per any room
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(-1226.78, -229.13, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1226.04, -233.71, 63.79)
                },
                door = {
                    name = '#519',
                    objHash = -674469114,
                    position = vector3(-1222.37, -233.31, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc140', --Must be uniq per any room
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(-1223.02, -222.07, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1222.28, -226.65, 63.79)
                },
                door = {
                    name = '#520',
                    objHash = -674469114,
                    position = vector3(-1218.62, -226.24, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc141', --Must be uniq per any room
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(-1219.24, -215.01, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1218.52, -219.59, 63.79)
                },
                door = {
                    name = '#521',
                    objHash = -674469114,
                    position = vector3(-1214.86, -219.18, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc142', --Must be uniq per any room
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(-1215.48, -207.95, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1214.76, -212.53, 63.79)
                },
                door = {
                    name = '#522',
                    objHash = -674469114,
                    position = vector3(-1211.10, -212.12, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc143', --Must be uniq per any room
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(-1211.72, -200.89, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1211.00, -205.47, 63.79)
                },
                door = {
                    name = '#523',
                    objHash = -674469114,
                    position = vector3(-1207.34, -205.06, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc144', --Must be uniq per any room
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(-1207.96, -193.83, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1207.24, -198.41, 63.79)
                },
                door = {
                    name = '#524',
                    objHash = -674469114,
                    position = vector3(-1203.58, -198.00, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc145', --Must be uniq per any room
                price = 2000,
                storage = {
                    state = true,
                    position = vector3(-1213.37, -175.74, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1207.99, -183.86, 63.79)
                },
                door = {
                    name = '#525',
                    objHash = -674469114,
                    position = vector3(-1210.40, -177.93, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 307.50
                },
            },
            {
                name = 'vc146', --Must be uniq per any room
                price = 2000,
                storage = {
                    state = true,
                    position = vector3(-1222.99, -162.96, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1217.61, -171.08, 63.79)
                },
                door = {
                    name = '#526',
                    objHash = -674469114,
                    position = vector3(-1220.02, -165.15, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 307.50
                },
            },
            {
                name = 'vc147', --Must be uniq per any room
                price = 2000,
                storage = {
                    state = true,
                    position = vector3(-1232.61, -150.18, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1227.23, -159.02, 63.79)
                },
                door = {
                    name = '#527',
                    objHash = -674469114,
                    position = vector3(-1229.64, -152.37, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 307.50
                },
            },
            {
                name = 'vc148', --Must be uniq per any room
                price = 2400,
                storage = {
                    state = true,
                    position = vector3(-1222.60, -154.53, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1228.58, -145.06, 63.79)
                },
                door = {
                    name = '#528',
                    objHash = -674469114,
                    position = vector3(-1225.62, -152.38, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 127.50
                },
            },
            {
                name = 'vc149', --Must be uniq per any room
                price = 2400,
                storage = {
                    state = true,
                    position = vector3(-1212.97, -167.36, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1218.47, -159.28, 63.79)
                },
                door = {
                    name = '#529',
                    objHash = -674469114,
                    position = vector3(-1215.50, -165.16, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 127.50
                },
            },
            {
                name = 'vc150', --Must be uniq per any room
                price = 2400,
                storage = {
                    state = true,
                    position = vector3(-1203.35, -180.14, 63.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1208.85, -172.06, 63.79)
                },
                door = {
                    name = '#530',
                    objHash = -674469114,
                    position = vector3(-1205.88, -177.94, 63.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 127.50
                },
            },
            -- 6TH FLOOR --
            {
                name = 'vc151', --Must be uniq per any room
                price = 1400,
                storage = {
                    state = true,
                    position = vector3(-1188.09, -180.99, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1190.00, -184.78, 67.79)
                },
                door = {
                    name = '#601',
                    objHash = -674469114,
                    position = vector3(-1188.32, -187.28, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc152', --Must be uniq per any room
                price = 1400,
                storage = {
                    state = true,
                    position = vector3(-1180.11, -179.61, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1183.55, -183.38, 67.79)
                },
                door = {
                    name = '#602',
                    objHash = -674469114,
                    position = vector3(-1180.50, -185.60, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc153', --Must be uniq per any room
                price = 1400,
                storage = {
                    state = true,
                    position = vector3(-1172.33, -177.92, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1175.38, -181.56, 67.79)
                },
                door = {
                    name = '#603',
                    objHash = -674469114,
                    position = vector3(-1172.68, -183.92, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc154', --Must be uniq per any room
                price = 1400,
                storage = {
                    state = true,
                    position = vector3(-1164.55, -176.23, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1167.60, -179.44, 67.79)
                },
                door = {
                    name = '#604',
                    objHash = -674469114,
                    position = vector3(-1164.18, -182.24, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc155', --Must be uniq per any room
                price = 1400,
                storage = {
                    state = true,
                    position = vector3(-1156.73, -174.55, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1159.78, -177.76, 67.79)
                },
                door = {
                    name = '#605',
                    objHash = -674469114,
                    position = vector3(-1156.36, -180.56, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc156', --Must be uniq per any room
                price = 1400,
                storage = {
                    state = true,
                    position = vector3(-1148.91, -172.87, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1151.96, -176.08, 67.79)
                },
                door = {
                    name = '#606',
                    objHash = -674469114,
                    position = vector3(-1148.54, -178.88, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc157', --Must be uniq per any room
                price = 1200,
                storage = {
                    state = true,
                    position = vector3(-1151.43, -188.95, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1148.42, -185.37, 67.79)
                },
                door = {
                    name = '#607',
                    objHash = -674469114,
                    position = vector3(-1151.12, -183.01, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc158', --Must be uniq per any room
                price = 1200,
                storage = {
                    state = true,
                    position = vector3(-1159.25, -190.63, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1156.24, -187.05, 67.79)
                },
                door = {
                    name = '#608',
                    objHash = -674469114,
                    position = vector3(-1158.94, -184.69, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc159', --Must be uniq per any room
                price = 1200,
                storage = {
                    state = true,
                    position = vector3(-1167.07, -192.31, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1164.06, -188.73, 67.79)
                },
                door = {
                    name = '#609',
                    objHash = -674469114,
                    position = vector3(-1166.76, -186.37, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc160', --Must be uniq per any room
                price = 1200,
                storage = {
                    state = true,
                    position = vector3(-1174.89, -193.99, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1171.88, -190.41, 67.79)
                },
                door = {
                    name = '#610',
                    objHash = -674469114,
                    position = vector3(-1174.54, -188.05, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc161', --Must be uniq per any room
                price = 1200,
                storage = {
                    state = true,
                    position = vector3(-1182.71, -195.67, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1179.70, -192.09, 67.79)
                },
                door = {
                    name = '#611',
                    objHash = -674469114,
                    position = vector3(-1182.36, -189.73, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc162', --Must be uniq per any room
                price = 1200,
                storage = {
                    state = true,
                    position = vector3(-1190.53, -197.35, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1187.52, -193.77, 67.79)
                },
                door = {
                    name = '#612',
                    objHash = -674469114,
                    position = vector3(-1190.18, -191.41, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc163', --Must be uniq per any room
                price = 1200,
                storage = {
                    state = true,
                    position = vector3(-1197.82, -205.88, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1198.74, -201.30, 67.79)
                },
                door = {
                    name = '#613',
                    objHash = -674469114,
                    position = vector3(-1202.26, -201.78, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc164', --Must be uniq per any room
                price = 1200,
                storage = {
                    state = true,
                    position = vector3(-1201.58, -212.94, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1202.50, -208.36, 67.79)
                },
                door = {
                    name = '#614',
                    objHash = -674469114,
                    position = vector3(-1206.02, -208.84, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc165', --Must be uniq per any room
                price = 1200,
                storage = {
                    state = true,
                    position = vector3(-1205.34, -220.00, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1206.26, -215.42, 67.79)
                },
                door = {
                    name = '#615',
                    objHash = -674469114,
                    position = vector3(-1209.78, -215.90, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc166', --Must be uniq per any room
                price = 1200,
                storage = {
                    state = true,
                    position = vector3(-1209.10, -227.06, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1210.02, -222.48, 67.79)
                },
                door = {
                    name = '#616',
                    objHash = -674469114,
                    position = vector3(-1213.54, -222.96, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc167', --Must be uniq per any room
                price = 1200,
                storage = {
                    state = true,
                    position = vector3(-1212.86, -234.12, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1213.78, -229.54, 67.79)
                },
                door = {
                    name = '#617',
                    objHash = -674469114,
                    position = vector3(-1217.30, -230.02, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc168', --Must be uniq per any room
                price = 1200,
                storage = {
                    state = true,
                    position = vector3(-1216.62, -241.18, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1217.54, -236.60, 67.79)
                },
                door = {
                    name = '#618',
                    objHash = -674469114,
                    position = vector3(-1221.06, -237.08, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc169', --Must be uniq per any room
                price = 1100,
                storage = {
                    state = true,
                    position = vector3(-1226.78, -229.13, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1226.04, -233.71, 67.79)
                },
                door = {
                    name = '#619',
                    objHash = -674469114,
                    position = vector3(-1222.37, -233.31, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc170', --Must be uniq per any room
                price = 1100,
                storage = {
                    state = true,
                    position = vector3(-1223.02, -222.07, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1222.28, -226.65, 67.79)
                },
                door = {
                    name = '#620',
                    objHash = -674469114,
                    position = vector3(-1218.62, -226.24, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc171', --Must be uniq per any room
                price = 1100,
                storage = {
                    state = true,
                    position = vector3(-1219.24, -215.01, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1218.52, -219.59, 67.79)
                },
                door = {
                    name = '#621',
                    objHash = -674469114,
                    position = vector3(-1214.86, -219.18, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc172', --Must be uniq per any room
                price = 1100,
                storage = {
                    state = true,
                    position = vector3(-1215.48, -207.95, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1214.76, -212.53, 67.79)
                },
                door = {
                    name = '#622',
                    objHash = -674469114,
                    position = vector3(-1211.10, -212.12, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc173', --Must be uniq per any room
                price = 1100,
                storage = {
                    state = true,
                    position = vector3(-1211.72, -200.89, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1211.00, -205.47, 67.79)
                },
                door = {
                    name = '#623',
                    objHash = -674469114,
                    position = vector3(-1207.34, -205.06, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc174', --Must be uniq per any room
                price = 1100,
                storage = {
                    state = true,
                    position = vector3(-1207.96, -193.83, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1207.24, -198.41, 67.79)
                },
                door = {
                    name = '#624',
                    objHash = -674469114,
                    position = vector3(-1203.58, -198.00, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc175', --Must be uniq per any room
                price = 2200,
                storage = {
                    state = true,
                    position = vector3(-1213.37, -175.74, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1207.99, -183.86, 67.79)
                },
                door = {
                    name = '#625',
                    objHash = -674469114,
                    position = vector3(-1210.40, -177.93, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 307.50
                },
            },
            {
                name = 'vc176', --Must be uniq per any room
                price = 2200,
                storage = {
                    state = true,
                    position = vector3(-1222.99, -162.96, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1217.61, -171.08, 67.79)
                },
                door = {
                    name = '#626',
                    objHash = -674469114,
                    position = vector3(-1220.02, -165.15, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 307.50
                },
            },
            {
                name = 'vc177', --Must be uniq per any room
                price = 2200,
                storage = {
                    state = true,
                    position = vector3(-1232.61, -150.18, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1227.23, -159.02, 67.79)
                },
                door = {
                    name = '#627',
                    objHash = -674469114,
                    position = vector3(-1229.64, -152.37, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 307.50
                },
            },
            {
                name = 'vc178', --Must be uniq per any room
                price = 2600,
                storage = {
                    state = true,
                    position = vector3(-1222.60, -154.53, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1228.58, -145.06, 67.79)
                },
                door = {
                    name = '#628',
                    objHash = -674469114,
                    position = vector3(-1225.62, -152.38, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 127.50
                },
            },
            {
                name = 'vc179', --Must be uniq per any room
                price = 2600,
                storage = {
                    state = true,
                    position = vector3(-1212.97, -167.36, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1218.47, -159.28, 67.79)
                },
                door = {
                    name = '#629',
                    objHash = -674469114,
                    position = vector3(-1215.50, -165.16, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 127.50
                },
            },
            {
                name = 'vc180', --Must be uniq per any room
                price = 2600,
                storage = {
                    state = true,
                    position = vector3(-1203.35, -180.14, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1208.85, -172.06, 67.79)
                },
                door = {
                    name = '#630',
                    objHash = -674469114,
                    position = vector3(-1205.88, -177.94, 67.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 127.50
                },
            },
            -- 7th --
            {
                name = 'vc181', --Must be uniq per any room
                price = 1300,
                storage = {
                    state = true,
                    position = vector3(-1188.09, -180.99, 67.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1190.00, -184.78, 71.79)
                },
                door = {
                    name = '#701',
                    objHash = -674469114,
                    position = vector3(-1188.32, -187.28, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc182', --Must be uniq per any room
                price = 1300,
                storage = {
                    state = true,
                    position = vector3(-1180.11, -179.61, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1183.55, -183.38, 71.79)
                },
                door = {
                    name = '#702',
                    objHash = -674469114,
                    position = vector3(-1180.50, -185.60, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc183', --Must be uniq per any room
                price = 1300,
                storage = {
                    state = true,
                    position = vector3(-1172.33, -177.92, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1175.38, -181.56, 71.79)
                },
                door = {
                    name = '#703',
                    objHash = -674469114,
                    position = vector3(-1172.68, -183.92, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc184', --Must be uniq per any room
                price = 1300,
                storage = {
                    state = true,
                    position = vector3(-1164.55, -176.23, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1167.60, -179.44, 71.79)
                },
                door = {
                    name = '#704',
                    objHash = -674469114,
                    position = vector3(-1164.18, -182.24, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc185', --Must be uniq per any room
                price = 1300,
                storage = {
                    state = true,
                    position = vector3(-1156.73, -174.55, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1159.78, -177.76, 71.79)
                },
                door = {
                    name = '#705',
                    objHash = -674469114,
                    position = vector3(-1156.36, -180.56, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc186', --Must be uniq per any room
                price = 1300,
                storage = {
                    state = true,
                    position = vector3(-1148.91, -172.87, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1151.96, -176.08, 71.79)
                },
                door = {
                    name = '#706',
                    objHash = -674469114,
                    position = vector3(-1148.54, -178.88, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 192.00
                },
            },
            {
                name = 'vc187', --Must be uniq per any room
                price = 1300,
                storage = {
                    state = true,
                    position = vector3(-1151.43, -188.95, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1148.42, -185.37, 71.79)
                },
                door = {
                    name = '#707',
                    objHash = -674469114,
                    position = vector3(-1151.12, -183.01, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc188', --Must be uniq per any room
                price = 1300,
                storage = {
                    state = true,
                    position = vector3(-1159.25, -190.63, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1156.24, -187.05, 71.79)
                },
                door = {
                    name = '#708',
                    objHash = -674469114,
                    position = vector3(-1158.94, -184.69, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc189', --Must be uniq per any room
                price = 1300,
                storage = {
                    state = true,
                    position = vector3(-1167.07, -192.31, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1164.06, -188.73, 71.79)
                },
                door = {
                    name = '#709',
                    objHash = -674469114,
                    position = vector3(-1166.76, -186.37, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc190', --Must be uniq per any room
                price = 1300,
                storage = {
                    state = true,
                    position = vector3(-1174.89, -193.99, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1171.88, -190.41, 71.79)
                },
                door = {
                    name = '#710',
                    objHash = -674469114,
                    position = vector3(-1174.54, -188.05, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc191', --Must be uniq per any room
                price = 1300,
                storage = {
                    state = true,
                    position = vector3(-1182.71, -195.67, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1179.70, -192.09, 71.79)
                },
                door = {
                    name = '#711',
                    objHash = -674469114,
                    position = vector3(-1182.36, -189.73, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc192', --Must be uniq per any room
                price = 1300,
                storage = {
                    state = true,
                    position = vector3(-1190.53, -197.35, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1187.52, -193.77, 71.79)
                },
                door = {
                    name = '#712',
                    objHash = -674469114,
                    position = vector3(-1190.18, -191.41, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 12.00
                },
            },
            {
                name = 'vc193', --Must be uniq per any room
                price = 1300,
                storage = {
                    state = true,
                    position = vector3(-1197.82, -205.88, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1198.74, -201.30, 71.79)
                },
                door = {
                    name = '#713',
                    objHash = -674469114,
                    position = vector3(-1202.26, -201.78, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc194', --Must be uniq per any room
                price = 1300,
                storage = {
                    state = true,
                    position = vector3(-1201.58, -212.94, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1202.50, -208.36, 71.79)
                },
                door = {
                    name = '#714',
                    objHash = -674469114,
                    position = vector3(-1206.02, -208.84, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc195', --Must be uniq per any room
                price = 1300,
                storage = {
                    state = true,
                    position = vector3(-1205.34, -220.00, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1206.26, -215.42, 71.79)
                },
                door = {
                    name = '#715',
                    objHash = -674469114,
                    position = vector3(-1209.78, -215.90, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc196', --Must be uniq per any room
                price = 1300,
                storage = {
                    state = true,
                    position = vector3(-1209.10, -227.06, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1210.02, -222.48, 71.79)
                },
                door = {
                    name = '#716',
                    objHash = -674469114,
                    position = vector3(-1213.54, -222.96, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc197', --Must be uniq per any room
                price = 1300,
                storage = {
                    state = true,
                    position = vector3(-1212.86, -234.12, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1213.78, -229.54, 71.79)
                },
                door = {
                    name = '#717',
                    objHash = -674469114,
                    position = vector3(-1217.30, -230.02, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc198', --Must be uniq per any room
                price = 1300,
                storage = {
                    state = true,
                    position = vector3(-1216.62, -241.18, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1217.54, -236.60, 71.79)
                },
                door = {
                    name = '#718',
                    objHash = -674469114,
                    position = vector3(-1221.06, -237.08, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 62.00
                },
            },
            {
                name = 'vc199', --Must be uniq per any room
                price = 1200,
                storage = {
                    state = true,
                    position = vector3(-1226.78, -229.13, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1226.04, -233.71, 71.79)
                },
                door = {
                    name = '#719',
                    objHash = -674469114,
                    position = vector3(-1222.37, -233.31, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc200', --Must be uniq per any room
                price = 1200,
                storage = {
                    state = true,
                    position = vector3(-1223.02, -222.07, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1222.28, -226.65, 71.79)
                },
                door = {
                    name = '#720',
                    objHash = -674469114,
                    position = vector3(-1218.62, -226.24, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc201', --Must be uniq per any room
                price = 1200,
                storage = {
                    state = true,
                    position = vector3(-1219.24, -215.01, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1218.52, -219.59, 71.79)
                },
                door = {
                    name = '#721',
                    objHash = -674469114,
                    position = vector3(-1214.86, -219.18, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc202', --Must be uniq per any room
                price = 1200,
                storage = {
                    state = true,
                    position = vector3(-1215.48, -207.95, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1214.76, -212.53, 71.79)
                },
                door = {
                    name = '#722',
                    objHash = -674469114,
                    position = vector3(-1211.10, -212.12, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc203', --Must be uniq per any room
                price = 1200,
                storage = {
                    state = true,
                    position = vector3(-1211.72, -200.89, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1211.00, -205.47, 71.79)
                },
                door = {
                    name = '#723',
                    objHash = -674469114,
                    position = vector3(-1207.34, -205.06, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc204', --Must be uniq per any room
                price = 1200,
                storage = {
                    state = true,
                    position = vector3(-1207.96, -193.83, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1207.24, -198.41, 71.79)
                },
                door = {
                    name = '#724',
                    objHash = -674469114,
                    position = vector3(-1203.58, -198.00, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 242.00
                },
            },
            {
                name = 'vc205', --Must be uniq per any room
                price = 2400,
                storage = {
                    state = true,
                    position = vector3(-1213.37, -175.74, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1207.99, -183.86, 71.79)
                },
                door = {
                    name = '#725',
                    objHash = -674469114,
                    position = vector3(-1210.40, -177.93, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 307.50
                },
            },
            {
                name = 'vc206', --Must be uniq per any room
                price = 2400,
                storage = {
                    state = true,
                    position = vector3(-1222.99, -162.96, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1217.61, -171.08, 71.79)
                },
                door = {
                    name = '#726',
                    objHash = -674469114,
                    position = vector3(-1220.02, -165.15, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 307.50
                },
            },
            {
                name = 'vc207', --Must be uniq per any room
                price = 2400,
                storage = {
                    state = true,
                    position = vector3(-1232.61, -150.18, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1227.23, -159.02, 71.79)
                },
                door = {
                    name = '#727',
                    objHash = -674469114,
                    position = vector3(-1229.64, -152.37, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 307.50
                },
            },
            {
                name = 'vc208', --Must be uniq per any room
                price = 2800,
                storage = {
                    state = true,
                    position = vector3(-1222.60, -154.53, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1228.58, -145.06, 71.79)
                },
                door = {
                    name = '#728',
                    objHash = -674469114,
                    position = vector3(-1225.62, -152.38, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 127.50
                },
            },
            {
                name = 'vc209', --Must be uniq per any room
                price = 2800,
                storage = {
                    state = true,
                    position = vector3(-1212.97, -167.36, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1218.47, -159.28, 71.79)
                },
                door = {
                    name = '#729',
                    objHash = -674469114,
                    position = vector3(-1215.50, -165.16, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 127.50
                },
            },
            {
                name = 'vc210', --Must be uniq per any room
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(-1203.35, -180.14, 71.79)
                },
                clothes = {
                    state = true,
                    position = vector3(-1208.85, -172.06, 71.79)
                },
                door = {
                    name = '#730',
                    objHash = -674469114,
                    position = vector3(-1205.88, -177.94, 71.89),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 127.50
                },
            },
        },
    },

    {
        displayName = 'Westgate',
        name = 'westgate', --Must be uniq for every hotel
        paymentType = 'standard', --Standard or invoice
        distance = 100.0,
        blip = {
            color = 15,
            sprite = 475,
            coords = vector3(-389.98, 4714.54, 263.07),
            scale = 0.8,
        },
        doorText = {
            size = 0.8,
            scale = 0.8,
            renderDistance = 3,
        },
        rooms = {
            {
                name = 'cabin1', --Must be uniq per any room
                price = 10000,
                storage = {
                    state = true,
                    position = vector3(-384.42, 4724.73, 262.80)
                },
                clothes = {
                    state = true,
                    position = vector3(-384.06, 4729.57, 262.77)
                },
                door = {
                    name = '#11101',
                    objHash = 1335309163,
                    position = vector3(-388.54, 4724.19, 262.80),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 170.00
                },
            },
            {
                name = 'cabin2', --Must be uniq per any room
                price = 10000,
                storage = {
                    state = true,
                    position = vector3(-381.66, 4700.64, 262.87)
                },
                clothes = {
                    state = true,
                    position = vector3(-378.08, 4697.2, 262.85)
                },
                door = {
                    name = '#12102',
                    objHash = 1335309163,
                    position = vector3(-379.66, 4704.09, 262.88),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 44.00
                },
            },
            {
                name = 'cabin3', --Must be uniq per any room
                price = 10000,
                storage = {
                    state = true,
                    position = vector3(-395.13, 4703.02, 264.3)
                },
                clothes = {
                    state = true,
                    position = vector3(-395.93, 4698.22, 264.)
                },
                door = {
                    name = '#13103',
                    objHash = 1335309163,
                    position = vector3(-391.25, 4703.61, 264.34),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 350.00
                },
            },
            {
                name = 'cabin4', --Must be uniq per any room
                price = 20000,
                storage = {
                    state = true,
                    position = vector3(-1271.92, 4403.56, 11.34)
                },
                clothes = {
                    state = true,
                    position = vector3(-1271.51, 4398.72, 11.32)
                },
                door = {
                    name = '#24101',
                    objHash = 1335309163,
                    position = vector3(-1268.08, 4404.91, 11.32),
                    offset = {
                        x = 0.6,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 0.00
                },
            },
        },
    },

    --[[Predefined gabz motel you can change it to whatever hotel you like
    {
        displayName = 'Pinkcage motel',
        name = 'pinkcage', --Must be uniq for every hotel
        paymentType = 'invoice', --Standard or invoice
        distance = 100.0,
        blip = {
            color = 15,
            sprite = 542,
            coords = vector3(325.71, -211.33, 54.09),
            scale = 0.8,
        },
        doorText = {
            size = 0.8,
            scale = 0.8,
            renderDistance = 3,
        },

        rooms = {
{
                name = 'pinkcage1', --Must be uniq per any room
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(310.58, -198.72, 54.23)
                },
                clothes = {
                    state = true,
                    position = vector3(306.32, -197.33, 54.23)
                },
                door = {
                    name = 'Room 1#',
                    objHash = -1156992775,
                    position = vector3(310.6, -203.79, 54.37),
                    offset = {
                        x = 0.5,
                        y = 0,
                        z = 0
                    },
                    objHeading = 68.930
                },
            },
            {
                name = 'pinkcage2',
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(320.47, -194.08, 54.23)
                },
                clothes = {
                    state = true,
                    position = vector3(322.13, -190.01, 54.23)
                },
                door = {
                    name = 'Room 2#',
                    objHash = -1156992775,
                    position = vector3(315.39, -194.17, 54.37),
                    offset = {
                        x = 0.5,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = -21.0
                }
            },
            {
                name = 'pinkcage3',
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(347.55, -204.36, 54.23)
                },
                clothes = {
                    state = true,
                    position = vector3(351.47, -205.92, 54.23)
                },
                door = {
                    name = 'Room 3#',
                    objHash = -1156992775,
                    position = vector3(347.39, -199.3, 54.37),
                    offset = {
                        x = 0.5,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 248.9
                }
            },
            {
                name = 'pinkcage4',
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(343.62, -214.27, 54.23)
                },
                clothes = {
                    state = true,
                    position = vector3(347.58, -215.88, 54.23)
                },
                door = {
                    name = 'Room 4#',
                    objHash = -1156992775,
                    position = vector3(343.6, -209.21, 54.37),
                    offset = {
                        x = 0.5,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 248.9
                }
            },
            {
                name = 'pinkcage5',
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(339.93, -224.09, 54.23)
                },
                clothes = {
                    state = true,
                    position = vector3(343.83, -225.76, 54.23)
                },
                door = {
                    name = 'Room 5#',
                    objHash = -1156992775,
                    position = vector3(339.8, -219.0, 54.3),
                    offset = {
                        x = 0.5,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 248.9
                }
            },
            {
                name = 'pinkcage6',
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(330.26, -228.08, 58.02)
                },
                clothes = {
                    state = true,
                    position = vector3(328.82, -232.09, 58.02)
                },
                door = {
                    name = 'Room 6#',
                    objHash = -1156992775,
                    position = vector3(335.3, -227.9, 58.16),
                    offset = {
                        x = 0.5,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 158.9
                }
            },
            {
                name = 'pinkcage7',
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(339.96, -224.18, 58.02)
                },
                clothes = {
                    state = true,
                    position = vector3(343.94, -225.79, 58.02)
                },
                door = {
                    name = 'Room 7#',
                    objHash = -1156992775,
                    position = vector3(339.8, -219.0, 58.16),
                    offset = {
                        x = 0.5,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 248.9
                }
            },
            {
                name = 'pinkcage8',
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(343.96, -214.4, 58.02)
                },
                clothes = {
                    state = true,
                    position = vector3(347.95, -215.88, 58.02)
                },
                door = {
                    name = 'Room 8#',
                    objHash = -1156992775,
                    position = vector3(343.6, -209.21, 58.16),
                    offset = {
                        x = 0.5,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 248.9
                }
            },
            {
                name = 'pinkcage9',
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(347.66, -204.37, 58.02)
                },
                clothes = {
                    state = true,
                    position = vector3(351.67, -205.82, 58.02)
                },
                door = {
                    name = 'Room 9#',
                    objHash = -1156992775,
                    position = vector3(347.3, -199.3, 58.16),
                    offset = {
                        x = 0.5,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 248.9
                }
            },
            {
                name = 'pinkcage10',
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(320.53, -193.94, 58.02)
                },
                clothes = {
                    state = true,
                    position = vector3(321.97, -189.86, 58.02)
                },
                door = {
                    name = 'Room 10#',
                    objHash = -1156992775,
                    position = vector3(315.3, -194.1, 58.16),
                    offset = {
                        x = 0.5,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 338.9
                }
            },
            {
                name = 'pinkcage11',
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(310.5, -198.79, 58.02)
                },
                clothes = {
                    state = true,
                    position = vector3(306.33, -197.24, 58.02)
                },
                door = {
                    name = 'Room 11#',
                    objHash = -1156992775,
                    position = vector3(310.6, -203.7, 58.16),
                    offset = {
                        x = 0.5,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 68.910
                }
            },
            {
                name = 'pinkcage12',
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(306.79, -208.61, 58.02)
                },
                clothes = {
                    state = true,
                    position = vector3(302.62, -206.99, 58.02)
                },
                door = {
                    name = 'Room 12#',
                    objHash = -1156992775,
                    position = vector3(306.8, -213.6, 58.16),
                    offset = {
                        x = 0.5,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 68.910
                }
            },
            {
                name = 'pinkcage13',
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(310.21, -220.26, 58.02)
                },
                clothes = {
                    state = true,
                    position = vector3(308.79, -224.62, 58.02)
                },
                door = {
                    name = 'Room 13#',
                    objHash = -1156992775,
                    position = vector3(315.25, -220.2, 58.17),
                    offset = {
                        x = 0.5,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 158.9
                }
            },
            {
                name = 'pinkcage14',
                price = 1000,
                storage = {
                    state = true,
                    position = vector3(306.71, -208.49, 54.23)
                },
                clothes = {
                    state = true,
                    position = vector3(302.97, -207.0, 54.23)
                },
                door = {
                    name = 'Room 14#',
                    objHash = -1156992775,
                    position = vector3(306.8, -213.6, 54.37),
                    offset = {
                        x = 0.5,
                        y = 0,
                        z = 0.5
                    },
                    objHeading = 68.96
                }
            }
        }
    }]]
}
