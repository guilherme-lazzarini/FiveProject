function tvRP.varyHealth(variation)
	local ped = PlayerPedId()
	local n = math.floor(GetEntityHealth(ped)+variation)
	SetEntityHealth(ped,n)
end

--[ GETHEALTH ]--------------------------------------------------------------------------------------------------------------------------

function tvRP.getHealth()
	return GetEntityHealth(PlayerPedId())
end

--[ SETHEALTH ]--------------------------------------------------------------------------------------------------------------------------

function tvRP.setHealth(health)
	SetEntityHealth(PlayerPedId(),parseInt(health))
end

--[ SETFRIENDLYFIRE ]--------------------------------------------------------------------------------------------------------------------

function tvRP.setFriendlyFire(flag)
	NetworkSetFriendlyFireOption(flag)
	SetCanAttackFriendly(PlayerPedId(),flag,flag)
end

--[ DRAWTXT ]----------------------------------------------------------------------------------------------------------------------------

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

--[ ISINCOMA ]---------------------------------------------------------------------------------------------------------------------------

function tvRP.isInComa()
	return nocauteado
end

--[ NETWORKRESSURECTION ]----------------------------------------------------------------------------------------------------------------

function tvRP.killGod()
	TriggerEvent("resetnocaut")
	local ped = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(ped))
	NetworkResurrectLocalPlayer(x,y,z,true,true,false)
	ClearPedBloodDamage(ped)
	SetEntityHealth(ped,110)
	ClearPedTasks(ped)
	ClearPedSecondaryTask(ped)
end