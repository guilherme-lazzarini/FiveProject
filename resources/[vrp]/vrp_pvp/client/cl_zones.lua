-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local nacorrida = false

--[[ local blips = {
	{ ['x'] = 1775.44, ['y'] = 3706.6, ['z'] = 34.27, ['sprite'] = 84, ['color'] = 4, ['nome'] = "Zona PVP Pistola", ['scale'] = 0.5 },
	{ ['x'] = 1135.47, ['y'] = -531.97, ['z'] = 64.49, ['sprite'] = 84, ['color'] = 4, ['nome'] = "Zona PVP Fuzil", ['scale'] = 0.5 },
} ]]
local pistol = {{title="Pistola #1", colour=1, id=110, x = 1775.44, y = 3706.6, z = 34.27}}
local fuzil = {{title="Fuzil #1" , colour=1, id=303, x = 1135.47, y = -531.97, z = 64.49}}


local safes = {
	{-1848.74,-1230.67,13.02},
	-- {-1275.16,-3387.21,13.95},
	-- {1542.78,-2127.84,81.09},
	-- {2543.68,-383.31,93.0},
	-- {2724.41,1367.54,24.53},
}

local spawnsafes = {
	-- { -1283.4,-3416.57,13.95 },
	-- { -1253.77,-3401.45,13.95 },
	-- { -1237.14,-3382.1,13.95 },
	-- { -1293.25,-3353.37,13.95 },
	-- { -1305.45,-3395.39,13.95 },

	-- { 1561.02,-2158.89,78.48 },
	-- { 1506.05,-2147.56,77.13 },
	-- { 1498.15,-2127.79,77.39 },
	-- { 1564.13,-2116.78,83.64 },
	-- { 1522.6,-2074.72,77.27 },

	-- { 2523.0,-356.09,94.13 },
	-- { 2484.97,-384.47,93.74 },
	-- { 2523.11,-412.43,94.12 },
	-- { 2572.96,-409.12,93.0 },
	-- { 2567.58,-334.69,93.13 },

	-- { 2720.79,1428.42,24.49 },
	-- { 2662.26,1374.53,24.05 },
	-- { 2771.66,1396.76,24.52 },
	-- { 2762.77,1462.53,24.52 },
	-- { 2740.09,1330.74,24.53 },

	{ -1830.22, -1263.07, 8.62 },
	{ -1847.06, -1247.23, 8.62 },
	{ -1865.07, -1212.99, 13.02 },
	{ -1839.17, -1220.04, 13.02 },
	{ -1832.28, -1239.88, 13.02 },
	{ -1847.96, -1229.13, 13.02 },
}

local spawn = {
	{ 1159.48, -792.3, 57.59 },
	{ 1140.62, -792.47, 57.6 },
	{ 1098.1, -784.4, 58.27 },
	{ 1073.43, -783.06, 61.43 },
	{ 986.35, -735.07, 57.82 },
	{ 973.07, -730.3, 57.86 },
	{ 997.45, -728.92, 57.82 },
	{ 980.09, -715.37, 57.9 },
	{ 954.02, -707.84, 58.18 },
	{ 971.05, -700.32, 58.49 },
	{ 962.41, -689.51, 57.94 },
	{ 943.81, -674.67, 58.02 },
	{ 960.2, -666.21, 58.02 },
	{ 925.88, -670.32, 58.17 },
	{ 931.34, -638.96, 57.86 },
	{ 916.53, -649.42, 57.87 },
	{ 902.73, -631.69, 58.05 },
	{ 903.58, -615.64, 58.46 },
	{ 878.74, -610.85, 58.22 },
	{ 862.63, -609.33, 58.3 },
	{ 853.56, -593.15, 57.98 },
	{ 861.21, -582.15, 58.16 },
	{ 831.09, -560.07, 57.71 },
	{ 838.09, -545.34, 57.33 },
	{ 842.36, -521.9, 57.33 },
	{ 846.61, -510.44, 57.33 },
	{ 863.68, -504.67, 57.33 },
	{ 868.63, -496.42, 57.65 },
	{ 881.56, -495.44, 57.88 },
	{ 896.66, -472.12, 59.02 },
	{ 916.91, -463.64, 60.71 },
	{ 934.59, -451.41, 61.26 },
	{ 963.28, -444.0, 62.61 },
	{ 975.1, -436.05, 63.76 },
	{ 992.29, -423.87, 63.75 },
	{ 1004.79, -414.46, 64.95 },
	{ 1014.48, -408.52, 65.95 },
	{ 1029.78, -402.67, 66.0 },
	{ 1048.47, -370.32, 67.95 },
	{ 1098.23, -341.04, 67.21 },
	{ 1145.2, -784.56, 57.6 },
	{ 995.04, -619.84, 58.9 },
	{ 961.85, -608.09, 59.39 },
	{ 990.72, -590.25, 59.26 },
	{ 974.9, -580.73, 59.64 },
	{ 995.85, -569.07, 60.2 },
	{ 1012.26, -570.8, 60.2 },
	{ 1229.26, -725.39, 60.8 },
	{ 1232.38, -713.63, 60.66 },
	{ 1259.66, -711.26, 64.51 },
	{ 1265.38, -703.2, 64.57 },
	{ 1259.66, -686.97, 66.04 },
	{ 1257.55, -660.77, 67.77 },
	{ 1265.17, -647.94, 67.93 },
	{ 1251.22, -621.61, 69.43 },
	{ 1239.19, -622.91, 69.37 },
	{ 1222.7, -697.18, 60.81 },
	{ 1228.21, -675.51, 63.12 },
	{ 1228.61, -664.16, 63.3 },
	{ 1221.23, -669.1, 63.5 },
	{ 1240.59, -601.64, 69.79 },
	{ 1232.72, -597.91, 69.44 },
	{ 1241.92, -565.95, 69.66 },
	{ 1229.77, -562.21, 69.28 },
	{ 1207.09, -620.44, 66.44 },
	{ 1203.79, -598.76, 68.07 },
	{ 1215.94, -595.65, 67.87 },
	{ 1218.97, -622.25, 66.44 },
	{ 1213.05, -579.86, 68.83 },
	{ 1200.89, -575.71, 69.14 },
	{ 1204.53, -557.77, 69.64 },
	{ 1213.52, -552.88, 69.17 },
	{ 1223.36, -503.03, 66.4 },
	{ 1223.24, -487.95, 66.41 },
	{ 1232.7, -455.36, 67.08 },
	{ 1214.52, -462.45, 78.9 },
	{ 1234.79, -446.31, 67.67 },
	{ 1217.76, -416.47, 67.76 },
	{ 1241.72, -417.25, 71.58 },
	{ 1238.78, -401.97, 68.96 },
	{ 1235.38, -392.97, 69.07 },
	{ 1172.41, -397.69, 67.72 },
	{ 1180.35, -394.49, 68.01 },
	{ 1169.85, -402.96, 72.22 },
	{ 1168.4, -426.44, 67.1 },
	{ 1173.57, -442.89, 66.8 },
	{ 1152.42, -432.1, 67.02 },
	{ 1157.02, -453.89, 66.99 },
	{ 1090.12, -484.53, 65.67 },
	{ 1098.64, -464.58, 67.32 },
	{ 1110.41, -464.45, 67.32 },
	{ 1108.77, -444.95, 67.6 },
	{ 1099.4, -438.08, 67.6 },
	{ 1117.83, -412.91, 67.56 },
	{ 1100.58, -411.2, 67.56 },
	{ 1114.21, -391.07, 68.95 },
	{ 1123.99, -390.37, 68.51 },
	{ 1113.86, -648.79, 57.75 },
	{ 1121.58, -645.7, 56.82 },
	{ 1056.3, -448.32, 66.26 },
	{ 1044.16, -448.8, 66.26 },
	{ 1051.53, -470.68, 63.96 },
	{ 1046.02, -497.39, 64.08 },
	{ 1014.29, -468.4, 64.29 },
	{ 1004.54, -499.09, 60.71 },
	{ 1005.86, -511.66, 60.84 },
	{ 972.41, -515.16, 61.74 },
	{ 946.32, -518.75, 60.63 },
	{ 941.57, -527.23, 60.24 },
	{ 924.24, -525.82, 59.79 },
	{ 932.67, -531.46, 59.35 },
	{ 906.73, -536.52, 58.14 },
	{ 893.0, -540.6, 58.51 },
	{ 965.27, -542.19, 59.55 },
	{ 919.84, -569.68, 58.37 },
	{ 912.45, -554.29, 58.37 }
}

local spawn2 = {
	{ 2074.31, 3758.57, 32.71 },
	{ 2074.09, 3780.73, 32.84 },
	{ 2075.36, 3827.43, 31.81 },
	{ 2043.02, 3850.67, 32.53 },
	{ 2037.64, 3895.76, 31.85 },
	{ 2007.44, 3937.23, 32.37 },
	{ 1978.18, 3932.98, 32.63 },
	{ 1920.8, 3971.64, 32.94 },
	{ 1908.34, 3929.57, 32.62 },
	{ 1877.16, 3922.83, 33.06 },
	{ 1895.49, 3904.36, 32.92 },
	{ 1895.52, 3892.29, 32.84 },
	{ 1917.1, 3909.02, 33.45 },
	{ 1937.2, 3889.66, 32.41 },
	{ 1975.12, 3824.63, 32.41 },
	{ 1974.7, 3814.58, 33.43 },
	{ 1944.99, 3805.55, 32.04 },
	{ 1990.13, 3792.14, 32.19 },
	{ 1965.83, 3753.36, 32.23 },
	{ 1932.89, 3725.63, 36.68 },
	{ 1912.77, 3722.12, 32.66 },
	{ 1901.9, 3733.99, 32.63 },
	{ 1872.18, 3750.95, 32.99 },
	{ 1855.81, 3763.84, 33.12 },
	{ 1854.18, 3786.7, 33.0 },
	{ 1891.59, 3782.84, 32.89 },
	{ 1862.18, 3858.38, 36.28 },
	{ 1842.16, 3858.01, 33.45 },
	{ 1838.07, 3917.64, 33.3 },
	{ 1803.38, 3912.73, 37.06 },
	{ 1814.48, 3908.04, 33.73 },
	{ 1779.55, 3907.41, 39.81 },
	{ 1788.07, 3895.55, 34.39 },
	{ 1893.18, 3725.42, 37.49 },
	{ 1839.64, 3672.51, 34.28 },
	{ 1821.98, 3683.82, 34.28 },
	{ 1839.92, 3693.49, 34.27 },
	{ 1826.44, 3729.07, 33.97 },
	{ 1832.5, 3737.42, 33.97 },
	{ 1781.32, 3747.36, 34.66 },
	{ 1779.46, 3801.91, 38.37 },
	{ 1761.9, 3823.71, 34.77 },
	{ 1745.94, 3812.37, 34.67 },
	{ 1746.15, 3785.43, 34.84 },
	{ 1710.19, 3844.19, 34.93 },
	{ 1720.3, 3889.34, 34.93 },
	{ 1651.74, 3805.7, 34.98 },
	{ 1650.28, 3808.65, 38.66 },
	{ 1605.97, 3786.28, 35.14 },
	{ 1604.14, 3825.31, 34.45 },
	{ 1681.11, 3764.16, 34.52 },
	{ 1730.71, 3702.3, 39.38 },
	{ 1748.53, 3691.87, 34.44 },
	{ 1711.72, 3683.94, 34.71 },
	{ 1777.39, 3641.57, 34.82 },
	{ 1689.16, 3608.1, 35.37 },
	{ 1693.59, 3589.77, 35.63 },
	{ 1651.12, 3629.33, 35.41 },
	{ 1629.98, 3656.56, 35.08 },
	{ 1635.06, 3671.86, 34.53 },
	{ 1618.23, 3712.39, 35.02 },
	{ 1531.13, 3794.46, 38.27 },
	{ 1529.44, 3806.52, 32.31 },
	{ 1570.58, 3684.04, 34.76 },
	{ 1536.93, 3698.89, 35.08 },
	{ 1583.72, 3617.1, 38.78 },
	{ 1603.48, 3583.68, 38.78 },
	{ 1605.91, 3559.6, 38.74 },
	{ 1571.31, 3576.52, 32.59 },
	{ 1534.49, 3592.24, 38.77 },
	{ 1554.34, 3518.61, 35.98 }
}

-----------------------------------------------------------------------------------------------------------------------------------------
-- MAIN_THREAD
-----------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	for _,v in pairs(safes) do
		blips = AddBlipForRadius(v[1],v[2],v[3], 200.0)
		SetBlipAlpha(blips, 60)
		SetBlipColour(blips, 4)
	end

  for _,v in pairs(pistol) do
    pistolzone = AddBlipForRadius(v.x,v.y,v.z, 355.0)
    SetBlipAlpha(pistolzone, 60)
		SetBlipColour(pistolzone, 1)

    v.blip = AddBlipForCoord(v.x, v.y, v.z)
                SetBlipSprite(v.blip, v.id)
                SetBlipDisplay(v.blip, 4)
                SetBlipColour(v.blip, v.colour)
                SetBlipAsShortRange(v.blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(v.title)
                EndTextCommandSetBlipName(v.blip)
  end


  for k,v in pairs(fuzil) do
    fuzilzone = AddBlipForRadius(v.x,v.y,v.z, 355.0)
    SetBlipAlpha(fuzilzone, 60)
		SetBlipColour(fuzilzone, 1)

    v.blip = AddBlipForCoord(v.x, v.y, v.z)
    SetBlipSprite(v.blip, v.id)
    SetBlipDisplay(v.blip, 4)
    SetBlipColour(v.blip, v.colour)
    SetBlipAsShortRange(v.blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(v.title)
    EndTextCommandSetBlipName(v.blip)
  end

  
  
	while true do
		local grein = 1000
		local coords = GetEntityCoords(GetPlayerPed(PlayerId()))
		local distance = #(coords - vector3(1135.47,-531.97,64.27))
        local distance2 = #(coords - vector3(1775.44,3706.6,34.37))
		local distance3 = #(coords - vector3(385.29,-1657.45,27.30))
        local playerPed = GetPlayerPed(-1)
		
		if distance2 <= 353.533 --[[ and (mundo == 61 or mundo == 62 or mundo == 63) ]] then
			grein = 1000
      PistolWeapons()

		end

    if distance <= 353.533 --[[ and (mundo == 61 or mundo == 62 or mundo == 63) ]] then
			grein = 1000
			FuzilWeapons()
		end

		for k,v in pairs(safes) do
			local safedis = #(coords - vector3(v[1],v[2],v[3]))
			if k == 1 then
				if safedis < 400.00 then
					grein = 5
					SafeZone()
					DisplayRadar(true)
				end
			else
				if safedis < 400.00 --[[ and mundo == 0 ]] then
					grein = 5
					SafeZone()
					DisplayRadar(true)
				end
			end
		end

		if coords.z > 836.50 --[[ or mundo == 60 ]] then
			grein = 5
			SafeZone()
			DisplayRadar(true)
		end
		Citizen.Wait(grein)
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- EVENTS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('GotoFuzil')
AddEventHandler('GotoFuzil',function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local distance = #(coords - vector3(1775.44,3706.6,34.27))
    if distance > 353.533 then
		TriggerEvent("Notify",'aviso',"Area de Fuzil #1.")
        local random = math.random(#spawn)
        SetEntityCoords(playerPed,spawn[random][1],spawn[random][2],spawn[random][3]+0.001,250.02+0.0001,1,0,0,1)
		
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
end)

RegisterNetEvent('GotoPistol')
AddEventHandler('GotoPistol',function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local distance = #(coords - vector3(1006.75,2366.65,55.57))
    if distance > 353.533 then
		TriggerEvent("Notify",'aviso',"Area de Pistola #1.")
		local random = math.random(#spawn2)
        SetEntityCoords(playerPed,spawn2[random][1],spawn2[random][2],spawn2[random][3]+0.001,250.02+0.0001,1,0,0,1)

		RemoveAllPedWeapons(playerPed)
		FreezeEntityPosition(playerPed,false)
		SetEntityHealth(playerPed,399)
  
		RemoveAllPedWeapons(playerPed)
		GiveWeaponToPed(playerPed,GetHashKey("WEAPON_PISTOL_MK2"),9999,true)
		GiveWeaponToPed(playerPed,GetHashKey("WEAPON_HEAVYPISTOL"),9999,true)
		GiveWeaponToPed(playerPed,GetHashKey("WEAPON_SNSPISTOL"),9999,true)
		GiveWeaponToPed(playerPed,GetHashKey("WEAPON_COMBATPISTOL"),9999,true)
		SetPedAmmo(playerPed,GetHashKey("WEAPON_PISTOL_MK2"),9999)
		RestorePlayerStamina(PlayerId(),1.0)
		ClearPedProp(playerPed,0)
    end
end)

AddEventHandler('GotoRace',function(corrida)
    nacorrida = corrida	
end)

RegisterNetEvent('GotoSafe')
AddEventHandler('GotoSafe',function()
    local ped = PlayerPedId()
	nacorrida = false
	local coords = GetEntityCoords(ped)
	for k,v in pairs(safes) do
		local safedis = #(coords - vector3(v[1],v[2],v[3]))
		if safedis < 400.00 --[[ and mundo == 0 ]] then
			return
		end
	end
	local random = math.random(#spawnsafes)
	SetEntityCoords(ped,spawnsafes[random][1],spawnsafes[random][2],spawnsafes[random][3]+0.001,250.02+0.0001,1,0,0,1)
	SetEntityHeading(ped, math.random(1,360))	
end)

RegisterNetEvent('Reset')
AddEventHandler('Reset',function()
    local ped = PlayerPedId()
	nacorrida = false
end)