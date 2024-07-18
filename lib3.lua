local library = {}

local UIS = game:GetService('UserInputService')


function library:Main(startingStatus)
	local main = {}
	
	local Main = Instance.new("ScreenGui")
	local MainFrame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local DropShadow = Instance.new("ImageLabel")
	local Title = Instance.new("TextLabel")
	local Status = Instance.new("TextLabel")
	local Container = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local ServerHop = Instance.new("TextButton")
	local ServerHopCorner = Instance.new("UICorner")
	
	Main.Name = "Main"
	Main.Parent = game.CoreGui

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = Main
	MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MainFrame.BorderSizePixel = 0
	MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	MainFrame.Size = UDim2.new(0, 450, 0, 330)
	
	local frame = MainFrame
	local dragToggle = nil
	local dragStart = nil
	local startPos = nil
	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		frame.Position = position
	end

	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)

	UICorner.CornerRadius = UDim.new(0, 4)
	UICorner.Parent = MainFrame

	DropShadow.Name = "DropShadow"
	DropShadow.Parent = MainFrame
	DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow.BackgroundTransparency = 1.000
	DropShadow.BorderSizePixel = 0
	DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropShadow.Size = UDim2.new(1, 49, 1, 49)
	DropShadow.ZIndex = 0
	DropShadow.Image = "rbxassetid://6014261993"
	DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	DropShadow.ImageTransparency = 0.300
	DropShadow.ScaleType = Enum.ScaleType.Slice
	DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

	Title.Name = "Title"
	Title.Parent = MainFrame
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0, 0, 0.0199999996, 0)
	Title.Size = UDim2.new(1, 0, 0, 16)
	Title.Font = Enum.Font.GothamBold
	Title.Text = "Murder Mystery 2 | Server Utility v3"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 17.000

	Status.Name = "Status"
	Status.Parent = MainFrame
	Status.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Status.BackgroundTransparency = 1.000
	Status.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Status.BorderSizePixel = 0
	Status.Position = UDim2.new(0, 0, 0.0828571394, 0)
	Status.Size = UDim2.new(1, 0, 0, 16)
	Status.Font = Enum.Font.Gotham
	Status.Text = '<b>Status: <b> ' .. startingStatus
	Status.TextColor3 = Color3.fromRGB(255, 255, 255)
	Status.TextSize = 17.000
	Status.RichText = true

	Container.Name = "Container"
	Container.Parent = MainFrame
	Container.Active = true
	Container.AnchorPoint = Vector2.new(0.5, 0)
	Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Container.BackgroundTransparency = 0.980
	Container.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Container.BorderSizePixel = 0
	Container.Position = UDim2.new(0.5, 0, 0.159999996, 0)
	Container.Size = UDim2.new(1, -65, 0.374142885, 100)
	Container.CanvasSize = UDim2.new(0, 0, 1, 30)
	Container.ScrollBarThickness = 0

	UIListLayout.Parent = Container
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 5)
	
	ServerHop.Name = "ServerHop"
	ServerHop.Parent = MainFrame
	ServerHop.AnchorPoint = Vector2.new(0.5, 0)
	ServerHop.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	ServerHop.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ServerHop.BorderSizePixel = 0
	ServerHop.Position = UDim2.new(0.5, 0, 1, -45)
	ServerHop.Size = UDim2.new(0, 200, 0, 40)
	ServerHop.Font = Enum.Font.Gotham
	ServerHop.Text = "Server Hop"
	ServerHop.TextColor3 = Color3.fromRGB(255, 255, 255)
	ServerHop.TextSize = 14.000

	ServerHopCorner.CornerRadius = UDim.new(0, 4)
	ServerHopCorner.Name = "ServerHopCorner"
	ServerHopCorner.Parent = ServerHop
	
	local function isPlayerOnMobile()
		return UIS.TouchEnabled
	end
	
	function main:UpdateStatus(status)
		Status.Text = '<b>Status: <b> ' .. status
	end
	
	function main:AddPlayer(playerName)
		local playerToAdd = game.Players:FindFirstChild(playerName)
		if playerToAdd then
			local DisplayName = playerToAdd.DisplayName
			local Name = playerToAdd.Name

			local NewText = Name .. " (" .. DisplayName .. ")"
			local Example = Instance.new("TextButton")
			local UICorner_2 = Instance.new("UICorner")
			local DeviceIcon = Instance.new("ImageLabel")

			Example.Name = NewText
			Example.Parent = Container
			Example.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
			Example.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Example.BorderSizePixel = 0
			Example.Size = UDim2.new(1, -6, 0, 30)
			Example.Font = Enum.Font.Gotham
			Example.Text = NewText
			Example.TextColor3 = Color3.fromRGB(255, 255, 255)
			Example.TextSize = 14.000

			UICorner_2.CornerRadius = UDim.new(0, 4)
			UICorner_2.Parent = Example


			--[[
				Phone Icon: "rbxassetid://18551405377"
				PC Icon: "rbxassetid://18551420107"
			]]
			
			DeviceIcon.Name = "DeviceIcon"
			DeviceIcon.Parent = Example
			DeviceIcon.AnchorPoint = Vector2.new(0, 0.5)
			DeviceIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DeviceIcon.BackgroundTransparency = 1.000
			DeviceIcon.BorderColor3 = Color3.fromRGB(0, 0, 0)
			DeviceIcon.BorderSizePixel = 0
			DeviceIcon.Position = UDim2.new(1, -30, 0.5, 0)
			DeviceIcon.Size = UDim2.new(0, 25, 0, 25)
			DeviceIcon.Image = "rbxassetid://18551718784"
		end
	end
	
	function main:SetCallBack(x)
		ServerHop.MouseButton1Click:Connect(x)
	end
	
	
	return main
end

return library
