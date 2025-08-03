-- YoxanXHub | Steal a Brainrot | Part 1/2

-- Game whitelist
local allowedPlaceIds = {
    [96342491571673] = true, -- New Player Server
    [109983668079237] = true -- Normal Server
}

if not allowedPlaceIds[game.PlaceId] then
    game.Players.LocalPlayer:Kick("This game is not supported.")
    return
end

-- Load OrionLib
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/1nig1htmare1234/SCRIPTS/main/Orion.lua"))()
local Window = OrionLib:MakeWindow({
    Name = "YoxanXHub | Steal a Brainrot",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "YoxanXHub_SAB"
})

local player = game.Players.LocalPlayer
local savedBaseCFrame = nil

-- Info Tab
local InfoTab = Window:MakeTab({
    Name = "Info",
    Icon = "rbxassetid://6023426926",
    PremiumOnly = false
})

InfoTab:AddParagraph("About", "YoxanXHub - Script for Steal a Brainrot\nVersion: 1.0\nDiscord: discord.gg/Az8Cm2F6")

InfoTab:AddButton({
    Name = "Copy Discord Link",
    Callback = function()
        setclipboard("https://discord.gg/Az8Cm2F6")
    end
})

-- Main Tab
local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://6031280882",
    PremiumOnly = false
})

MainTab:AddToggle({
    Name = "Godmode",
    Default = false,
    Callback = function(state)
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if state and humanoid then
            local clone = humanoid:Clone()
            clone.Parent = character
            humanoid:Destroy()
            clone.Name = "Humanoid"
            workspace.CurrentCamera.CameraSubject = clone
        else
            warn("Reset your character to disable Godmode.")
        end
    end
})

MainTab:AddButton({
    Name = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, player)
    end
})

-- Steal Tab
local StealTab = Window:MakeTab({
    Name = "Steal",
    Icon = "rbxassetid://6031260798",
    PremiumOnly = false
})

StealTab:AddButton({
    Name = "📍 Save Base Location",
    Callback = function()
        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            savedBaseCFrame = hrp.CFrame
            OrionLib:MakeNotification({
                Name = "Location Saved",
                Content = "Current position saved as base.",
                Time = 3
            })
        end
    end
})

StealTab:AddButton({
    Name = "🚀 Teleport to Base",
    Callback = function()
        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if hrp and savedBaseCFrame then
            hrp.CFrame = savedBaseCFrame
            OrionLib:MakeNotification({
                Name = "Teleported",
                Content = "Teleported to saved base location.",
                Time = 3
            })
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "No base saved. Use Save Base Location first.",
                Time = 3
            })
        end
    end
})

StealTab:AddButton({
    Name = "⬆️ Float Up",
    Callback = function()
        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = hrp.CFrame + Vector3.new(0, 200, 0)
        end
    end
})

StealTab:AddButton({
    Name = "⚡ Speed Boost (94)",
    Callback = function()
        local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        if hum then hum.WalkSpeed = 94 end
    end
})

StealTab:AddToggle({
    Name = "🌀 Double Jump",
    Default = false,
    Callback = function(state)
        local UIS = game:GetService("UserInputService")
        local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
        local canDouble = true
        if state then
            hum.StateChanged:Connect(function(_, s)
                if s == Enum.HumanoidStateType.Landed then
                    canDouble = true
                end
            end)
            UIS.JumpRequest:Connect(function()
                if hum.FloorMaterial == Enum.Material.Air and canDouble then
                    canDouble = false
                    hum:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        end
    end
})

StealTab:AddButton({
    Name = "💥 Instant Steal",
    Callback = function()
        local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        hrp.CFrame = hrp.CFrame + Vector3.new(0, 200, 0)

        OrionLib:MakeNotification({
            Name = "Steal Started",
            Content = "Floating up... teleporting to base shortly.",
            Time = 2
        })

        task.delay(1.5, function()
            if savedBaseCFrame then
                hrp.CFrame = savedBaseCFrame
                OrionLib:MakeNotification({
                    Name = "Returned",
                    Content = "You returned to your base.",
                    Time = 3
                })
            else
                OrionLib:MakeNotification({
                    Name = "No Base Saved",
                    Content = "Use 'Save Base Location' first.",
                    Time = 3
                })
            end
        end)
    end
})

-- Init UI
OrionLib:Init()
-- YoxanXHub | Steal a Brainrot | Part 2/2

-- Continue from Part 1/2
local OrionLib = OrionLib or nil
if not OrionLib then
    warn("OrionLib not loaded. Please run Part 1/2 first.")
    return
end

local player = game.Players.LocalPlayer

-- Visual Tab
local VisualTab = Window:MakeTab({
    Name = "Visual",
    Icon = "rbxassetid://6031075938",
    PremiumOnly = false
})

-- ESP Toggle (Player ESP)
VisualTab:AddToggle({
    Name = "👁️ Player ESP",
    Default = false,
    Callback = function(state)
        local Players = game:GetService("Players")

        local function createESP(targetPlayer)
            if targetPlayer == player then return end
            local char = targetPlayer.Character or targetPlayer.CharacterAdded:Wait()
            local head = char:WaitForChild("Head", 2)
            if not head then return end

            if not head:FindFirstChild("YoxanX_ESP") then
                local esp = Instance.new("BillboardGui")
                esp.Name = "YoxanX_ESP"
                esp.Adornee = head
                esp.Size = UDim2.new(0, 50, 0, 50)
                esp.StudsOffset = Vector3.new(0, 2, 0)
                esp.AlwaysOnTop = true
                esp.Parent = head

                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(1, 0, 1, 0)
                frame.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
                frame.BackgroundTransparency = 0.25
                frame.BorderSizePixel = 0
                frame.Parent = esp

                local label = Instance.new("TextLabel")
                label.Size = UDim2.new(1, 0, 0.5, 0)
                label.Position = UDim2.new(0, 0, -0.5, 0)
                label.Text = targetPlayer.Name
                label.BackgroundTransparency = 1
                label.TextColor3 = Color3.new(1, 1, 1)
                label.Font = Enum.Font.SourceSansBold
                label.TextSize = 14
                label.Parent = esp
            end
        end

        local function removeESP(targetPlayer)
            local char = targetPlayer.Character
            if char and char:FindFirstChild("Head") then
                local head = char.Head
                if head:FindFirstChild("YoxanX_ESP") then
                    head.YoxanX_ESP:Destroy()
                end
            end
        end

        for _, p in pairs(Players:GetPlayers()) do
            if state then
                createESP(p)
            else
                removeESP(p)
            end
        end

        Players.PlayerAdded:Connect(function(p)
            if state then
                task.wait(1)
                createESP(p)
            end
        end)

        Players.PlayerRemoving:Connect(function(p)
            removeESP(p)
        end)
    end
})

-- Player Count
VisualTab:AddButton({
    Name = "👥 Show Player Count",
    Callback = function()
        local count = #game.Players:GetPlayers()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Player Count",
            Text = "There are " .. count .. " players in the game.",
            Duration = 5
        })
    end
})

-- Anti Lag Button
VisualTab:AddButton({
    Name = "🧹 Anti-Lag Mode",
    Callback = function()
        local ws = game:GetService("Workspace")
        local lighting = game:GetService("Lighting")

        for _, v in pairs(ws:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
                v.CastShadow = false
            elseif v:IsA("Decal") or v:IsA("Texture") or v:IsA("ParticleEmitter") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
                v:Destroy()
            elseif v:IsA("PointLight") or v:IsA("SurfaceLight") or v:IsA("SpotLight") then
                v.Enabled = false
            end
        end

        lighting.GlobalShadows = false
        lighting.FogEnd = 1e10
        lighting.Brightness = 0
        lighting.ClockTime = 14

        OrionLib:MakeNotification({
            Name = "Anti-Lag Activated",
            Content = "Performance optimized for low-end devices.",
            Time = 4
        })
    end
})

-- Done
OrionLib:MakeNotification({
    Name = "YoxanXHub Loaded",
    Content = "Part 2/2 fully loaded! Have fun.",
    Time = 3
})
