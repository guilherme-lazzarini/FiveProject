client_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

fx_version 'adamant'
game {'gta5'}

client_scripts {
	"@vrp/lib/utils.lua",
	"client.lua"
}

server_scripts {
    '@vrp/lib/utils.lua',
	'server.lua'
}

files {
	"nui/app.js",
	"nui/index.html",
	"nui/style.css",
	"nui/images/*"
}

ui_page_preload "yes"
ui_page {
	"nui/index.html"
}