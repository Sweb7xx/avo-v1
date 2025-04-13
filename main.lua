-- Simplified Main Script for Avo v1
local function createNotification(title, text, duration)
    game.StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration or 5
    })
end

-- Wrap everything in pcall to catch any errors
local success, errorMsg = pcall(function()
    createNotification("Avo v1", "Creating GUI...", 3)
    
    -- Create the main GUI
    local ModMenu = Instance.new("ScreenGui")
    ModMenu.Name = "AvoV1"
    
    -- Check if we can use CoreGui (some exploits don't allow this)
    local parent = game:GetService("CoreGui")
    local useCore = pcall(function()
        ModMenu.Parent = parent
    end)
    
    if not useCore then
        parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
        ModMenu.Parent = parent
        createNotification("Avo v1", "Using PlayerGui instead of CoreGui", 3)
    end
    
    ModMenu.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
    MainFrame.Size = UDim2.new(0, 300, 0, 200)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ModMenu
    
    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "Avo v1 - Rivals"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 18
    Title.BorderSizePixel = 0
    Title.Parent = MainFrame
    
    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
    CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    CloseButton.Position = UDim2.new(1, -25, 0, 5)
    CloseButton.Size = UDim2.new(0, 20, 0, 20)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.Text = "X"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 14
    CloseButton.BorderSizePixel = 0
    CloseButton.Parent = Title
    
    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Name = "StatusLabel"
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Position = UDim2.new(0, 0, 0.5, -20)
    StatusLabel.Size = UDim2.new(1, 0, 0, 40)
    StatusLabel.Font = Enum.Font.Gotham
    StatusLabel.Text = "Avo v1 loaded successfully!"
    StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    StatusLabel.TextSize = 16
    StatusLabel.Parent = MainFrame
    
    -- Close button functionality
    CloseButton.MouseButton1Click:Connect(function()
        ModMenu:Destroy()
        createNotification("Avo v1", "GUI closed", 3)
    end)
    
    -- Keybind to toggle menu visibility
    local UserInputService = game:GetService("UserInputService")
    local menuVisible = true
    
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == Enum.KeyCode.RightControl then
            menuVisible = not menuVisible
            MainFrame.Visible = menuVisible
            createNotification("Avo v1", menuVisible and "Menu shown" or "Menu hidden", 2)
        end
    end)
    
    createNotification("Avo v1", "Loaded successfully! Press Right Ctrl to toggle menu", 5)
end)

if not success then
    -- If the main script fails, show a notification
    pcall(function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "Avo v1 - Main Script Error",
            Text = tostring(errorMsg),
            Duration = 10
        })
    end)
end
