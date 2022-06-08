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
