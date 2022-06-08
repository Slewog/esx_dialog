--[[ FX Information ]]--
fx_version 'adamant'
-- use_fxv2_oal 'yes'
-- lua54 'yes'
game 'gta5'

name         'esx_dialog'
author		 'Slewog'
version      '1.0.0'
-- repository   ''
description  'Display a dialog to the player to confirm or cancel an action'

shared_script '@es_extended/imports.lua'

client_scripts {
    'client.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}