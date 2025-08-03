local ts = game:GetService("TweenService")
local cg = game:GetService("CoreGui")

pcall(function() cg:FindFirstChild("ExampleUI"):Destroy() end)

local gui = Instance.new("ScreenGui", cg)
gui.Name = "ExampleUI"
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling"
gui.ResetOnSpawn = false

local reopen = Instance.new("TextButton", gui)
reopen.Size = UDim2.new(0, 40, 0, 40)
reopen.Position = UDim2.new(0, 20, 1, -60)
reopen.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
reopen.Text = "☰"
reopen.TextColor3 = Color3.new(1,1,1)
reopen.Font = Enum.Font.GothamBold
reopen.TextSize = 20
reopen.Visible = false
Instance.new("UICorner", reopen).CornerRadius = UDim.new(1,0)

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 700, 0, 400)
main.Position = UDim2.new(0.5, 0, 0.5, 20)
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
main.BackgroundTransparency = 1
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)

local glow = Instance.new("UIStroke", main)
glow.Thickness = 2
glow.Color = Color3.fromRGB(0, 200, 255)
glow.Transparency = 1
glow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local shadow = Instance.new("ImageLabel", main)
shadow.Image = "rbxassetid://1316045217"
shadow.ImageTransparency = 1
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10,10,118,118)
shadow.Size = UDim2.new(1,60,1,60)
shadow.Position = UDim2.new(0,-30,0,-30)
shadow.BackgroundTransparency = 1
shadow.ZIndex = -1

local title = Instance.new("TextLabel", main)
title.Text = "Example UI"
title.Font = Enum.Font.GothamBlack
title.TextSize = 22
title.TextColor3 = Color3.fromRGB(0,255,255)
title.BackgroundTransparency = 1
title.Size = UDim2.new(1,-20,0,40)
title.Position = UDim2.new(0,15,0,10)
title.TextXAlignment = Enum.TextXAlignment.Left

local close = Instance.new("TextButton", main)
close.Size = UDim2.new(0,35,0,35)
close.Position = UDim2.new(1,-50,0,10)
close.BackgroundColor3 = Color3.fromRGB(0,150,255)
close.Text = "X"
close.TextColor3 = Color3.new(1,1,1)
close.Font = Enum.Font.GothamBold
close.TextSize = 18
Instance.new("UICorner", close).CornerRadius = UDim.new(1,0)

local tabs = Instance.new("Frame", main)
tabs.Size = UDim2.new(0, 60, 1, -60)
tabs.Position = UDim2.new(0, 0, 0, 60)
tabs.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
Instance.new("UICorner", tabs).CornerRadius = UDim.new(0, 8)

ts:Create(main, TweenInfo.new(0.4), {
	BackgroundTransparency = 0
}):Play()
ts:Create(shadow, TweenInfo.new(0.4), {
	ImageTransparency = 0.4
}):Play()
ts:Create(glow, TweenInfo.new(0.5), {
	Transparency = 0
}):Play()

close.MouseButton1Click:Connect(function()
	main.Visible = false
	reopen.Visible = true
end)
reopen.MouseButton1Click:Connect(function()
	main.Visible = true
	reopen.Visible = false
end)
