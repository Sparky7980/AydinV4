local TeleportModule = {}

function TeleportModule.Activate()
    local player = game.Players.LocalPlayer
    if player and player.Character then
        local character = player.Character
        character:MoveTo(Vector3.new(0, 10, 0)) -- Example teleport location
        print("Teleported to (0, 10, 0)")
    end
end

return TeleportModule
