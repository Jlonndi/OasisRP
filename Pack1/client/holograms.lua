--[[

	Holograms / Floating text Script by Meh
	
	Just put in the coordinates you get when standing on the ground, it's above the ground then
	By default, you only see the hologram when you are within 10m of it, to change that, edit the 10.0 infront of the "then"
	The Default holograms are at the Observatory.
	
	If you want to add a line to the hologram, just make a new Draw3DText line with the same coordinates, and edit the vertical offset.
	
	Formatting:
			Draw3DText( x, y, z  vertical offset, "text", font, text size, text size)
			
			
	To add a new hologram, copy paste this example under the existing ones, and put coordinates and text into it.
	
		if GetDistanceBetweenCoords( X, Y, Z, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( X, Y, Z,  -1.400, "TEXT", 4, 0.1, 0.1)
			Draw3DText( X, Y, Z,  -1.600, "TEXT", 4, 0.1, 0.1)
			Draw3DText( X, Y, Z,  -1.800, "TEXT", 4, 0.1, 0.1)		
		end


]]--

Citizen.CreateThread(function()
    Holograms()
end)

function Holograms()
	local plyped = GetPlayerPed(-1)
		while true do
			Citizen.Wait(5)			
				-- Hologram No. 1 at Airport
		if GetDistanceBetweenCoords( -1031.91,  -2725.93, 13.61, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1031.91,  -2725.93, 13.61  -1.200, "Welcome to OasisRP!", 4, 0.1, 0.1)
			Draw3DText( -1031.91,  -2725.93, 13.61  -1.400, "BEFORE YOU STEAL ANY CARS READ THIS!!! Police will respond to stolen car alerts.", 4, 0.1, 0.1)
			Draw3DText( -1031.91,  -2725.93, 13.61  -1.600, "Please press t and type:'/taxi At Airport, need Taxi.' and someone will come help you!", 4, 0.1, 0.1)
			Draw3DText( -1031.91,  -2725.93, 13.61  -1.800, "Please visit our Discord at Discord.gg/OasisRPlay for rules, help, questions.", 4, 0.1, 0.1)
			Draw3DText( -1031.91,  -2725.93, 13.61  -2.000, "Sim RP, Mic Required, Friendly Server", 4, 0.1, 0.1)		
		end		
				--Hologram No. 2 Donator Shop
		if GetDistanceBetweenCoords( -1395.00, -3265.82, 13.94, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1395.00, -3265.82, 13.94  -1.400, "WARNING DISCRETION ADVISED", 400, 0.1, 0.1)
			Draw3DText( -1395.00, -3265.82, 13.94  -1.600, "CARS INSIDE CAN BE AUTOMATICALLY", 4, 0.1, 0.1)
			Draw3DText( -1395.00, -3265.82, 13.94  -1.800, "PURCHASED WITH REAL MONEY IN 1 CLICK OF A BUTTON (E)", 4, 0.1, 0.1)
			Draw3DText( -1395.00, -3265.82, 13.94  -2.000, "NO REFUNDS ARE ISSUED, PERIOD.", 4, 0.1, 0.1)
		end	
				--Hologram No. 2.1 Donator Shop
		if GetDistanceBetweenCoords( -1266.97, -2987.74, -48.49, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1266.97, -2987.74, -48.49  -1.400, "WARNING DISCRETION ADVISED", 400, 0.1, 0.1)
			Draw3DText( -1266.97, -2987.74, -48.49  -1.600, "CARS CAN BE AUTOMATICALLY", 4, 0.1, 0.1)
			Draw3DText( -1266.97, -2987.74, -48.49  -1.800, "PURCHASED WITH REAL MONEY IN 1 CLICK OF A BUTTON (E)", 4, 0.1, 0.1)
			Draw3DText( -1266.97, -2987.74, -48.49  -2.000, "IF YOU PRESS E NEAR ANY VEHICLE PAST THIS POINT", 4, 0.1, 0.1)
			Draw3DText( -1266.97, -2987.74, -48.49  -2.200, "YOU WILL HAVE PAID REAL MONEY FOR IT AND NO REFUNDS ARE ISSUED, PERIOD.", 4, 0.1, 0.1)
		end	
				--Hologram No. 2.2 Donator Shop
		if GetDistanceBetweenCoords( -1267.65, -2971.65, -48.49, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1267.65, -2971.65, -48.49  -1.400, "WARNING DISCRETION ADVISED", 400, 0.1, 0.1)
			Draw3DText( -1267.65, -2971.65, -48.49  -1.600, "IF YOU DO NOT SEE VEHICLES", 4, 0.1, 0.1)
			Draw3DText( -1267.65, -2971.65, -48.49  -1.800, "IN THE SHOWROOM DO NOT CLICK (E)", 4, 0.1, 0.1)
			Draw3DText( -1267.65, -2971.65, -48.49  -2.000, "TO ENTER THE DONATOR SHOP MENU", 4, 0.1, 0.1)
			Draw3DText( -1267.65, -2971.65, -48.49  -2.200, "YOU WILL FREEZE", 4, 0.1, 0.1)
			Draw3DText( -1267.65, -2971.65, -48.49  -2.400, "EXIT AND COME BACK IN", 4, 0.1, 0.1)
		end	
				--Hologram No. 2.3 Donator Shop
		if GetDistanceBetweenCoords( -1256.43, -2980.52, -48.49, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1256.43, -2980.52, -48.49  -1.400, "WARNING DISCRETION ADVISED", 400, 0.1, 0.1)
			Draw3DText( -1256.43, -2980.52, -48.49  -1.600, "IF YOU DO NOT SEE VEHICLES", 4, 0.1, 0.1)
			Draw3DText( -1256.43, -2980.52, -48.49  -1.800, "IN THE SHOWROOM DO NOT CLICK (E)", 4, 0.1, 0.1)
			Draw3DText( -1256.43, -2980.52, -48.49  -2.000, "TO ENTER THE DONATOR SHOP MENU", 4, 0.1, 0.1)
			Draw3DText( -1256.43, -2980.52, -48.49  -2.200, "YOU WILL FREEZE", 4, 0.1, 0.1)
			Draw3DText( -1256.43, -2980.52, -48.49  -2.400, "EXIT AND COME BACK IN", 4, 0.1, 0.1)
		end	
				--[[Hologram No. 3 allplayerhousing
		if GetDistanceBetweenCoords( -131.14, 963.82, 236.04, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -131.14, 963.82, 236.04  -1.400, "6969 Lake Vinewood Estates", 4, 0.1, 0.1)
			Draw3DText( -131.14, 963.82, 236.04  -1.600, "Vinewood Hills", 4, 0.1, 0.1)
		end	
				--Hologram No. 4 allplayerhousing
		if GetDistanceBetweenCoords( -100.09, 849.27, 235.51, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -100.09, 849.27, 235.51  -1.400, "420 Lake Vinewood Estates", 4, 0.1, 0.1)
			Draw3DText( -100.09, 849.27, 235.51  -1.600, "Vinewood Hills", 4, 0.1, 0.1)
		end
				--Hologram No. 5 allplayerhousing
		if GetDistanceBetweenCoords( -122.09, 895.45, 235.88, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -122.09, 895.45, 235.88  -1.400, "8404 Lake Vinewood Estates", 4, 0.1, 0.1)
			Draw3DText( -122.09, 895.45, 235.88  -1.600, "Vinewood Hills", 4, 0.1, 0.1)
		end
				--Hologram No. 6 allplayerhousing
		if GetDistanceBetweenCoords( -158.86, 975.67, 235.44, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -158.86, 975.67, 235.44  -1.400, "0311 Lake Vinewood Estates", 4, 0.1, 0.1)
			Draw3DText( -158.86, 975.67, 235.44  -1.600, "Vinewood Hills", 4, 0.1, 0.1)
		end
				--Hologram No. 7 allplayerhousing
		if GetDistanceBetweenCoords( -1508.55, 45.15, 55.16, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1508.55, 45.15, 55.16  -1.400, "42069 Americano Way", 4, 0.1, 0.1)
			Draw3DText( -1508.55, 45.15, 55.16  -1.600, "Richman", 4, 0.1, 0.1)
		end
				--Hologram No. 8 allplayerhousing
		if GetDistanceBetweenCoords( -1554.58, 36.96, 58.14, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1554.58, 36.96, 58.14  -1.400, "53 Americano Way", 4, 0.1, 0.1)
			Draw3DText( -1554.58, 36.96, 58.14  -1.600, "Richman", 4, 0.1, 0.1)
		end
				--Hologram No. 9 ymap/mlo
		if GetDistanceBetweenCoords( -1345.55, -739.84, 22.19, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1345.55, -739.84, 22.19  -1.400, "1 Del Perro Fwy,", 4, 0.1, 0.1)
			Draw3DText( -1345.55, -739.84, 22.19  -1.600, "Del Perro", 4, 0.1, 0.1)
		end
				--Hologram No. 10 ymap/mlo
		if GetDistanceBetweenCoords( -1980.73, -487.19, 11.7, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1980.73, -487.19, 13.15  -1.400, "3761 Del Perro Fwy", 4, 0.1, 0.1)
			Draw3DText( -1980.73, -487.19, 13.15  -1.600, "Pacific Bluffs", 4, 0.1, 0.1)
		end
				--Hologram No. 11 ymap/mlo
		if GetDistanceBetweenCoords( -1728.21, -711.31, 10.8, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1728.21, -711.31, 10.8  -1.400, "9295 Equality Way Apartments", 4, 0.1, 0.1)
			Draw3DText( -1728.21, -711.31, 10.8  -1.600, "Del Perro", 4, 0.1, 0.1)
		end
				--Hologram No. 12  ymap/mlo Noah Dealership
		if GetDistanceBetweenCoords( -1156.90, -1754.32, 4.22, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1156.90, -1754.32, 4.22  -1.400, "53 Bay City Avenue Bldg 31", 4, 0.1, 0.1)
			Draw3DText( -1156.90, -1754.32, 4.22  -1.600, "Vespucci Beach", 4, 0.1, 0.1)
		end
				--Hologram No. 13 ymap/mlo
		if GetDistanceBetweenCoords( -1105.11, -1676.34, 4.44, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1105.11, -1676.34, 4.44  -1.400, "241 Bay City Avenue", 4, 0.1, 0.1)
			Draw3DText( -1105.11, -1676.34, 4.44  -1.600, "Vespucci Beach", 4, 0.1, 0.1)
		end
				--Hologram No. 14  ymap/mlo
		if GetDistanceBetweenCoords( -1150.37, -1520.25, 4.36, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1150.37, -1520.25, 4.36  -1.400, "811 Goma Street Apt.B^", 4, 0.1, 0.1)
			Draw3DText( -1150.37, -1520.25, 4.36  -1.600, "La Puerta", 4, 0.1, 0.1)
		end
				--Hologram No. 16  ymap/mlo
		if GetDistanceBetweenCoords( -849.16, 164.12, 66.54, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -849.16, 164.12, 66.54  -1.400, "553 Portola Dr", 4, 0.1, 0.1)
			Draw3DText( -849.16, 164.12, 66.54  -1.600, "Rockford Hills", 4, 0.1, 0.1)
		end]]
				--Hologram No. 17  ymap/mlo Driving School
		if GetDistanceBetweenCoords( 221.11, -1393.91, 30.59, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 221.11, -1393.91, 30.59  -1.400, "Good Luck and Drive Safe!", 4, 0.1, 0.1)
			Draw3DText( 221.11, -1393.91, 30.59  -1.600, "(Once you've paid, wait for the vehicle to load)", 4, 0.1, 0.1)		
		end
				--[[Hologram No. 18 allplayerhousing
		if GetDistanceBetweenCoords( -1480.52, 49.43, 53.85, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1480.52, 49.43, 53.85  -1.400, "6900 Americano Way", 4, 0.1, 0.1)
			Draw3DText( -1480.52, 49.43, 53.85  -1.600, "Richman", 4, 0.1, 0.1)		
		end
				--Hologram No. 20 CASINO
		if GetDistanceBetweenCoords( 1093.55, 215.55, -49, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 1093.55, 215.55, -49  -1.400, "Please visit the cashier to", 4, 0.1, 0.1)	
			Draw3DText( 1093.55, 215.55, -49  -1.600, "exchange cash for chips", 4, 0.1, 0.1)
			Draw3DText( 1093.55, 215.55, -49  -1.800, "or to use the ATM", 4, 0.1, 0.1)	
		end
				--Hologram No. 21 MLO grove st customs
		if GetDistanceBetweenCoords( -69.23, -1818.31, 26.94, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -69.23, -1818.31, 26.94  -1.400, "420 Grove Street,", 4, 0.1, 0.1)
			Draw3DText( -69.23, -1818.31, 26.94  -1.600, "Davis", 4, 0.1, 0.1)		
		end
				--Hologram No. 21 ymap/mlo Dios shop
		if GetDistanceBetweenCoords( 39.09, -2652.81, 6.00, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 39.09, -2652.81, 6.00  -1.400, "PacAll Shipping", 4, 0.1, 0.1)
			Draw3DText( 39.09, -2652.81, 6.00  -1.600, "92 Plaice Pl, Elysian Island", 4, 0.1, 0.1)		
		end
				--Hologram No. 22 ymap/mlo Lesters
		if GetDistanceBetweenCoords( 1273.07, -1721.86, 54.66, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 1273.07, -1721.86, 54.66  -1.400, "777 Amarillo Vista", 4, 0.1, 0.1)
			Draw3DText( 1273.07, -1721.86, 54.66  -1.600, "El Burro Heights", 4, 0.1, 0.1)		
		end
				--Hologram No. 23 ymap/mlo San Andreas Highway Patrol
		if GetDistanceBetweenCoords( 826.96, -1292.15, 28.24, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 826.96, -1292.15, 28.24  -1.400, "SAHP ", 4, 0.1, 0.1)
			Draw3DText( 826.96, -1292.15, 28.24  -1.600, "167 Popular St, La Mesa", 4, 0.1, 0.1)		
		end
				--Hologram No. 24 ymap/mlo Rod n Cams
		if GetDistanceBetweenCoords( 940.88, -988.87, 38.70, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 940.88, -988.87, 38.70  -1.400, "Rod n Cam's Muscles", 4, 0.1, 0.1)
			Draw3DText( 940.88, -988.87, 38.70  -1.600, "229 Vespucci Blvd, Murrieta Heights", 4, 0.1, 0.1)		
		end
				--Hologram No. 25 ymap/mlo Oasis Arcade
		if GetDistanceBetweenCoords( 755.60, -808.20, 23.66, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 755.60, -808.20, 23.66  -1.400, "The Oasis", 4, 0.1, 0.1)
			Draw3DText( 755.60, -808.20, 23.66  -1.600, "744 Popular St, La Mesa", 4, 0.1, 0.1)		
		end
				--Hologram No. 26 ymap/mlo Sky Bar at the Elk Ridge
		if GetDistanceBetweenCoords( 286.88, -940.04, 29.41, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 286.88, -940.04, 29.41  -1.400, "Sky Bar at the Elk Ridge", 4, 0.1, 0.1)
			Draw3DText( 286.88, -940.04, 29.41  -1.600, "209 Atlee St, Mission Row", 4, 0.1, 0.1)		
		end
				--Hologram No. 27 ymap/mlo Lauz Vanilla Unicorn
		if GetDistanceBetweenCoords( 118.20, -1309.67, 29.23, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 118.20, -1309.67, 29.23  -1.400, "Vanilla Unicorn", 4, 0.1, 0.1)
			Draw3DText( 118.20, -1309.67, 29.23  -1.600, "133 Strawberry Ave, Strawberry", 4, 0.1, 0.1)		
		end
				--Hologram No. 28 ymap/mlo hideout
		if GetDistanceBetweenCoords( 190.50, -1520.23, 29.32, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 190.50, -1520.23, 29.32  -1.400, "141 Ste B", 4, 0.1, 0.1)
			Draw3DText( 190.50, -1520.23, 29.32  -1.600, "Davis Ave, Davis", 4, 0.1, 0.1)		
		end
				--Hologram No. 29 ymap/mlo Franklins Aunt
		if GetDistanceBetweenCoords( -18.27, -1444.68, 30.65, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -18.27, -1444.68, 30.65  -1.400, "126", 4, 0.1, 0.1)
			Draw3DText( -18.27, -1444.68, 30.65  -1.600, "Forum Dr, Strawberry", 4, 0.1, 0.1)		
		end
				--Hologram No. 30 ymap/mlo Puerto Del Sol Yacht Club
		if GetDistanceBetweenCoords( -918.56, -1294.73, 5.02, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -918.56, -1294.73, 5.02  -1.400, "Units 310, 311, 312", 4, 0.1, 0.1)
			Draw3DText( -918.56, -1294.73, 5.02  -1.600, "Units 210, 211, 212", 4, 0.1, 0.1)
			Draw3DText( -918.56, -1294.73, 5.02  -1.800, "Units 110, 111, 112", 4, 0.1, 0.1)		
		end
				--Hologram No. 31 ymap/mlo City Hall
		if GetDistanceBetweenCoords( -1286.12, -562.42, 31.71, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1286.12, -562.42, 31.71  -1.400, "Oasis City Hall", 4, 0.1, 0.1)
			Draw3DText( -1286.12, -562.42, 31.71  -1.600, "637 South Rockford Dr, Del Perro", 4, 0.1, 0.1)		
		end
				--Hologram No. 31 ymap/mlo Vineyard
		if GetDistanceBetweenCoords( -1875.23, 2046.58, 140.98, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1875.23, 2046.58, 140.98  -1.400, "Marlowe Vineyard", 4, 0.1, 0.1)
			Draw3DText( -1875.23, 2046.58, 140.98  -1.600, "911 Buen Vino Road, Tongva Hills", 4, 0.1, 0.1)		
		end
				--Hologram No. 31 ymap/mlo Designer House
		if GetDistanceBetweenCoords( -2608.33, 1661.20, 139.05, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -2608.33, 1661.20, 139.05  -1.400, "1954", 4, 0.1, 0.1)
			Draw3DText( -2608.33, 1661.20, 139.05  -1.600, "Buen Vino Road, Tongva Hills", 4, 0.1, 0.1)		
		end
				--Hologram No. 31 ymap/mlo Mafia House
		if GetDistanceBetweenCoords( -2650.58, 1312.87, 146.41, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -2650.58, 1312.87, 146.41  -1.400, "1020", 4, 0.1, 0.1)
			Draw3DText( -2650.58, 1312.87, 146.41  -1.600, "Banham Canyon Dr, Banham Canyon", 4, 0.1, 0.1)		
		end
				--Hologram No. 31 ymap/mlo Malibu Mansion
		if GetDistanceBetweenCoords( -3130.05, 804.21, 17.60, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -3130.05, 804.21, 17.60  -1.400, "7709", 4, 0.1, 0.1)
			Draw3DText( -3130.05, 804.21, 17.60  -1.600, "Great Ocean Highway, Banham Canyon", 4, 0.1, 0.1)		
		end
				--Hologram No. 31 ymap/mlo go postal house
		if GetDistanceBetweenCoords( 65.31, 91.53, 78.94, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 65.31, 91.53, 78.94  -1.400, "293", 4, 0.1, 0.1)
			Draw3DText( 65.31, 91.53, 78.94  -1.600, "Laguna Place, Dowtonwn Vinewood", 4, 0.1, 0.1)		
		end
				--Hologram No. 31 ymap/mlo mirror park mlo's
		if GetDistanceBetweenCoords( 1300.66, -701.22, 64.81, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 1300.66, -701.22, 64.81  -1.400, "Foggy Foothills", 4, 0.1, 0.1)
			Draw3DText( 1300.66, -701.22, 64.81  -1.600, "East Mirror Dr, Mirror Park", 4, 0.1, 0.1)		
		end
				--Hologram No. 31 ymap/mlo noah's pent
		if GetDistanceBetweenCoords( -311.72, -713.72, 28.26, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -311.72, -713.72, 28.26  -1.400, "Quartz Towers", 4, 0.1, 0.1)
			Draw3DText( -311.72, -713.72, 28.26  -1.600, "381 San Andreas Ave, Downtown", 4, 0.1, 0.1)		
		end
				--Hologram No. 31 ymap/mlo madrazo's ranch
		if GetDistanceBetweenCoords( 1311.09, 1110.80, 105.68, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 1311.09, 1110.80, 105.68  -1.400, "La Fuente Blanca", 4, 0.1, 0.1)
			Draw3DText( 1311.09, 1110.80, 105.68  -1.600, "722 Senora Rd, Vinewood Hills", 4, 0.1, 0.1)		
		end
				--Hologram No. 31 ymap/mlo yellow jack inn
		if GetDistanceBetweenCoords( 1993.94, 3053.94, 47.21, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 1993.94, 3053.94, 47.21  -1.400, "Yellow Jack Inn", 4, 0.1, 0.1)
			Draw3DText( 1993.94, 3053.94, 47.21  -1.600, "949 Panorama Dr, Grand Senora Desert", 4, 0.1, 0.1)		
		end
				--Hologram No. 31 ymap/mlo drag strip
		if GetDistanceBetweenCoords( 1707.26, 3260.80, 41.08, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 1707.26, 3260.80, 41.08  -1.400, "Sandy's Drag", 4, 0.1, 0.1)
			Draw3DText( 1707.26, 3260.80, 41.08  -1.600, "1020 Panorama Dr, Grand Senora Desert", 4, 0.1, 0.1)		
		end
				--Hologram No. 31 ymap/mlo trevors house
		if GetDistanceBetweenCoords( 1987.32, 3815.32, 32.31, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( 1987.32, 3815.32, 32.31  -1.400, "1035", 4, 0.1, 0.1)
			Draw3DText( 1987.32, 3815.32, 32.31  -1.600, "Zancudo Ave, Sandy Shores", 4, 0.1, 0.1)		
		end]]
				--Hologram No. 31 Garbage Depot
		if GetDistanceBetweenCoords( -312.21, -1538.64, 27.84, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -312.21, -1538.64, 27.84  -1.400, "WAIT! Before you start your run, you need to know:", 4, 0.1, 0.1)
			Draw3DText( -312.21, -1538.64, 27.84  -1.600, "the max amount of stops you can do is 15. You get paid as you go.", 4, 0.1, 0.1)
			Draw3DText( -312.21, -1538.64, 27.84  -1.800, "If it does not let you collect anymore it is because you hit your max", 4, 0.1, 0.1)
			Draw3DText( -312.21, -1538.64, 27.84  -2.000, "Just bring the truck back and get a new one if you want to continue.", 4, 0.1, 0.1)		
		end
				--Hologram No. 31 pdm
		if GetDistanceBetweenCoords( -35.00, -1104.60, 26.42, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -35.00, -1104.60, 26.42  -1.400, "Before you purchase a vehicle from here just know:", 4, 0.1, 0.1)
			Draw3DText( -35.00, -1104.60, 26.42  -1.600, "We have IRL brands in the city available for purchase.", 4, 0.1, 0.1)
			Draw3DText( -35.00, -1104.60, 26.42  -1.800, "Go under your favorites tab in your phone, shoot a dealer a message with what you are looking for.", 4, 0.1, 0.1)
			Draw3DText( -35.00, -1104.60, 26.42  -2.000, "Or go to our discord @ discord.gg/oasisrplay and check with the dealerships on there.", 4, 0.1, 0.1)		
		end
				--Hologram No. 31 airport
		if GetDistanceBetweenCoords( -1036.34, -2736.86, 13.76, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1036.34, -2736.86, 13.76  -1.400, "This is a SERIOUS RP server. Not a vMenu or GTAO server", 4, 0.1, 0.1)
			Draw3DText( -1036.34, -2736.86, 13.76  -1.600, "You must have a Mic to play here. We are also new player friendly.", 4, 0.1, 0.1)
			Draw3DText( -1036.34, -2736.86, 13.76  -1.800, "If you are new to FiveM and want to grow with a community we are willing to teach you how to play.", 4, 0.1, 0.1)
			Draw3DText( -1036.34, -2736.86, 13.76  -2.000, "Please go to our discord @ Discord.gg/OasisRPlay and ask us whatever you need to know", 4, 0.1, 0.1)		
		end
				--Hologram No. 31 airport
		--[[if GetDistanceBetweenCoords( -1465.67, 63.72, 53.00, GetEntityCoords(GetPlayerPed(-1))) < 10.0 then
			Draw3DText( -1465.67, 63.72, 53.00  -1.400, "648", 4, 0.1, 0.1)
			Draw3DText( -1465.67, 63.72, 53.00  -1.600, "Americano Way, Richman", 4, 0.1, 0.1)
		end]]

	end
end

-------------------------------------------------------------------------------------------------------------------------
function Draw3DText(x,y,z,textInput,fontId,scaleX,scaleY)
         local px,py,pz=table.unpack(GetGameplayCamCoords())
         local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)    
         local scale = (1/dist)*20
         local fov = (1/GetGameplayCamFov())*100
         local scale = scale*fov   
         SetTextScale(scaleX*scale, scaleY*scale)
         SetTextFont(fontId)
         SetTextProportional(1)
         SetTextColour(250, 250, 250, 255)		-- You can change the text color here
         SetTextDropshadow(1, 1, 1, 1, 255)
         SetTextEdge(2, 0, 0, 0, 150)
         SetTextDropShadow()
         SetTextOutline()
         SetTextEntry("STRING")
         SetTextCentre(1)
         AddTextComponentString(textInput)
         SetDrawOrigin(x,y,z+2, 0)
         DrawText(0.0, 0.0)
         ClearDrawOrigin()
        end
