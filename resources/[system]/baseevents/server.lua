local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")

RegisterServerEvent('baseevents:onPlayerDied')
RegisterServerEvent('baseevents:onPlayerKilled')

AddEventHandler('baseevents:onPlayerKilled', function(killedBy, data)
	local victim = source
	RconLog({msgType = 'playerKilled', victim = victim, attacker = killedBy, data = data})   -- JOGADOR MORTO
	vRP.giveDeaths(victim,1)
	print(vRP.getUserId(killedBy))

--[[ 	vRP.getUserId(killedBy) ]]
	TriggerClientEvent("Notify",victim,"importante", "Morreu +1")
--[[ 	vRP.giveKills(killer,1)
	TriggerClientEvent("Notify",killer,"importante", "Matou +1") ]]
	print("Vitima"..victim..".")
--[[ 	print("KilledBy"..killer..".") ]]
end)

AddEventHandler('baseevents:onPlayerDied', function(killedBy, pos)
	local victim = source
	RconLog({msgType = 'playerDied', victim = victim, attackerType = killedBy, pos = pos}) -- SE MATOU
end)

RegisterCommand('a',function(source)
    vRP.getUserId(113410)
	print(vRP.getUserId('113410'))
end)