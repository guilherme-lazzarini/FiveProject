local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
clgg = {}
Tunnel.bindInterface("juan-pvp",clgg)

RegisterNetEvent("dimension:default")
	AddEventHandler("dimension:default",function()
	local source = source
	SetPlayerRoutingBucket(source,0)
	TriggerClientEvent("Notify",source,"negado","Dimensão #0")
	end)

RegisterNetEvent("dimension:pistol")
    AddEventHandler("dimension:pistol",function()
    local source = source
    SetPlayerRoutingBucket(source,1)
	TriggerClientEvent("Notify",source,"negado","Dimensão #1")
    end)
    
RegisterNetEvent("dimension:fuzil")
    AddEventHandler("dimension:fuzil",function()
    local source = source
    SetPlayerRoutingBucket(source,2)
	TriggerClientEvent("Notify",source,"negado","Dimensão #2")
    end)

--[[ RegisterNetEvent("dimension:alterned")
    AddEventHandler("dimension:alterned",function(player, args)
		local source = source
		print(args)
        SetPlayerRoutingBucket(source,args)
    end)
     ]]



RegisterCommand('dimensao',function(source,args,rawCommand)
	if parseInt(args[1]) then
		local d = parseInt(args[1])
		if d ~= 0 and d ~= 1 and d~= 2 then
			SetPlayerRoutingBucket(source,d)
			TriggerClientEvent("Notify",source,"sucesso","Dimensão: #<b>"..args[1].."</b>.")
		else
			TriggerClientEvent("Notify",source,"negado","Dimensão Indisponivel")
		end
	end
end)


RegisterCommand('a',function(source,args,rawCommand)

	TriggerEvent('Notify','sucesso', 'Skin aplicada.')
	TriggerClientEvent("Notify",source,"sucesso","Dimensão Indisponivel")
end)

local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- /e
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('e', function(source,args,rawCommand)
	TriggerClientEvent("emotes",source,args[1])
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- /e2
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('e2', function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.perm") then
		local nplayer = vRPclient.getNearestPlayer(source,2)
		if nplayer then
			TriggerClientEvent("emotes",nplayer,args[1])
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PANO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("tryclean")
AddEventHandler("tryclean",function(nveh)
	TriggerClientEvent("syncclean",-1,nveh)
end)



--[[ RegisterCommand('pistol',function(source)   
	local user_id = vRP.getUserId(source)

		vRPclient.giveWeapons(user_id,{["WEAPON_PISTOL_MK2"] = { ammo = 1000 }})
		vRPclient.giveWeapons(user_id,{["WEAPON_COMBATPISTOL"] = { ammo = 1000 }})
		vRPclient.giveWeapons(source,{["WEAPON_SNSPISTOL"] = { ammo = 1000 }})




	local positions = {--spawn position
		{x= -1057.8961181641,y= -1493.2017822266,z= 5.1414666175842}, --your spawn position
		{x= -1131.8883056641,y= -1585.1516113281,z= 4.3820219039917},
		{x= -1069.0128173828,y= -1671.859375,z= 4.4703063964844},
		{x= -1090.9267578125,y= -1662.421875,z= 4.6450071334839},
		{x= -1089.7543945312,y= -1632.7999267578,z= 4.7327351570129},
		{x= -1120.1773681641,y= -1623.3972167969,z= 4.3984351158142},
		--aa
		{x= -1078.1643066406,y= -1678.2136230469,z= 4.5752367973328},
		{x= -1089.3126220703,y= -1688.5766601562,z= 4.6129813194275},
		{x= -1133.1513671875,y= -1641.5439453125,z= 4.3204522132874},
		{x= -1114.8028564453,y= -1578.6435546875,z= 8.6727600097656},
		{x= -1120.0391845703,y= -1426.9074707031,z= 5.0260801315308},
		{x= -1130.4132080078,y= -1452.4874267578,z= 4.9491996765137},
		{x= -1261.6857910156,y= -1485.2927246094,z= 4.3305149078369},
		{x= -1241.1391601562,y= -1534.7043457031,z= 4.2962112426758},
		{x= -1021.3573608398,y= -1527.671875,z= 5.1083278656006},
		{x= -1025.3787841797,y= -1630.4233398438,z= 4.6481962203979},
		{x= -1056.5974121094,y= -1653.6361083984,z= 4.6733808517456},
		{x= -1117.9575195312,y= -1624.1810302734,z= 4.3984351158142}
	}
  	local pos = positions[math.random(1, #positions)]
	vRPclient.teleport(source,pos.x, pos.y, pos.z)
	TriggerClientEvent("Notify",source,"sucesso","Teleportado para o ID: <b>"..args[1].."</b>.")
end) ]]


