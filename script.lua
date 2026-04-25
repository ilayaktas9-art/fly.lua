-- [[ ILAY'S SCRIPT - FIXED & BUILT-IN ]] --
local ScreenGui = Instance.new("ScreenGui")
local Border = Instance.new("Frame")
local MainFrame = Instance.new("Frame")
local InstaBtn = Instance.new("TextButton")
local UICornerMain = Instance.new("UICorner")
local UICornerBorder = Instance.new("UICorner")
local UICornerBtn = Instance.new("UICorner")

-- GUI Setup
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "IlayFinalFix"

-- Blauer Rand (Hintergrund)
Border.Name = "Border"
Border.Parent = ScreenGui
Border.BackgroundColor3 = Color3.fromRGB(0, 160, 255)
Border.Position = UDim2.new(0.5, -150, 0.5, -75)
Border.Size = UDim2.new(0, 300, 0, 150)
UICornerBorder.CornerRadius = UDim.new(0, 12)
UICornerBorder.Parent = Border

-- Hauptfenster
MainFrame.Parent = Border
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.Position = UDim2.new(0, 2, 0, 2)
MainFrame.Size = UDim2.new(0, 296, 0, 146)
UICornerMain.CornerRadius = UDim.new(0, 10)
UICornerMain.Parent = MainFrame

-- Titel
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "❄️ ILAY'S SCRIPT"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18

-- Insta Steal Button
InstaBtn.Parent = MainFrame
InstaBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
InstaBtn.Position = UDim2.new(0.1, 0, 0.4, 0)
InstaBtn.Size = UDim2.new(0.8, 0, 0, 50)
InstaBtn.Text = "⚔️ Insta Steal"
InstaBtn.TextColor3 = Color3.fromRGB(0, 160, 255)
InstaBtn.Font = Enum.Font.GothamBold
InstaBtn.TextSize = 22
UICornerBtn.CornerRadius = UDim.new(0, 8)
UICornerBtn.Parent = InstaBtn

-- Schließen Button
local Close = Instance.new("TextButton")
Close.Parent = MainFrame
Close.Size = UDim2.new(0, 30, 0, 30)
Close.Position = UDim2.new(1, -40, 0, 10)
Close.Text = "X"
Close.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
local cCorner = Instance.new("UICorner")
cCorner.Parent = Close

--- HIER IST DAS STEAL SCRIPT DIREKT EINGEBAUT ---
local function runInstaSteal()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")

    -- Suche nach allem, was man einsammeln kann
    for _, v in pairs(workspace:GetDescendants()) do
        pcall(function()
            -- Prüfe auf ClickDetector (am wichtigsten für Steal a Brainrot)
            if v:IsA("ClickDetector") then
                fireclickdetector(v)
            -- Prüfe auf Touch (Falls man drüberlaufen muss)
            elseif v:IsA("TouchTransmitter") then
                firetouchinterest(hrp, v.Parent, 0)
                firetouchinterest(hrp, v.Parent, 1)
            -- Prüfe auf ProximityPrompt (Falls man E halten muss)
            elseif v:IsA("ProximityPrompt") then
                fireproximityprompt(v)
            end
        end)
    end
end

-- Button Klick Event
InstaBtn.MouseButton1Click:Connect(function()
    InstaBtn.Text = "STALING..."
    InstaBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    
    -- Führt die Funktion aus
    runInstaSteal()
    
    task.wait(1)
    InstaBtn.Text = "⚔️ Insta Steal"
    InstaBtn.TextColor3 = Color3.fromRGB(0, 160, 255)
end)

Close.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
