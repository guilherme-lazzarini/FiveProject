-- This resource is part of the default Cfx.re asset pack (cfx-server-data)
-- Altering or recreating for local use only is strongly discouraged.

version '1.0.0'
author 'Cfx.re <root@cfx.re>'
description 'Adds basic events for developers to use in their scripts. Some third party resources may depend on this resource.'
repository 'https://github.com/citizenfx/cfx-server-data'

fx_version 'adamant'
game 'gta5'
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_scripts {
	"@vrp/lib/utils.lua",
	"deathevents.lua",
    "vehiclechecker.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
	"server.lua"
}









