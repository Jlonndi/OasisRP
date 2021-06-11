Config = {

	MaxJobs = 5, -- Maximum amount of jobs avalable for every player (Only applies to jobs that are auto savable)
	AllowAutoJobSavining = true, -- When the script detects a new job it will add it to your jobs Ex. You get police job and it saves that job (if maximum not reached) to your job list
	
	OpenJobUIKey = '',             -- The key used to open the UI (Leave blank if you do not want to use key) ---->  PREVIOUSLY F6  <----
	OpenJobUICommand = 'jobscenter', -- Command used to open the UI (MUST NOT BE BLANK!!)
	
	--Set up blip info (https://docs.fivem.net/docs/game-references/blips/)
	--BLIPS FOR MANAGEMENT LOCATIONS
	BlipSprite = 457,
	BlipColor = 3,
	BlipText = 'Job Management',
	
	--BLIPS FOR JOB CENTERS
	BlipCenterSprite = 498,
	BlipCenterColor = 3,
	BlipCenterText = 'Job Center',
	
	MarkerSprite = 27,
	MarkerColor = {66, 135, 245},
	MarkerSize = 1.5,
	
	LocationsJobCenters = { -- If you want you can setup locations to change jobs (Leave without entiries if you dont want locations) (ADDS 0.02 MS)
		{coords = vector3(-234.53, -920.39, 32.31), blip = true}
	},

--Boss menu locations
BossMenuLocations = {

	{coords = vector3(462.43,-985.50,30.73), job = "police", label = "POLICE"},
	{coords = vector3(-198.1,-1341.44,34.9), job = "vegas", label = "JDI"},
	{coords = vector3(949.36,-966.36,39.51), job = "bpm", label = "BPM"},
	{coords = vector3(277.67,-1150.80,29.27), job = "coco", label = "Cocomotos"},
	{coords = vector3(122.75,-158.87,60.60), job = "kepler", label = "Kepler"},
	{coords = vector3(809.04,-882.19,33.07), job = "mbrp", label = "MBRP"},
	{coords = vector3(-432.21,-324.87,34.91), job = "ambulance", label = "EMS"},
	{coords = vector3(-788.96,-216.46,37.08), job = "laynz", label = "Switchin Laynz"},
	{coords = vector3(-81.59,-802.49,243.4), job = "realestateagent", label = "Realtor"},
	{coords = vector3(-232.86,-923.62,32.31), job = "mechanic", label = "Mechanics"},
	{coords = vector3(94.95,-1294.02,29.26), job = "unicorn", label = "Vanilla Unicorn"},
	{coords = vector3(908.74,-152.83,74.16), job = "taxi", label = "Taxi Co"},
	{coords = vector3(-725.59,-857.71,23.23), job = "hydra", label = "Brown Family"},
	{coords = vector3(963.46,-979.30,39.50), job = "gotti", label = "Gambino Crime Family"},
	{coords = vector3(1993.68,3045.07,50.51), job = "reap", label = "Soul Reaper MC"},
	{coords = vector3(940.9,-1461.89,33.61), job = "losb", label = "Los Buenos"},
	{coords = vector3(772.51,-1326.78,22.01), job = "hamc", label = "Hells Angels MC"},
	{coords = vector3(123.07,-1944.98,15.22), job = "lscartel", label = "Los Santos Cartel"},
	{coords = vector3(-9.99,-2545.66,7.39), job = "gent", label = "Royal Mafia"},
	{coords = vector3(-616.81,-1622.98,32.74), job = "sunless", label = "Sunless"},
},

--Boss menu users by grade name and their permissions
BossMenuUsers = {

	['astchief'] = {canWithdraw = true, canDeposit = true, canHire = true, canRank = true, canFire = true},
	['chief'] = {canWithdraw = true, canDeposit = true, canHire = true, canRank = true, canFire = true},
	['boss'] = {canWithdraw = true, canDeposit = true, canHire = true, canRank = true, canFire = true},
	['shadow'] = {canWithdraw = false, canDeposit = true, canHire = true, canRank = true, canFire = true},
	['experienced'] = {canWithdraw = false, canDeposit = true, canHire = false, canRank = false, canFire = false},
	['crafter'] = {canWithdraw = false, canDeposit = true, canHire = false, canRank = false, canFire = false},
	['recruit'] = {canWithdraw = false, canDeposit = true, canHire = false, canRank = false, canFire = false}

},




LocationsToChangeJobs = { -- If you want you can setup locations to change jobs (Leave without entiries if you dont want locations) (ADDS 0.02 MS)
	{coords = vector3(-250.98,-922.08,32.34), blip = true}
},

OffdutyForEveryone = true, -- Everyone can go into offduty job
JobsThatCanUseOffduty = { -- Jobs that can use offduty if option above is false
'police',
'ambulance',
'mechanic',
'realestateagent',
},

DefaultJobsInJobCenter = { -- Jobs that can be added by going to the job center. For icons use https://fontawesome.com/
	
	{job = 'busdriver', label = "Bus Driver", icon = "fas fa-bus", description = "Even Bigfoot needs a lift."},
	{job = 'garbage', label = "Sanitation", icon = "fas fa-dumpster", description = "Clean the city! At least from smelly trash..."},
	{job = 'trucking', label = "Trucking", icon = "fas fa-truck-loading", description = "See the city! One delivery at a time"},
	{job = 'unemployed', label = "Unemployed", icon = "fas fa-hiking", description = "AKA ''Entreprenuer''"},
	{job = 'windowcleaner', label = "WindowWash", icon = "fas fa-hand-sparkles", description = "Do you like to look at yourself? This is the job for you!"},
	{job = 'fisherman', label = "Fisherman", icon = "fas fa-fish", description = "Make your living off the land... or rather, the ocean."},

},


DefaultJobs = { -- Jobs that will be added in menu by default and wont be removable
	
	--{job = 'unemployed', grade = 0},
	--{job = 'fueler', grade = 0}
},

Text = {

	['cant_offduty'] = 'You cant go offduty!',
	['open_ui_hologram'] = '[~b~E~w~] Open Job Managment',
	['open_jobcenter_ui_hologram'] = '[~b~E~w~] Open Job Center',
	['wrong_usage'] = 'Wrong command usage',
	['job_added'] = 'Job added!',
	['promoted'] = 'You have been promoted',
	['promoted_other'] = 'You have been promoted in another job!',
	['fired'] = 'You have been fired',
	['fired_other'] = 'You have been fired',
	['hired'] = 'You have been hired',
	['bossmenu_hologram'] = '[~b~E~w~] Open Boss Menu',
	['action_success'] = 'Action successful',
	['action_unsuccessful'] = 'Action unsuccessful',
	['cant_access_bossmenu'] = 'You cant access boss menu',
	['insufficent_balance'] = 'Insufficent balance',
	['bonus_given'] = 'Bonus has been given!',
	['bonus_recieved'] = 'You recieved a bonus! +$'

}
	

}

-- Only change if you know what are you doing!
function SendTextMessage(msg)

		--SetNotificationTextEntry('STRING')
		--AddTextComponentString(msg)
		--DrawNotification(0,1)

		--EXAMPLE USED IN VIDEO
		exports['mythic_notify']:SendAlert('error', msg)

end
