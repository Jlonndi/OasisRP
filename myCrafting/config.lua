cfg = {}

cfg.Locale = 'en'

-- You can set up the colors of this system at the very top of the style.css

cfg.Button = {
    enable = true, -- enable the button
    control = 3 -- button to open the workbench
}

cfg.command = {
    allowed = true, --enable the command
    text = 'craft' -- the command
}

cfg.CraftingStation = {

    enable = true, -- enable the worbench
    pos = {x = -343.81, y = -140.01, z = 39.01}, -- position of the workbench
    control = 38 -- button to open the workbench
}

cfg.CraftingStation2 = {

    enable = true, -- enable the worbench
    pos = {x = -1825.38, y = 435.10, z = 118.37}, -- position of the workbench
    control = 38 -- button to open the workbench
}

cfg.Recipes = { -- All Recipes
    {
        label = 'Bagel',
        item = 'bagel',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'bread', label = 'Bread'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = 'bread', label = 'Bread'}, -- middle left
        field5 = {name = '', label = ''}, -- middle center
        field6 = {name = 'bread', label = 'Bread'}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = 'bread', label = 'Bread'}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = false, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
		job = '', -- should a Job be required to craft this
		added = false, -- do not touch
    },
    --[[{
        label = 'Pistol .50',
        item = 'weapon_pistol50',
        field1 = {name = 'pisejector', label = 'Pistol Ejector'}, -- top left
        field2 = {name = 'pisgrip', label = 'Pistol Grip'}, -- top center
        field3 = {name = 'magazine', label = 'Magazine'}, -- top right
        field4 = {name = 'covassem', label = 'Receiver Cover Assembly 9mm'}, -- middle left
        field5 = {name = 'trigassem', label = 'Trigger Assembly'}, -- middle center
        field6 = {name = 'barrelassem', label = 'Barrel Assembly'}, -- middle right
        field7 = {name = 'firingmech', label = 'Firing Mechanism'}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = false, -- if the item should be 
        requiredItem = {name = 'recipe_weapon_pistol50', label = 'Recipe for Pistol .50'}, -- is a recipe required to craft this item?
        isAWeapon = true,
		job = '', -- 
		added = false,
    },
    {
        label = 'Micro Uzi',
        item = 'weapon_microsmg',
        field1 = {name = 'uziejector', label = 'Uzi Ejector'}, -- top left
        field2 = {name = 'uzigrip', label = 'Uzi Grip'}, -- top center
        field3 = {name = 'uziassem', label = 'Upper Assembly Uzi'}, -- top right
        field4 = {name = 'barrelassem', label = 'Barrel Assembly'}, -- middle left
        field5 = {name = 'weapbrace', label = 'Brace'}, -- middle center
        field6 = {name = 'trigassem', label = 'Trigger Assembly'}, -- middle right
        field7 = {name = 'covassem', label = 'Receiver Cover Assembly 9mm'}, -- bottom left
        field8 = {name = 'magazine', label = 'Magazine'}, -- bottom center
        field9 = {name = 'pisgrip', label = 'Pistol Grip'}, -- bottom right
        invisible = false, -- if the item should be 
        requiredItem = {name = 'recipe_weapon_microsmg', label = 'Recipe for Micro Uzi'}, -- is a recipe required to craft this item?
        isAWeapon = true,
		job = '', -- 
		added = false,
    },]]
    {
        label = 'Coffee',
        item = 'coffee',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'hotcup', label = 'Hot cup'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'coffeebeans', label = 'Coffee beans'}, -- middle center
        field6 = {name = '', label = ''}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = 'coffeemachine', label = 'Coffee machine'},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Decaf Coffee',
        item = 'decafcoffee',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'hotcup', label = 'Hot cup'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'decafbeans', label = 'Decaf beans'}, -- middle center
        field6 = {name = '', label = ''}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = 'coffeemachine', label = 'Coffee machine'},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Espresso',
        item = 'espresso',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'hotcup', label = 'Hot cup'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'espressobeans', label = 'Espresso beans'}, -- middle center
        field6 = {name = '', label = ''}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = 'espressomachine', label = 'Espresso machine'},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Decaf espresso',
        item = 'decafespresso',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'hotcup', label = 'Hot cup'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'decafbeans', label = 'Decaf beans'}, -- middle center
        field6 = {name = '', label = ''}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = 'espressomachine', label = 'Espresso machine'},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Latte macchiato',
        item = 'lattemacchiato',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'milk', label = 'Milk'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'espresso', label = 'Espresso'}, -- middle center
        field6 = {name = '', label = ''}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Decaf Latte Macchiato',
        item = 'decaflattemacchiato',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'milk', label = 'Milk'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'decafespresso', label = 'Decaf espresso'}, -- middle center
        field6 = {name = '', label = ''}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Hot mocha',
        item = 'hotmocha',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'chocolatechips', label = 'Chocolate chips'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'espresso', label = 'Espresso'}, -- middle center
        field6 = {name = '', label = ''}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Decaf hot mocha',
        item = 'decafhotmocha',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'chocolatechips', label = 'Chocolate chips'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'decafespresso', label = 'Decaf espresso'}, -- middle center
        field6 = {name = '', label = ''}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Pink unicorn frappucino',
        item = 'pinkunicornfrappucino',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'coldcup', label = 'Cold cup'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'cherry', label = 'Cherry'}, -- middle center
        field6 = {name = 'ice', label = 'Ice'}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = 'milk', label = 'Milk'}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = 'blender', label = 'Blender'},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Cherry lemonade',
        item = 'cherrylemonade',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'coldcup', label = 'Cold cup'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'cherry', label = 'Cherry'}, -- middle center
        field6 = {name = 'ice', label = 'Ice'}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = 'blender', label = 'Blender'},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Boba cold brew',
        item = 'bobacoldbrew',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'coldcup', label = 'Cold cup'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'coffee', label = 'Coffee'}, -- middle center
        field6 = {name = 'ice', label = 'Ice'}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = 'tapiocapearls', label = 'Tapioca pearls'}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = 'blender', label = 'Blender'},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {   
        label = 'Decaf boba cold brew',
        item = 'decafbobacoldbrew',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'coldcup', label = 'Cold cup'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'decafcoffee', label = 'Decaf coffee'}, -- middle center
        field6 = {name = 'ice', label = 'Ice'}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = 'tapiocapearls', label = 'Tapioca pearls'}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = 'blender', label = 'Blender'},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Matcha tea frappucino',
        item = 'matchateafrappucino',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'coldcup', label = 'Cold cup'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'teabag', label = 'Tea bag'}, -- middle center
        field6 = {name = 'ice', label = 'Ice'}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = 'matchapowder', label = 'Matcha powder'}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = 'blender', label = 'Blender'},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Tea',
        item = 'tea',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'hotcup', label = 'Hot cup'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'teabag', label = 'Tea bag'}, -- middle center
        field6 = {name = '', label = ''}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = 'kettle', label = 'Kettle'},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Bean iced tea',
        item = 'beanicedtea',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'coldcup', label = 'Cold cup'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'tea', label = 'Tea'}, -- middle center
        field6 = {name = 'ice', label = 'Ice'}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = 'blender', label = 'Blender'},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Dough',
        item = 'dough',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'milk', label = 'Milk'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = 'butter', label = 'Butter'}, -- middle left
        field5 = {name = 'flour', label = 'Flour'}, -- middle center
        field6 = {name = 'egg', label = 'Egg'}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = 'sugar', label = 'Sugar'}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = 'mixer', label = 'Mixer'},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Lemon cake',
        item = 'lemoncake',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'lemon', label = 'Lemon'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'dough', label = 'Dough'}, -- middle center
        field6 = {name = '', label = ''}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Red velvet cake',
        item = 'redvelvetcake',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'chocolatechips', label = 'Chocolate chips'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'dough', label = 'Dough'}, -- middle center
        field6 = {name = 'foodcoloring', label = 'Food coloring'}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Cheesecake',
        item = 'cheesecake',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'creamcheese', label = 'Cream cheese'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'dough', label = 'Dough'}, -- middle center
        field6 = {name = '', label = ''}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Berries and cream',
        item = 'berriesandcream',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'creamcheese', label = 'Cream cheese'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'dough', label = 'Dough'}, -- middle center
        field6 = {name = 'fruitmix', label = 'Fruit mix'}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Carrot',
        item = 'carrot',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'creamcheese', label = 'Cream cheese'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'dough', label = 'Dough'}, -- middle center
        field6 = {name = 'carrotshavings', label = 'Carrot shavings'}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Hot fudge brownie',
        item = 'hotfudgebrownie',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'chocolatechips', label = 'Chocolate chips'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'dough', label = 'Dough'}, -- middle center
        field6 = {name = 'whippedcream', label = 'Whipped cream'}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Tres leches',
        item = 'tresleches',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'milk', label = 'Milk'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'dough', label = 'Dough'}, -- middle center
        field6 = {name = 'whippedcream', label = 'Whipped cream'}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = 'fruitmix', label = 'Fruit mix'}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Wedding cake slice',
        item = 'weddingcakeslice',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'fondant', label = 'Fondant'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'dough', label = 'Dough'}, -- middle center
        field6 = {name = '', label = ''}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Birthday cake',
        item = 'birthdaycake',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'whippedcream', label = 'Whipped cream'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = 'dough', label = 'Dough'}, -- middle left
        field5 = {name = 'dough', label = 'Dough'}, -- middle center
        field6 = {name = 'foodcoloring', label = 'Food coloring'}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = 'sprinkles', label = 'Sprinkles'}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Birthday cake slice',
        item = 'birthdaycakeslice',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'whippedcream', label = 'Whipped cream'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'dough', label = 'Dough'}, -- middle center
        field6 = {name = 'foodcoloring', label = 'Food coloring'}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = 'sprinkles', label = 'Sprinkles'}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Cake pops',
        item = 'cakepops',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'fondant', label = 'Fondant'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'dough', label = 'Dough'}, -- middle center
        field6 = {name = 'sprinkles', label = 'Sprinkles'}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Chocolate chip cookie',
        item = 'chocolatechipcookie',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'chocolatechips', label = 'Chocolate chips'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'dough', label = 'Dough'}, -- middle center
        field6 = {name = '', label = ''}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Fruit parfait',
        item = 'fruitparfait',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'sugar', label = 'Sugar'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'egg', label = 'Egg'}, -- middle center
        field6 = {name = 'creamcheese', label = 'Cream cheese'}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = 'fruitmix', label = 'Fruit mix'}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Croissant',
        item = 'croissant',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = '', label = ''}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'dough', label = 'Dough'}, -- middle center
        field6 = {name = '', label = ''}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Macaron valentine box',
        item = 'macaronvalentinebox',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'foodcoloring', label = 'Food coloring'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'dough', label = 'Dough'}, -- middle center
        field6 = {name = 'chocolatechips', label = 'Chocolate chips'}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Macaron gift box',
        item = 'macarongiftbox',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'foodcoloring', label = 'Food coloring'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'dough', label = 'Dough'}, -- middle center
        field6 = {name = 'fruitmix', label = 'Fruit mix'}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Caesar salad',
        item = 'caesarsalad',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'grilledchicken', label = 'Grilled chicken'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'lettuce', label = 'Lettuce'}, -- middle center
        field6 = {name = 'tomato', label = 'Tomato'}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Chicken wrap',
        item = 'chickenwrap',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'lettuce', label = 'Lettuce'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'dough', label = 'Dough'}, -- middle center
        field6 = {name = 'tomato', label = 'Tomato'}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = 'grilledchicken', label = 'Grilled chicken'}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Breakfast bagel',
        item = 'breakfastbagel',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'lettuce', label = 'Lettuce'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'dough', label = 'Dough'}, -- middle center
        field6 = {name = 'tomato', label = 'Tomato'}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = 'bacon', label = 'Bacon'}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Mozzarella pesto panini',
        item = 'mozzarellapestopanini',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'lettuce', label = 'Lettuce'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = 'pesto', label = 'Pesto'}, -- middle left
        field5 = {name = 'dough', label = 'Dough'}, -- middle center
        field6 = {name = 'tomato', label = 'Tomato'}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = 'mozzarella', label = 'Mozzarella'}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Smoothie bowl',
        item = 'smoothiebowl',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'fruitmix', label = 'Fruit mix'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'coconut', label = 'Coconut'}, -- middle center
        field6 = {name = 'icecubes', label = 'Ice cubes'}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = 'blender', label = 'Blender'},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Bean Iced Coffee',
        item = 'beanicedcoffee',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'coldcup', label = 'Cold cup'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'coffee', label = 'Coffee'}, -- middle center
        field6 = {name = 'ice', label = 'Ice'}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Decaf Iced Coffee',
        item = 'decaficedcoffee',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'coldcup', label = 'Cold cup'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'decafcoffee', label = 'Decaf Coffee'}, -- middle center
        field6 = {name = 'ice', label = 'Ice'}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = '', label = ''}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },
    {
        label = 'Caramel Frappucino',
        item = 'caramelfrappucino',
        field1 = {name = '', label = ''}, -- top left
        field2 = {name = 'coldcup', label = 'Cold cup'}, -- top center
        field3 = {name = '', label = ''}, -- top right
        field4 = {name = '', label = ''}, -- middle left
        field5 = {name = 'caramelsyrup', label = 'Caramel Syrup'}, -- middle center
        field6 = {name = 'ice', label = 'Ice'}, -- middle right
        field7 = {name = '', label = ''}, -- bottom left
        field8 = {name = 'milk', label = 'Milk'}, -- bottom center
        field9 = {name = '', label = ''}, -- bottom right
        invisible = true, 
        requiredItem = {name = '', label = ''},
        isAWeapon = false,
        job = 'bean', -- should a Job be required to craft this
        added = false, -- do not touch
    },

}

Translation = {
    ['de'] = {
        ['help_notification'] = 'Drücke ~o~E~s~, um die Workbench zu öffnen',
        ['need_requireditem_part1'] = 'Du benötigst ~b~',
        ['need_requireditem_part2'] = '~s~, um dieses Rezept herzustellen!'
    },
    ['en'] = {
        ['help_notification'] = 'Press ~o~E~s~ to open the workbench',
        ['need_requireditem_part1'] = 'You need ~b~',
        ['need_requireditem_part2'] = '~s~ to craft this item!'
    }
}