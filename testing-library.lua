local library = {} -- v2.5
function library:main(startingStatus)
	local main = {}

	local HUBGUI = Instance.new("ScreenGui")
	local MainFrame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local Container = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local Title = Instance.new("TextLabel")
	local Status = Instance.new("TextLabel")
	local ActualStatus = Instance.new("TextLabel")
	local ServerHop = Instance.new("TextButton")
	local UICorner_3 = Instance.new("UICorner")

	HUBGUI.Name = "HUBGUI"
	HUBGUI.Parent = game.CoreGui
	HUBGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	MainFrame.Name = "MainFrame"
	MainFrame.Parent = HUBGUI
	MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	MainFrame.BorderSizePixel = 0
	MainFrame.Position = UDim2.new(0, 0, 0.676470578, 0)
	MainFrame.Size = UDim2.new(0, 307, 0, 193)

	UICorner.Parent = MainFrame

	Container.Name = "Container"
	Container.Parent = MainFrame
	Container.Active = true
	Container.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Container.BackgroundTransparency = 1.000
	Container.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Container.BorderSizePixel = 0
	Container.Position = UDim2.new(0, 0, 0.290155441, 0)
	Container.Size = UDim2.new(0, 307, 0, 137)
	Container.CanvasSize = UDim2.new(0, 0, 0, 250)
	Container.ScrollBarThickness = 2

	UIListLayout.Parent = Container
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 2)

	Title.Name = "Title"
	Title.Parent = MainFrame
	Title.AnchorPoint = Vector2.new(0, 1)
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0, 0, 0, -5)
	Title.Size = UDim2.new(0, 307, 0, 18)
	Title.Font = Enum.Font.GothamMedium
	Title.Text = "Murder Mystery 2 | Server Finder"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 20.000

	Status.Name = "Status"
	Status.Parent = MainFrame
	Status.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Status.BackgroundTransparency = 1.000
	Status.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Status.BorderSizePixel = 0
	Status.Position = UDim2.new(0, 0, 0, 5)
	Status.Size = UDim2.new(0, 307, 0, 18)
	Status.Font = Enum.Font.GothamMedium
	Status.Text = "Status:"
	Status.TextColor3 = Color3.fromRGB(255, 255, 255)
	Status.TextSize = 17.000

	ActualStatus.Name = "ActualStatus"
	ActualStatus.Parent = MainFrame
	ActualStatus.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ActualStatus.BackgroundTransparency = 1.000
	ActualStatus.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ActualStatus.BorderSizePixel = 0
	ActualStatus.Position = UDim2.new(0, 0, 0, 23)
	ActualStatus.Size = UDim2.new(0, 307, 0, 18)
	ActualStatus.Font = Enum.Font.GothamMedium
	ActualStatus.Text = startingStatus or "Found Server"
	ActualStatus.TextColor3 = Color3.fromRGB(255, 255, 255)
	ActualStatus.TextSize = 14.000
	
	ServerHop.Name = "ServerHop"
	ServerHop.Parent = MainFrame
	ServerHop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ServerHop.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ServerHop.BorderSizePixel = 0
	ServerHop.Position = UDim2.new(0, 0, 1.05181348, 0)
	ServerHop.Size = UDim2.new(0, 307, 0, 16)
	ServerHop.Font = Enum.Font.SourceSans
	ServerHop.Text = "Server Hop (Click Me)"
	ServerHop.TextColor3 = Color3.fromRGB(0, 0, 0)
	ServerHop.TextSize = 14.000
	ServerHop.Visible = false

	UICorner_3.CornerRadius = UDim.new(0, 6)
	UICorner_3.Parent = ServerHop
	
	function main:updateStatus(status)
		ActualStatus.Text = status
	end
	
	function main:showServerHop(visible)
		ServerHop.Visible = visible
	end

	function main:addPlayer(playerName)
		local PlayerTemplate1 = Instance.new("TextLabel")
		local UICorner_2 = Instance.new("UICorner")

		PlayerTemplate1.Name = playerName
		PlayerTemplate1.Parent = Container
		PlayerTemplate1.AnchorPoint = Vector2.new(0, 1)
		PlayerTemplate1.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		PlayerTemplate1.BorderColor3 = Color3.fromRGB(0, 0, 0)
		PlayerTemplate1.BorderSizePixel = 0
		PlayerTemplate1.Position = UDim2.new(0, 0, 0, -5)
		PlayerTemplate1.Size = UDim2.new(0, 307, 0, 18)
		PlayerTemplate1.Font = Enum.Font.GothamMedium
		PlayerTemplate1.Text = playerName
		PlayerTemplate1.TextColor3 = Color3.fromRGB(255, 255, 255)
		PlayerTemplate1.TextSize = 16.000

		UICorner_2.CornerRadius = UDim.new(0, 4)
		UICorner_2.Parent = PlayerTemplate1

	end

	return main
end

return library
