-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
src = {}
Tunnel.bindInterface("lojaderoupas",src)
vSERVER = Tunnel.getInterface("lojaderoupas")
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOJAS
-----------------------------------------------------------------------------------------------------------------------------------------
local roupasCompradas = 0
local lojaderoupa = {
    { name = "Loja de Roupas", id = 73, color = 13, x= -1833.5736083984,y= -1211.8658447266,z= 13.017254829407, provador = {x= -1834.4184570312,y= -1213.5999755859,z= 13.017227172852, heading = 150.0}},
--[[     { name = "Loja de Roupas", id = 73, color = 13, x= -1833.7606201172,y= -1213.5799560547,z= 13.017251014709, provador = {x=-1833.7606201172,y= -1213.5799560547,z= 13.017251014709, heading = 150.0}},
    { name = "Loja de Roupas", id = 73, color = 13, x= -1832.0445556641,y= -1214.5255126953,z= 13.017254829407, provador = {x=-1832.0445556641,y= -1214.5255126953,z= 13.017254829407, heading = 150.0}}, ]]
    
    --{ name = "Loja de Roupas", id = 73, color = 13, x = 337.21, y = -579.29, z = 43.31, provador = {x = 337.21, y = -579.29, z = 43.31, heading = 154.50}},
}

-----------------------------------------------------------------------------------------------------------------------------------------
-- BLIP MENU
-----------------------------------------------------------------------------------------------------------------------------------------
local noProvador = false

local pos = nil
local camPos = nil
local cam = -1
-----------------------------------------------------------------------------------------------------------------------------------------
-- DESENHAR MARCADOR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local ped = PlayerPedId()
        local playerCoords = GetEntityCoords(ped, true)
        
        for k, v in pairs(lojaderoupa) do
            local provador = lojaderoupa[k].provador

--[[             if GetDistanceBetweenCoords(playerCoords.x, playerCoords.y, playerCoords.z, lojaderoupa[k].x, lojaderoupa[k].y, lojaderoupa[k].z, true ) <= 50 and not in_loja then
                DrawMarker(27,lojaderoupa[k].x,lojaderoupa[k].y,lojaderoupa[k].z-1,0,0,0,0,180.0,130.0,1.0,1.0,1.0,255,0,0,75,0,0,0,1)
            end ]]

            if GetDistanceBetweenCoords(GetEntityCoords(ped), lojaderoupa[k].x, lojaderoupa[k].y, lojaderoupa[k].z, true ) < 1 then
                --[[ DrawText3D(lojaderoupa[k].x, lojaderoupa[k].y, lojaderoupa[k].z-0.1, "Pressione [~r~E~w~] para acessar a ~r~LOJA~w~.") ]]
                if IsControlJustPressed(0, 38) then

					SetEntityHeading(PlayerPedId(), provador.heading)
					SetEntityCoords(ped,provador.x, provador.y, provador.z-1,1,0,0,1)
                    TriggerEvent("skinshop:toggleMenu",true)
					lojaProvador()


                    
                end
            end

        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ABRIR MENU POR COMANDO
-----------------------------------------------------------------------------------------------------------------------------------------
--[[RegisterCommand("clothes", function()
  if not IsPedInAnyVehicle(PlayerPedId()) then
    local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
		TriggerEvent("skinshop:toggleMenu")
    -- for k,v in pairs(cloths) do
    --   local distance = Vdist(x,y,z,v.x,v.y,v.z)
    --   if distance <= 5 then
    --     TriggerEvent("skinshop:toggleMenu")
    --   end
    -- end
  end
end)]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- Menu toggle
-----------------------------------------------------------------------------------------------------------------------------------------
local m, f = GetHashKey("mp_m_freemode_01"), GetHashKey("mp_f_freemode_01")
local cor = 0
RegisterNetEvent("skinshop:toggleMenu")
AddEventHandler("skinshop:toggleMenu", function(menuactive)
	local ped = PlayerPedId()
	if menuactive == true then
		SetNuiFocus(true,true)
		noProvador = true
		SetCameraCoords()
	 	FreezeEntityPosition(ped, true)
		local ped = PlayerPedId()
		SetEntityInvincible(ped, false)
		if IsPedModel(ped, m) then
			SendNUIMessage({ showMenu = true, masc = true })
		elseif IsPedModel(ped, f) then
			SendNUIMessage({ showMenu = true, masc = false })		
		end


	else
		SetNuiFocus(false,false)
		FreezeEntityPosition(ped, false)
		SetEntityInvincible(ped, false)
		PlayerReturnInstancia()
		noProvador = false
		DeleteCam()
		if IsPedModel(ped, m) then
			SendNUIMessage({ showMenu = false, masc = true })
		elseif IsPedModel(ped, f) then
			SendNUIMessage({ showMenu = false, masc = false })		
		end
	end

end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if menuactive then InvalidateIdleCam() end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- Retornos
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterNUICallback("exit", function(data, cb)
	if data == "true" then 
		TriggerEvent("skinshop:toggleMenu",false)
	end
end)

RegisterNUICallback("rotate", function(data, cb)
	local ped = PlayerPedId()
	local heading = GetEntityHeading(ped)
	if data == "left" then
		SetEntityHeading(ped, heading + 15)
	elseif data == "right" then
		SetEntityHeading(ped, heading - 15)
	elseif data == "up" then
		print('Levantando a mão')
		vRP.playAnim(true,{{"random@mugging3","handsup_standing_base"}},true)
	elseif data == "down" then
		print('Abaixando a mão')
		vRP._stopAnim(false)
	end
end)

RegisterNUICallback("maos", function(data, cb)
	local ped = PlayerPedId()
	local heading = GetEntityHeading(ped)
	if data == "up" then
		vRP.playAnim(true,{{"random@mugging3","handsup_standing_base"}},true)
	elseif data == "down" then
		vRP._stopAnim(false)
	end
end)

RegisterNUICallback("update", function(data, cb)
	local ped = PlayerPedId()
	dados = tonumber(json.encode(data[1]))
	tipo = tonumber(json.encode(data[2]))
	cor = 0
	if (tipo == -1) then
		ClearPedProp(ped,dados-100)
	else
		setRoupa(dados, tipo, cor)
	end
end)

RegisterNUICallback("color", function(data, cb)
	if data == "left" then
		if cor ~= 0 then
			cor = cor - 1
		else
			cor = 25
		end
	elseif data == "right" then
		if cor < 25 then
			cor = cor + 1
		else
			cor = 0
		end
	end
	if dados and tipo then setRoupa(dados, tipo, cor) end
end)

local roupaAtual = nil
function setRoupa(dados, tipo, cor)
	local ped = PlayerPedId()
	if dados ~= roupaAtual then
		roupaAtual = dados
		roupasCompradas = roupasCompradas + 1
	end
	if dados < 100 then		
		SetPedComponentVariation(ped, dados, tipo, cor, 1)
	else
		SetPedPropIndex(ped, dados-100, tipo, cor, 1)
	end
end

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end

function PlayerInstancia()
    for _, player in ipairs(GetActivePlayers()) do
        local ped = PlayerPedId()
        local otherPlayer = GetPlayerPed(player)
        if ped ~= otherPlayer then
            SetEntityVisible(otherPlayer, false)
            SetEntityNoCollisionEntity(ped, otherPlayer, true)
        end
    end
end

function PlayerReturnInstancia()
    for _, player in ipairs(GetActivePlayers()) do
        local ped = PlayerPedId()
        local otherPlayer = GetPlayerPed(player)
        if ped ~= otherPlayer then
            SetEntityVisible(otherPlayer, true)
            SetEntityCollision(ped, true)
        end
    end
end

function lojaProvador() 
    Citizen.CreateThread(function()
        while true do
            if noProvador then
                PlayerInstancia()
                DisableControlAction(1, 1, true)
                DisableControlAction(1, 2, true)
                DisableControlAction(1, 24, true)
                DisablePlayerFiring(PlayerPedId(), true)
                DisableControlAction(1, 142, true)
                DisableControlAction(1, 106, true)
                DisableControlAction(1, 37, true)
            else 
                break
            end
            Citizen.Wait(4)
        end
    end)
end


function SetCameraCoords()
    local ped = PlayerPedId()
	RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
    
	if not DoesCamExist(cam) then
        cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
		SetCamActive(cam, true)
        RenderScriptCams(true, true, 500, true, true)

        pos = GetEntityCoords(PlayerPedId())
        camPos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 2.0, 0.0)
        SetCamCoord(cam, camPos.x, camPos.y, camPos.z+0.75)
        PointCamAtCoord(cam, pos.x, pos.y, pos.z+0.15)
    end

end



function DeleteCam()
	SetCamActive(cam, false)
	RenderScriptCams(false, true, 0, true, true)
	cam = nil
end