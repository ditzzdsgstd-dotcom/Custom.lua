local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

pcall(function()
	CoreGui:FindFirstChild("ExampleUI"):Destroy()
end)

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "ExampleUI"
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling"
Gui.ResetOnSpawn = false

local Reopen = Instance.new("TextButton", Gui)
Reopen.Size = UDim2.new(0, 40, 0, 40)
Reopen.Position = UDim2.new(0, 20, 1, -60)
Reopen.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
Reopen.Text = "☰"
Reopen.TextColor3 = Color3.fromRGB(255, 255, 255)
Reopen.Font = Enum.Font.GothamBold
Reopen.TextSize = 20
Reopen.Visible = false
Instance.new("UICorner", Reopen).CornerRadius = UDim.new(1, 0)

local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 720, 0, 420)
Main.Position = UDim2.new(0.5, 0, 0.5, 20)
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(26, 26, 32)
Main.BackgroundTransparency = 1
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)

local Shadow = Instance.new("ImageLabel", Main)
Shadow.Image = "rbxassetid://1316045217"
Shadow.ImageTransparency = 1
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
Shadow.Size = UDim2.new(1, 60, 1, 60)
Shadow.Position = UDim2.new(0, -30, 0, -30)
Shadow.BackgroundTransparency = 1
Shadow.ZIndex = -1

local Header = Instance.new("TextLabel", Main)
Header.Text = "Example UI"
Header.Font = Enum.Font.GothamBlack
Header.TextSize = 20
Header.TextColor3 = Color3.fromRGB(255, 255, 255)
Header.BackgroundTransparency = 1
Header.Size = UDim2.new(1, -20, 0, 40)
Header.Position = UDim2.new(0, 15, 0, 10)
Header.TextXAlignment = Enum.TextXAlignment.Left

local Close = Instance.new("TextButton", Main)
Close.Size = UDim2.new(0, 35, 0, 35)
Close.Position = UDim2.new(1, -50, 0, 10)
Close.BackgroundColor3 = Color3.fromRGB(55, 55, 65)
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.Font = Enum.Font.GothamBold
Close.TextSize = 18
Instance.new("UICorner", Close).CornerRadius = UDim.new(1, 0)

local Sidebar = Instance.new("Frame", Main)
Sidebar.Size = UDim2.new(0, 60, 1, -60)
Sidebar.Position = UDim2.new(0, 0, 0, 60)
Sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 10)

TweenService:Create(Main, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
	BackgroundTransparency = 0,
	Position = UDim2.new(0.5, 0, 0.5, 0)
}):Play()

TweenService:Create(Shadow, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
	ImageTransparency = 0.4
}):Play()

Close.MouseButton1Click:Connect(function()
	Main.Visible = false
	Reopen.Visible = true
end)

Reopen.MouseButton1Click:Connect(function()
	Main.Visible = true
	Reopen.Visible = false
end)
