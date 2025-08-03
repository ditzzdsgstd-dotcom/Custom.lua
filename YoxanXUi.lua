local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")

pcall(function()
    CoreGui:FindFirstChild("YoxanXHubUI"):Destroy()
end)

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "YoxanXHubUI"
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Reopen button
local ReopenBtn = Instance.new("TextButton", Gui)
ReopenBtn.Size = UDim2.new(0, 40, 0, 40)
ReopenBtn.Position = UDim2.new(0, 20, 1, -60)
ReopenBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
ReopenBtn.Text = "☰"
ReopenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ReopenBtn.TextSize = 20
ReopenBtn.Font = Enum.Font.GothamBold
ReopenBtn.Visible = false
Instance.new("UICorner", ReopenBtn).CornerRadius = UDim.new(1, 0)

-- Main Frame
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 720, 0, 420)
Main.Position = UDim2.new(0.5, 0, 0.5, 20)
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
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
local Header = Instance.new("TextLabel", Main)
Header.Text = "YoxanXHub UI"
Header.Font = Enum.Font.GothamBlack
Header.TextSize = 20
Header.TextColor3 = Color3.fromRGB(255, 255, 255)
Header.BackgroundTransparency = 1
Header.Size = UDim2.new(1, -20, 0, 40)
Header.Position = UDim2.new(0, 15, 0, 10)
Header.TextXAlignment = Enum.TextXAlignment.Left

-- Close Button
local CloseBtn = Instance.new("TextButton", Main)
CloseBtn.Size = UDim2.new(0, 35, 0, 35)
CloseBtn.Position = UDim2.new(1, -50, 0, 10)
CloseBtn.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 18
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(1, 0)

-- Sidebar base (Part 2/5 placeholder)
local Sidebar = Instance.new("Frame", Main)
Sidebar.Size = UDim2.new(0, 60, 1, -60)
Sidebar.Position = UDim2.new(0, 0, 0, 60)
Sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 10)

-- Show animation
TweenService:Create(Main, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    BackgroundTransparency = 0,
    Position = UDim2.new(0.5, 0, 0.5, 0)
}):Play()

TweenService:Create(Shadow, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
    ImageTransparency = 0.4
}):Play()

-- Close logic
CloseBtn.MouseButton1Click:Connect(function()
    Main.Visible = false
    ReopenBtn.Visible = true
end)

ReopenBtn.MouseButton1Click:Connect(function()
    Main.Visible = true
    ReopenBtn.Visible = false
end)
