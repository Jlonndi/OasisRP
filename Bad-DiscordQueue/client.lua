Citizen.CreateThread(function()
	while true do 
		Citizen.Wait(5);
		if NetworkIsSessionStarted() then 
			TriggerServerEvent('DiscordQueue:Activated'); -- They got past queue, deactivate them in it
			return 
		end
	end
end)