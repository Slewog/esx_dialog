local Promise, ModalIsActive = nil, false

RegisterNUICallback("return-action", function(data, cb)
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
    while ModalIsActive do Wait(125) end

    if type(value.icon) ~= 'string' then
        value.icon = ''
    end

    Promise = promise.new()
    ModalIsActive = true

    SendNUIMessage({
        action = "open",
        info = value
    })

    SetNuiFocus(true, true)

    return Citizen.Await(Promise)
end

exports("CreateDialog", CreateDialog)
