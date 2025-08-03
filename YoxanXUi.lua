local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Clear old UI
pcall(function()
    CoreGui:FindFirstChild("YoxanXHubUI"):Destroy()
end)

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "YoxanXHubUI"
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Reopen Button (Initially hidden)
local ReopenBtn = Instance.new("TextButton", Gui)
ReopenBtn.Size = UDim2.new(0, 40, 0, 40)
ReopenBtn.Position = UDim2.new(0, 15, 1, -60)
ReopenBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
ReopenBtn.Text = "☰"
ReopenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ReopenBtn.TextSize = 22
ReopenBtn.Font = Enum.Font.GothamBold
ReopenBtn.Visible = false
Instance.new("UICorner", ReopenBtn).CornerRadius = UDim.new(1, 0)

-- Main Frame
local Main = Instance.new("Frame", Gui)
Main.Name = "MainFrame"
Main.Size = UDim2.new(0, 680, 0, 400)
Main.Position = UDim2.new(0.5, 0, 0.5, 20)
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(28, 28, 32)
Main.BackgroundTransparency = 1
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)

-- Shadow
local Shadow = Instance.new("ImageLabel", Main)
Shadow.Image = "rbxassetid://1316045217"
Shadow.ImageTransparency = 1
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
Shadow.Size = UDim2.new(1, 60, 1, 60)
Shadow.Position = UDim2.new(0, -30, 0, -30)
Shadow.BackgroundTransparency = 1
Shadow.ZIndex = -1

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

-- Close Button
local Close = Instance.new("TextButton", Main)
Close.Size = UDim2.new(0, 35, 0, 35)
Close.Position = UDim2.new(1, -45, 0, 10)
Close.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.Font = Enum.Font.GothamBold
Close.TextSize = 18
Instance.new("UICorner", Close).CornerRadius = UDim.new(1, 0)

Close.MouseButton1Click:Connect(function()
    Main.Visible = false
    ReopenBtn.Visible = true
end)

ReopenBtn.MouseButton1Click:Connect(function()
    Main.Visible = true
    ReopenBtn.Visible = false
end)

-- Opening Animation
TweenService:Create(Main, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    BackgroundTransparency = 0,
    Position = UDim2.new(0.5, 0, 0.5, 0)
}):Play()

TweenService:Create(Shadow, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    ImageTransparency = 0.4
}):Play()
