local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

-- Remove old UI if exists
pcall(function()
    CoreGui:FindFirstChild("YoxanXHubUI"):Destroy()
end)

-- ScreenGui
local Gui = Instance.new("ScreenGui")
Gui.Name = "YoxanXHubUI"
Gui.Parent = CoreGui
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.ResetOnSpawn = false

-- Main Frame
local Main = Instance.new("Frame")
Main.Name = "MainFrame"
Main.Size = UDim2.new(0, 680, 0, 400)
Main.Position = UDim2.new(0.5, 0, 0.5, 20)
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(28, 28, 32)
Main.BackgroundTransparency = 1
Main.BorderSizePixel = 0
Main.Parent = Gui

-- Rounded corners
local corner = Instance.new("UICorner", Main)
corner.CornerRadius = UDim.new(0, 12)

-- Border stroke
local stroke = Instance.new("UIStroke", Main)
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Color = Color3.fromRGB(70, 70, 85)
stroke.Thickness = 1.5

-- Shadow
local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.Image = "rbxassetid://1316045217"
Shadow.ImageTransparency = 1
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
Shadow.Size = UDim2.new(1, 60, 1, 60)
Shadow.Position = UDim2.new(0, -30, 0, -30)
Shadow.BackgroundTransparency = 1
Shadow.ZIndex = -1
Shadow.Parent = Main

-- Title
local Title = Instance.new("TextLabel", Main)
Title.Text = "YoxanXHub UI"
Title.Font = Enum.Font.GothamBlack
Title.TextSize = 20
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, -20, 0, 40)
Title.Position = UDim2.new(0, 10, 0, 10)
Title.TextXAlignment = Enum.TextXAlignment.Left

-- Tween Animation
TweenService:Create(Main, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    Position = UDim2.new(0.5, 0, 0.5, 0),
    BackgroundTransparency = 0
}):Play()

TweenService:Create(Shadow, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    ImageTransparency = 0.4
}):Play()
