-- [[ Ilay's Script - Fly V2 ]] --

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

local flyEnabled = false
local flySpeed = 50

-- GUI Erstellung
local screenGui = Instance.new("ScreenGui", game.CoreGui)
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 200, 0, 120)
frame.Position = UDim2.new(0.5, -100, 0.5, -60)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 2

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "ILAY'S FLY GUI"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)

local toggleBtn = Instance.new("TextButton", frame)
toggleBtn.Size = UDim2.new(0.9, 0, 0, 30)
toggleBtn.Position = UDim2.new(0.05, 0, 0.35, 0)
toggleBtn.Text = "Fly: OFF"
toggleBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local speedBox = Instance.new("TextBox", frame)
speedBox.Size = UDim2.new(0.9, 0, 0, 30)
speedBox.Position = UDim2.new(0.05, 0, 0.65, 0)
speedBox.Text = "50"
speedBox.PlaceholderText = "Speed..."
speedBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
speedBox.TextColor3 = Color3.fromRGB(255, 255, 255)

-- Flug Logik
local runService = game:GetService("RunService")
local connection

toggleBtn.MouseButton1Click:Connect(function()
    flyEnabled = not flyEnabled
    
    if flyEnabled then
        toggleBtn.Text = "Fly: ON"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        
        local char = player.Character
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        
        -- Loop für die Bewegung
        connection = runService.Heartbeat:Connect(function()
            if not flyEnabled or not player.Character:FindFirstChild("HumanoidRootPart") then 
                connection:Disconnect() 
                return 
            end
            
            local velocity = Vector3.new(0, 0.1, 0)
            local cam = workspace.CurrentCamera
            
            -- Steuerung (W, A, S, D)
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
                velocity = velocity + (cam.CFrame.LookVector * flySpeed)
            end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
                velocity = velocity - (cam.CFrame.LookVector * flySpeed)
            end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
                velocity = velocity - (cam.CFrame.RightVector * flySpeed)
            end
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
                velocity = velocity + (cam.CFrame.RightVector * flySpeed)
            end
            
            player.Character.HumanoidRootPart.Velocity = velocity
        end)
        
    else
        toggleBtn.Text = "Fly: OFF"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
        if connection then connection:Disconnect() end
    end
end)

speedBox.FocusLost:Connect(function()
    flySpeed = tonumber(speedBox.text) or 50
end)
