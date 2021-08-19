local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
Lserver = {}
Lclient = Tunnel.getInterface("mito_morte")

Tunnel.bindInterface("mito_morte",Lserver)
local CONFIG = module("mito_morte","mito_config")


function SendWebhookMessage(message)
        print('a')
		PerformHttpRequest(CONFIG.webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
end

Lserver.sendKillLog = function(nsource,wp) 
    local source = source 
    local str = CONFIG.webhookMensagemKill
    local user_id = vRP.getUserId(source)
    local nuser_id = vRP.getUserId(nsource)
--[[     print(source,nuser_id,user_id,wp) ]]
    if nuser_id then 
    local identity = vRP.getUserIdentity(user_id)
    local uidentity = vRP.getUserIdentity(nuser_id)

    vRP.giveKills(user_id,1)
    vRP.giveDeaths(nuser_id,1)
--[[     print(user_id)
    print(nuser_id) ]]

    str = str:gsub("{deathId}",nuser_id)
    str = str:gsub("{killerId}",user_id)

    str = str:gsub("{killerName}",identity.name)
    str = str:gsub("{killerFirstName}",identity.firstname)    
    
    str = str:gsub("{deathName}",uidentity.name)
    str = str:gsub("{deathFirstName}",uidentity.firstname)

    str = str:gsub("{weapon}",wp)
    
    SendWebhookMessage("```prolog\n "..str.."  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    end
end



Lserver.atualizaKD = function(nsource)
    local source = source 
    local user_id = vRP.getUserId(source)
    local nuser_id = vRP.getUserId(nsource)

    vRP.giveKills(user_id,1)
    vRP.giveDeaths(nuser_id,1)
end

Lserver.sendSuicideLog = function() 
    local source = source 
    local str = CONFIG.webhookMensagemSuicide
    local user_id = vRP.getUserId(source)
    if user_id then 
        local identity = vRP.getUserIdentity(user_id)

        str = str:gsub("{deathId}",user_id)
        str = str:gsub("{deathName}",identity.name)
        str = str:gsub("{deathFirstName}",identity.firstname)

        SendWebhookMessage("```prolog\n "..str.."  "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
    end

end