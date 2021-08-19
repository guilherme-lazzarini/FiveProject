 -----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("vrp_tattoos", cRP)
vSERVER = Tunnel.getInterface("vrp_tattoos")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local cam = nil
local atualShop = {}
local atualTattoo = {}
local old_custom
local openShop = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADFOCUS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	SetNuiFocus(false,false)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETTATTOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vrp_tattoos:setTattoos")
AddEventHandler("vrp_tattoos:setTattoos",function(status)
	atualTattoo = status

	for k,v in pairs(atualTattoo) do
		AddPedDecorationFromHashes(PlayerPedId(),GetHashKey(v[1]),GetHashKey(k))
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENTATTOOSHOP
-----------------------------------------------------------------------------------------------------------------------------------------
function openTattooShop()
	local ped = PlayerPedId()
	SetEntityHeading(ped, 240.0)
	SetEntityCoords(ped,-1840.5126953125,-1200.0765380859,14.304760932922-1,1,0,0,1)

--[[ 	setCameraCoords() ]]
	SetNuiFocus(true,true)
	openShop = true
	ClearAllPedProps(ped)
	if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
		atualShop = Config.tattooList["partsM"]
	elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
		atualShop = Config.tattooList["partsF"]
	end
	SendNUIMessage({ openNui = true, shop = atualShop, tattoo = atualTattoo })
end



--[[ Citizen.CreateThread(function()
	while true do
		local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
		print(coords)
	end
end) ]]

-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATETATTOO
-----------------------------------------------------------------------------------------------------------------------------------------
function updateTattoo()
	ClearPedDecorations(PlayerPedId())

	for k,v in pairs(atualTattoo) do
		AddPedDecorationFromHashes(PlayerPedId(),GetHashKey(v[1]),GetHashKey(k))
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SETCAMERACOORDS
-----------------------------------------------------------------------------------------------------------------------------------------
function setCameraCoords()
	if DoesCamExist(cam) then
		RenderScriptCams(false,true,250,1,0)
		DestroyCam(cam,false)
		cam = nil
	end

	cam = CreateCam("DEFAULT_SCRIPTED_CAMERA",true)
	SetCamActive(cam,true)
	RenderScriptCams(true,true,500,true,true)
	pos = GetEntityCoords(PlayerPedId())
	camPos = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,2.0,0.0)
	SetCamCoord(cam,camPos.x,camPos.y,camPos.z + 0.75)
	PointCamAtCoord(cam,pos.x,pos.y,pos.z + 0.15)
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- CHANGE CAMERA
-----------------------------------------------------------------------------------------------------------------------------------------
function ChangeCameraCoords(type)
	local ped = PlayerPedId()
	
	if type == "head" then
		SetEntityHeading(ped,240.0)
		cam = CreateCam("DEFAULT_SCRIPTED_CAMERA",true)
		SetCamActive(cam,true)
		RenderScriptCams(true,true,500,true,true)
		pos = GetEntityCoords(PlayerPedId())
		camPos = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,0.5,0.0)
		SetCamCoord(cam,camPos.x,camPos.y,camPos.z + 0.65)
		PointCamAtCoord(cam,pos.x,pos.y,pos.z + 0.65)
	end
	if type ==  "leftarm" then
		cam = CreateCam("DEFAULT_SCRIPTED_CAMERA",true)
		SetCamActive(cam,true)
		RenderScriptCams(true,true,500,true,true)
		pos = GetEntityCoords(PlayerPedId())
		camPos = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,-0.5,0.0)
		SetCamCoord(cam,camPos.x,camPos.y-1,camPos.z+0.1)
		PointCamAtCoord(cam,pos.x,pos.y,pos.z +0.1) 
		SetEntityHeading(ped,60.0)
	end
	if type ==  "rightarm" then
		SetEntityHeading(ped,240.0)
		cam = CreateCam("DEFAULT_SCRIPTED_CAMERA",true)
		SetCamActive(cam,true)
		RenderScriptCams(true,true,500,true,true)
		pos = GetEntityCoords(PlayerPedId())
		camPos = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,-0.5,0.0)
		SetCamCoord(cam,camPos.x,camPos.y-1,camPos.z+0.1)
		PointCamAtCoord(cam,pos.x,pos.y,pos.z+0.1)
	end
	if type ==  "torso" then
		SetEntityHeading(ped,240.0)
		cam = CreateCam("DEFAULT_SCRIPTED_CAMERA",true)
		SetCamActive(cam,true)
		RenderScriptCams(true,true,500,true,true)
		pos = GetEntityCoords(PlayerPedId())
		camPos = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,0.8,0.0)
		SetCamCoord(cam,camPos.x,camPos.y,camPos.z + 0.4)
		PointCamAtCoord(cam,pos.x,pos.y,pos.z + 0.4)
	end
	if type ==  "leftleg" or type == "rightleg" then
		SetEntityHeading(ped,240.0)
		cam = CreateCam("DEFAULT_SCRIPTED_CAMERA",true)
		SetCamActive(cam,true)
		RenderScriptCams(true,true,500,true,true)
		pos = GetEntityCoords(PlayerPedId())
		camPos = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,0.8,0.0)
		SetCamCoord(cam,camPos.x,camPos.y,camPos.z-0.6)
		PointCamAtCoord(cam,pos.x,pos.y,pos.z-0.6)
	end

end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("close",function(data,cb)
	openShop = false
	RenderScriptCams(false,true,250,1,0)
	vSERVER.applyTattow(atualTattoo)
	SetNuiFocus(false,false)
	DestroyCam(cam,false)
	cam = nil
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
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local timeDistance = 500
		local ped = PlayerPedId()
		if not IsPedInAnyVehicle(ped) then
			local coords = GetEntityCoords(ped)

			for k,v in pairs(Config.coordsSystem) do
				local distance = #(coords - vector3(v[1],v[2],v[3]))
				if distance <= 5 then
					timeDistance = 4
--					DrawMarker(23,v[1],v[2],v[3]-0.95,0,0,0,0,0,0,1.5,1.5,1.5,42,137,255,100,0,0,0,0)

					if distance <= 1 and IsControlJustPressed(1,38) then
						openTattooShop()
					end
				end
			end
		end

		Citizen.Wait(timeDistance)
	end
end)

--[[ Citizen.CreateThread(function()
	local innerTable = {}
	for k,v in pairs(Config.coordsSystem) do
		table.insert(innerTable,{ v[1],v[2],v[3],2,"E","Estudio de Tatuagem","Pressione para abrir" })
	end

	TriggerEvent("hoverfy:insertTable",innerTable)
end) ]]

-----------------------------------------------------------------------------------------------------------------------------------------
-- CHANGETATTOO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("changeTattoo",function(data,cb)
	local newAtualTattoo = {}
	local tattooData = atualShop[data.type]["tattoo"][data.id + 1]

	for k,v in pairs(atualTattoo) do
		if k ~= tattooData["name"] then
			newAtualTattoo[k] = v
		end
	end

	if atualTattoo[tattooData["name"]] == nil then
		newAtualTattoo[tattooData["name"]] = { tattooData["part"] }
	end

	atualTattoo = newAtualTattoo
	updateTattoo()
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLEARTATTOO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("clearTattoo",function(data,cb)
	atualTattoo = {}
	ClearPedDecorations(PlayerPedId())
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ROTATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("rotate",function(data,cb)
	local ped = PlayerPedId()
	local heading = GetEntityHeading(ped)
	if data == "left" then
		SetEntityHeading(ped,heading + 90)
	elseif data == "right" then
		SetEntityHeading(ped,heading - 90)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CAMERA CHANGE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("camera",function(data,cb)
	local ped = PlayerPedId()
	local heading = GetEntityHeading(ped)
	if data == "head" then
		ChangeCameraCoords("head")
		else if data == "torso" then
			ChangeCameraCoords("torso")
			else if data == "leftarm" then
				ChangeCameraCoords("leftarm")
				else if data == "rightarm" then
					ChangeCameraCoords("rightarm")
					else if data == "leftleg" then
						ChangeCameraCoords("leftleg")
						else if data == "rightleg" then
							ChangeCameraCoords("rightleg")
						end
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HANDSUP
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("handsup",function(data,cb)
	local ped = PlayerPedId()
	if IsEntityPlayingAnim(ped,"random@mugging3","handsup_standing_base",3) then
		StopAnimTask(ped,"random@mugging3","handsup_standing_base",2.0)
		vRP._stopActived()
	else
		vRP._playAnim(true,{"random@mugging3","handsup_standing_base"},true)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT3D
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3Ds(x,y,z,text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	SetTextFont(4)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,100)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	local factor = (string.len(text))/450
	DrawRect(_x,_y+0.0125,0.01+factor,0.03,0,0,0,100)
end
