local alreadyDead = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(20)
		if GetGameTimer() > 15000 then
			for k,v in pairs(GetActivePlayers()) do
				N_0x31698aa80e0223f8(v)
			end
			local playerPed = PlayerPedId()
			if IsEntityDead(playerPed) and alreadyDead == false then
				local killer = GetPedSourceOfDeath(playerPed)
--[[ 				local killerId = 0 ]]
				for k,v in pairs(GetActivePlayers()) do
					if killer == GetPlayerPed(v) then
						killerId = GetPlayerServerId(v)
					end
				end
					TriggerServerEvent('diedplayer',tostring(killerId),1)
					alreadyDead = true
			end
			if not IsEntityDead(playerPed) and alreadyDead == true then
				alreadyDead = false
			end
		end
	end
end)