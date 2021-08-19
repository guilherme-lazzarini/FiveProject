vRPc = {}
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
Tunnel.bindInterface("mito_morte", vRPc)
Proxy.addInterface("mito_morte", vRPc)

Lserver = Tunnel.getInterface("mito_morte", "mito_morte")

local cfg = module("mito_morte", "mito_config")


Citizen.CreateThread(function() -- // ARMA DE FOGO
  while true do
      Wait(2)
      if IsPlayerFreeAiming(PlayerId()) then
          local ent = nil
          local mirando,ent = GetEntityPlayerIsFreeAimingAt(PlayerId(), ent)
          if mirando then
              local entcds = GetWorldPositionOfEntityBone(ent,GetPedBoneIndex(ent, 31086))
              if IsPedShooting(PlayerPedId()) then 
                Citizen.Wait(3000)
                local wHash = GetSelectedPedWeapon(PlayerPedId())
                if GetEntityHealth(ent) <= 101 then 
--[[                   Lserver.sendKillLog(GetPlayerServerId(NetworkGetEntityOwner(ent)),cfg.Weapons[tostring(wHash)] or "Desconhecido")  ]]
                  Lserver.atualizaKD(GetPlayerServerId(NetworkGetEntityOwner(ent)))  
                end
            end
      end
    end
  end
end)



Citizen.CreateThread(function() -- // QUEDA
  while true do
      Wait(2)
      if IsPedFalling(PlayerPedId()) then
        Citizen.Wait(10000)
        while (IsPedFalling(PlayerPedId())) do 
          Citizen.Wait(0)
        end
        if GetEntityHealth(PlayerPedId()) <= 101 then 
          Lserver.sendSuicideLog()    
        end
      end
  end
end)

