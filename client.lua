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

RegisterCommand('testDialog', function()
    local options = {
        icon = 'fas fa-car',
        title = 'Premium Motorsport - Buy a car',
        content = 'Do you want buy this Benefactor Schafter V12 for 25.0000$ ?'
    }

    local accepted = exports['esx_dialog']:CreateDialog(options)

    if accepted then
        exports['okokNotify']:Alert('Premium Motorsport : ', 'You are now the owner of this Benefactor Schafter V12 !', 2500, 'info')
    else
        exports['okokNotify']:Alert('Premium Motorsport : ', 'Too bad it will be for another time, have a nice day !', 2500, 'info')
    end
end)