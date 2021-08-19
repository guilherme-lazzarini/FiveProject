-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
vRP = Proxy.getInterface("vRP")
vRPNserver = Tunnel.getInterface("vrp_identidade")
-----------------------------------------------------------------------------------------------------------------------------------------
-- IDENTIDADE
-----------------------------------------------------------------------------------------------------------------------------------------
local identity = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if IsControlJustPressed(0, 344) and GetEntityHealth(PlayerPedId()) > 101 then
            if identity then
                identity = false
                SendNUIMessage({type = 'close'})
                vRP._DeletarObjeto()
            else
				-- local IsMale = GetEntityModel(PlayerPedId()) == GetHashKey("mp_m_freemode_01")				                
				--[[ vRP._CarregarObjeto("amb@world_human_stand_mobile@female@text@enter", "enter","p_ld_id_card_01", 50, 28422) ]]
                --[[ Citizen.Wait(1500) ]]
                local carteira, banco, nome, sobrenome, idade, user_id, identidade, telefone, job, cargo, vip, multas = vRPNserver.Identidade()
                SendNUIMessage({
                    type = 'open',
                    nome = nome,
                    sobrenome = sobrenome,
                    carteira = carteira,
                    banco = banco,
                    vip = vip,
                    emprego = job,
                    cargo = cargo,
                    id = user_id,
                    documento = identidade,
                    idade = idade,
                    telefone = telefone,
                    multas = multas
                })
                identity = true
            end
        end
    end
end)
