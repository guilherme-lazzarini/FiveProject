local menu_state = {}

function tvRP.openMenuData(menudata)
	SendNUIMessage({ act = "open_menu", menudata = menudata })
end

function tvRP.closeMenu()
	SendNUIMessage({ act = "close_menu" })
end

function tvRP.getMenuState()
	return menu_state
end

local agachar = false

function tvRP.getAgachar()
    return agachar
end

--[ CANCELANDO O F6 ]--------------------------------------------------------------------------------------------------------------------

local cancelando = false
RegisterNetEvent('cancelando')
AddEventHandler('cancelando',function(status)
    cancelando = status
end)

local animoff = false

Citizen.CreateThread(function()
	while true do
		local idle = 1000
		local ped = GetPlayerPed(-1)
		local coords = GetEntityCoords(ped)
        local distance = #(coords - vector3(1135.47,-531.97,64.27))
        local distance2 = #(coords - vector3(1775.44,3706.6,34.37))
		if distance < 353.53 or distance2 < 353.53 then
			animoff = true
		else
			animoff = false
		end

		if cancelando then
			idle = 5
			BlockWeaponWheelThisFrame()
			DisableControlAction(0,29,true)
			DisableControlAction(0,38,true)
			DisableControlAction(0,47,true)
			DisableControlAction(0,56,true)
			DisableControlAction(0,57,true)
			DisableControlAction(0,73,true)
			DisableControlAction(0,137,true)
			DisableControlAction(0,166,true)
			DisableControlAction(0,167,true)
			DisableControlAction(0,169,true)
			DisableControlAction(0,170,true)
			DisableControlAction(0,182,true)
			DisableControlAction(0,187,true)
			DisableControlAction(0,188,true)
			DisableControlAction(0,189,true)
			DisableControlAction(0,190,true)
			DisableControlAction(0,243,true)
			DisableControlAction(0,245,true)
			DisableControlAction(0,257,true)
			DisableControlAction(0,288,true)
			DisableControlAction(0,289,true)
			DisableControlAction(0,311,true)
			DisableControlAction(0,344,true)			
		end

		if menu_state.opened then
			idle = 5
			DisableControlAction(0,75)
		end
		Citizen.Wait(idle)
	end
end)

function tvRP.prompt(title,default_text)
	SendNUIMessage({ act = "prompt", title = title, text = tostring(default_text) })
	SetNuiFocus(true)
end

function tvRP.request(id,text,time)
	SendNUIMessage({ act = "request", id = id, text = tostring(text), time = time })
end

RegisterNUICallback("menu",function(data,cb)
	if data.act == "close" then
		vRPserver._closeMenu(data.id)
	elseif data.act == "valid" then
		vRPserver._validMenuChoice(data.id,data.choice,data.mod)
	end
end)

RegisterNUICallback("menu_state",function(data,cb)
	menu_state = data
end)

RegisterNUICallback("prompt",function(data,cb)
	if data.act == "close" then
		SetNuiFocus(false)
		vRPserver._promptResult(data.result)
	end
end)

RegisterNUICallback("request",function(data,cb)
	if data.act == "response" then
		vRPserver._requestResult(data.id,data.ok)
	end
end)

RegisterNUICallback("init",function(data,cb)
	SendNUIMessage({ act = "cfg", cfg = {} })
	TriggerEvent("vRP:NUIready")
end)

function tvRP.setDiv(name,css,content)
	SendNUIMessage({ act = "set_div", name = name, css = css, content = content })
end

function tvRP.setDivContent(name,content)
	SendNUIMessage({ act = "set_div_content", name = name, content = content })
end

function tvRP.removeDiv(name)
	SendNUIMessage({ act = "remove_div", name = name })
end

local apontar = false
local object = nil

function tvRP.loadAnimSet(dict)
	RequestAnimSet(dict)
	while not HasAnimSetLoaded(dict) do
		Citizen.Wait(10)
	end
	SetPedMovementClipset(PlayerPedId(),dict,0.25)
end

function tvRP.CarregarAnim(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(10)
	end
end

function tvRP.CarregarObjeto(dict,anim,prop,flag,hand,pos1,pos2,pos3,pos4,pos5,pos6)
	local ped = PlayerPedId()

	RequestModel(GetHashKey(prop))
	while not HasModelLoaded(GetHashKey(prop)) do
		Citizen.Wait(10)
	end

	if pos1 then
		local coords = GetOffsetFromEntityInWorldCoords(ped,0.0,0.0,-5.0)
		object = CreateObject(GetHashKey(prop),coords.x,coords.y,coords.z,true,true,true)
		SetEntityCollision(object,false,false)
		AttachEntityToEntity(object,ped,GetPedBoneIndex(ped,hand),pos1,pos2,pos3,pos4,pos5,pos6,true,true,false,true,1,true)
	else
		tvRP.CarregarAnim(dict)
		TaskPlayAnim(ped,dict,anim,3-.0,3.0,-1,flag,0,0,0,0)
		local coords = GetOffsetFromEntityInWorldCoords(ped,0.0,0.0,-5.0)
		object = CreateObject(GetHashKey(prop),coords.x,coords.y,coords.z,true,true,true)
		SetEntityCollision(object,false,false)
		AttachEntityToEntity(object,ped,GetPedBoneIndex(ped,hand),0.0,0.0,0.0,0.0,0.0,0.0,false,false,false,false,2,true)
	end
	Citizen.InvokeNative(0xAD738C3085FE7E11,object,true,true)
end

function tvRP.DeletarObjeto()
    tvRP.stopAnim(true)
    TriggerEvent("binoculos")
    if DoesEntityExist(object) then
        TriggerServerEvent("trydeleteobj",ObjToNet(object))
        object = nil
    end
end

--[ COOLDOWN ]---------------------------------------------------------------------------------------------------------------------------

local cooldown = 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if cooldown > 0 then
			cooldown = cooldown - 1
		end
	end
end)

--[  ]-----------------------------------------------------------------------------

RegisterKeyMapping ( 'vrp:accept' , 'Aceitar' , 'keyboard' , 'y' )

RegisterCommand('vrp:accept', function()
    SendNUIMessage({ act = "event", event = "Y" })
end, false)

RegisterKeyMapping ( 'vrp:decline' , 'Negar' , 'keyboard' , 'u' )

RegisterCommand('vrp:decline', function()
    SendNUIMessage({ act = "event", event = "U" })
end, false)

--[  ]-----------------------------------------------------------------------------

RegisterKeyMapping ( 'vrp:up' , 'CimaG' , 'keyboard' , 'UP' )

RegisterCommand('vrp:up', function()
	local ped = PlayerPedId()
	if menu_state.opened then
		SendNUIMessage({ act = "event", event = "UP" }) 
        tvRP.playSound("NAV_UP_DOWN","HUD_FRONTEND_DEFAULT_SOUNDSET") 
	end
	if not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 101 and not menu_state.opened and not animoff then
		tvRP.playAnim(true,{{"anim@mp_player_intcelebrationmale@salute","salute"}},false)
	end
end, false)

RegisterKeyMapping ( 'vrp:down' , 'BaixoG' , 'keyboard' , 'DOWN' )

RegisterCommand('vrp:down', function()
	local ped = PlayerPedId()
	if menu_state.opened then
		SendNUIMessage({ act = "event", event = "DOWN" })
        tvRP.playSound("NAV_UP_DOWN","HUD_FRONTEND_DEFAULT_SOUNDSET")
	end
	if not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 101 and not menu_state.opened and not animoff then
		tvRP.playAnim(true,{{"rcmnigel1c","hailing_whistle_waive_a"}},false)
	end
end, false)

RegisterKeyMapping ( 'vrp:left' , 'EsquerdaG' , 'keyboard' , 'LEFT' )

RegisterCommand('vrp:left', function()
	local ped = PlayerPedId()
	if menu_state.opened then
		SendNUIMessage({ act = "event", event = "LEFT" })
        tvRP.playSound("NAV_LEFT_RIGHT","HUD_FRONTEND_DEFAULT_SOUNDSET")
	end
	if not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 101 and not menu_state.opened and not animoff then
		tvRP.playAnim(true,{{"anim@mp_player_intupperthumbs_up","enter"}},false)
	end
end, false)

RegisterKeyMapping ( 'vrp:right' , 'DireitaG' , 'keyboard' , 'RIGHT' )

RegisterCommand('vrp:right', function()
	local ped = PlayerPedId()
	if menu_state.opened then
		SendNUIMessage({ act = "event", event = "RIGHT" }) 
        tvRP.playSound("NAV_LEFT_RIGHT","HUD_FRONTEND_DEFAULT_SOUNDSET")
	end
	if not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 101 and not menu_state.opened and not animoff then
		-- tvRP.playAnim(true,{{"anim@mp_player_intcelebrationmale@face_palm","face_palm"}},false)
		tvRP.playAnim(true,{{"anim@mp_player_intupperface_palm","idle_a"}},false)
	end
end, false)

RegisterKeyMapping ( 'vrp:select' , 'Selecionar' , 'keyboard' , 'RETURN' )

RegisterCommand('vrp:select', function()
	if menu_state.opened then
		SendNUIMessage({ act = "event", event = "SELECT" })
		tvRP.playSound("SELECT","HUD_FRONTEND_DEFAULT_SOUNDSET") 
	end
end, false)

RegisterKeyMapping ( 'vrp:cancel' , 'Cancelar' , 'keyboard' , 'BACK' )

RegisterCommand('vrp:cancel', function()
	SendNUIMessage({ act = "event", event = "CANCEL" })
end, false)

--[  ]-----------------------------------------------------------------------------

RegisterKeyMapping ( 'vrp:anim01' , '[A] Cruzar os braços' , 'keyboard' , 'F1' )

RegisterCommand('vrp:anim01', function()
	local ped = PlayerPedId()
	if not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 101 and not menu_state.opened and not animoff and not cancelando then
		if IsEntityPlayingAnim(ped,"anim@heists@heist_corona@single_team","single_team_loop_boss",3) then
			tvRP.DeletarObjeto()
		else
			tvRP.playAnim(true,{{"anim@heists@heist_corona@single_team","single_team_loop_boss"}},true)
		end
	end
end, false)

RegisterKeyMapping ( 'vrp:anim02' , '[A] Cruzar os braços' , 'keyboard' , 'F2' )

RegisterCommand('vrp:anim02', function()
	local ped = PlayerPedId()
	if not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 101 and not menu_state.opened and not animoff and not cancelando then
		if IsEntityPlayingAnim(ped,"mini@strip_club@idles@bouncer@base","base",3) then
			tvRP.DeletarObjeto()
		else
			tvRP.playAnim(true,{{"mini@strip_club@idles@bouncer@base","base"}},true)
		end
	end
end, false)

RegisterKeyMapping ( 'vrp:anim03' , '[A] Dedo do meio' , 'keyboard' , 'F3' )

RegisterCommand('vrp:anim03', function()
	local ped = PlayerPedId()
	if not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 101 and not menu_state.opened and not animoff and not cancelando then
		if IsEntityPlayingAnim(ped,"anim@mp_player_intupperfinger","idle_a_fp",3) then
			tvRP.DeletarObjeto()
		else
			tvRP.playAnim(true,{{"anim@mp_player_intupperfinger","idle_a_fp"}},true)
		end
	end
end, false)

RegisterKeyMapping ( 'vrp:anim05' , '[A] Puto' , 'keyboard' , 'F5' )

RegisterCommand('vrp:anim05', function()
	local ped = PlayerPedId()
	if not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 101 and not menu_state.opened and not animoff and not cancelando then
		tvRP.playAnim(true,{{"misscarsteal4@actor","actor_berating_loop"}},false)
	end
end, false)

RegisterKeyMapping ( 'vrp:cancelAnims' , 'Cancelar animações' , 'keyboard' , 'F6' )

RegisterCommand('vrp:cancelAnims', function()
	local ped = PlayerPedId()
	if cooldown < 1 then
		cooldown = 1
		if GetEntityHealth(ped) > 101 then
			if not menu_state.opened and not cancelando then
				tvRP.DeletarObjeto()
				ClearPedTasks(ped)
			end
		end
	end
end, false)

RegisterKeyMapping ( 'vrp:anim10' , '[A] Mãos na cabeça' , 'keyboard' , 'F10' )

RegisterCommand('vrp:anim10', function()
	local ped = PlayerPedId()
	if GetEntityHealth(ped) > 101 and not menu_state.opened and not animoff and not cancelando then
		if IsEntityPlayingAnim(ped,"random@arrests@busted","idle_a",3) then
			tvRP.DeletarObjeto()
		else
			tvRP.DeletarObjeto()
			tvRP.playAnim(true,{{"random@arrests@busted","idle_a"}},true)
		end
	end
end, false)

RegisterKeyMapping ( 'vrp:animX' , '[A] Levantar as mãos' , 'keyboard' , 'X' )

RegisterCommand('vrp:animX', function()
	local ped = PlayerPedId()
	if not IsPedInAnyVehicle(ped) and GetEntityHealth(ped) > 101 and not animoff and not cancelando then
		SetCurrentPedWeapon(ped,GetHashKey("WEAPON_UNARMED"),true)
		if IsEntityPlayingAnim(ped,"random@mugging3","handsup_standing_base",3) then
			tvRP.DeletarObjeto()
		else
			tvRP.playAnim(true,{{"random@mugging3","handsup_standing_base"}},true)
		end
	end
end, false)

RegisterKeyMapping ( 'vrp:vehicleZ' , '[V] Ligar motor' , 'keyboard' , 'Z' )

RegisterCommand('vrp:vehicleZ', function()
	local ped = PlayerPedId()
	if IsPedInAnyVehicle(ped) then
		local vehicle = GetVehiclePedIsIn(ped,false)
		if GetPedInVehicleSeat(vehicle,-1) == ped then
			tvRP.DeletarObjeto()
			local running = Citizen.InvokeNative(0xAE31E7DF9B5B132E,vehicle)
			SetVehicleEngineOn(vehicle,not running,true,true)
			if running then
				SetVehicleUndriveable(vehicle,true)
			else
				SetVehicleUndriveable(vehicle,false)
			end
		end
	end
end, false)

RegisterKeyMapping ( 'vrp:animB' , '[A] Apontar o dedo' , 'keyboard' , 'B' )

RegisterCommand('vrp:animB', function()
	local ped = PlayerPedId()
	if GetEntityHealth(ped) > 101 and not animoff then
		tvRP.CarregarAnim("anim@mp_point")
		if not apontar then
			SetPedCurrentWeaponVisible(ped,0,1,1,1)
			SetPedConfigFlag(ped,36,1)
			Citizen.InvokeNative(0x2D537BA194896636,ped,"task_mp_pointing",0.5,0,"anim@mp_point",24)
				apontar = true
				apontando()
		else
			Citizen.InvokeNative(0xD01015C7316AE176,ped,"Stop")
			if not IsPedInjured(ped) then
				ClearPedSecondaryTask(ped)
			end
			if not IsPedInAnyVehicle(ped) then
				SetPedCurrentWeaponVisible(ped,1,1,1,1)
			end
			SetPedConfigFlag(ped,36,0)
			ClearPedSecondaryTask(ped)
			apontar = false
		end
	end
end, false)

RegisterKeyMapping ( 'vrp:ctrl' , '[A] Agachar' , 'keyboard' , 'LCONTROL' )

RegisterCommand('vrp:ctrl', function()
	DisableControlAction(0,36,true)
	local ped = PlayerPedId()
	if not IsPedInAnyVehicle(ped) then
		RequestAnimSet("move_ped_crouched")
		RequestAnimSet("move_ped_crouched_strafing")
		if IsDisabledControlJustPressed(0,36) then
			if agachar then
				ResetPedStrafeClipset(ped)
				ResetPedMovementClipset(ped,0.25)
				--agachando()
				-- Citizen.Wait(500)
				agachar = false
			else
				SetPedStrafeClipset(ped,"move_ped_crouched_strafing")
				SetPedMovementClipset(ped,"move_ped_crouched",0.25)
				agachar = true
				agachando()
			end
		end
	end
end, false)


function agachando()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(5)
			local ped = PlayerPedId()
			local player = PlayerId()
			if agachar then 
				DisablePlayerFiring(player, true)
			else
				break
			end
		end
	end)
end

function apontando()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(5)
			local ped = PlayerPedId()
			if apontar then
				local camPitch = GetGameplayCamRelativePitch()
				if camPitch < -70.0 then
					camPitch = -70.0
				elseif camPitch > 42.0 then
					camPitch = 42.0
				end
				camPitch = (camPitch + 70.0) / 112.0
	
				local camHeading = GetGameplayCamRelativeHeading()
				local cosCamHeading = Cos(camHeading)
				local sinCamHeading = Sin(camHeading)
				if camHeading < -180.0 then
					camHeading = -180.0
				elseif camHeading > 180.0 then
					camHeading = 180.0
				end
				camHeading = (camHeading + 180.0) / 360.0
	
				local blocked = 0
				local nn = 0
				local coords = GetOffsetFromEntityInWorldCoords(ped,(cosCamHeading*-0.2)-(sinCamHeading*(0.4*camHeading+0.3)),(sinCamHeading*-0.2)+(cosCamHeading*(0.4*camHeading+0.3)),0.6)
				local ray = Cast_3dRayPointToPoint(coords.x,coords.y,coords.z-0.2,coords.x,coords.y,coords.z+0.2,0.4,95,ped,7);
				nn,blocked,coords,coords = GetRaycastResult(ray)
	
				Citizen.InvokeNative(0xD5BB4025AE449A4E,ped,"Pitch",camPitch)
				Citizen.InvokeNative(0xD5BB4025AE449A4E,ped,"Heading",camHeading*-1.0+1.0)
				Citizen.InvokeNative(0xB0A6CFD2C69C1088,ped,"isBlocked",blocked)
				Citizen.InvokeNative(0xB0A6CFD2C69C1088,ped,"isFirstPerson",Citizen.InvokeNative(0xEE778F8C7E1142E2,Citizen.InvokeNative(0x19CAFA3C87F7C2FF))==4)
			else
				break
			end
		end
	end)
end

--[ SYNCCLEAN ]--------------------------------------------------------------------------------------------------------------------------

RegisterNetEvent("syncclean")
AddEventHandler("syncclean",function(index)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToVeh(index)
		if DoesEntityExist(v) then
			if IsEntityAVehicle(v) then
				SetVehicleDirtLevel(v,0.0)
				SetVehicleUndriveable(v,false)
				tvRP.DeletarObjeto()
			end
		end
	end
end)

--[ SYNCDELETEPED ]----------------------------------------------------------------------------------------------------------------------

RegisterNetEvent("syncdeleteped")
AddEventHandler("syncdeleteped",function(index)
	if NetworkDoesNetworkIdExist(index) then
		local v = NetToPed(index)
		if DoesEntityExist(v) then
			Citizen.InvokeNative(0xAD738C3085FE7E11,v,true,true)
			SetPedAsNoLongerNeeded(Citizen.PointerValueIntInitialized(v))
			DeletePed(v)
		end
	end
end)