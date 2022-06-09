Config = {}

Config.Sound = {
    play = true, -- true or false | if true a sound will be played on modal fadIn.
    volume = 0.6 -- from 0.0 to 1.0 | Change the volume.
}

-- Set the text of every button.
Config.Button = {
    confirm = 'Confirm',
    cancel = 'Decline'
}

-- Set key "change" to true of a colors if you want use an another color.
-- @value: Only use css syntax (u will broke the UI).
Config.Colors = {
    primary = { -- Border and icons color | default value =  rgb(34, 132, 189).
        change = false,
        value = 'rgb(50, 255, 0)'
    },
    textColor = { -- Text color | #ffffff by default on the css.
        change = false,
        value = ''
    },
    bgColor = { -- BG color of the modal | default value = rgba(5, 5, 5, 0.85).
        change = false,
        value = ''
    }
}