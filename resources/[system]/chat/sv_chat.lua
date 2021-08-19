local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP")
BMclient = Tunnel.getInterface("vRP_basic_menu","vRP_basic_menu")

RegisterServerEvent('chat:init')
RegisterServerEvent('chat:addTemplate')
RegisterServerEvent('chat:addMessage')
RegisterServerEvent('chat:addSuggestion')
RegisterServerEvent('chat:removeSuggestion')
RegisterServerEvent('_chat:messageEntered')
RegisterServerEvent('chat:clear')
RegisterServerEvent('__cfx_internal:commandFallback')

AddEventHandler('_chat:messageEntered', function(author, color, message)
    if not message or not author then
        return
    end

    if not WasEventCanceled() then
		TriggerClientEvent('sendProximityMessage', -1, source, author, message, color)
    end

    print(author .. ': ' .. message)
end)

AddEventHandler('__cfx_internal:commandFallback', function(command)
    local name = GetPlayerName(source)
    if not WasEventCanceled() then
    end
    CancelEvent()
end)

-- CHATS

RegisterCommand('911',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id ~= nil then
		local player = vRP.getUserSource(user_id)
		local identity = vRP.getUserIdentity(user_id)
		TriggerClientEvent('chatMessage',-1,"[911] "..identity.name.. " "..identity.firstname.." ",{0,0,255},rawCommand:sub(4))
	end
end)


RegisterCommand('112',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id ~= nil then
		local player = vRP.getUserSource(user_id)
		local identity = vRP.getUserIdentity(user_id)
		TriggerClientEvent('chatMessage',-1,"[112] "..identity.name.. " "..identity.firstname.." ",{255,120,120},rawCommand:sub(4))
	end
end)


RegisterCommand('twt', function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id ~= nil then
		local player = vRP.getUserSource(user_id)
		local identity = vRP.getUserIdentity(user_id)
		TriggerClientEvent('chatMessage',-1,"[Twitter] @"..identity.name.. " "..identity.firstname.." ",{0,170,255},rawCommand:sub(4))
	end
end)


RegisterCommand('ilegal', function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id ~= nil then
		local player = vRP.getUserSource(user_id)
		local identity = vRP.getUserIdentity(user_id)
		TriggerClientEvent('chatMessage',-1,"[@Anônimo] | "..user_id.."",{000,000,000},rawCommand:sub(7))
	end
end)


RegisterCommand('anunciomec',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		if vRP.hasPermission(user_id,"mecanico.perm") then
			if user_id then
				TriggerClientEvent('chatMessage',-1,"Central Mecânica",{255,128,0},rawCommand:sub(12))
			end
		end
	end
end)


RegisterCommand('mcc',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "mecanico.perm"
		if vRP.hasPermission(user_id,permission) then
			local mec = vRP.getUsersByPermission(permission)
			for l,w in pairs(mec) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					async(function()
						TriggerClientEvent('chatMessage',player,"[MECÂNICO] "..identity.name.. " "..identity.firstname.." ",{255,191,128},rawCommand:sub(4))
					end)
				end
			end
		end
	end
end)


RegisterCommand('pdc',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "policia.perm"
		if vRP.hasPermission(user_id,permission) then
			local soldado = vRP.getUsersByPermission(permission)
			for l,w in pairs(soldado) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					async(function()
						TriggerClientEvent('chatMessage',player,"[POLÍCIA] "..identity.name.. " "..identity.firstname.." ",{64,179,255},rawCommand:sub(4))
					end)
				end
			end
		end
	end
end)


RegisterCommand('prc',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "paramedico.perm"
		if vRP.hasPermission(user_id,permission) then
			local soldado = vRP.getUsersByPermission(permission)
			for l,w in pairs(soldado) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					async(function()
						TriggerClientEvent('chatMessage',player,"[PARAMÉDICO] "..identity.name.. " "..identity.firstname.." ",{255,175,175},rawCommand:sub(4))
					end)
				end
			end
		end
	end
end)


RegisterCommand('sc',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "staff.chat"
		if vRP.hasPermission(user_id,permission) then
			local soldado = vRP.getUsersByPermission(permission)
			for l,w in pairs(soldado) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					async(function()
						TriggerClientEvent('chatMessage',player,"[STAFF] "..identity.name.. " "..identity.firstname.." ",{255,0,255},rawCommand:sub(4))
					end)
				end
			end
		end
	end
end)


RegisterCommand('cc', function(source)
	local user_id = vRP.getUserId(source);
		if user_id ~= nil then
			if vRP.hasPermission(user_id, "admin.perm") then
				TriggerClientEvent("chat:clear", -1);
			else
				TriggerClientEvent("chat:clear", source);
			end
		end
	end)


local function refreshCommands(player)
    if GetRegisteredCommands then
        local registeredCommands = GetRegisteredCommands()

        local suggestions = {}

        for _, command in ipairs(registeredCommands) do
            if IsPlayerAceAllowed(player, ('command.%s'):format(command.name)) then
                table.insert(suggestions, {
                    name = '/' .. command.name,
                    help = ''
                })
            end
        end

        TriggerClientEvent('chat:addSuggestions', player, suggestions)
    end
end

AddEventHandler('chat:init', function()
    refreshCommands(source)
end)

AddEventHandler('onServerResourceStart', function(resName)
    Wait(500)

    for _, player in ipairs(GetPlayers()) do
        refreshCommands(player)
    end
end)