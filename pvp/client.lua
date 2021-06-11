Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		for i = 0,256 do
			if NetworkIsPlayerActive(i) then
				SetCanAttackFriendly(GetPlayerPed(i), true, true)
				NetworkSetFriendlyFireOption(true)
			end
		end
	end
end)