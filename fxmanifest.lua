fx_version "adamant"

game "gta5"
lua54 'yes'
description 'an-pursuitmode'

client_scripts { 
    "config.lua", 
    "handling.lua", 
    "client.lua" 
}

shared_scripts {
    '@ox_lib/init.lua',
    '@es_extended/imports.lua',
}

exports {
    'GetVehicleMode',
}
 