local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- UI Setup
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "YoxanXHubUI"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- Main Frame
local Main = Instance.new("Frame", ScreenGui)
Main.Name = "MainFrame"
Main.Size = UDim2.new(0, 750, 0, 450)
Main.Position = UDim2.new(0.5, -375, 0.5, -225)
Main.BackgroundColor3 = Color3.fromRGB(30, 30, 35)

local MainCorner = Instance.new("UICorner", Main)
MainCorner.CornerRadius = UDim.new(0, 10)

-- Top Bar
local TopBar = Instance.new("Frame", Main)
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 50)
TopBar.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 8)

-- Username Display
local Username = Instance.new("TextLabel", TopBar)
Username.Text = "Hello, " .. LocalPlayer.Name
Username.Font = Enum.Font.GothamBold
Username.TextSize = 18
Username.TextColor3 = Color3.fromRGB(255, 255, 255)
Username.BackgroundTransparency = 1
Username.Size = UDim2.new(0, 300, 1, 0)
Username.Position = UDim2.new(0, 60, 0, 0)
Username.TextXAlignment = Enum.TextXAlignment.Left

-- Profile Icon
local ProfileImage = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
local Avatar = Instance.new("ImageLabel", TopBar)
Avatar.Image = ProfileImage
Avatar.Size = UDim2.new(0, 40, 0, 40)
Avatar.Position = UDim2.new(0, 10, 0.5, -20)
Avatar.BackgroundTransparency = 1
Instance.new("UICorner", Avatar).CornerRadius = UDim.new(1, 0)

-- Side Bar
local Sidebar = Instance.new("Frame", Main)
Sidebar.Size = UDim2.new(0, 60, 1, -50)
Sidebar.Position = UDim2.new(0, 0, 0, 50)
Sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 8)

-- Navigation Icons
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

-- Content Frame
local Content = Instance.new("Frame", Main)
Content.Name = "Content"
Content.Size = UDim2.new(1, -60, 1, -50)
Content.Position = UDim2.new(0, 60, 0, 50)
Content.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 8)

-- Example Content Card
local Card = Instance.new("Frame", Content)
Card.Size = UDim2.new(0, 220, 0, 100)
Card.Position = UDim2.new(0, 20, 0, 20)
Card.BackgroundColor3 = Color3.fromRGB(60, 20, 20)
Instance.new("UICorner", Card).CornerRadius = UDim.new(0, 8)

local CardLabel = Instance.new("TextLabel", Card)
CardLabel.Text = "Wave\nYour executor seems to support this script."
CardLabel.TextWrapped = true
CardLabel.Font = Enum.Font.Gotham
CardLabel.TextSize = 14
CardLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CardLabel.BackgroundTransparency = 1
CardLabel.Size = UDim2.new(1, -10, 1, -10)
CardLabel.Position = UDim2.new(0, 5, 0, 5)
CardLabel.TextXAlignment = Enum.TextXAlignment.Left
CardLabel.TextYAlignment = Enum.TextYAlignment.Top
