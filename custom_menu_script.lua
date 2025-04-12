--// UI Setup
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "CustomMenuUI"
ScreenGui.ResetOnSpawn = false

--// Картинка-кнопка
local imageButton = Instance.new("ImageButton", ScreenGui)
imageButton.Size = UDim2.new(0, 60, 0, 60)
imageButton.Position = UDim2.new(0, 20, 0, 200)
imageButton.Image = "rbxthumb://type=Asset&id=91349943208870&w=420&h=420"
imageButton.BackgroundTransparency = 1
imageButton.Name = "OpenImage"
imageButton.ZIndex = 10

local imageUICorner = Instance.new("UICorner", imageButton)
imageUICorner.CornerRadius = UDim.new(1, 0)

--// Главное меню
local menuFrame = Instance.new("Frame", ScreenGui)
menuFrame.Size = UDim2.new(0, 400, 0, 300)
menuFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
menuFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
menuFrame.Visible = false
menuFrame.Active = true
menuFrame.Draggable = true
menuFrame.ZIndex = 20

local menuUICorner = Instance.new("UICorner", menuFrame)
menuUICorner.CornerRadius = UDim.new(0.05, 0)

--// Кнопка-крестик
local closeButton = Instance.new("TextButton", menuFrame)
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.fromRGB(180, 60, 60)
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextScaled = true
closeButton.ZIndex = 21

local closeCorner = Instance.new("UICorner", closeButton)
closeCorner.CornerRadius = UDim.new(1, 0)

--// Контейнер с прокруткой
local scroll = Instance.new("ScrollingFrame", menuFrame)
scroll.Size = UDim2.new(1, -20, 1, -50)
scroll.Position = UDim2.new(0, 10, 0, 40)
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.ScrollBarThickness = 8
scroll.BackgroundTransparency = 1
scroll.ZIndex = 20
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.ClipsDescendants = true

local UIListLayout = Instance.new("UIListLayout", scroll)
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

--// Функция создания кнопок
local function createRedButton(text, scriptUrl)
	local button = Instance.new("TextButton")
	button.Size = UDim2.new(0, 360, 0, 50)
	button.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
	button.TextColor3 = Color3.new(1, 1, 1)
	button.Font = Enum.Font.GothamBold
	button.TextScaled = true
	button.Text = text
	button.Parent = scroll
	button.ZIndex = 21

	local corner = Instance.new("UICorner", button)
	corner.CornerRadius = UDim.new(1, 0)

	button.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet(scriptUrl))()
	end)
end

--// Кнопки
createRedButton("Counter Blox", "https://raw.githubusercontent.com/uedan228/Happy-Hub/main/Counter%20Blox%3A%20Source%202")
createRedButton("Purple Auto Build", "https://raw.githubusercontent.com/catblox1346/StensUIReMake/refs/heads/main/Script/BoatBuilderHub")
createRedButton("Script with Cats", "https://raw.githubusercontent.com/TheRealAsu/BABFT/refs/heads/main/Jan25_Source.lua")
createRedButton("Ragdoll", "https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script")
createRedButton("Auto Build", "https://raw.githubusercontent.com/novakoolhub/Scripts/main/Scripts/NovBoatR1")

--// Кнопка для копирования пароля (всегда после Auto Build)
local passwordButton = Instance.new("TextButton")
passwordButton.Size = UDim2.new(0, 360, 0, 40)
passwordButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
passwordButton.TextColor3 = Color3.new(1, 1, 1)
passwordButton.Font = Enum.Font.GothamBold
passwordButton.TextScaled = true
passwordButton.Text = "Password: N-314159"
passwordButton.Parent = scroll
passwordButton.ZIndex = 21

local passwordCorner = Instance.new("UICorner", passwordButton)
passwordCorner.CornerRadius = UDim.new(1, 0)

passwordButton.MouseButton1Click:Connect(function()
	setclipboard("N-314159")
	passwordButton.Text = "Copied!"
	task.wait(1)
	passwordButton.Text = "Password: N-314159"
end)

-- Новые кнопки
createRedButton("Telekinesis", "https://raw.githubusercontent.com/thenormalchel/RbxScripts/refs/heads/main/MityHubByMe.lua")
createRedButton("Universal", "https://sirius.menu/script")

--// Открытие/закрытие
local menuOpen = false

imageButton.MouseButton1Click:Connect(function()
	if not menuOpen then
		menuOpen = true
		menuFrame.Visible = true
		imageButton.Visible = false
	end
end)

closeButton.MouseButton1Click:Connect(function()
	menuOpen = false
	menuFrame.Visible = false
	imageButton.Visible = true
end)
