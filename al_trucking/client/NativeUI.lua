function CreateNativeUIMenu(title, subtitle)
    menuPool = NativeUI.CreatePool()

    local menu = NativeUI.CreateMenu(title, subtitle)
    menuPool:Add(menu)

    return menu
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if menuPool then menuPool:ProcessMenus() end
    end
end)