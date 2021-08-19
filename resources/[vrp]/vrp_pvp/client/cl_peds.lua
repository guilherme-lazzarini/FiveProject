
local pedlist = {
	{ ['type'] = "PVP1", ['x'] = -1828.0343017578, ['y'] = -1223.4105224609, ['z'] = 13.017316818237, ['h'] = 38.054275512695, ['hash'] = 0x9B22DBAF, ['hash2'] = "player_one", ['invencible'] = true, ['freezed'] = true, ['walk'] = false },
	{ ['type'] = "PVP2", ['x'] = -1826.5804443359, ['y'] = -1221.5219726562, ['z'] = 13.017374038696, ['h'] = 38.054275512695, ['hash'] = 0x9B810FA2, ['hash2'] = "player_two", ['invencible'] = true, ['freezed'] = true, ['walk'] = false },
	{ ['type'] = "RACE1", ['x'] = -1814.29, ['y'] = -1213.03, ['z'] = 13.02, ['h'] = 39.76, ['hash'] = 0x84F9E937, ['hash2'] = "ig_car3guy1", ['invencible'] = true, ['freezed'] = true, ['walk'] = false },
	{ ['type'] = "ARENA", ['x'] = -1810.08, ['y'] = -1207.74, ['z'] = 14.31, ['h'] = 129.22, ['hash'] = 0xE497BBEF, ['hash2'] = "s_m_y_dealer_01", ['invencible'] = true, ['freezed'] = true, ['walk'] = false },
	{ ['type'] = "TATUAGEM", ['x'] = -1841.6860351562, ['y'] = -1198.9801025391, ['z'] =14.304750442505, ['h'] = 240.0, ['hash'] = 0x94AE2B8C, ['hash2'] = "u_m_y_tattoo_01", ['invencible'] = true, ['freezed'] = true, ['walk'] = false },
	{ ['type'] = "ROUPAS", ['x'] = -1833.5736083984, ['y'] = -1211.8658447266, ['z'] =13.017254829407, ['h'] = 150.0, ['hash'] = 0x348065F5, ['hash2'] = "u_m_y_imporage", ['invencible'] = true, ['freezed'] = true, ['walk'] = false },
	{ ['type'] = "BARBEIRO", ['x'] = -1845.0988769531, ['y'] = -1213.1837158203, ['z'] =13.017148971558, ['h'] = 240.0, ['hash'] = 0x5AA42C21, ['hash2'] = "g_f_y_vagos_01", ['invencible'] = true, ['freezed'] = true, ['walk'] = false },
}
Citizen.CreateThread(function()
	Citizen.Wait(10000)
	for k,v in pairs(pedlist) do
		Citizen.Wait(10)
		RequestModel(GetHashKey(v.hash2))
		while not HasModelLoaded(GetHashKey(v.hash2)) do
			Citizen.Wait(10)
		end

		local ped = CreatePed(4,v.hash,v.x,v.y,v.z-1,v.h,false,true)
		if not v.walk then
			FreezeEntityPosition(ped,true)
		end
		if v.walk then
			TaskWanderStandard(ped,10.0,10)
			-- TaskWanderInArea(ped,v.x,v.y,v.z,5.0,500.0,25000.0)
		end

		if v.invencible then 
			SetEntityInvincible(ped,true)
		end

		if v.freezed then 
			SetEntityHeading(ped, v.h)
			SetBlockingOfNonTemporaryEvents(ped, true)
			if k == 9 then
				TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		local timer = 5
		local delay = true
		for k,v in pairs(pedlist) do
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(v.x,v.y,v.z)
			local distance = Vdist2(x,y,z,v.x,v.y,v.z)
			if distance <= 100 then
				delay = false
				if v.type == "PVP1" then
					DrawText3DPed(v.x, v.y, v.z+1, "PRESSIONE [~r~E~w~]\nPISTOL #1", 255, 255, 255)
					DrawMarker(27,v.x, v.y, v.z-1,0,0,0,0,180.0,130.0,1.0,1.0,1.0,255,0,0,75,0,0,0,1)
					if distance <= 5 then
						if IsControlJustPressed(0,38) then
							TriggerEvent("GotoPistol",true)
						
--[[ 							TriggerServerEvent("ChangeWorld",63) ]]
						end
					end
				elseif v.type == "PVP2" then
					DrawText3DPed(v.x, v.y, v.z+1, "PRESSIONE [~r~E~w~]\nFUZIL #1", 255, 255, 255)
					DrawMarker(27,v.x, v.y, v.z-1,0,0,0,0,180.0,130.0,1.0,1.0,1.0,255,0,0,75,0,0,0,1)
					if distance <= 5 then
						if IsControlJustPressed(0,38) then
							TriggerEvent("GotoFuzil",true)
--[[ 							TriggerServerEvent("ChangeWorld",63) ]]
						end
					end

				elseif v.type == "ROUPAS" then
					DrawText3DPed(v.x, v.y, v.z+1, "PRESSIONE [~r~E~w~]\nROUPAS", 255, 255, 255)
					DrawMarker(27,v.x, v.y, v.z-1,0,0,0,0,180.0,130.0,1.0,1.0,1.0,255,0,0,75,0,0,0,1)

				elseif v.type == "TATUAGEM" then
					DrawText3DPed(v.x, v.y, v.z+1, "PRESSIONE [~r~E~w~]\nTATUAGENS", 255, 255, 255)
					DrawMarker(27,v.x, v.y, v.z-1,0,0,0,0,180.0,130.0,1.0,1.0,1.0,255,0,0,75,0,0,0,1)

				elseif v.type == "BARBEIRO" then
					DrawText3DPed(v.x, v.y, v.z+1, "PRESSIONE [~r~E~w~]\nVISUAL", 255, 255, 255)
					DrawMarker(27,v.x, v.y, v.z-1,0,0,0,0,180.0,130.0,1.0,1.0,1.0,255,0,0,75,0,0,0,1)

				elseif v.type == "RACE1" then
					DrawText3DPed(v.x, v.y, v.z+1, "PRESSIONE ~r~E~w~ PARA\nCORRIDAS DE CARRO", 255, 255, 255)
					if distance <= 10 then
						if IsControlJustPressed(0,38) then
							TriggerEvent("GotoRace",true)
							TriggerServerEvent("ChangeWorld",60)
						end
					end
				elseif v.type == "ARENA" then
					DrawText3DPed(v.x, v.y, v.z+1, "PRESSIONE ~r~E~w~ PARA\nARENAS", 255, 255, 255)
					if distance <= 10 then
						if IsControlJustPressed(0,38) then
							TriggerEvent("GotoArena")
							TriggerServerEvent("ChangeWorld",0)
						end
					end
				end
			end
		end
		if delay then timer = 1000 end
		Citizen.Wait(timer)
	end
end)










    