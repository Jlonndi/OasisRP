Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)

		RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_CARBINERIFLE'))
		RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_PISTOL'))
		RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_PUMPSHOTGUN'))
		RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_MICROSMG'))
		RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_WEAPON_MINISMG'))
		RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_WEAPON_SMG'))
		RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_SNIPERRIFLE'))
		RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_SAWNOFFSHOTGUN'))
		RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_ADVANCEDRIFLE'))
		RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_ASSAULTRIFLE'))
		RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_SPECIALCARBINE'))

	end
end)