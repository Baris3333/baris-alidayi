ESX = nil
local aracboyadimmi = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('baris:alidayii')
AddEventHandler('baris:alidayii', function(Farukusikem)
	local playerPed = PlayerPedId()			
	local vehicle = GetVehiclePedIsIn(playerPed, false)
	FreezeEntityPosition(vehicle, true)
		TriggerEvent("mythic_progbar:client:progress", {
				name = "boyadeğişio",
				duration = 1000,
				label = "Araç Boya Değişim işlemi yapılıyor.. ",
				useWhileDead = false,
				canCancel = true,
				controlDisables = {
						disableMovement = true,
						disableCarMovement = true,
						disableMouse = false,
						disableCombat = true,
				},
		}, function(status)
				if not status then										
					local props = {
						color1 = Farukusikem
					}
					ESX.Game.SetVehicleProperties(vehicle, props)
					exports['mythic_notify']:DoHudText('success', 'Araç boyası değiştirildi.')
					FreezeEntityPosition(vehicle, false)
				end
		end)
end)


Citizen.CreateThread(function()
    while true do
		local adissoc = 2000
		local anakartsizc0dex = math.random(1,150)
		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 35.44433, -1409.28, 29.348, true) < 5 then
			adissoc = 5
                DrawText3D(35.44433, -1409.28, 29.348, " ~g~[E] ~w~ Boyacı Ali Dayı")
					if IsControlJustReleased(1, 51) then
					  if not aracboyadimmi then
						ESX.TriggerServerCallback('baris-aliusta:buycolor', function (bazqgay)
							if bazqgay then
								TriggerEvent('baris:alidayii', anakartsizc0dex)
								aracboyadimmi = true
							else
								exports['mythic_notify']:DoHudText('error', 'Yeterli Paran Bulunmuyor.')
							end
						end)
					else
                        exports['mythic_notify']:DoHudText('error', 'Daha yeni boyattın daha sonra gel')
					end
				end           
			end
		Citizen.Wait(adissoc)
	end
end)


Citizen.CreateThread(function ()
	while true do
		sleep = 2000
		if aracboyadimmi then
			sleep = 5
            Citizen.Wait(240000) -- 4 dakika
            aracboyadimmi = false
		end
		Citizen.Wait(sleep)
	end
end)

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
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.005+ factor, 0.03, 0, 0, 0, 100)
end