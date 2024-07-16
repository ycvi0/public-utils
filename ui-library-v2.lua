---fixed server hop button
local lib = {}

function lib:Main(startingStatus)
	local main = {}
	
	local Main = Instance.new("ScreenGui")
	local MainFrame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Title = Instance.new("TextLabel")
	local UIPadding = Instance.new("UIPadding")
	local DropShadow = Instance.new("ImageLabel")
	local Status = Instance.new("TextLabel")
	local ServerHop = Instance.new("TextButton")
	local UICorner_2 = Instance.new("UICorner")
	local Container = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local UIPadding_2 = Instance.new("UIPadding")
	local UICorner_4 = Instance.new("UICorner")
	local UIStroke = Instance.new("UIStroke")
	local UIStroke_3 = Instance.new("UIStroke")

	Main.Name = "Main"
	Main.Parent = game.CoreGui

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = Main
	MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MainFrame.BorderSizePixel = 0
	MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	MainFrame.Size = UDim2.new(0, 400, 0, 280)
	
	local UIS = game:GetService('UserInputService')
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

	UICorner.Parent = MainFrame

	Title.Name = "Title"
	Title.Parent = MainFrame
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Size = UDim2.new(1, 0, 0, 22)
	Title.Font = Enum.Font.GothamMedium
	Title.Text = "Murder Mystery 2 | Server Utility"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 18.000

	UIPadding.Parent = Title
	UIPadding.PaddingTop = UDim.new(0, 3)

	DropShadow.Name = "DropShadow"
	DropShadow.Parent = MainFrame
	DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow.BackgroundTransparency = 1.000
	DropShadow.BorderSizePixel = 0
	DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
	DropShadow.Size = UDim2.new(1, 51, 1, 51)
	DropShadow.ZIndex = 0
	DropShadow.Image = "rbxassetid://6014261993"
	DropShadow.ImageColor3 = Color3.fromRGB(3, 255, 163)
	DropShadow.ImageTransparency = 0.250
	DropShadow.ScaleType = Enum.ScaleType.Slice
	DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

	Status.Name = "Status"
	Status.Parent = MainFrame
	Status.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Status.BackgroundTransparency = 1.000
	Status.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Status.BorderSizePixel = 0
	Status.Position = UDim2.new(0, 0, 0, 24)
	Status.Size = UDim2.new(1, 0, 0, 22)
	Status.Font = Enum.Font.Gotham
	Status.Text = '<font color="#03ffa3">Status: </font> ' .. startingStatus
	Status.TextColor3 = Color3.fromRGB(255, 255, 255)
	Status.TextSize = 16.000
	Status.RichText = true

	ServerHop.Name = "ServerHop"
	ServerHop.Parent = MainFrame
	ServerHop.AnchorPoint = Vector2.new(0.5, 1)
	ServerHop.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	ServerHop.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ServerHop.BorderSizePixel = 0
	ServerHop.Position = UDim2.new(0.5, 0, 1, -8)
	ServerHop.Size = UDim2.new(0, 200, 0, 30)
	ServerHop.Font = Enum.Font.Gotham
	ServerHop.Text = "Server Hop"
	ServerHop.TextColor3 = Color3.fromRGB(255, 255, 255)
	ServerHop.TextSize = 14.000

	UICorner_2.Parent = ServerHop

	UIStroke_3.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
	UIStroke_3.Color = Color3.fromRGB(132,132,132)
	UIStroke_3.Thickness = 0.6
	UIStroke_3.Parent = ServerHop

	Container.Name = "Container"
	Container.Parent = MainFrame
	Container.Active = true
	Container.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	Container.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Container.BorderSizePixel = 0
	Container.Position = UDim2.new(0.0500000007, 0, 0.317857146, -40)
	Container.Size = UDim2.new(0.899999976, 0, 0.649999976, 0)
	Container.CanvasSize = UDim2.new(0, 0, 1, 10)
	Container.ScrollBarThickness = 0

	UIListLayout.Parent = Container
	UIListLayout.Padding = UDim.new(0, 5)
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	UIPadding_2.Parent = Container
	UIPadding_2.PaddingTop = UDim.new(0, 4)
	
	UICorner_4.CornerRadius = UDim.new(0, 0)
	UICorner_4.Parent = Container

	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
	UIStroke.Color = Color3.fromRGB(132,132,132)
	UIStroke.Thickness = 0.6
	UIStroke.Parent = Container
	
	function main:UpdateStatus(status)
		Status.Text = '<font color="#03ffa3">Status: </font> ' .. status
	end
	
	function main:AddPlayer(playerName)
		local playerToAdd = game.Players:FindFirstChild(playerName)
		if playerToAdd then
			local DisplayName = playerToAdd.DisplayName
			local Name = playerToAdd.Name
			
			local NewText = Name .. " (" .. DisplayName .. ")"
				
			local PlayerExample = Instance.new("TextLabel")
			local UICorner_3 = Instance.new("UICorner")
			local UIStroke_2 = Instance.new("UIStroke")
			
			PlayerExample.Name = NewText
			PlayerExample.Parent = Container
			PlayerExample.BackgroundColor3 = Color3.fromRGB(47, 47, 47)
			PlayerExample.BorderColor3 = Color3.fromRGB(0, 0, 0)
			PlayerExample.BorderSizePixel = 0
			PlayerExample.Size = UDim2.new(1, -10, 0, 20)
			PlayerExample.Font = Enum.Font.SourceSans
			PlayerExample.Text = NewText
			PlayerExample.TextColor3 = Color3.fromRGB(255, 255, 255)
			PlayerExample.TextSize = 14.000

			UICorner_3.CornerRadius = UDim.new(0, 4)
			UICorner_3.Parent = PlayerExample

			UIStroke_2.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
			UIStroke_2.Color = Color3.fromRGB(132,132,132)
			UIStroke_2.Thickness = 0.6
			UIStroke_2.Parent = PlayerExample
		end
	end
	
	function main:SetCallBack(x)
		ServerHop.MouseButton1Click:Connect(x)
	end
	
	return main
end

return lib
