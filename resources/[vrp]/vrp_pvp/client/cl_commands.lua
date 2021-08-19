local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- HEADING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("h",function(source,args)
	TriggerEvent('chatMessage',"HEADING",{255,70,50},GetEntityHeading(PlayerPedId()))
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CARREGAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("carregar",function(source,args)
    if not IsPedInAnyVehicle(PlayerPedId()) then
        TriggerServerEvent("vrp_user:carregar")
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- ARMAS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('armas',function()
	local playerPed = GetPlayerPed(-1)		
	GiveWeaponToPed(playerPed,GetHashKey("WEAPON_PISTOL_MK2"),9999,true)
	GiveWeaponToPed(playerPed,GetHashKey("WEAPON_COMBATPISTOL"),9999,true)
	GiveWeaponToPed(playerPed,GetHashKey("WEAPON_HEAVYPISTOL"),9999,true)
	GiveWeaponToPed(playerPed,GetHashKey("WEAPON_SNSPISTOL"),9999,true)
	GiveWeaponToPed(playerPed,GetHashKey("WEAPON_SMG"),9999,true)
	GiveWeaponToPed(playerPed,GetHashKey("WEAPON_COMBATPDW"),9999,true)
	GiveWeaponToPed(playerPed,GetHashKey("WEAPON_SMG_MK2"),9999,true)
	GiveWeaponToPed(playerPed,GetHashKey("WEAPON_MACHINEPISTOL"),9999,true)
	GiveWeaponToPed(playerPed,GetHashKey("WEAPON_MICROSMG"),9999,true)
	GiveWeaponToPed(playerPed,GetHashKey("WEAPON_ASSAULTRIFLE_MK2"),9999,true)
	GiveWeaponToPed(playerPed,GetHashKey("WEAPON_ASSAULTRIFLE"),9999,true)
	GiveWeaponToPed(playerPed,GetHashKey("WEAPON_CARBINERIFLE"),9999,true)
	GiveWeaponToPed(playerPed,GetHashKey("WEAPON_CARBINERIFLE_MK2"),9999,true)
	GiveWeaponToPed(playerPed,GetHashKey("WEAPON_SPECIALCARBINE_MK2"),9999,true)
	GiveWeaponToPed(playerPed,GetHashKey("WEAPON_PUMPSHOTGUN_MK2"),9999,true)
	GiveWeaponToPed(playerPed,GetHashKey("WEAPON_SAWNOFFSHOTGUN"),9999,true)
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- LIMPAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('limpar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		TriggerClientEvent("Notify",source,"sucesso","Você limpou seus armamentos.")
		vRPclient.giveWeapons(source,{},true)
		vRPclient.setArmour(source,0)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FPS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("fps",function(source,args)
    if args[1] == nil then
        TriggerEvent("Notify","sucesso","Escolha qual o nivel de Boost voce deseja: </br>1 - /fps ultra</br>  2 - /fps medio</br> 3 - /fps baixo</br> 4- /fps off", "") 
    elseif args[1] == "on" then
        TriggerEvent("Notify","sucesso","Escolha qual o nivel de Boost voce deseja: </br>1 - /fps ultra</br>  2 - /fps medio</br> 3 - /fps baixo</br> 4- /fps off", "") 
        
   elseif args[1] == "ultra" then
        SetTimecycleModifier("cinema")
        RopeDrawShadowEnabled(false)
        CascadeShadowsClearShadowSampleType()
        CascadeShadowsSetAircraftMode(false)
        CascadeShadowsEnableEntityTracker(true)
        CascadeShadowsSetDynamicDepthMode(false)
        CascadeShadowsSetEntityTrackerScale(0.0)
        CascadeShadowsSetDynamicDepthValue(0.0)
        CascadeShadowsSetCascadeBoundsScale(0.0)
        SetFlashLightFadeDistance(0.0)
        SetLightsCutoffDistanceTweak(0.0)
        DistantCopCarSirens(false)
        TriggerEvent("Notify","sucesso","Boost de fps ultra ligado!", "")    
        
    elseif args[1] == "medio" then
        SetTimecycleModifier("cinema")
        RopeDrawShadowEnabled(false)
        CascadeShadowsClearShadowSampleType()
        CascadeShadowsSetAircraftMode(false)
        CascadeShadowsEnableEntityTracker(true)
        CascadeShadowsSetDynamicDepthMode(false)
        CascadeShadowsSetEntityTrackerScale(0.0)
        CascadeShadowsSetDynamicDepthValue(0.0)
        CascadeShadowsSetCascadeBoundsScale(0.0)
        SetFlashLightFadeDistance(0.0)
        SetLightsCutoffDistanceTweak(0.0)
        DistantCopCarSirens(false)
        TriggerEvent("Notify","sucesso","Boost de fps mediano ligado!", "")    
        
    elseif args[1] == "baixo" then
        RopeDrawShadowEnabled(true)
        CascadeShadowsClearShadowSampleType()
        CascadeShadowsSetAircraftMode(false)
        CascadeShadowsEnableEntityTracker(true)
        CascadeShadowsSetDynamicDepthMode(false)
        CascadeShadowsSetEntityTrackerScale(5.0)
        CascadeShadowsSetDynamicDepthValue(3.0)
        CascadeShadowsSetCascadeBoundsScale(3.0)
        SetFlashLightFadeDistance(3.0)
        SetLightsCutoffDistanceTweak(3.0)
        DistantCopCarSirens(false)
        SetArtificialLightsState(false)
        TriggerEvent("Notify","sucesso","Boost de fps baixo ligado!", "")    
        
    elseif args[1] == "off" then
        SetTimecycleModifier("default")
        RopeDrawShadowEnabled(true)
        CascadeShadowsSetAircraftMode(true)
        CascadeShadowsEnableEntityTracker(false)
        CascadeShadowsSetDynamicDepthMode(true)
        CascadeShadowsSetEntityTrackerScale(5.0)
        CascadeShadowsSetDynamicDepthValue(5.0)
        CascadeShadowsSetCascadeBoundsScale(5.0)
        SetFlashLightFadeDistance(10.0)
        SetLightsCutoffDistanceTweak(10.0)
        DistantCopCarSirens(true)
        SetArtificialLightsState(false)
        TriggerEvent("Notify","sucesso","Boost de fps desligado!")
    end
end)

RegisterCommand('me', function(source, args, rawCommand)
	local text = '' .. rawCommand:sub(4) .. ''
	local ped = PlayerPedId()
	TriggerServerEvent('ChatMe', text)
end)

RegisterCommand('shomem',function(source,args,rawCommand)
	if mundo == 3 or mundo > 60 then
		TriggerEvent("Notify","erro","Você não pode fazer isso neste mundo.")
	else
		TriggerEvent("skinmenu","mp_m_freemode_01")
		TriggerEvent("Notify","sucesso","Skin alterada.")
	end
end)

RegisterCommand('smulher',function(source,args,rawCommand)	
    if mundo == 3 or mundo > 60 then
		TriggerEvent("Notify","erro","Você não pode fazer isso neste mundo.")
	else
		TriggerEvent("skinmenu","mp_f_freemode_01")
		TriggerEvent("Notify","sucesso","Skin alterada.")
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
--[ ANDAR ]------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("homem",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_m@confident")
	end
end)

RegisterCommand("mulher",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_f@heels@c")
	end
end)

RegisterCommand("depressivo",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_m@depressed@a")
	end
end)

RegisterCommand("depressiva",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_f@depressed@a")
	end
end)

RegisterCommand("empresario",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_m@business@a")
	end
end)

RegisterCommand("determinado",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_m@brave@a")
	end	
end)

RegisterCommand("descontraido",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_m@casual@a")
	end
end)

RegisterCommand("farto",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_m@fat@a")
	end
end)

RegisterCommand("estiloso",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_m@hipster@a")
	end
end)

RegisterCommand("ferido",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_m@injured")
	end
end)

RegisterCommand("nervoso",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_m@hurry@a")
	end
end)

RegisterCommand("desleixado",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_m@hobo@a")
	end
end)

RegisterCommand("infeliz",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_m@sad@a")
	end
end)

RegisterCommand("musculoso",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_m@muscle@a")
	end
end)

RegisterCommand("desligado",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_m@shadyped@a")
	end
end)

RegisterCommand("fadiga",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_m@buzzed")
	end
end)

RegisterCommand("alien",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_m@alien")
	end
end)

RegisterCommand("apressado",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_m@hurry_butch@a")
	end
end)

RegisterCommand("descolado",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_m@money")
	end
end)

RegisterCommand("corridinha",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_m@quick")
	end
end)

RegisterCommand("piriguete",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_f@maneater")
	end
end)

RegisterCommand("petulante",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_f@sassy")
	end
end)

RegisterCommand("arrogante",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_f@arrogant@a")
	end
end)

RegisterCommand("bebado",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_m@drunk@slightlydrunk")
	end
end)

RegisterCommand("bebado2",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_m@drunk@verydrunk")
	end
end)

RegisterCommand("bebado3",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_m@drunk@moderatedrunk")
	end
end)

RegisterCommand("irritado",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_m@fire")
	end
end)

RegisterCommand("intimidado",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_m@intimidation@cop@unarmed")
	end
end)

RegisterCommand("poderosa",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_f@handbag")
	end
end)

RegisterCommand("chateado",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_f@injured")
	end
end)

RegisterCommand("estilosa",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_f@posh@")
	end
end)

RegisterCommand("sensual",function(source,args)
	if not prisioneiro then
	vRP.loadAnimSet("move_f@sexy@a")
	end
end)