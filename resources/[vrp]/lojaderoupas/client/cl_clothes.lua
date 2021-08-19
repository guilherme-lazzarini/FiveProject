clCLOTHES = {}
Tunnel.bindInterface("cl_clothes",clCLOTHES)

svCLOTHES = Tunnel.getInterface("sv_clothes")

blacktoinsert = {}

compvalue = {
	[1] = 'mascara',
	[3] = 'maos',
	[4] = 'calca',
	[5] = 'mochila',
	[6] = 'sapato',
	[7] = 'acessorios',
	[8] = 'blusa',
	[9] = 'colete',
	[10] = 'adesivo',
	[11] = 'jaquetas',
	['p0'] = 'chapeu',
	['p1'] = 'oculos',
}

RegisterCommand('sroupas', function()
	if svCLOTHES:getperm(permissaosroupas) then
		local custom = vRP.getCustomization()
		local table = ''
		for k,v in pairs(custom) do
			if compvalue[k] then
				table = table .. compvalue[k] .. ' => ' .. custom[k][1] .. '<br/>'
			end
		end
		TriggerServerEvent('clothes:nui','sroupas',table)
	else
		TriggerEvent('Notify','erro','Sem permissão!')
	end
end)

RegisterCommand('croupas', function()
	if svCLOTHES:getperm(permissaocroupas) then
		local custom = vRP.getCustomization()
		local table = ''
		for k,v in pairs(custom) do
			if compvalue[k] then
				table = table .. compvalue[k] .. ' ' .. custom[k][1] .. '; '
			end
		end
		TriggerServerEvent('clothes:nui','croupas',table)
	else
		TriggerEvent('Notify','erro','Sem permissão!')
	end
end)

CreateThread(function()
	for k,v in pairs(compvalue) do
		for _,w in pairs(blacklist) do
			if v == _ then
				blacktoinsert[k] = w
			end
		end
	end
end)

CreateThread(function()
	repeat
		Wait(1000)
		local custom = vRP.getCustomization()
		for k,v in pairs(custom) do
			if blacktoinsert[k] then
				for _,w in pairs(blacktoinsert[k]) do
					if _ == v[1] then
						applyValues(compvalue[k],k,v,w.permission)
					end
				end
			end
		end
	until false
end)

applyValues = function(name,k,v,perm)
	if perm then
		if svCLOTHES:getperm(perm) then
			return 
		end 
	end 
	TriggerEvent('Notify','erro','Você não pode usar esta numeração de ' .. name .. '.') 
	if name ~= 'chapeu' and name ~= 'oculos' then
		SetPedComponentVariation(PlayerPedId(),k,v[1]+1,v[2],2)
	else 
		SetPedPropIndex(PlayerPedId(),k,v[1]+1,v[2],2)
	end
end
