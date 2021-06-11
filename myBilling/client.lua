ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5)
	end
end)

_menuPool  = NativeUI.CreatePool()
local billingMenu
--end)

RegisterNetEvent('myBills:openMenu')
AddEventHandler('myBills:openMenu', function()
	if billingMenu == nil or billingMenu:Visible() == false then
		TriggerServerEvent('myBills:requestPlayerBills')
		createBillsMenu()
	else
		billingMenu:Visible(false)
	end
end)

Citizen.CreateThread(function()

	--TriggerServerEvent('esx_billing:sendBill', 6, 'society_government','Example Invoice2', 1000)
	--'esx_billing:sendBill' for esx_billing support
	while true do
		Citizen.Wait(1)
		_menuPool:ProcessMenus()
		if IsControlJustReleased(0, Config.Key) then
			if billingMenu == nil or billingMenu:Visible() == false then
				TriggerServerEvent('myBills:requestPlayerBills')
				createBillsMenu()
			else
				billingMenu:Visible(false)
			end
			
		end

	end

end)


local taxbillsSubmenu

function createBillsMenu()

	billingMenu = NativeUI.CreateMenu(Translation[Config.Locale]['bills'], nil)
	_menuPool:Add(billingMenu)
	
	if Config.CanEverybodyGiveBills then
		local giveBill_sub = _menuPool:AddSubMenu(billingMenu, Translation[Config.Locale]['give_bill'], Translation[Config.Locale]['give_bill_desc'])
		
		local reasonStr = '-'
		local amountInt = 0
		
		local billReason_Item = NativeUI.CreateItem(Translation[Config.Locale]['reason'], '~b~')
		billReason_Item:RightLabel('~b~' .. reasonStr)
		giveBill_sub:AddItem(billReason_Item)
		
		billReason_Item.Activated = function(sender, item)
		
			local reason_res = CreateDialog(Translation[Config.Locale]['insert_reason'])
			if (reason_res ~= nil) then
				reasonStr = reason_res
				billReason_Item:RightLabel('~b~' .. reasonStr)
			end
		
		end
		
		local billAmount_Item = NativeUI.CreateItem(Translation[Config.Locale]['amount'], '~b~')
		billAmount_Item:RightLabel('~b~' .. amountInt .. '$')
		giveBill_sub:AddItem(billAmount_Item)
		
		billAmount_Item.Activated = function(sender, item)
		
			local amount_res = CreateDialog(Translation[Config.Locale]['insert_amount'])
			if (amount_res ~= nil and tonumber(amount_res)) then
				amountInt = tonumber(amount_res)
				billAmount_Item:RightLabel('~b~' .. amountInt .. '$')
			end
		
		end
		
		local submitBill = NativeUI.CreateItem(Translation[Config.Locale]['submit_bill'], '~b~')
		giveBill_sub:AddItem(submitBill)
		
		submitBill.Activated = function(sender, item)
			if amountInt ~= nil and amountInt > 0 then
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				if closestPlayer == -1 or closestDistance > 4.0 then
					ESX.ShowNotification("~r~Es ist niemand in der Nähe!")
				else
					TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), nil, reasonStr, amountInt)
					_menuPool:CloseAllMenus()
				end
			end
			
		end
		
		billingMenu.Items[1]:RightLabel('~o~→→→')
	end
	
	taxbillsSubmenu = _menuPool:AddSubMenu(billingMenu, Translation[Config.Locale]['taxbills'], '~b~')
	--taxbillsSubmenu = _menuPool:AddSubMenu(billingMenu, 'Rechnungen in Teilzahlung', 'Ausstehende Rechnungen werden automatisch um 21 Uhr abgebucht.')



	if Config.CanEverybodyGiveBills then
		billingMenu.Items[2]:RightLabel('~b~→→→')
	else
		billingMenu.Items[1]:RightLabel('~b~→→→')
	end

	_menuPool:ControlDisablingEnabled(false)
	_menuPool:MouseControlsEnabled(false)
	
    --billingMenu:Visible(not billingMenu:Visible())

end

RegisterNetEvent('myBills:receiveBills')
AddEventHandler('myBills:receiveBills', function(bills_s, taxbills_s)

	for k, v in pairs(bills_s) do
		local targetEditStr
		if v.target_type == 'society' then
			local targetEdit = v.target:gsub("society_", "")
			targetEditStr = targetEdit:gsub("^%l", string.upper)
		else
			targetEditStr = Translation[Config.Locale]['private']
		end

		local billItem = NativeUI.CreateItem(v.label .. ' (~y~' .. targetEditStr .. '~s~)', '~b~')
		billItem:RightLabel('~r~' .. v.amount .. '$')
		billingMenu:AddItem(billItem)

	end

	for k2, v2 in pairs(taxbills_s) do
		local targetEditStr
		if v2.target_type == 'society' then
			local targetEdit = v2.target:gsub("society_", "")
			targetEditStr = targetEdit:gsub("^%l", string.upper)
		else
			targetEditStr = Translation[Config.Locale]['private']
		end


		local calcuteLeft = math.floor((v2.amount / 5) * v2.duration)
		
		local taxbillItem = NativeUI.CreateItem(v2.label .. ' (~y~' .. targetEditStr .. '~s~)', Translation[Config.Locale]['taxbills_desc'])
		taxbillItem:RightLabel('~r~' .. calcuteLeft .. '$ ~s~/~o~ ' .. v2.amount .. '$')
		taxbillsSubmenu:AddItem(taxbillItem)

	end

	billingMenu.OnItemSelect = function(sender, item, index)

		if Config.CanEverybodyGiveBills then
			if index > 2 then

				local billData = bills_s[index - 2]

				TriggerServerEvent('myBills:payBill', 'billing', billData.id, billData.target_type, billData.target, billData.amount, billData.sender)

			end
		else
			if index > 1 then

				local billData = bills_s[index - 1]

				TriggerServerEvent('myBills:payBill', 'billing', billData.id, billData.target_type, billData.target, billData.amount, billData.sender)

			end
		end

	end

	taxbillsSubmenu.OnItemSelect = function(sender, item, index)

		local billData = taxbills_s[index]

		TriggerServerEvent('myBills:payBill', 'taxbills', billData.id, billData.target_type, billData.target, billData.amount / 5 * billData.duration, billData.sender)

	end

	_menuPool:RefreshIndex()
	billingMenu:Visible(not billingMenu:Visible())
end)

RegisterNetEvent('myBills:gotInvoice')
AddEventHandler('myBills:gotInvoice', function(senderPlayer, playerIdentifier, sharedAccountName, label, amount)

	local invoiceMenu = NativeUI.CreateMenu(Translation[Config.Locale]['dialog_title'], nil)
	_menuPool:Add(invoiceMenu)
	invoiceMenu.Controls.Back.Enabled = false

	local amountItem = NativeUI.CreateItem(Translation[Config.Locale]['amount'], '~b~')
	amountItem:RightLabel('~g~' .. amount .. '$')
	invoiceMenu:AddItem(amountItem)

	local reason = NativeUI.CreateItem(Translation[Config.Locale]['reason'], '~b~')
	reason:RightLabel('~b~' .. label)
	invoiceMenu:AddItem(reason)


	local spacer = NativeUI.CreateItem('', '~b~')
	invoiceMenu:AddItem(spacer)

	local accept = NativeUI.CreateItem(Translation[Config.Locale]['dialog_accept'], '~b~')
	invoiceMenu:AddItem(accept)

	local deny = NativeUI.CreateItem(Translation[Config.Locale]['dialog_reject'], '~b~')
	invoiceMenu:AddItem(deny)


	invoiceMenu.OnItemSelect = function(sender, item, index)

		if item == accept then

			TriggerServerEvent('myBills:gotAnswerForBill', senderPlayer, playerIdentifier, sharedAccountName, label, amount, true)
			_menuPool:CloseAllMenus()

		elseif item == deny then

			TriggerServerEvent('myBills:gotAnswerForBill', senderPlayer, playerIdentifier, sharedAccountName, label, amount, false)
			_menuPool:CloseAllMenus()

		end

	end

	_menuPool:ControlDisablingEnabled(false)
	_menuPool:MouseControlsEnabled(false)
	
    invoiceMenu:Visible(not invoiceMenu:Visible())

end)

RegisterNetEvent('myBills:refreshMenu')
AddEventHandler('myBills:refreshMenu', function()
	--if billingMenu ~= nil and (billingMenu:Visible() == true or taxbillsSubmenu:Visible(true))  then
		--billingMenu:Visible(false)
	_menuPool:CloseAllMenus()
	TriggerServerEvent('myBills:requestPlayerBills')
	createBillsMenu()
	--end
end)

RegisterNetEvent('myBills:msg')
AddEventHandler('myBills:msg', function(str)
	ShowNotification(str)
end)

function ShowNotification(text)
	SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
	DrawNotification(false, true)
end

function CreateDialog(OnScreenDisplayTitle_shopmenu) --general OnScreenDisplay for KeyboardInput
	AddTextEntry(OnScreenDisplayTitle_shopmenu, OnScreenDisplayTitle_shopmenu)
	DisplayOnscreenKeyboard(1, OnScreenDisplayTitle_shopmenu, "", "", "", "", "", 32)
	while (UpdateOnscreenKeyboard() == 0) do
		DisableAllControlActions(0);
		Wait(0);
	end
	if (GetOnscreenKeyboardResult()) then
		local displayResult = GetOnscreenKeyboardResult()
		return displayResult
	end
end