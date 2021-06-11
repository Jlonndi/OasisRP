--[[AD CONSTRUCTOR]]
function ad(_id, _pic1, _pic2, _sender, _subject, _hidden)
	if _hidden == nil then _hidden = false end
	if _subject == nil then _subject = 'Advertisement' end

	return {
		id = _id,
		pic1 = _pic1,
		pic2 = _pic2,
		sender = _sender,
		subject = _subject,
		hidden = _hidden
	}
end

--[[TABLE OF ADS]]
local ads = {
--  ad ('What you'll type in chat', 'CHAR_FLOYD', 'ImageName', 'Ad Title', 'Ad Subtitle'),
	ad('bank', 'CHAR_BANK_FLEECA', 'CHAR_BANK_FLEECA', 'Fleeca Bank'),
	ad('dealership', 'CHAR_CARSITE', 'CHAR_CARSITE', 'Legendary Motors'),
	ad('lsc', 'CHAR_LS_CUSTOMS', 'CHAR_LS_CUSTOMS', 'LS Customs'),
	ad('ammunation', 'CHAR_AMMUNATION', 'CHAR_AMMUNATION', 'Ammunation'),
	ad('taxi', 'CHAR_FLOYD', 'taxi', 'Taxi'),
	ad('uber', 'CHAR_FLOYD', 'UBER', 'Uber', 'Phone Notification'),
	ad('chp', 'CHAR_FLOYD', 'CHP', 'CHP Advisory', 'Phone Alert'),
	ad('bcso', 'CHAR_FLOYD', 'BCSO', 'Blaine Co. Sheriff\'s Office'),
	ad('ems', 'CHAR_FLOYD', 'EMS', 'Emergency'),
	ad('laynz', 'CHAR_FLOYD', 'Laynz', 'Switchin Laynz'),
	ad('lspd', 'CHAR_FLOYD', 'LSPD', 'Los Santos Police Dept'),
	ad('mech', 'CHAR_FLOYD', 'Mosleys', 'Mosley\'s Auto'),
	ad('src', 'CHAR_FLOYD', 'soulreapers', 'Soul Reapers Customs'),
	ad('veg', 'CHAR_FLOYD', 'Vegas', 'VegasJDImports'),
	ad('weaz', 'CHAR_FLOYD', 'Weazel', 'BREAKING NEWS'),
	ad('store', 'CHAR_FLOYD', 'store', 'SALE!'),
	ad('uni', 'CHAR_FLOYD', 'Uni', 'Sexy!'),
	ad('a1', 'CHAR_FLOYD', 'kepler', 'A1 Crown!'),
	ad('coco', 'CHAR_FLOYD', 'cocomoto', 'Cocomotos'),
	ad('bpm', 'CHAR_FLOYD', 'bpm', 'Bullet Proof Muscle'),
	ad('onlyadmin', 'CHAR_FLOYD', 'ADMIN', 'Administration', nil, true)
}
local function findAdById(id)
	local output 
	for _, item in ipairs(ads) do 
		if item.id == id then output = item end 
	end 
	return output
end

--[[EVENT TO SHOW ALL ADS]]
RegisterNetEvent('ShowAds')
AddEventHandler('ShowAds', function()
	local index = 0
	local outstring = '^7'
	for _, item in ipairs(ads) do
		if item.hidden ~= true then
			index = index + 1
			if index == 1 then outstring = outstring..item.id else outstring = outstring..' / '..item.id end
		end
	end
	TriggerEvent('chatMessage', 'SYSTEM', {0,0,0}, 'Available ads: <'..outstring..'>')
end)

--[[EVENT TO DISPLAY AN AD TO THE PLAYER]]
RegisterNetEvent('DisplayAd')
AddEventHandler('DisplayAd',function(adtype, inputText)
	local ad = findAdById(adtype)

	if ad == nil then
		TriggerEvent('chatMessage', 'SYSTEM', {0,0,0}, 'Invalid type of ad')
		TriggerEvent('ShowAds')
		return
	end

	SetNotificationTextEntry('STRING');
	AddTextComponentString(inputText);
	SetNotificationMessage(ad.pic1, ad.pic2, true, 4, ad.sender, ad.subject);
	DrawNotification(false, true);
end)