local TeleportModule = {}

function TeleportModule.Activate()
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local rootPart = player.Character.HumanoidRootPart
        local forwardDirection = rootPart.CFrame.LookVector
        local teleportDistance = 5
        local newPosition = rootPart.Position + forwardDirection * teleportDistance
        rootPart.CFrame = CFrame.new(newPosition)
        print("Teleported 5 blocks forward")
    else
        print("Teleport failed: Character or HumanoidRootPart not found")
    end
end

return TeleportModule
