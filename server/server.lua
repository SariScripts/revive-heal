
RegisterCommand('revive', function (source, args)
    local targetId = tonumber(args[1]) or source-- If no number is provided it should revive yourself
    local targetPed = GetPlayerPed(targetId)

    if GetPlayerName(targetId) then
        TriggerClientEvent('revive-heal:revivePlayer', targetId)

        if targetId == source then
            -- Reviving self
            TriggerClientEvent('chat:addMessage', source, {
                colour = {60, 179, 113},
                multiline = true,
                args = { "^2Success", "You have been revived." }
            })
        else
            -- Reviving another player
            TriggerClientEvent('chat:addMessage', source, {
                colour = {60, 179, 113},
                multiline = true,
                args = { "^3Success", "Player ID " .. targetId .. " has been revived!" }
            })
        end
    else
        TriggerClientEvent('chat:addMessage', source,{
            colour = {255, 0, 0},
            multiline = true,
            args = {"^1Error", "ID ".. targetId .." is not currently playing."}
        } )
    end

end, false)

RegisterCommand('heal', function(source, args)
    local targetId = tonumber(args[1]) or source 
    local targetPed = GetPlayerPed(targetId)

    if targetPed then
        TriggerClientEvent('revive-heal:healplayer', targetId)
        TriggerClientEvent('chat:addMessage', source, {
            colour = { 0, 255, 0 },
            multiline = true,
            args = {"Heal", "Player ID ".. targetId .." has been healed!"}
        })
    else
        TriggerClientEvent('chat:addMessage', source,{
            colour = { 255, 0, 0 },
            multiline = true,
            args = {"Error", "".. targetId .." is not an active player."}
        } )
    end



end, false)