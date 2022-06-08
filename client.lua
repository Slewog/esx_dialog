local Promise, ModalIsActive, UIReady = nil, false, false

RegisterNUICallback("get-config", function(data, cb)
    UIReady = true

    cb({Sound = Config.Sound, CustomColors = Config.CustomColors})
end)

RegisterNUICallback("modal-callback", function(data, cb)
    SetNuiFocus(false, false)

    if Promise ~= nil then
        if data.result == 'confirmed' then
            Promise:resolve(true)
        else
            Promise:resolve(false)
        end

        Promise = nil
    end

    ModalIsActive = false

    cb(true)
end)

local function CreateDialog(value)
    if not UIReady then
        while not UIReady do Wait(50) end
    end

    while ModalIsActive do Wait(500) end

    if value.icon == nil or type(value.icon) ~= 'string' then
        value.icon = ''
    end

    Promise = promise.new()
    ModalIsActive = true

    SendNUIMessage({
        action = "open-modal",
        info = value
    })

    SetNuiFocus(true, true)

    return Citizen.Await(Promise)
end

exports("CreateDialog", CreateDialog)

RegisterCommand('dialog', function ()
    local accepted = exports['esx_dialog']:CreateDialog({
        icon = 'fas fa-car',
        title = 'Premium Motorsport - Buy a car',
        content = 'Do you want buy this Benefactor Schafter V12 for 25.0000$ ?',
        delay = false, -- Automatic cancellation after 5000 ms.
    })

    if accepted then
        exports["esx_notify"]:Notify("info", 3000, "You are now the owner of this Benefactor Schafter V12 !")
    else
        exports["esx_notify"]:Notify("info", 3000, "Too bad it will be for another time, have a nice day !")
    end
end)