local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- UI Setup
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "YoxanXHubUI"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- Responsive scale
local scale = Instance.new("UIScale", ScreenGui)
scale.Scale = 1

-- Main Frame
local Main = Instance.new("Frame", ScreenGui)
Main.Name = "MainFrame"
Main.Size = UDim2.new(0, 750, 0, 450)
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
Main.BorderSizePixel = 0

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)
local stroke = Instance.new("UIStroke", Main)
stroke.Color = Color3.fromRGB(60, 60, 70)
stroke.Thickness = 1.5
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local gradient = Instance.new("UIGradient", Main)
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(35,35,40)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(25,25,28))
}

-- Dragging Support
local dragging, dragInput, dragStart, startPos
Main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
Main.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)
UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Top Bar
local TopBar = Instance.new("Frame", Main)
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 50)
TopBar.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 8)

-- Close Button
local CloseBtn = Instance.new("TextButton", TopBar)
CloseBtn.Size = UDim2.new(0, 40, 0, 40)
CloseBtn.Position = UDim2.new(1, -45, 0.5, -20)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 18
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(1, 0)

-- Reopen Icon (Hidden by default)
local ReopenBtn = Instance.new("TextButton", ScreenGui)
ReopenBtn.Size = UDim2.new(0, 40, 0, 40)
ReopenBtn.Position = UDim2.new(0, 15, 1, -55)
ReopenBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
ReopenBtn.Text = "☰"
ReopenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ReopenBtn.Font = Enum.Font.GothamBold
ReopenBtn.TextSize = 22
Instance.new("UICorner", ReopenBtn).CornerRadius = UDim.new(1, 0)
ReopenBtn.Visible = false

CloseBtn.MouseButton1Click:Connect(function()
    Main.Visible = false
    ReopenBtn.Visible = true
end)

ReopenBtn.MouseButton1Click:Connect(function()
    Main.Visible = true
    ReopenBtn.Visible = false
end)

-- Username
local Username = Instance.new("TextLabel", TopBar)
Username.Text = "Hello, " .. LocalPlayer.Name
Username.Font = Enum.Font.GothamBold
Username.TextSize = 18
Username.TextColor3 = Color3.fromRGB(255, 255, 255)
Username.BackgroundTransparency = 1
Username.Size = UDim2.new(0, 300, 1, 0)
Username.Position = UDim2.new(0, 60, 0, 0)
Username.TextXAlignment = Enum.TextXAlignment.Left

-- Avatar
local avatarUrl = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
local Avatar = Instance.new("ImageLabel", TopBar)
Avatar.Image = avatarUrl
Avatar.Size = UDim2.new(0, 40, 0, 40)
Avatar.Position = UDim2.new(0, 10, 0.5, -20)
Avatar.BackgroundTransparency = 1
Instance.new("UICorner", Avatar).CornerRadius = UDim.new(1, 0)

-- Sidebar
local Sidebar = Instance.new("Frame", Main)
Sidebar.Size = UDim2.new(0, 60, 1, -50)
Sidebar.Position = UDim2.new(0, 0, 0, 50)
Sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 8)

local icons = {
    {name = "Home", image = "rbxassetid://7734053493"},
    {name = "Friends", image = "rbxassetid://7733920766"},
    {name = "Server", image = "rbxassetid://7733960981"},
    {name = "Discord", image = "rbxassetid://7734068321"}
}

for i, icon in ipairs(icons) do
    local Button = Instance.new("ImageButton", Sidebar)
    Button.Name = icon.name
    Button.Image = icon.image
    Button.Size = UDim2.new(0, 40, 0, 40)
    Button.Position = UDim2.new(0.5, -20, 0, (i - 1) * 50 + 10)
    Button.BackgroundTransparency = 1
end

-- Content Area
local Content = Instance.new("Frame", Main)
Content.Name = "Content"
Content.Size = UDim2.new(1, -60, 1, -50)
Content.Position = UDim2.new(0, 60, 0, 50)
Content.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 8)

-- Welcome Panel
local Card = Instance.new("Frame", Content)
Card.Size = UDim2.new(0, 220, 0, 100)
Card.Position = UDim2.new(0, 20, 0, 20)
Card.BackgroundColor3 = Color3.fromRGB(60, 20, 20)
Instance.new("UICorner", Card).CornerRadius = UDim.new(0, 8)

local CardLabel = Instance.new("TextLabel", Card)
CardLabel.Text = "Welcome to YoxanXHub!"
CardLabel.TextWrapped = true
CardLabel.Font = Enum.Font.Gotham
CardLabel.TextSize = 14
CardLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CardLabel.BackgroundTransparency = 1
CardLabel.Size = UDim2.new(1, -10, 1, -10)
CardLabel.Position = UDim2.new(0, 5, 0, 5)
CardLabel.TextXAlignment = Enum.TextXAlignment.Left
CardLabel.TextYAlignment = Enum.TextYAlignment.Top
