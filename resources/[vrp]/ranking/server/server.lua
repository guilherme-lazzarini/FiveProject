-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("ranking")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cnVRP = {}
Tunnel.bindInterface("ranking",cnVRP)
vCLIENT = Tunnel.getInterface("ranking")

vRP.prepare("vRP/get_top","SELECT * from vrp_kda order by kills desc")

function cnVRP.getStatus()
    local source = source
    local user_id = vRP.getUserId(source)
    local kills = vRP.getKills(user_id)
    local identity = vRP.getUserIdentity(user_id)
    local deaths = vRP.getDeaths(user_id)
    local coins = vRP.getCoins(user_id)
    local kills_deaths = kills/deaths
  
    return 
        { kills = kills,
        name = identity.name,
        firstname = identity.firstname,
        user_id = user_id,
        deaths = deaths,
        kills_deaths = string.format("%.2f", kills_deaths),
        coins = coins,
        }
end



 function cnVRP.getRank()
	return 
    {
        name = "jose",
        kills = 50,
        deaths = 10
    }
end 
