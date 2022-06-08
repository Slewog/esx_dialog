--[[ FX Information ]]--
fx_version 'adamant'
game 'gta5'

name         'esx_dialog'
author		 'Slewog'
version      '1.1.0'
repository   'https://github.com/Slewog/esx_dialog'
description  'Display a dialog to the player to confirm or cancel an action'

client_scripts {
    'config.lua',
    'client.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/modal.ogg',
    'html/script.js'
}