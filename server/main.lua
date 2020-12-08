ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('baris-aliusta:buycolor', function(source, cb)
    local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
		if xPlayer.getMoney() >= Config.Para then
			xPlayer.removeMoney(Config.Para)
				cb(true)
		else
			cb(false)
	end
end)