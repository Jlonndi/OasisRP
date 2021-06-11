-- Configure the coordinates for the bartenders.

local bouncers = {
  {type=4, hash=0x9fd4292d, x = 1092.8, y = 207.9, z = -50.0, a = 114.31},
  {type=4, hash=0x9fd4292d, x = 1088.51, y = 212.03, z = -50.0, a = 183.23},
  {type=4, hash=0x9fd4292d, x = 1100.8, y = 226.52, z = -49.99, a = 167.17},
  {type=4, hash=0x9fd4292d, x = 1126.7, y = 241.07, z = -51.44, a = 98.35},
  {type=4, hash=0x9fd4292d, x = 1136.27, y = 260.55, z = -52.44, a = 210.89},
}

local punters = {
  {type=4, hash=0x36DF2D5D, x = 1096.72, y = 215.88, z = -50.99, a = 317.26},
  {type=4, hash=0x36DF2D5D, x = 1108.11, y = 207.55, z = -50.44, a = 329.61},
  {type=4, hash=0x36DF2D5D, x = 1107.95, y = 209.18, z = -50.44, a = 190.33},
  {type=4, hash=0xC454BCBB, x = 1113.93, y = 211.38, z = -50.44, a = 103.73},
  {type=4, hash=0xB585B217, x = 1148.18, y = 267.02, z = -52.84, a = 353.16},
  {type=4, hash=0x799E61F6, x = 1146.82, y = 269.72, z = -52.84, a = 258.45},
  {type=4, hash=0xC2E31A0A, x = 1148.39, y = 271.84, z = -52.84, a = 202.50},
  {type=4, hash=0xC2E31A0A, x = 1110.70, y = 212.27, z = -50.44, a = 159.59},
  {type=4, hash=0xDBB17082, x = 1110.70, y = 212.27, z = -50.44, a = 159.59},
  {type=4, hash=0xDBB17082, x = 1104.84, y = 218.99, z = -48.87, a = 78.54},
  {type=4, hash=0x799E61F6, x = 1133.82, y = 243.35, z = -50.84, a = 124.35},
  {type=4, hash=0x799E61F6, x = 1097.76, y = 215.68, z = -49.19, a = 336.95},
  {type=4, hash=0x799E61F6, x = 1116.58, y = 217.87, z = -49.26, a = 308.61},

}

Citizen.CreateThread(function()
	Wait(1000)
	-- Load the ig_gustavo 0xB585B217
	RequestModel(GetHashKey("ig_gustavo"))
		while not HasModelLoaded(GetHashKey("ig_gustavo")) do
		Wait(1)
	end
	
	-- Load the bartender modal (S_F_Y_ClubBar_01)
	RequestModel(GetHashKey("S_F_Y_ClubBar_01"))
		while not HasModelLoaded(GetHashKey("S_F_Y_ClubBar_01")) do
		Wait(1)
	end

	-- Load the cashier U_F_M_CasinoCash_01 | 0xBB0D72F5
	RequestModel(GetHashKey("U_F_M_CasinoCash_01"))
		while not HasModelLoaded(GetHashKey("U_F_M_CasinoCash_01")) do
		Wait(1)
	end

	-- Load the cashier U_F_M_Debbie_01 | 0xD575A46
	RequestModel(GetHashKey("U_F_M_Debbie_01"))
		while not HasModelLoaded(GetHashKey("U_F_M_Debbie_01")) do
		Wait(1)
	end

	-- Load the shop U_F_M_CasinoShop_01 | 0x1427D428
	RequestModel(GetHashKey("U_F_M_CasinoShop_01"))
		while not HasModelLoaded(GetHashKey("U_F_M_CasinoShop_01")) do
		Wait(1)
	end

	-- Load the ped modal (s_m_m_bouncer_01)
	RequestModel(GetHashKey("s_m_m_bouncer_01"))
		while not HasModelLoaded(GetHashKey("s_m_m_bouncer_01")) do
		Wait(1)
	end
	
	-- Load the ped modal (a_f_y_bevhills_04) 0x36DF2D5D
	RequestModel(GetHashKey("a_f_y_bevhills_04"))
		while not HasModelLoaded(GetHashKey("a_f_y_bevhills_04")) do
		Wait(1)
	end
	
	-- Load the ped modal (u_m_m_griff_01) 0xC454BCBB
	RequestModel(GetHashKey("u_m_m_griff_01"))
		while not HasModelLoaded(GetHashKey("u_m_m_griff_01")) do
		Wait(1)
	end

		-- Load the ped modal (ig_jackie) 0x799E61F6
		RequestModel(GetHashKey("ig_jackie"))
		while not HasModelLoaded(GetHashKey("ig_jackie")) do
		Wait(1)
	end

		-- Load the ped modal (s_f_y_beachbarstaff_01) 0xC2E31A0A
		RequestModel(GetHashKey("s_f_y_beachbarstaff_01"))
		while not HasModelLoaded(GetHashKey("s_f_y_beachbarstaff_01")) do
		Wait(1)
	end

		-- Load the ped modal (csb_miguelmadrazo) 0xDBB17082
		RequestModel(GetHashKey("csb_miguelmadrazo"))
		while not HasModelLoaded(GetHashKey("csb_miguelmadrazo")) do
		Wait(1)
	end
	
	
	-- Load the bouncer animation (testing)
	RequestAnimDict("mini@strip_club@idles@bouncer@base")
		while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
		Wait(1)
	end

	-- Spawn the bartender to the coordinates S_F_Y_ClubBar_01 | 0xC126394B
	bartender =  CreatePed(5, 0xC126394B, 1110.33, 208.9, -50.44, 63.96, false, true)
	SetBlockingOfNonTemporaryEvents(bartender, true)
	SetPedCombatAttributes(bartender, 46, true)
	SetPedFleeAttributes(bartender, 0, 0)
	SetPedRelationshipGroupHash(bartender, GetHashKey("CIVFEMALE"))
	SetEntityInvincible(bartender, false)

	-- Spawn the cashier to the coordinates U_F_M_CasinoCash_01 | 0xBB0D72F5
	cashier =  CreatePed(5, 0xBB0D72F5, 1117.3, 220.44, -49.44, 114.54, false, true)
	SetBlockingOfNonTemporaryEvents(cashier, true)
	SetPedCombatAttributes(cashier, 46, true)
	SetPedFleeAttributes(cashier, 0, 0)
	SetPedRelationshipGroupHash(cashier, GetHashKey("CIVFEMALE"))
	SetEntityInvincible(cashier, false)

	-- Spawn the reception to the coordinates U_F_M_Debbie_01 | 0xD575A46
	reception =  CreatePed(5, 0xD575A46, 1087.94, 221.16, -50.2, 182.16, false, true)
	SetBlockingOfNonTemporaryEvents(reception, true)
	SetPedCombatAttributes(reception, 46, true)
	SetPedFleeAttributes(reception, 0, 0)
	SetPedRelationshipGroupHash(reception, GetHashKey("CIVFEMALE"))
	SetEntityInvincible(reception, false)

	-- Spawn the shop to the coordinates U_F_M_CasinoShop_01 | 0x1427D428
	shop =  CreatePed(5, 0x1427D428, 1100.53, 195.59, -50.44, 313.67, false, true)
	SetBlockingOfNonTemporaryEvents(shop, true)
	SetPedCombatAttributes(shop, 46, true)
	SetPedFleeAttributes(shop, 0, 0)
	SetPedRelationshipGroupHash(shop, GetHashKey("CIVFEMALE"))
	SetEntityInvincible(shop, false)

	  -- Spawn the bouncers to the coordinates
	for _, item in pairs(bouncers) do
		ped =  CreatePed(item.type, item.hash, item.x, item.y, item.z, item.a, false, true)
		GiveWeaponToPed(ped, 0x1B06D571, 2800, false, true)
		SetEntityInvincible(ped, false)
		SetPedCombatAttributes(ped, 46, true)
		SetPedCombatAbility(ped, 2)
		SetPedFleeAttributes(ped, 0, 0)
		SetPedArmour(ped, 100)
		SetPedMaxHealth(ped, 100)
		SetPedRelationshipGroupHash(ped, GetHashKey("SECURITY_GUARD"))
		TaskStartScenarioInPlace(ped, "WORLD_HUMAN_GUARD_STAND_PATROL", 0, true)
		SetPedCanRagdoll(ped, false)
		SetPedDiesWhenInjured(ped, false)
		TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
		SetEntityInvincible(ped, false)
		SetEntityAsMissionEntity(ped)
	end
	
	-- Spawn the punters around the casino
	for _, item in pairs(punters) do
		ped1 =  CreatePed(item.type, item.hash, item.x, item.y, item.z, item.a, false, true)
		SetEntityInvincible(ped1, false)
		TaskStartScenarioInPlace(ped1, "WORLD_HUMAN_PARTYING", 0, true)
	end
end)