RegisterNetEvent('revive-heal:revivePlayer')
AddEventHandler('revive-heal:revivePlayer', function()
local ped = PlayerPedId()
local coords = GetEntityCoords(ped)

ResurrectPed(ped)
SetEntityCoords(ped, coords.x, coords.y, coords.z, false, false, false, true)
ClearPedTasksImmediately(ped)
SetEntityHealth(ped, 200)

end)

RegisterNetEvent('revive-heal:healplayer')
AddEventHandler('revive-heal:healplayer', function()
local ped = PlayerPedId()

SetEntityHealth(ped, 200)
end)