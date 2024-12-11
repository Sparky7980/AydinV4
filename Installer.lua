local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create the main ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomMenu"
screenGui.Parent = playerGui

-- Create the main menu frame
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 300, 0, 400)
menuFrame.Position = UDim2.new(0, 20, 0, 100)
menuFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
menuFrame.BorderSizePixel = 0
menuFrame.Parent = screenGui

-- Create a title for the menu
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Text = "Player Settings"
titleLabel.TextSize = 20
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
titleLabel.BorderSizePixel = 0
titleLabel.Parent = menuFrame

-- Helper function to create collapsible categories
local function createCategory(name, parent, yPosition)
    local categoryFrame = Instance.new("Frame")
    categoryFrame.Size = UDim2.new(1, 0, 0, 50)
    categoryFrame.Position = UDim2.new(0, 0, 0, yPosition)
    categoryFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    categoryFrame.BorderSizePixel = 0
    categoryFrame.Parent = parent

    local categoryLabel = Instance.new("TextLabel")
    categoryLabel.Size = UDim2.new(1, -50, 1, 0)
    categoryLabel.Position = UDim2.new(0, 10, 0, 0)
    categoryLabel.Text = name
    categoryLabel.TextSize = 18
    categoryLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    categoryLabel.BackgroundTransparency = 1
    categoryLabel.Parent = categoryFrame

    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0, 40, 0, 40)
    toggleButton.Position = UDim2.new(1, -50, 0, 5)
    toggleButton.Text = "+"
    toggleButton.TextSize = 20
    toggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.Parent = categoryFrame

    local optionsFrame = Instance.new("Frame")
    optionsFrame.Size = UDim2.new(1, -20, 0, 150)
    optionsFrame.Position = UDim2.new(0, 10, 1, 0)
    optionsFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    optionsFrame.Visible = false
    optionsFrame.Parent = categoryFrame

    -- Toggle visibility of options
    toggleButton.MouseButton1Click:Connect(function()
        optionsFrame.Visible = not optionsFrame.Visible
        toggleButton.Text = optionsFrame.Visible and "-" or "+"
    end)

    return optionsFrame
end

-- Add categories and options
local movementCategory = createCategory("Movement", menuFrame, 60)

-- Create Fly feature
local flying = false
local flySpeed = 50
local flyDirection = Vector3.new(0, 0, 0)

local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(1, -20, 0, 40)
flyButton.Position = UDim2.new(0, 10, 0, 10)
flyButton.Text = "Toggle Fly"
flyButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
flyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
flyButton.Parent = movementCategory

flyButton.MouseButton1Click:Connect(function()
    flying = not flying
    if flying then
        flyButton.Text = "Stop Flying"
        -- Enable Fly
        local character = player.Character or player.CharacterAdded:Wait()
        local root = character:WaitForChild("HumanoidRootPart")
        local camera = workspace.CurrentCamera

        -- Flying loop
        game:GetService("RunService").RenderStepped:Connect(function()
            if flying then
                local direction = camera.CFrame.LookVector
                root.Velocity = direction * flySpeed
            else
                root.Velocity = Vector3.new(0, 0, 0)
            end
        end)
    else
        flyButton.Text = "Toggle Fly"
    end
end)

-- Create Invisible feature
local invisibleButton = Instance.new("TextButton")
invisibleButton.Size = UDim2.new(1, -20, 0, 40)
invisibleButton.Position = UDim2.new(0, 10, 0, 60)
invisibleButton.Text = "Toggle Invisible"
invisibleButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
invisibleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
invisibleButton.Parent = movementCategory

invisibleButton.MouseButton1Click:Connect(function()
    local character = player.Character or player.CharacterAdded:Wait()
    local isCurrentlyInvisible = character:FindFirstChild("Invisible")
    if not isCurrentlyInvisible then
        -- Make Invisible
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Transparency = 1
                part.CanCollide = false
            end
        end
        local invisibleTag = Instance.new("BoolValue")
        invisibleTag.Name = "Invisible"
        invisibleTag.Parent = character
        invisibleButton.Text = "Become Visible"
    else
        -- Revert to Visible
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.Transparency = 0
                part.CanCollide = true
            end
        end
        isCurrentlyInvisible:Destroy()
        invisibleButton.Text = "Toggle Invisible"
    end
end)
