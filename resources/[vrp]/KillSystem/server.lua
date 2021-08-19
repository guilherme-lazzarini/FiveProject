local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

local SUA_WEBHOOK = 'https://discord.com/api/webhooks/869000877472636928/rHZWjS2WDzf-dCXLQIg7g3J_hVPozVugqwx6g6Hx6MJcRkK5WA8fKvhcFUCCLcE7jAt_'

function SendWebhookMessage(webhook,message,footer)
    PerformHttpRequest(webhook, function(E, F, G)end, "POST", json.encode({username = "thn-anticheat",avatar_url = "https://media.discordapp.net/attachments/761734472612708353/781269420634538034/LOGO_Thunder_Shop_2000x2000_Transparente_-_by_Design_Ideal.png",embeds = {{color = 16711680,author = {name = 'KillSystem',icon_url = 'https://media.discordapp.net/attachments/761734472612708353/781269420634538034/LOGO_Thunder_Shop_2000x2000_Transparente_-_by_Design_Ideal.png'},description = message,footer = {text = footer,}}} }), {["Content-Type"] = "application/json"})
end

RegisterServerEvent('diedplayer')
AddEventHandler('diedplayer',function(notify2,killer,reason)
--[[     local source = source ]]
	local user_id = vRP.getUserId(source)
    
    local killer_id = vRP.getUserId(killer)
        vRP.giveKills(killer_id,1)
        SendWebhookMessage(SUA_WEBHOOK,'\n\n[LOG KILL]\n[ID]: '..killer_id..' \n[MATOU]: '..user_id..''..os.date('\n\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S')..'')

end)