Config                            = {}
Config.DrawDistance               = 30.0
Config.Locale                     = 'EN'
Config.showMarker = true


Config.Zones = {

    RDC1 = {--RDC 1 / 4
        Marker  = { x = -1208.51 , y = -217.83, z = 38.3251 },
        Spawn   = { x = -1208.51 , y = -217.83, z = 39.3251 },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 242, g = 27, b = 51 },
        Type    = 27,
        Heading = 62.8135,
        canGoTo = {"Etage11","Etage21","Etage31","Etage41","Etage51","Etage61","Etage71"}
        --canGoTo = {"Etage11","Etage21","Etage31"}
    },
    
     RDC2 = {--RDC 2 / 4
         Marker  = { x = -1198.47 , y = -198.89, z = 38.3251  },
         Spawn   = { x = -1198.47 , y = -198.89, z = 39.3251  },
         Size    = { x = 2.0, y = 2.0, z = 1.0 },
         Color   = { r = 255, g = 122, b = 51 },
         Type    = 27,
         Heading = 63.5532,
         canGoTo = {"Etage12","Etage22","Etage32","Etage42","Etage52","Etage61","Etage72"}
     },
    
     RDC3 = {--RDC 3 / 4
         Marker  = { x = -1218.90 , y = -156.39, z = 38.3251  },
         Spawn   = { x = -1218.90 , y = -156.39, z = 39.3251  },
         Size    = { x = 2.0, y = 2.0, z = 1.0 },
         Color   = { r = 255, g = 122, b = 51 },
         Type    = 27,
         Heading = 144.4608,
         canGoTo = {"Etage13","Etage23","Etage33","Etage43","Etage53","Etage63","Etage73"}
     },
    
    -- RDC4 = {--RDC 4 / 4
        -- Marker  = { x = -1214.2536621094 , y = -190.97254943848, z = 39.325103759766  },
        -- Spawn   = { x = -1214.2536621094 , y = -190.97254943848, z = 40.325103759766 },
        -- Size    = { x = 2.0, y = 2.0, z = 1.0 },
        -- Color   = { r = 255, g = 187, b = 255 },
        -- Type    = 27,
        -- Heading = 169.59108,
        -- canGoTo = {"Etage14","Etage24","Etage34","Etage44","Etage54","Etage64","Etage74"}
    -- },



    Etage11 = {--Etage1 1 / 4
        -- Marker  = {x=-1203.0048828125, y=-190.76875305176, z=46.79},
        -- Spawn   = {x=-1203.0048828125, y=-190.76875305176, z=47.79},
        
        Marker  = {x=-1203.1069335938,y=-190.87379455566,z=46.79},
        Spawn   = {x=-1203.1069335938,y=-190.87379455566,z=47.79},
        
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC1","Etage21","Etage31","Etage41","Etage51","Etage61","Etage71"}
    },
    Etage12 = {--Etage1 2 / 4
        Marker  = {x=-1204.8363037109, y=-188.37803649902, z=46.79},
        Spawn   = {x=-1204.8363037109, y=-188.37803649902, z=47.79},
        
        
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC2","Etage22","Etage32","Etage42","Etage52","Etage62","Etage72"}
    },
    Etage13 = {--Etage1 3 / 4
        Marker  = {x=-1199.1802978516, y=-184.08113098145, z=46.79},
        Spawn   = {x=-1199.1802978516, y=-184.08113098145, z=47.79},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC3","Etage23","Etage33","Etage43","Etage53","Etage63","Etage73"}
    },
    Etage14 = {--Etage1 4 / 4
        Marker  = {x=-1197.4893798828, y=-186.58154296875, z=46.79},
        Spawn   = {x=-1197.4893798828, y=-186.58154296875, z=47.79},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC4","Etage24","Etage34","Etage44","Etage54","Etage64","Etage74"}
    },
    


    Etage21 = {--Etage1 1 / 4
        -- Marker  = {x=-1203.0048828125, y=-190.76875305176, z=50.79},
        -- Spawn   = {x=-1203.0048828125, y=-190.76875305176, z=51.79},
        
        
        Marker  = {x=-1203.1069335938,y=-190.87379455566,z=50.79},
        Spawn   = {x=-1203.1069335938,y=-190.87379455566,z=51.79},
        
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC1","Etage11","Etage31","Etage41","Etage51","Etage61","Etage71"}
    },
    Etage22 = {--Etage1 2 / 4
        Marker  = {x=-1204.8363037109, y=-188.37803649902, z=50.79},
        Spawn   = {x=-1204.8363037109, y=-188.37803649902, z=51.79},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC2","Etage12","Etage32","Etage42","Etage52","Etage62","Etage72"}
    },
    Etage23 = {--Etage1 3 / 4
        Marker  = {x=-1199.1802978516, y=-184.08113098145, z=50.79},
        Spawn   = {x=-1199.1802978516, y=-184.08113098145, z=51.79},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC3","Etage13","Etage33","Etage43","Etage53","Etage63","Etage73"}
    },
    Etage24 = {--Etage1 4 / 4
        Marker  = {x=-1197.4893798828, y=-186.58154296875, z=50.79},
        Spawn   = {x=-1197.4893798828, y=-186.58154296875, z=51.79},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC4","Etage14","Etage34","Etage44","Etage54","Etage64","Etage74"}
    },



    Etage31 = {--Etage1 1 / 4
        Marker  = {x=-1203.1069335938,y=-190.87379455566,z=54.79},
        Spawn   = {x=-1203.1069335938,y=-190.87379455566,z=55.79},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC1","Etage11","Etage21","Etage41","Etage51","Etage61","Etage71"}
    },
    Etage32 = {--Etage1 2 / 4
        Marker  = {x=-1204.8363037109, y=-188.37803649902, z=54.79},
        Spawn   = {x=-1204.8363037109, y=-188.37803649902, z=55.79},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC2","Etage12","Etage22","Etage42","Etage52","Etage62","Etage72"}
    },
    Etage33 = {--Etage1 3 / 4
        Marker  = {x=-1199.1802978516, y=-184.08113098145, z=54.79},
        Spawn   = {x=-1199.1802978516, y=-184.08113098145, z=55.79},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC3","Etage13","Etage23","Etage43","Etage53","Etage63","Etage73"}
    },
    Etage34 = {--Etage1 4 / 4
        Marker  = {x=-1197.4893798828, y=-186.58154296875, z=54.79},
        Spawn   = {x=-1197.4893798828, y=-186.58154296875, z=55.79},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC4","Etage14","Etage24","Etage44","Etage54","Etage64","Etage74"}
    },




    Etage41 = {--Etage1 1 / 4
        Marker  = {x=-1203.1069335938,y=-190.87379455566,z=58.79},
        Spawn   = {x=-1203.1069335938,y=-190.87379455566,z=59.79},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC1","Etage11","Etage21","Etage31","Etage51","Etage61","Etage71"}
    },
    Etage42 = {--Etage1 2 / 4
        Marker  = {x=-1204.8363037109, y=-188.37803649902, z=58.79},
        Spawn   = {x=-1204.8363037109, y=-188.37803649902, z=59.79},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC2","Etage12","Etage22","Etage32","Etage52","Etage62","Etage72"}
    },
    Etage43 = {--Etage1 3 / 4
        Marker  = {x=-1199.1802978516, y=-184.08113098145, z=58.79},
        Spawn   = {x=-1199.1802978516, y=-184.08113098145, z=59.79},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC3","Etage13","Etage23","Etage33","Etage53","Etage63","Etage73"}
    },
    Etage44 = {--Etage1 4 / 4
        Marker  = {x=-1197.4893798828, y=-186.58154296875, z=58.79},
        Spawn   = {x=-1197.4893798828, y=-186.58154296875, z=59.79},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC4","Etage14","Etage24","Etage34","Etage54","Etage64","Etage74"}
    },
    
    
    
    
    
    Etage51 = {--Etage1 1 / 4
        Marker  = {x=-1203.1069335938,y=-190.87379455566,z=62.79},
        Spawn   = {x=-1203.1069335938,y=-190.87379455566,z=63.79},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC1","Etage11","Etage21","Etage31","Etage41","Etage61","Etage71"}
    },
    Etage52 = {--Etage1 2 / 4
        Marker  = {x=-1204.8363037109, y=-188.37803649902, z=62.79},
        Spawn   = {x=-1204.8363037109, y=-188.37803649902, z=63.79},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC2","Etage12","Etage22","Etage32","Etage42","Etage62","Etage72"}
    },
    Etage53 = {--Etage1 3 / 4
        Marker  = {x=-1199.1802978516, y=-184.08113098145, z=62.79},
        Spawn   = {x=-1199.1802978516, y=-184.08113098145, z=63.79},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC3","Etage13","Etage23","Etage33","Etage43","Etage63","Etage73"}
    },
    Etage54 = {--Etage1 4 / 4
        Marker  = {x=-1197.4893798828, y=-186.58154296875, z=62.79},
        Spawn   = {x=-1197.4893798828, y=-186.58154296875, z=63.79},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC4","Etage14","Etage24","Etage34","Etage44","Etage64","Etage74"}
    },
    
    
    
    
    
    Etage61 = {--Etage1 1 / 4
        Marker  = {x=-1203.1069335938,y=-190.87379455566,z=66.79},
        Spawn   = {x=-1203.1069335938,y=-190.87379455566,z=67.79},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC1","Etage11","Etage21","Etage31","Etage41","Etage51","Etage71"}
    },
    Etage62 = {--Etage1 2 / 4
        Marker  = {x=-1204.8363037109, y=-188.37803649902, z=66.79},
        Spawn   = {x=-1204.8363037109, y=-188.37803649902, z=67.79},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC2","Etage12","Etage22","Etage32","Etage42","Etage52","Etage72"}
    },
    Etage63 = {--Etage1 3 / 4
        Marker  = {x=-1199.1802978516, y=-184.08113098145, z=66.79},
        Spawn   = {x=-1199.1802978516, y=-184.08113098145, z=67.79},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC3","Etage13","Etage23","Etage33","Etage43","Etage53","Etage73"}
    },
    Etage64 = {--Etage1 4 / 4
        Marker  = {x=-1197.4893798828, y=-186.58154296875, z=66.79},
        Spawn   = {x=-1197.4893798828, y=-186.58154296875, z=67.79},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC4","Etage14","Etage24","Etage34","Etage44","Etage54","Etage74"}
    },
    
    
    
    
    Etage71 = {--Etage1 1 / 4
        Marker  = {x=-1203.1069335938,y=-190.87379455566,z=70.79},
        Spawn   = {x=-1203.1069335938,y=-190.87379455566,z=71.79},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC1","Etage11","Etage21","Etage31","Etage41","Etage51","Etage61"}
    },
    Etage72 = {--Etage1 2 / 4
        Marker  = {x=-1204.8363037109, y=-188.37803649902, z=70.79},
        Spawn   = {x=-1204.8363037109, y=-188.37803649902, z=71.79},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC2","Etage12","Etage22","Etage32","Etage42","Etage52","Etage62"}
    },
    Etage73 = {--Etage1 3 / 4
        Marker  = {x=-1199.1802978516, y=-184.08113098145, z=70.79},
        Spawn   = {x=-1199.1802978516, y=-184.08113098145, z=71.79},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC3","Etage13","Etage23","Etage33","Etage43","Etage53","Etage63"}
    },
    Etage74 = {--Etage1 4 / 4
        Marker  = {x=-1197.4893798828, y=-186.58154296875, z=70.79},
        Spawn   = {x=-1197.4893798828, y=-186.58154296875, z=71.79},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 122, b = 51 },
        Type    = 27,
        Heading = 169.59108,
        canGoTo = {"RDC4","Etage14","Etage24","Etage34","Etage44","Etage54","Etage64"}
    }
    
}

Config.Lang = {
    ["EN"] = 
    {
        ["elevator"] = "Elevator",
        ["lfloor"] = "Floors",
        ["openMenu"] = "Press ~input_context~ to open the menu",
        ["Etage1"] = "Floor 1 (Pool)",
        ["Etage2"] = "Floor 2",
        ["Etage3"] = "Floor 3",
        ["Etage4"] = "Floor 4",
        ["Etage5"] = "Floor 5",
        ["Etage6"] = "Floor 6",
        ["Etage7"] = "Floor 7",
        ["RDC"] =    "Ground floor",
    },
    ["FR"] = 
    {
        ["elevator"] = "Ascenceur",
        ["lfloor"] = "Etages",
        ["openMenu"] = "Appuyez sur ~input_context~ pour ouvrir le menu",
        ["Etage1"] = "Etage 1",
        ["Etage2"] = "Etage 2",
        ["Etage3"] = "Etage 3",
        ["Etage4"] = "Etage 4",
        ["Etage5"] = "Etage 5",
        ["Etage6"] = "Etage 6",
        ["Etage7"] = "Etage 7",
        ["RDC"] =    "Rez de Chaussée",
    },
}



--Made By Sarish => AuroraRP