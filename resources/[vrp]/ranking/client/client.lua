local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")



-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cnVRP = {}
Tunnel.bindInterface("ranking", cnVRP)
vSERVER = Tunnel.getInterface("ranking")

RegisterCommand("rank:setShow",function(source,args)
    SetNuiFocus(true,true)
    SendNUIMessage({ type = "setShow", detail = true })
    SendNUIMessage({ type = "setRank", detail = vSERVER.getRank() })
    SendNUIMessage({ type = "setStatus", detail = vSERVER.getStatus() })
end)

RegisterNUICallback("setShowFalse", function(data,cb)
    SetNuiFocus(false,false)
    cb("")
end)

RegisterKeyMapping('rank:setShow','Abrir a Rank','keyboard','oem_3')


RegisterCommand("abc",function(source)
    print(vSERVER.getStatus())
end)


