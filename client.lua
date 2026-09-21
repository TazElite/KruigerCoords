RegisterCommand('coords', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)

    local formattedCoords = string.format(
        'vector4(%.2f, %.2f, %.2f, %.2f)',
        coords.x,
        coords.y,
        coords.z,
        heading
    )

    SendNUIMessage({
        action = 'copy',
        text = formattedCoords
    })

    TriggerEvent('chat:addMessage', {
        color = { 0, 255, 100 },
        args = {
            'Kruiger Coordinates',
            'Copied to clipboard: ' .. formattedCoords
        }
    })
end, false)
