local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_skinshop")
vRPloja = Tunnel.getInterface("vrp_skinshop")

RegisterServerEvent('server:kda')
AddEventHandler('server:kda', function()
	local _src = source
	local user_id = vRP.getUserId(_src)
	local kill = vRP.getKills(user_id)
--[[     print(user_id)
    print(kill) ]]
	TriggerClientEvent('client:refreshkda',_src,kill)
end)

--[[ RegisterCommand("teste", function(source)
	local _src = source
	local user_id = vRP.getUserId(_src)
	local kill = vRP.getKills(user_id)
    print(user_id)
    print(kill)
	TriggerClientEvent('client:refreshkda',source,kill)
end)
 ]]