-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("vrp_hud", cRP)
vSERVER = Tunnel.getInterface("vrp_hud")


function cRP.getKDA()
    local source = source
    local user_id = vRP.getUserId(source)
    local kills = vRP.getKills(user_id)
	local deaths = vRP.getDeaths(user_id)

	return 
	{	kills = kills,
	deaths = deaths
	}

end