Citizen.CreateThread(function()
	while true do
        -- This is the Application ID (Replace this with you own)
		SetDiscordAppId(739559257141149767)

        -- Here you will have to put the image name for the "large" icon.
		SetDiscordRichPresenceAsset('oasis2')
        
        -- (11-11-2018) New Natives:

        -- Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('Oasis RP')
       
        -- Here you will have to put the image name for the "small" icon.
        SetDiscordRichPresenceAssetSmall('oasis')

        -- Here you can add hover text for the "small" icon.
        SetDiscordRichPresenceAssetSmallText('discord.gg/oasisrplay')


        -- (26-02-2021) New Native:

        --[[ 
            Here you can add buttons that will display in your Discord Status,
            First paramater is the button index (0 or 1), second is the title and 
            last is the url (this has to start with "fivem://connect/" or "https://") 
        ]]--
        SetDiscordRichPresenceAction(0, "Join Us!", "fivem://connect/usa-vgn-11dd6b17.fivem.host")
        SetDiscordRichPresenceAction(1, "Patreon!", "https://www.patreon.com/oasisrplay?fan_landing=true")

        -- It updates every minute just in case.
		Citizen.Wait(60000)
	end
end)