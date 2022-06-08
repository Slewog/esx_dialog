Config = {}

Config.Sound = {
    play = true, -- true or false | if true a sound will be played on modal fadIn.
    volume = 0.8 -- from 0.0 to 1.0 | Change the volume.
}

-- Set key "change" of every colors if you want load the ui colors from here and not from the css (only with css syntax).
Config.CustomColors = {
    primary = { -- Border and icons color | default value =  rgb(34, 132, 189).
        change = false,
        value = 'rgb(34, 132, 189)'
    },
    textColor = { -- Text color | #ffffff by default on the css.
        change = false,
        value = '#ffffff'
    },
    bgColor = { -- BG color of the modal | default value = rgba(5, 5, 5, 0.85).
        change = false,
        value = 'rgba(5, 5, 5, 0.85)'
    }
}
