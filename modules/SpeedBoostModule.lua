local SpeedBoostModule = {}

function SpeedBoostModule.Activate()
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("Humanoid") then
        local humanoid = player.Character.Humanoid
        humanoid.WalkSpeed = 50 -- Example boosted speed
        print("Speed Boost Activated")
    end
end

return SpeedBoostModule
