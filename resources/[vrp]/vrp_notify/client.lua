RegisterNetEvent('Notify')
AddEventHandler('Notify', function(mtype, mtext, mauthor, mdelay)
	SendNUIMessage({
        mtype = mtype,
        mtext = mtext,
        mauthor = mauthor,
        mdelay = mdelay
    })
end)

RegisterNetEvent('NotifyKill')
AddEventHandler('NotifyKill', function(notify, matou, arma, morreu)
	SendNUIMessage({
        mtype = "pvp",
        notify = notify,
        matou = matou,
        arma = arma,
        morreu = morreu
    })
end)