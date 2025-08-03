-- Part 1/2 - YoxanXHub | Steal a Brainrot (Converted to OrionLib)

-- Game whitelist check
local allowedPlaceIds = {
    [96342491571673] = true,
    [109983668079237] = true
}

if not allowedPlaceIds[game.PlaceId] then
    game.Players.LocalPlayer:Kick("Unsupported Game Join Correct.")
    return
end

-- Load OrionLib
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/1nig1htmare1234/SCRIPTS/main/Orion.lua"))()

-- Create main window
local Window = OrionLib:MakeWindow({
    Name = "YoxanXHub | Steal a Brainrot",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "YoxanX_StealBrainrot"
})

-- Info Tab
local InfoTab = Window:MakeTab({
    Name = "Info",
    Icon = "rbxassetid://6023426926",
    PremiumOnly = false
})

InfoTab:AddButton({
    Name = "Join Discord",
    Callback = function()
        setclipboard("https://discord.gg/mv6uWsNqSY")
    end
})

InfoTab:AddParagraph("About", "CEO : Kz Scripter | Team : Zipp Silent & Lobão\nVersion : 1.1.0 Beta")

-- Main Tab
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://6026568228",
    PremiumOnly = false
})

MainTab:AddToggle({
    Name = "Godmode",
    Default = false,
    Callback = function(state)
        local Player = game.Players.LocalPlayer
        if state then
            local Character = Player.Character or Player.CharacterAdded:Wait()
            local Humanoid = Character:FindFirstChildOfClass("Humanoid")
            if Humanoid then
                local Clone = Humanoid:Clone()
                Clone.Parent = Character
                Humanoid:Destroy()
                Clone.Name = "Humanoid"
                workspace.CurrentCamera.CameraSubject = Clone
            end
        else
            warn("Reset manually to remove godmode.")
        end
    end
})

MainTab:AddButton({
    Name = "Rejoin Server",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        local placeId = game.PlaceId
        local jobId = game.JobId
        local player = game.Players.LocalPlayer

        local success, err = pcall(function()
            TeleportService:TeleportToPlaceInstance(placeId, jobId, player)
        end)
        if not success then
            warn("Teleport failed:", err)
            TeleportService:Teleport(placeId, player)
        end
    end
})

-- Steal Tab
local StealTab = Window:MakeTab({
    Name = "Steal",
    Icon = "rbxassetid://6031260798",
    PremiumOnly = false
})

StealTab:AddButton({
    Name = "Steal GUI",
    Callback = function()
        local gui = Instance.new("ScreenGui", game.CoreGui)
        gui.Name = "Kz Steal"

        local btn = Instance.new("TextButton", gui)
        btn.Size = UDim2.new(0, 200, 0, 50)
        btn.Position = UDim2.new(0, 20, 0.5, -25)
        btn.Text = "Teleport UP: OFF"
        btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        btn.TextColor3 = Color3.new(1, 1, 1)
        btn.Font = Enum.Font.GothamBold
        btn.TextSize = 14
        btn.Draggable = true
        Instance.new("UICorner", btn)

        local toggled = false
        local originalPosition

        btn.MouseButton1Click:Connect(function()
            local player = game.Players.LocalPlayer
            local char = player.Character or player.CharacterAdded:Wait()
            local hrp = char:WaitForChild("HumanoidRootPart")

            if not toggled then
                originalPosition = hrp.Position
                hrp.CFrame = hrp.CFrame + Vector3.new(0, 200, 0)
                btn.Text = "Teleport UP: ON"
                toggled = true
            else
                if originalPosition then
                    hrp.CFrame = CFrame.new(originalPosition)
                else
                    hrp.CFrame = hrp.CFrame - Vector3.new(0, 200, 0)
                end
                btn.Text = "Teleport UP: OFF"
                toggled = false
            end
        end)
    end
})

StealTab:AddButton({
    Name = "Speed Boost",
    Callback = function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 94
    end
})

StealTab:AddButton({
    Name = "Float GUI",
    Callback = function()
        local player = game.Players.LocalPlayer
        local floatOn = false
        local floatConn

        local gui = Instance.new("ScreenGui", game.CoreGui)
        gui.Name = "Kz Float Ui"

        local frame = Instance.new("Frame", gui)
        frame.Size = UDim2.new(0, 200, 0, 100)
        frame.Position = UDim2.new(0.5, -100, 0.5, -50)
        frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        frame.Draggable = true
        frame.Active = true

        local label = Instance.new("TextLabel", frame)
        label.Size = UDim2.new(1, 0, 0, 30)
        label.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        label.Text = "Float Steal Mode"
        label.TextColor3 = Color3.new(1,1,1)
        label.Font = Enum.Font.SourceSansBold
        label.TextSize = 16

        local button = Instance.new("TextButton", frame)
        button.Size = UDim2.new(0.8, 0, 0, 30)
        button.Position = UDim2.new(0.1, 0, 0.5, -15)
        button.Text = "Active Float"
        button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
        button.TextColor3 = Color3.new(1,1,1)
        button.Font = Enum.Font.SourceSansBold
        button.TextSize = 14

        local function applyFloat(char)
            local hrp = char:WaitForChild("HumanoidRootPart")
            if hrp:FindFirstChild("FloatPosition") then
                hrp:FindFirstChild("FloatPosition"):Destroy()
            end

            local bp = Instance.new("BodyPosition")
            bp.Name = "FloatPosition"
            bp.MaxForce = Vector3.new(0, 100000, 0)
            bp.Position = hrp.Position + Vector3.new(0, 0.65, 0)
            bp.D = 1000
            bp.P = 3000
            bp.Parent = hrp

            floatConn = game:GetService("RunService").Heartbeat:Connect(function()
                if char and hrp and bp and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 then
                    bp.Position = hrp.Position + Vector3.new(0, 0.65, 0)
                else
                    if floatConn then floatConn:Disconnect() end
                end
            end)
        end

        local function removeFloat(char)
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp and hrp:FindFirstChild("FloatPosition") then
                hrp.FloatPosition:Destroy()
            end
            if floatConn then
                floatConn:Disconnect()
            end
        end

        button.MouseButton1Click:Connect(function()
            floatOn = not floatOn
            if floatOn then
                button.Text = "Put OFF"
                button.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
                if player.Character then applyFloat(player.Character) end
            else
                button.Text = "Active Float"
                button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
                if player.Character then removeFloat(player.Character) end
            end
        end)

        player.CharacterAdded:Connect(function(char)
            wait(1)
            if floatOn then applyFloat(char) end
        end)
    end
})

-- Part 2/2 - Lanjutan YoxanXHub | Steal a Brainrot (OrionLib)

-- Lanjutan Steal Tab
local player = game.Players.LocalPlayer
local DoubleJumpActive = false
local DoubleJumpConnection = nil
local StateConnection = nil
local UserInputService = game:GetService("UserInputService")

local function enableDoubleJump()
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local canDoubleJump = true

    StateConnection = humanoid.StateChanged:Connect(function(_, newState)
        if newState == Enum.HumanoidStateType.Landed then
            canDoubleJump = true
        end
    end)

    DoubleJumpConnection = UserInputService.JumpRequest:Connect(function()
        if humanoid.FloorMaterial ~= Enum.Material.Air then
            canDoubleJump = true
        elseif canDoubleJump then
            canDoubleJump = false
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end)
end

local function disableDoubleJump()
    if DoubleJumpConnection then
        DoubleJumpConnection:Disconnect()
        DoubleJumpConnection = nil
    end
    if StateConnection then
        StateConnection:Disconnect()
        StateConnection = nil
    end
end

StealTab:AddToggle({
    Name = "Double Jump",
    Default = false,
    Callback = function(state)
        DoubleJumpActive = state
        if state then enableDoubleJump() else disableDoubleJump() end
    end
})

player.CharacterAdded:Connect(function()
    wait(1)
    if DoubleJumpActive then
        enableDoubleJump()
    end
end)

StealTab:AddButton({
    Name = "Instant Steal",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Youifpg/Steal-a-Brianrot/refs/heads/main/Slowversion.lua"))()
    end
})

-- Visual Tab
local VisualTab = Window:MakeTab({
    Name = "Visual",
    Icon = "rbxassetid://6031075938",
    PremiumOnly = false
})

VisualTab:AddToggle({
    Name = "ESP Players",
    Default = false,
    Callback = function(state)
        local Players = game:GetService("Players")

        local function createESP(player)
            if player == Players.LocalPlayer then return end
            local character = player.Character or player.CharacterAdded:Wait()
            local head = character:WaitForChild("Head")
            local box = Instance.new("BillboardGui")
            box.Name = "ESPBox"
            box.Adornee = head
            box.Size = UDim2.new(0, 50, 0, 50)
            box.StudsOffsetWorldSpace = Vector3.new(0, 2, 0)
            box.AlwaysOnTop = true
            box.Parent = head

            local frame = Instance.new("Frame")
            frame.Size = UDim2.new(1, 0, 1, 0)
            frame.BackgroundTransparency = 0.8
            frame.BackgroundColor3 = Color3.new(0, 1, 0)
            frame.Parent = box

            local label = Instance.new("TextLabel")
            label.Size = UDim2.new(1, 0, 0.5, 0)
            label.Position = UDim2.new(0, 0, -0.5, 0)
            label.Text = player.Name
            label.BackgroundTransparency = 1
            label.TextColor3 = Color3.new(1, 1, 1)
            label.TextStrokeTransparency = 0
            label.Font = Enum.Font.SourceSansBold
            label.TextSize = 14
            label.Parent = frame
        end

        local function removeESP(player)
            local character = player.Character
            if character and character:FindFirstChild("Head") then
                local head = character.Head
                if head:FindFirstChild("ESPBox") then
                    head.ESPBox:Destroy()
                end
            end
        end

        if state then
            for _, p in pairs(Players:GetPlayers()) do
                createESP(p)
            end
        else
            for _, p in pairs(Players:GetPlayers()) do
                removeESP(p)
            end
        end

        Players.PlayerAdded:Connect(function(p)
            if state then
                wait(1)
                createESP(p)
            end
        end)

        Players.PlayerRemoving:Connect(removeESP)
    end
})

VisualTab:AddButton({
    Name = "Show Player Count",
    Callback = function()
        local count = #game.Players:GetPlayers()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Player Count",
            Text = "There are " .. count .. " players in the game.",
            Duration = 5
        })
    end
})

VisualTab:AddButton({
    Name = "Anti Lag",
    Callback = function()
        local ws = game:GetService("Workspace")
        local lighting = game:GetService("Lighting")
        for _, v in pairs(ws:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
                v.CastShadow = false
            end
            if v:IsA("Decal") or v:IsA("Texture") or v:IsA("ParticleEmitter") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
                v:Destroy()
            end
            if v:IsA("PointLight") or v:IsA("SurfaceLight") or v:IsA("SpotLight") then
                v.Enabled = false
            end
        end

        lighting.GlobalShadows = false
        lighting.FogEnd = 1e10
        lighting.Brightness = 0
        lighting.ClockTime = 14
        lighting.EnvironmentDiffuseScale = 0
        lighting.EnvironmentSpecularScale = 0

        ws.Terrain.WaterWaveSize = 0
        ws.Terrain.WaterWaveSpeed = 0
        ws.Terrain.WaterReflectance = 0
        ws.Terrain.WaterTransparency = 1
    end
})

-- Finder Tab
local FinderTab = Window:MakeTab({
    Name = "Finder",
    Icon = "rbxassetid://6031071058",
    PremiumOnly = false
})

FinderTab:AddButton({
    Name = "Server Hop",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end
})

FinderTab:AddButton({
    Name = "Try find a target in server hop",
    Callback = function()
        print("Warning")
    end
})

FinderTab:AddButton({
    Name = "Join Small Server",
    Callback = function()
        local HttpService = game:GetService("HttpService")
        local TeleportService = game:GetService("TeleportService")
        local Players = game:GetService("Players")
        local function GetLowPlayerServer()
            local jobIdAtual = game.JobId
            local PlaceId = game.PlaceId
            local Cursor = nil
            local ListaFinal = {}

            for _ = 1, 10 do
                local url = "https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100"
                if Cursor then url = url .. "&cursor=" .. Cursor end

                local success, result = pcall(function()
                    return HttpService:JSONDecode(game:HttpGet(url))
                end)

                if success and result and result.data then
                    for _, server in pairs(result.data) do
                        if server.playing < server.maxPlayers and server.id ~= jobIdAtual then
                            table.insert(ListaFinal, server)
                        end
                    end
                    Cursor = result.nextPageCursor
                    if not Cursor then break end
                else
                    break
                end
            end

            if #ListaFinal > 0 then
                return ListaFinal[math.random(1, #ListaFinal)].id
            else
                return nil
            end
        end

        local targetServer = GetLowPlayerServer()
        if targetServer then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, targetServer, Players.LocalPlayer)
        else
            warn("Low players server Not found.")
        end
    end
})

FinderTab:AddButton({
    Name = "Warning: Try best low server",
    Callback = function()
        print("Low Server")
    end
})

-- Finalize UI
OrionLib:Init()
