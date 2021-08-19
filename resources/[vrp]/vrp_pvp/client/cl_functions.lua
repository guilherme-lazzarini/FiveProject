function drawTxtS(x,y ,width,height,scale, text, r,g,b,a)
  SetTextFont(0)
  SetTextProportional(0)
  SetTextScale(0.25, 0.25)
  SetTextColour(r, g, b, a)
  SetTextDropShadow(0, 0, 0, 0,255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x - width/2, y - height/2 + 0.005)
end

function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end

function DrawText3Ds(x,y,z, text)
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
  local factor = (string.len(text)) / 370
  DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
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

function gangs_DisplayHelpText(str)--notifications function
  SetTextComponentFormat("STRING")
  AddTextComponentString(str)
  DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function PistolWeapons()
  local playerPed = GetPlayerPed(-1)
  currentWeapon = GetSelectedPedWeapon(playerPed)
  if currentWeapon == GetHashKey('WEAPON_PISTOL_MK2') or currentWeapon == GetHashKey('WEAPON_HEAVYPISTOL') or currentWeapon == GetHashKey('WEAPON_SNSPISTOL') or currentWeapon == GetHashKey('WEAPON_COMBATPISTOL') or currentWeapon == GetHashKey('WEAPON_UNARMED') then
    return false;
  else
    RemoveAllPedWeapons(playerPed)
    GiveWeaponToPed(playerPed,GetHashKey("WEAPON_PISTOL_MK2"),9999,true)
    GiveWeaponToPed(playerPed,GetHashKey("WEAPON_HEAVYPISTOL"),9999,true)
    GiveWeaponToPed(playerPed,GetHashKey("WEAPON_SNSPISTOL"),9999,true)
    GiveWeaponToPed(playerPed,GetHashKey("WEAPON_COMBATPISTOL"),9999,true)
    SetPedAmmo(playerPed,GetHashKey("WEAPON_PISTOL_MK2"),9999)
    RestorePlayerStamina(PlayerId(),1.0)
    ClearPedProp(playerPed,0)
  end

end

function FuzilWeapons()
  local playerPed = GetPlayerPed(-1)
  currentWeapon = GetSelectedPedWeapon(playerPed)
  if currentWeapon == GetHashKey('WEAPON_SMG') or currentWeapon == GetHashKey('WEAPON_COMBATPDW') or currentWeapon == GetHashKey('WEAPON_SMG_MK2') or currentWeapon == GetHashKey('WEAPON_ASSAULTRIFLE_MK2') or currentWeapon == GetHashKey('WEAPON_ASSAULTRIFLE') or currentWeapon == GetHashKey('WEAPON_CARBINERIFLE') or currentWeapon == GetHashKey('WEAPON_CARBINERIFLE_MK2') or currentWeapon == GetHashKey('WEAPON_SPECIALCARBINE') or currentWeapon == GetHashKey('WEAPON_SPECIALCARBINE_MK2') or currentWeapon == GetHashKey('WEAPON_UNARMED') then
    return false;
  else
  RemoveAllPedWeapons(playerPed)
  GiveWeaponToPed(playerPed,GetHashKey("WEAPON_SMG"),9999,true)
  GiveWeaponToPed(playerPed,GetHashKey("WEAPON_COMBATPDW"),9999,true)
  GiveWeaponToPed(playerPed,GetHashKey("WEAPON_SMG_MK2"),9999,true)
  GiveWeaponToPed(playerPed,GetHashKey("WEAPON_ASSAULTRIFLE_MK2"),9999,true)
  GiveWeaponToPed(playerPed,GetHashKey("WEAPON_ASSAULTRIFLE"),9999,true)
  GiveWeaponToPed(playerPed,GetHashKey("WEAPON_CARBINERIFLE"),9999,true)
  GiveWeaponToPed(playerPed,GetHashKey("WEAPON_CARBINERIFLE_MK2"),9999,true)
  GiveWeaponToPed(playerPed,GetHashKey("WEAPON_SPECIALCARBINE"),9999,true)
  GiveWeaponToPed(playerPed,GetHashKey("WEAPON_SPECIALCARBINE_MK2"),9999,true)
  SetPedAmmo(playerPed,GetHashKey("WEAPON_SMG"),9999)
  SetPedAmmo(playerPed,GetHashKey("WEAPON_ASSAULTRIFLE_MK2"),9999)
  RestorePlayerStamina(PlayerId(),1.0)
  ClearPedProp(playerPed,0)
  end
end

function SafeZone()
  SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), true)
  DisableControlAction(2, 37, true) -- disable weapon wheel (Tab)
  DisableControlAction(1, 45, true) -- disable reload
  DisableControlAction(2, 80, true) -- disable reload
  DisableControlAction(2, 140, true) -- disable reload
  DisableControlAction(2, 250, true) -- disable reload
  DisableControlAction(2, 263, true) -- disable reload
  DisableControlAction(2, 310, true) -- disable reload
  DisableControlAction(1, 140, true)
  DisableControlAction(1, 141, true)
  DisableControlAction(1, 142, true)
  DisableControlAction(1, 143, true)
  DisableControlAction(0, 24, true) -- disable attack
  DisableControlAction(0, 25, true) -- disable aim
  --DisableControlAction(0, 47, true) -- disable weapon
  DisableControlAction(0, 58, true) -- disable weap
  DisablePlayerFiring(PlayerPedId(), true) -- Disables firing all together if they somehow bypass inzone Mouse Disable
  DisableControlAction(0, 106, true) -- Disable in-game mouse controls
end

function DrawText3DPed(x,y,z, text, r,g,b)
local onScreen,_x,_y=World3dToScreen2d(x,y,z)
local px,py,pz=table.unpack(GetGameplayCamCoords())
local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

local scale = (1/dist)*2
local fov = (1/GetGameplayCamFov())*100
local scale = scale*fov

if onScreen then
  SetTextScale(0.35, 0.35)
  SetTextFont(4)
  SetTextProportional(1)
  SetTextColour(255, 255, 255, 215)
  SetTextEntry("STRING")
  SetTextCentre(1)
  AddTextComponentString(text)
  DrawText(_x,_y)
end
end
