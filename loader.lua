-- Avo v1 Loader
-- Created for Rivals game

-- Error handling function
local function handleError(err, stage)
    warn("Avo v1 Error at " .. stage .. ": " .. tostring(err))
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Avo v1 Error",
            Text = stage .. ": " .. tostring(err):sub(1, 100),
            Duration = 10
        })
    end)
end

-- Main loader function
local function loadAvoV1()
    -- Create loading GUI
    local gui = Instance.new("ScreenGui")
    gui.Name = "AvoV1Loader"
    
    -- Try different parents
    local success = pcall(function()
        gui.Parent = game:GetService("CoreGui")
    end)
    
    if not success then
        success = pcall(function()
            gui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
        end)
    end
    
    if not success then
        error("Could not find a valid parent for the GUI")
    end
    
    -- Create loading interface
    local background = Instance.new("Frame")
    background.Name = "Background"
    background.Size = UDim2.new(0, 300, 0, 150)
    background.Position = UDim2.new(0.5, -150, 0.5, -75)
    background.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    background.BorderSizePixel = 0
    background.Parent = gui
    
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Position = UDim2.new(0, 0, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "Avo v1"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 24
    title.Parent = background
    
    local status = Instance.new("TextLabel")
    status.Name = "Status"
    status.Size = UDim2.new(1, 0, 0, 20)
    status.Position = UDim2.new(0, 0, 0.5, 0)
    status.BackgroundTransparency = 1
    status.Text = "Loading..."
    status.TextColor3 = Color3.fromRGB(200, 200, 200)
    status.Font = Enum.Font.Gotham
    status.TextSize = 16
    status.Parent = background
    
    local loadingBar = Instance.new("Frame")
    loadingBar.Name = "LoadingBarBackground"
    loadingBar.Size = UDim2.new(0.8, 0, 0, 20)
    loadingBar.Position = UDim2.new(0.1, 0, 0.8, -10)
    loadingBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    loadingBar.BorderSizePixel = 0
    loadingBar.Parent = background
    
    local loadingFill = Instance.new("Frame")
    loadingFill.Name = "LoadingFill"
    loadingFill.Size = UDim2.new(0, 0, 1, 0)
    loadingFill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    loadingFill.BorderSizePixel = 0
    loadingFill.Parent = loadingBar
    
    -- Function to update loading status
    local function updateStatus(text, progress)
        status.Text = text
        loadingFill:TweenSize(
            UDim2.new(progress, 0, 1, 0),
            Enum.EasingDirection.Out,
            Enum.EasingStyle.Quad,
            0.5,
            true
        )
    end
    
    -- Start loading process
    updateStatus("Checking game...", 0.1)
    wait(0.5)
    
    -- Check if in Rivals game (replace with actual game ID)
    if game.PlaceId ~= 13370783664 then
        -- For testing, we'll continue anyway
        updateStatus("Note: Not in Rivals game, but continuing...", 0.2)
        wait(1)
    else
        updateStatus("Game detected: Rivals", 0.2)
        wait(0.5)
    end
    
    updateStatus("Loading main script...", 0.4)
    wait(0.5)
    
    -- Load the main script
    updateStatus("Executing...", 0.8)
    
    -- Here we'll execute the main script
    local mainScriptSuccess, mainScriptError = pcall(function()
        -- Main script content starts here
        
        -- Create the main GUI
        local ModMenu = Instance.new("ScreenGui")
        ModMenu.Name = "AvoV1"
        
        -- Try different parents
        local guiSuccess = pcall(function()
            ModMenu.Parent = game:GetService("CoreGui")
        end)
        
        if not guiSuccess then
            guiSuccess = pcall(function()
                ModMenu.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
            end)
        end
        
        if not guiSuccess then
            error("Could not find a valid parent for the main GUI")
        end
        
        local MainFrame = Instance.new("Frame")
        MainFrame.Name = "MainFrame"
        MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
        MainFrame.Size = UDim2.new(0, 400, 0, 300)
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
        
        local FeaturesFrame = Instance.new("ScrollingFrame")
        FeaturesFrame.Name = "FeaturesFrame"
        FeaturesFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        FeaturesFrame.Position = UDim2.new(0, 10, 0, 40)
        FeaturesFrame.Size = UDim2.new(1, -20, 1, -50)
        FeaturesFrame.BorderSizePixel = 0
        FeaturesFrame.ScrollBarThickness = 6
        FeaturesFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
        FeaturesFrame.Parent = MainFrame
        
        local UIListLayout = Instance.new("UIListLayout")
        UIListLayout.Parent = FeaturesFrame
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 5)
        
        -- Function to create a button
        local function createButton(name, callback)
            local button = Instance.new("TextButton")
            button.Name = name
            button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            button.Size = UDim2.new(1, -10, 0, 40)
            button.Font = Enum.Font.Gotham
            button.Text = name
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.TextSize = 16
            button.BorderSizePixel = 0
            button.Parent = FeaturesFrame
            
            button.MouseButton1Click:Connect(callback)
            return button
        end
        
        -- Function to create a toggle
        local function createToggle(name, callback)
            local toggleFrame = Instance.new("Frame")
            toggleFrame.Name = name .. "Frame"
            toggleFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
            toggleFrame.Size = UDim2.new(1, -10, 0, 40)
            toggleFrame.BorderSizePixel = 0
            toggleFrame.Parent = FeaturesFrame
            
            local toggleLabel = Instance.new("TextLabel")
            toggleLabel.Name = "Label"
            toggleLabel.BackgroundTransparency = 1
            toggleLabel.Position = UDim2.new(0, 10, 0, 0)
            toggleLabel.Size = UDim2.new(0.7, 0, 1, 0)
            toggleLabel.Font = Enum.Font.Gotham
            toggleLabel.Text = name
            toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            toggleLabel.TextSize = 16
            toggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            toggleLabel.Parent = toggleFrame
            
            local toggleButton = Instance.new("Frame")
            toggleButton.Name = "ToggleButton"
            toggleButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
            toggleButton.Position = UDim2.new(0.85, 0, 0.5, -10)
            toggleButton.Size = UDim2.new(0, 40, 0, 20)
            toggleButton.BorderSizePixel = 0
            toggleButton.Parent = toggleFrame
            
            local toggleIndicator = Instance.new("Frame")
            toggleIndicator.Name = "Indicator"
            toggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            toggleIndicator.Position = UDim2.new(0, 2, 0, 2)
            toggleIndicator.Size = UDim2.new(0, 16, 0, 16)
            toggleIndicator.BorderSizePixel = 0
            toggleIndicator.Parent = toggleButton
            
            local enabled = false
            
            toggleFrame.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    enabled = not enabled
                    
                    if enabled then
                        toggleButton.BackgroundColor3 = Color3.fromRGB(50, 255, 50)
                        toggleIndicator:TweenPosition(UDim2.new(1, -18, 0, 2), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
                    else
                        toggleButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
                        toggleIndicator:TweenPosition(UDim2.new(0, 2, 0, 2), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
                    end
                    
                    callback(enabled)
                end
            end)
            
            return toggleFrame
        end
        
        -- Close button functionality
        CloseButton.MouseButton1Click:Connect(function()
            ModMenu:Destroy()
        end)
        
        -- Add features
        createButton("Infinite Health", function()
            -- Add your code for infinite health here
            game.StarterGui:SetCore("SendNotification", {
                Title = "Avo v1",
                Text = "Infinite Health activated!",
                Duration = 3
            })
            
            -- Example implementation
            local player = game.Players.LocalPlayer
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                local humanoid = player.Character.Humanoid
                
                -- Connect to the health changed event
                humanoid.HealthChanged:Connect(function()
                    if humanoid.Health < humanoid.MaxHealth then
                        humanoid.Health = humanoid.MaxHealth
                    end
                end)
            end
        end)
        
        createToggle("Speed Boost", function(enabled)
            -- Add your code for speed boost here
            local player = game.Players.LocalPlayer
            if enabled then
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid.WalkSpeed = 50
                end
            else
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid.WalkSpeed = 16
                end
            end
        end)
        
        createToggle("Jump Boost", function(enabled)
            -- Add your code for jump boost here
            local player = game.Players.LocalPlayer
            if enabled then
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid.JumpPower = 100
                end
            else
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid.JumpPower = 50
                end
            end
        end)
        
        createButton("Teleport to Nearest Player", function()
            -- Add your code for teleporting to nearest player
            local player = game.Players.LocalPlayer
            local character = player.Character
            if not character then return end
            
            local closestPlayer = nil
            local closestDistance = math.huge
            
            for _, otherPlayer in pairs(game.Players:GetPlayers()) do
                if otherPlayer ~= player and otherPlayer.Character then
                    local distance = (character.HumanoidRootPart.Position - otherPlayer.Character.HumanoidRootPart.Position).Magnitude
                    if distance < closestDistance then
                        closestDistance = distance
                        closestPlayer = otherPlayer
                    end
                end
            end
            
            if closestPlayer then
                character:SetPrimaryPartCFrame(closestPlayer.Character.HumanoidRootPart.CFrame)
            end
        end)
        
        createButton("ESP Players", function()
            -- Add ESP functionality
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer then
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local esp = Instance.new("BillboardGui")
                        esp.Name = "ESP"
                        esp.AlwaysOnTop = true
                        esp.Size = UDim2.new(0, 100, 0, 50)
                        esp.StudsOffset = Vector3.new(0, 3, 0)
                        esp.Adornee = player.Character.HumanoidRootPart
                        
                        local nameLabel = Instance.new("TextLabel")
                        nameLabel.BackgroundTransparency = 1
                        nameLabel.Size = UDim2.new(1, 0, 1, 0)
                        nameLabel.Text = player.Name
                        nameLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                        nameLabel.TextStrokeTransparency = 0
                        nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                        nameLabel.Font = Enum.Font.GothamBold
                        nameLabel.TextSize = 14
                        nameLabel.Parent = esp
                        
                        esp.Parent = player.Character.HumanoidRootPart
                    end
                end
            end
            
            game.StarterGui:SetCore("SendNotification", {
                Title = "Avo v1",
                Text = "ESP activated!",
                Duration = 3
            })
        end)
        
        createButton("Aimbot", function()
            -- Simple aimbot implementation
            local aimbot = true
            local camera = game.Workspace.CurrentCamera
            local player = game.Players.LocalPlayer
            
            game.StarterGui:SetCore("SendNotification", {
                Title = "Avo v1",
                Text = "Aimbot activated! Press X to toggle.",
                Duration = 3
            })
            
            game:GetService("UserInputService").InputBegan:Connect(function(input)
                if input.KeyCode == Enum.KeyCode.X then
                    aimbot = not aimbot
                    game.StarterGui:SetCore("SendNotification", {
                        Title = "Avo v1",
                        Text = aimbot and "Aimbot enabled" or "Aimbot disabled",
                        Duration = 2
                    })
                end
            end)
            
            game:GetService("RunService").RenderStepped:Connect(function()
                if aimbot then
                    local closestPlayer = nil
                    local closestDistance = math.huge
                    
                    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
                        if otherPlayer ~= player and otherPlayer.Character and 
                           otherPlayer.Character:FindFirstChild("HumanoidRootPart") and
                           otherPlayer.Character:FindFirstChild("Humanoid") and
                           otherPlayer.Character.Humanoid.Health > 0 then
                            
                            local screenPoint = camera:WorldToScreenPoint(otherPlayer.Character.HumanoidRootPart.Position)
                            local screenCenter = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
                            local distance = (Vector2.new(screenPoint.X, screenPoint.Y) - screenCenter).Magnitude
                            
                            if distance < closestDistance and screenPoint.Z > 0 then
                                closestDistance = distance
                                closestPlayer = otherPlayer
                            end
                        end
                    end
                    
                    if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("Head") then
                        camera.CFrame = CFrame.new(camera.CFrame.Position, closestPlayer.Character.Head.Position)
                    end
                end
            end)
        end)
        
        createButton("Infinite Jump", function()
            -- Infinite jump implementation
            local infiniteJump = true
            
            game.StarterGui:SetCore("SendNotification", {
                Title = "Avo v1",
                Text = "Infinite Jump activated!",
                Duration = 3
            })
            
            game:GetService("UserInputService").JumpRequest:Connect(function()
                if infiniteJump then
                    game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        end)
        
        createToggle("No Clip", function(enabled)
            -- No clip implementation
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            
            if enabled then
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
                
                -- Connect to stepped event to maintain no clip
                local noclipConnection
                noclipConnection = game:GetService("RunService").Stepped:Connect(function()
                    for _, part in pairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end)
                
                -- Store the connection in the character
                character:SetAttribute("NoClipConnection", true)
                
                -- Clean up when toggled off
                character.Humanoid.Died:Connect(function()
                    if noclipConnection then
                        noclipConnection:Disconnect()
                    end
                end)
            else
                -- Disconnect the noclip connection
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                        part.CanCollide = true
                    end
                end
                
                character:SetAttribute("NoClipConnection", false)
            end
        end)
        
        createButton("Teleport to Safe Zone", function()
            -- Teleport to a safe location in the map
            local player = game.Players.LocalPlayer
            local character = player.Character
            
            if character and character:FindFirstChild("HumanoidRootPart") then
                -- Adjust these coordinates based on the actual safe zones in Rivals
                character.HumanoidRootPart.CFrame = CFrame.new(0, 100, 0)
                
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Avo v1",
                    Text = "Teleported to safe zone!",
                    Duration = 3
                })
            end
        end)
        
        -- Credits section
        local creditsLabel = Instance.new("TextLabel")
        creditsLabel.Name = "CreditsLabel"
        creditsLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        creditsLabel.Size = UDim2.new(1, -10, 0, 30)
        creditsLabel.Font = Enum.Font.Gotham
        creditsLabel.Text = "Avo v1 by Sweb7xx"
        creditsLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
        creditsLabel.TextSize = 14
        creditsLabel.BorderSizePixel = 0
        creditsLabel.Parent = FeaturesFrame
        
        -- Update canvas size based on content
        FeaturesFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
        
        -- Keybind to toggle menu visibility
        local UserInputService = game:GetService("UserInputService")
        local menuVisible = true
        
        UserInputService.InputBegan:Connect(function(input, gameProcessed)
            if not gameProcessed and input.KeyCode == Enum.KeyCode.RightControl then
                menuVisible = not menuVisible
                MainFrame.Visible = menuVisible
            end
        end)
        
        -- Notification on load
        game.StarterGui:SetCore("SendNotification", {
            Title = "Avo v1",
            Text = "Loaded successfully! Press Right Ctrl to toggle menu",
            Duration = 5
        })
        
        -- End of main script
    end)
    
    if not mainScriptSuccess then
        updateStatus("Error: " .. tostring(mainScriptError):sub(1, 50), 1)
        loadingFill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        handleError(mainScriptError, "Main Script")
        wait(3)
    else
        updateStatus("Successfully loaded!", 1)
        loadingFill.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
        wait(1)
    end
    
    -- Remove loading GUI
    gui:Destroy()
end

-- Execute the loader with error handling
local success, error = pcall(loadAvoV1)
if not success then
    handleError(error, "Loader")
end
