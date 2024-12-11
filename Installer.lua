-- Main Script for AydinV4 GUI

local function loadModules()
    local modules = {}

    -- Load modules from the Modules folder
    local moduleFolder = script:FindFirstChild("Modules")
    if moduleFolder then
        for _, module in pairs(moduleFolder:GetChildren()) do
            if module:IsA("ModuleScript") then
                modules[module.Name] = require(module)
            end
        end
    end

    return modules
end

local function createAydinV4StyleGUI(modules)
    local player = game.Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")

    -- Main screen GUI
    local aydinGUI = Instance.new("ScreenGui")
    aydinGUI.Name = "AydinV4StyleGUI"
    aydinGUI.Parent = playerGui

    -- Frame for menu
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0.3, 0, 0.4, 0)
    mainFrame.Position = UDim2.new(0.35, 0, 0.3, 0)
    mainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    mainFrame.BorderSizePixel = 0
    mainFrame.Visible = false -- Start hidden
    mainFrame.Parent = aydinGUI

    -- Top bar
    local topBar = Instance.new("Frame")
    topBar.Name = "TopBar"
    topBar.Size = UDim2.new(1, 0, 0.1, 0)
    topBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    topBar.BorderSizePixel = 0
    topBar.Parent = mainFrame

    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Text = "Aydin V4 Style GUI"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 18
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1
    title.Size = UDim2.new(1, 0, 1, 0)
    title.Parent = topBar

    -- Toggle Button
    local toggleButton = Instance.new("TextButton")
    toggleButton.Name = "ToggleButton"
    toggleButton.Text = "Open"
    toggleButton.Size = UDim2.new(0.1, 0, 0.05, 0)
    toggleButton.Position = UDim2.new(0.9, 0, 0.05, 0)
    toggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.Font = Enum.Font.GothamBold
    toggleButton.TextSize = 14
    toggleButton.Parent = aydinGUI

    -- Add close button inside MainFrame
    local closeButton = Instance.new("TextButton")
    closeButton.Name = "CloseButton"
    closeButton.Text = "X"
    closeButton.Size = UDim2.new(0.1, 0, 0.1, 0)
    closeButton.Position = UDim2.new(0.9, 0, 0, 0)
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.Font = Enum.Font.GothamBold
    closeButton.TextSize = 14
    closeButton.Parent = mainFrame

    -- Buttons for modules
    local yPos = 0.2
    for moduleName, module in pairs(modules) do
        local button = Instance.new("TextButton")
        button.Name = moduleName .. "Button"
        button.Text = moduleName
        button.Size = UDim2.new(0.8, 0, 0.1, 0)
        button.Position = UDim2.new(0.1, 0, yPos, 0)
        button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.GothamBold
        button.TextSize = 14
        button.Parent = mainFrame

        yPos = yPos + 0.15

        button.MouseButton1Click:Connect(function()
            module.Activate()
        end)
    end

    -- Open/Close Functionality
    local isOpen = false

    toggleButton.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        mainFrame.Visible = isOpen
        toggleButton.Text = isOpen and "Close" or "Open"
    end)

    closeButton.MouseButton1Click:Connect(function()
        isOpen = false
        mainFrame.Visible = false
        toggleButton.Text = "Open"
    end)
end

-- Load GUI upon execution
local modules = loadModules()
createAydinV4StyleGUI(modules)
