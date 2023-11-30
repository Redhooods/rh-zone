fx_version "cerulean"
game "gta5"

client_scripts {
    '@PolyZone/CircleZone.lua',
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/ComboZone.lua',
    'client/client.lua'
}


shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}


lua54 "yes"

ui_page "html/index.html"

files {
    "html/index.html",
    "html/script.js",
}
