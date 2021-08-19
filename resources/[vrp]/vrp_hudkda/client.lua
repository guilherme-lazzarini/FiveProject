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
Tunnel.bindInterface("vrp_hud",cRP)

RegisterNetEvent('client:refreshkda')
AddEventHandler('client:refreshkda', function(kill)
  local kill = kill
--[[   SendNUIMessage({
    kill = kill
  }) ]]
end)




Citizen.CreateThread(function()
    while true do
		TriggerServerEvent('server:kda')
    end
end)