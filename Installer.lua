-- LocalScript for SpeedBoost and Teleport Modules

-- Create SpeedBoost Module
local SpeedBoostModule = {}
function SpeedBoostModule.Activate()
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("Humanoid") then
        local humanoid = player.Character.Humanoid
        humanoid.WalkSpeed = 50 -- Boosted speed
        print("Speed Boost Activated")
    else
        print("Speed Boost failed: Character or Humanoid not found")
    end
end

-- Create Teleport Module
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

-- Set up GUI and buttons
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create the GUI
local aydinGUI = Instance.new("ScreenGui")
aydinGUI.Name = "AydinV4StyleGUI"
aydinGUI.Parent = playerGui

-- Main Frame for the menu
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0.3, 0, 0.4, 0)
mainFrame.Position = UDim2.new(0.35, 0, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false -- Start hidden
mainFrame.Parent = aydinGUI

-- Button to toggle the menu visibility
local openButton = Instance.new("TextButton")
openButton.Size = UDim2.new(0, 100, 0, 50)
openButton.Position = UDim2.new(0.5, -50, 0, 20)
openButton.Text = "Open Menu"
openButton.Parent = mainFrame
openButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
    print("Menu toggled")  -- Debugging
end)

-- Button for SpeedBoost
local speedBoostButton = Instance.new("TextButton")
speedBoostButton.Size = UDim2.new(0, 100, 0, 50)
speedBoostButton.Position = UDim2.new(0.5, -50, 0, 80)
speedBoostButton.Text = "Speed Boost"
speedBoostButton.Parent = mainFrame
speedBoostButton.MouseButton1Click:Connect(function()
    print("Speed Boost Button clicked")  -- Debugging
    SpeedBoostModule.Activate()
end)

-- Button for Teleport
local teleportButton = Instance.new("TextButton")
teleportButton.Size = UDim2.new(0, 100, 0, 50)
teleportButton.Position = UDim2.new(0.5, -50, 0, 140)
teleportButton.Text = "Teleport"
teleportButton.Parent = mainFrame
teleportButton.MouseButton1Click:Connect(function()
    print("Teleport Button clicked")  -- Debugging
    TeleportModule.Activate()
end)
