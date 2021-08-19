vRP.prepare("vRP/kda_init_user","INSERT IGNORE INTO vrp_kda(user_id,kills,deaths,coins) VALUES(@user_id,@kills,@deaths,@coins)")
vRP.prepare("vRP/get_kda","SELECT kills,deaths,coins FROM vrp_kda WHERE user_id = @user_id")
vRP.prepare("vRP/set_kda","UPDATE vrp_kda SET kills = @kills, deaths = @deaths, coins = @coins WHERE user_id = @user_id")

--[[ KILLS ]]

function vRP.getKills(user_id)
	local tmp = vRP.getUserTmpTable(user_id)
	if tmp then
		return tmp.kills or 0
	else
		return 0
	end
end

function vRP.setKills(user_id,value)
	local tmp = vRP.getUserTmpTable(user_id)
	if tmp then
		tmp.kills = value
	end
end

function vRP.giveKills(user_id,amount)
	if amount >= 0 then
		local kills = vRP.getKills(user_id)
		vRP.setKills(user_id,kills+amount)
	end
end

--[[ DEATHS ]]


function vRP.getDeaths(user_id)
	local tmp = vRP.getUserTmpTable(user_id)
	if tmp then
		return tmp.deaths or 0
	else
		return 0
	end
end


function vRP.setDeaths(user_id,value)
	local tmp = vRP.getUserTmpTable(user_id)
	if tmp then
		tmp.deaths = value
	end
end

function vRP.giveDeaths(user_id,amount)
	if amount >= 0 then
		local deaths = vRP.getDeaths(user_id)
		vRP.setDeaths(user_id,deaths+amount)
	end
end

--[[ COINS ]]


function vRP.getCoins(user_id)
	local tmp = vRP.getUserTmpTable(user_id)
	if tmp then
		return tmp.coins or 0
	else
		return 0
	end
end


function vRP.setCoins(user_id,value)
	local tmp = vRP.getUserTmpTable(user_id)
	if tmp then
		tmp.coins = value
	end
end

function vRP.giveCoins(user_id,amount)
	if amount >= 0 then
		local coins = vRP.getDeaths(user_id)
		vRP.setCoins(user_id,coins+amount)
	end
end

function vRP.tryPaymentCoins(user_id,amount)
	if amount >= 0 then
		local coins = vRP.getCoins(user_id)
		if amount >= 0 and coins >= amount then
			vRP.setCoins(user_id,coins-amount)
			return true
		else
			return false
		end
	end
	return false
end

--



AddEventHandler("vRP:playerJoin",function(user_id,source,name)
	vRP.execute("vRP/kda_init_user",{ user_id = user_id, kills = 0, deaths = 0, coins = 0 })
	local tmp = vRP.getUserTmpTable(user_id)
	if tmp then
		local rows = vRP.query("vRP/get_kda",{ user_id = user_id })
		if #rows > 0 then
			tmp.deaths = rows[1].deaths
			tmp.kills = rows[1].kills
			tmp.coins = rows[1].coins
		end
	end
end)

RegisterCommand('savekda',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local tmp = vRP.getUserTmpTable(user_id)
		if tmp and tmp.kills and tmp.deaths and tmp.coins then
			vRP.execute("vRP/set_kda",{ user_id = user_id, kills = tmp.kills, deaths = tmp.deaths, coins = tmp.coins })
		end
		TriggerClientEvent("save:database",source)
		TriggerClientEvent("Notify",source,"importante","Você salvou todo o conteúdo temporário de sua database.")
	end
end)

AddEventHandler("vRP:playerLeave",function(user_id,source)
	local tmp = vRP.getUserTmpTable(user_id)
	if tmp and tmp.kills and tmp.deaths and tmp.coins then
		vRP.execute("vRP/set_kda",{ user_id = user_id, kills = tmp.kills, deaths = tmp.deaths, coins= tmp.coins })
	end
end)

AddEventHandler("vRP:save",function()
	for k,v in pairs(vRP.user_tmp_tables) do
		if v.kills and v.deaths and v.coins then
			vRP.execute("vRP/set_kda",{ user_id = k, kills = v.kills, deaths = v.deaths, coins = v.coins })
		end
	end
end)