-- This script can be uploaded to GitHub and loaded using a loadstring URL

local function createVapeStyleGUI()
    local player = game.Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")

    -- Main screen GUI
    local vapeGUI = Instance.new("ScreenGui")
    vapeGUI.Name = "VapeStyleGUI"
    vapeGUI.Parent = playerGui

    -- Frame for menu
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0.3, 0, 0.4, 0)
    mainFrame.Position = UDim2.new(0.35, 0, 0.3, 0)
    mainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    mainFrame.BorderSizePixel = 0
    mainFrame.Visible = false -- Start hidden
    mainFrame.Parent = vapeGUI

    -- Top bar
    local topBar = Instance.new("Frame")
    topBar.Name = "TopBar"
    topBar.Size = UDim2.new(1, 0, 0.1, 0)
    topBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    topBar.BorderSizePixel = 0
    topBar.Parent = mainFrame

    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Text = "Vape V4 Style GUI"
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
    toggleButton.Parent = vapeGUI

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
createVapeStyleGUI()

-- Loadstring setup example:
-- Upload this script to GitHub Gist or a similar service, and retrieve the raw URL
-- Use this loadstring in your game to load the GUI:
-- loadstring(game:HttpGet("YOUR_RAW_GITHUB_URL_HERE"))()
