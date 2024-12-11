-- Main Installer Script for AydinV4 GUI and Modules

-- Load the modules
local function loadModules()
    local modules = {}

    -- SpeedBoostModule
    local SpeedBoostModule = {}
    function SpeedBoostModule.Activate()
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("Humanoid") then
            local humanoid = player.Character.Humanoid
            humanoid.WalkSpeed = 50 -- Example boosted speed
            print("Speed Boost Activated")
        else
            print("Speed Boost failed: Character or Humanoid not found")
        end
    end
    modules["SpeedBoostModule"] = SpeedBoostModule

    -- TeleportModule
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
    modules["TeleportModule"] = TeleportModule

    return modules
end

-- Create the GUI and set up buttons
local function createAydinV4StyleGUI(modules)
    local player = game.Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")

    -- Create ScreenGui
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

    -- Button to open/close the menu
    local openButton = Instance.new("TextButton")
    openButton.Size = UDim2.new(0, 100, 0, 50)
    openButton.Position = UDim2.new(0.5, -50, 0, 20)
    openButton.Text = "Open Menu"
    openButton.Parent = mainFrame
    openButton.MouseButton1Click:Connect(function()
        mainFrame.Visible = not mainFrame.Visible
        print("Menu toggled")  -- Debugging line
    end)

    -- Button for SpeedBoost
    local speedBoostButton = Instance.new("TextButton")
    speedBoostButton.Size = UDim2.new(0, 100, 0, 50)
    speedBoostButton.Position = UDim2.new(0.5, -50, 0, 80)
    speedBoostButton.Text = "Speed Boost"
    speedBoostButton.Parent = mainFrame
    speedBoostButton.MouseButton1Click:Connect(function()
        print("Speed Boost Button clicked")  -- Debugging line
        modules["SpeedBoostModule"].Activate()
    end)

    -- Button for Teleport
    local teleportButton = Instance.new("TextButton")
    teleportButton.Size = UDim2.new(0, 100, 0, 50)
    teleportButton.Position = UDim2.new(0.5, -50, 0, 140)
    teleportButton.Text = "Teleport"
    teleportButton.Parent = mainFrame
    teleportButton.MouseButton1Click:Connect(function()
        print("Teleport Button clicked")  -- Debugging line
        modules["TeleportModule"].Activate()
    end)
end

-- Load modules and create GUI
local modules = loadModules()
createAydinV4StyleGUI(modules)
