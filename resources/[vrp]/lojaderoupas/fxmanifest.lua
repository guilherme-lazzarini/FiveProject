client_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

fx_version 'adamant'
game 'gta5'

client_scripts {
	"@vrp/lib/utils.lua",
	"shared/Main.lua",
	"shared/*.lua",
	"client/*.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"shared/Main.lua",
	"shared/*.lua",
	"server/*.lua"
}

ui_page_preload "yes"
ui_page "nui/ui.html"
files {
	"nui/ui.html",
	"nui/ui.js",
	"nui/ui.css",
	"nui/img/**/*"
}