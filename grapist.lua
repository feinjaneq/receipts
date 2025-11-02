-- Gui to Lua (mobile-friendly version)
-- Version: 3.3

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Instances
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")

-- Properties
ScreenGui.Parent = playerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.AnchorPoint = Vector2.new(0.5, 0.5)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5, 0, 0.4, 0)
Frame.Size = UDim2.new(0.8, 0, 0.3, 0) -- larger and responsive
UICorner.Parent = Frame

-- Title Label
TextLabel.Parent = Frame
TextLabel.AnchorPoint = Vector2.new(0.5, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.Position = UDim2.new(0.5, 0, 0.05, 0)
TextLabel.Size = UDim2.new(0.9, 0, 0.2, 0)
TextLabel.Font = Enum.Font.FredokaOne
TextLabel.Text = "ASTRO HUB AJ"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextWrapped = true

-- AutoJoiner Button
TextButton.Parent = Frame
TextButton.AnchorPoint = Vector2.new(0.5, 0)
TextButton.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.5, 0, 0.35, 0)
TextButton.Size = UDim2.new(0.9, 0, 0.35, 0)
TextButton.Font = Enum.Font.FredokaOne
TextButton.Text = "AUTOJOINER: OFF"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextScaled = true
TextButton.TextWrapped = true
UICorner_2.Parent = TextButton

-- Discord Label
TextLabel_2.Parent = Frame
TextLabel_2.AnchorPoint = Vector2.new(0.5, 0)
TextLabel_2.BackgroundTransparency = 1
TextLabel_2.Position = UDim2.new(0.5, 0, 0.75, 0)
TextLabel_2.Size = UDim2.new(0.9, 0, 0.15, 0)
TextLabel_2.Font = Enum.Font.FredokaOne
TextLabel_2.Text = "discord.gg/wR3rgRaDjN"
TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.TextScaled = true
TextLabel_2.TextWrapped = true

-- Button logic
TextButton.MouseButton1Click:Connect(function()
	if TextButton.Text == "AUTOJOINER: OFF" then
		TextButton.Text = "AUTOJOINER: ON"
		pcall(function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/iw929wiwiw/Protector-/refs/heads/main/Secret%20Finder"))()
		end)
	else
		TextButton.Text = "AUTOJOINER: OFF"
	end
end)

-- Drag logic
local dragging = false
local dragInput, mousePos, framePos

local function update(input)
	local delta = input.Position - mousePos
	Frame.Position = UDim2.new(
		framePos.X.Scale,
		framePos.X.Offset + delta.X,
		framePos.Y.Scale,
		framePos.Y.Offset + delta.Y
	)
end

Frame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		mousePos = input.Position
		framePos = Frame.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

Frame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == dragInput and dragging then
		update(input)
	end
end)
