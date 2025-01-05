asset = 0
cloned = nil
target = nil
selection = nil

x, y, z = 0, 0, 0

local function Divide(part, targetBlockSize)
    local result = {}

	local function Elw(vec, op)
		return Vector3.new(op(vec.X), op(vec.Y), op(vec.Z))
	end
	
	local blockCount = Elw(part.Size, function(l) return math.floor(l / targetBlockSize) end)
	local blockSize = part.Size / blockCount
	
	for x = 1, blockCount.X do
		for y = 1, blockCount.Y do
			for z = 1, blockCount.Z do
				local offset = (part.Size + blockSize) / 2.0
				local block = Instance.new("Part")
                block.Parent = game.ReplicatedStorage
				block.Size = blockSize
				block.CFrame = part.CFrame:ToWorldSpace(CFrame.new(Vector3.new(x,y,z) * blockSize - offset))
				block.Anchored = true
                table.insert(result, block.CFrame)
			end
		end
	end

    return result
end

function fill(a, b, asset)
    local difference = b.Position - a.Position
    local temporary = a:Clone()
    temporary.Transparency = 0.5
    temporary.Anchored = true
    temporary.Parent = workspace
    temporary.Position = ((a.Position + b.Position) / 2)
    temporary.Size = Vector3.new(math.abs(difference.X) + 4, math.abs(difference.Y) + 4, math.abs(difference.Z) + 4)

    local parts = Divide(temporary, 4)
    for i, v in parts do
        if v == a.Position then continue end
        task.spawn(function()
            game:GetService("ReplicatedStorage").BuildingBridge.Stamp:InvokeServer(asset, v)
        end)
        task.wait()
    end
    temporary:Destroy()
    game:GetService('ReplicatedStorage').BuildingBridge.Delete:InvokeServer(target)
end

-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local LabelX = Instance.new("TextLabel")
local MinusX = Instance.new("TextButton")
local PlusX = Instance.new("TextButton")
local LabelY = Instance.new("TextLabel")
local MinusY = Instance.new("TextButton")
local PlusY = Instance.new("TextButton")
local LabelZ = Instance.new("TextLabel")
local MinusZ = Instance.new("TextButton")
local PlusZ = Instance.new("TextButton")
local Save = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 0.500
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.04, 0, 0.653, 0)
Frame.Size = UDim2.new(0.314307451, 0, 0.188442215, 0)

LabelX.Name = "LabelX"
LabelX.Parent = Frame
LabelX.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LabelX.BackgroundTransparency = 1.000
LabelX.BorderColor3 = Color3.fromRGB(0, 0, 0)
LabelX.BorderSizePixel = 0
LabelX.Position = UDim2.new(0.0239361264, 0, 0, 0)
LabelX.Size = UDim2.new(0.68308568, 0, 0.314465404, 0)
LabelX.Font = Enum.Font.Code
LabelX.Text = "X: 0"
LabelX.TextColor3 = Color3.fromRGB(0, 170, 0)
LabelX.TextScaled = true
LabelX.TextSize = 14.000
LabelX.TextWrapped = true
LabelX.TextXAlignment = Enum.TextXAlignment.Left

MinusX.Name = "MinusX"
MinusX.Parent = LabelX
MinusX.BackgroundColor3 = Color3.fromRGB(255, 89, 89)
MinusX.BorderColor3 = Color3.fromRGB(0, 0, 0)
MinusX.BorderSizePixel = 0
MinusX.Position = UDim2.new(1.07048774, 0, 0, 0)
MinusX.Size = UDim2.new(0.177638516, 0, 1, 0)
MinusX.Font = Enum.Font.Code
MinusX.Text = "-"
MinusX.TextColor3 = Color3.fromRGB(255, 255, 255)
MinusX.TextScaled = true
MinusX.TextSize = 14.000
MinusX.TextStrokeTransparency = 0.000
MinusX.TextWrapped = true

PlusX.Name = "PlusX"
PlusX.Parent = LabelX
PlusX.BackgroundColor3 = Color3.fromRGB(0, 255, 85)
PlusX.BorderColor3 = Color3.fromRGB(0, 0, 0)
PlusX.BorderSizePixel = 0
PlusX.Position = UDim2.new(1.25126553, 0, 0, 0)
PlusX.Size = UDim2.new(0.177638516, 0, 1, 0)
PlusX.Font = Enum.Font.Code
PlusX.Text = "+"
PlusX.TextColor3 = Color3.fromRGB(255, 255, 255)
PlusX.TextScaled = true
PlusX.TextSize = 14.000
PlusX.TextStrokeTransparency = 0.000
PlusX.TextWrapped = true

LabelY.Name = "LabelY"
LabelY.Parent = Frame
LabelY.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LabelY.BackgroundTransparency = 1.000
LabelY.BorderColor3 = Color3.fromRGB(0, 0, 0)
LabelY.BorderSizePixel = 0
LabelY.Position = UDim2.new(0.0239361264, 0, 0.340000004, 0)
LabelY.Size = UDim2.new(0.68308568, 0, 0.314465404, 0)
LabelY.Font = Enum.Font.Code
LabelY.Text = "Y: 0"
LabelY.TextColor3 = Color3.fromRGB(0, 170, 0)
LabelY.TextScaled = true
LabelY.TextSize = 14.000
LabelY.TextWrapped = true
LabelY.TextXAlignment = Enum.TextXAlignment.Left

MinusY.Name = "MinusY"
MinusY.Parent = LabelY
MinusY.BackgroundColor3 = Color3.fromRGB(255, 89, 89)
MinusY.BorderColor3 = Color3.fromRGB(0, 0, 0)
MinusY.BorderSizePixel = 0
MinusY.Position = UDim2.new(1.07048774, 0, 0, 0)
MinusY.Size = UDim2.new(0.177638516, 0, 1, 0)
MinusY.Font = Enum.Font.Code
MinusY.Text = "-"
MinusY.TextColor3 = Color3.fromRGB(255, 255, 255)
MinusY.TextScaled = true
MinusY.TextSize = 14.000
MinusY.TextStrokeTransparency = 0.000
MinusY.TextWrapped = true

PlusY.Name = "PlusY"
PlusY.Parent = LabelY
PlusY.BackgroundColor3 = Color3.fromRGB(0, 255, 85)
PlusY.BorderColor3 = Color3.fromRGB(0, 0, 0)
PlusY.BorderSizePixel = 0
PlusY.Position = UDim2.new(1.25126553, 0, 0, 0)
PlusY.Size = UDim2.new(0.177638516, 0, 1, 0)
PlusY.Font = Enum.Font.Code
PlusY.Text = "+"
PlusY.TextColor3 = Color3.fromRGB(255, 255, 255)
PlusY.TextScaled = true
PlusY.TextSize = 14.000
PlusY.TextStrokeTransparency = 0.000
PlusY.TextWrapped = true

LabelZ.Name = "LabelZ"
LabelZ.Parent = Frame
LabelZ.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LabelZ.BackgroundTransparency = 1.000
LabelZ.BorderColor3 = Color3.fromRGB(0, 0, 0)
LabelZ.BorderSizePixel = 0
LabelZ.Position = UDim2.new(0.0239361264, 0, 0.680000007, 0)
LabelZ.Size = UDim2.new(0.68308568, 0, 0.314465404, 0)
LabelZ.Font = Enum.Font.Code
LabelZ.Text = "Z: 0"
LabelZ.TextColor3 = Color3.fromRGB(0, 170, 0)
LabelZ.TextScaled = true
LabelZ.TextSize = 14.000
LabelZ.TextWrapped = true
LabelZ.TextXAlignment = Enum.TextXAlignment.Left

MinusZ.Name = "MinusZ"
MinusZ.Parent = LabelZ
MinusZ.BackgroundColor3 = Color3.fromRGB(255, 89, 89)
MinusZ.BorderColor3 = Color3.fromRGB(0, 0, 0)
MinusZ.BorderSizePixel = 0
MinusZ.Position = UDim2.new(1.07048774, 0, 0, 0)
MinusZ.Size = UDim2.new(0.177638516, 0, 1, 0)
MinusZ.Font = Enum.Font.Code
MinusZ.Text = "-"
MinusZ.TextColor3 = Color3.fromRGB(255, 255, 255)
MinusZ.TextScaled = true
MinusZ.TextSize = 14.000
MinusZ.TextStrokeTransparency = 0.000
MinusZ.TextWrapped = true

PlusZ.Name = "PlusZ"
PlusZ.Parent = LabelZ
PlusZ.BackgroundColor3 = Color3.fromRGB(0, 255, 85)
PlusZ.BorderColor3 = Color3.fromRGB(0, 0, 0)
PlusZ.BorderSizePixel = 0
PlusZ.Position = UDim2.new(1.25126553, 0, 0, 0)
PlusZ.Size = UDim2.new(0.177638516, 0, 1, 0)
PlusZ.Font = Enum.Font.Code
PlusZ.Text = "+"
PlusZ.TextColor3 = Color3.fromRGB(255, 255, 255)
PlusZ.TextScaled = true
PlusZ.TextSize = 14.000
PlusZ.TextStrokeTransparency = 0.000
PlusZ.TextWrapped = true

Save.Name = "Save"
Save.Parent = Frame
Save.BackgroundColor3 = Color3.fromRGB(0, 255, 85)
Save.BorderColor3 = Color3.fromRGB(0, 0, 0)
Save.BorderSizePixel = 0
Save.Position = UDim2.new(-0.000550498662, 0, 1.03999996, 0)
Save.Size = UDim2.new(1.00055051, 0, 0.340000004, 0)
Save.Font = Enum.Font.Code
Save.Text = "Save"
Save.TextColor3 = Color3.fromRGB(255, 255, 255)
Save.TextScaled = true
Save.TextSize = 14.000
Save.TextStrokeTransparency = 0.000
Save.TextWrapped = true

-- Scripts:

PlusX.MouseButton1Click:connect(function()
    x += 1
    cloned.PrimaryPart.Position += Vector3.new(4, 0, 0)
    LabelX.Text = 'X: ' .. tostring(x)
end)

MinusX.MouseButton1Click:connect(function()
    x -= 1
    cloned.PrimaryPart.Position -= Vector3.new(4, 0, 0)
    LabelX.Text = 'X: ' .. tostring(x)
end)

PlusY.MouseButton1Click:connect(function()
    y += 1
    cloned.PrimaryPart.Position += Vector3.new(0, 4, 0)
    LabelY.Text = 'Y: ' .. tostring(y)
end)

MinusY.MouseButton1Click:connect(function()
    y -= 1
    cloned.PrimaryPart.Position -= Vector3.new(0, 4, 0)
    LabelY.Text = 'Y: ' .. tostring(y)
end)

PlusZ.MouseButton1Click:connect(function()
    z += 1
    cloned.PrimaryPart.Position += Vector3.new(0, 0, 4)
    LabelZ.Text = 'Z: ' .. tostring(z)
end)

MinusZ.MouseButton1Click:connect(function()
    z -= 1
    cloned.PrimaryPart.Position -= Vector3.new(0, 0, 4)
    LabelZ.Text = 'Z: ' .. tostring(z)
end)

Save.MouseButton1Click:connect(function()
    x, y, z = 0, 0, 0
    start_part, end_part = target.PrimaryPart, cloned.PrimaryPart
    fill(start_part, end_part, asset)

    target = nil
    selection:Destroy()
    cloned:Destroy()
    
    LabelX.Text = 'X: 0'
    LabelY.Text = 'Y: 0'
    LabelZ.Text = 'Z: 0'
end)

local a = Instance.new('Tool', game:GetService('Players').LocalPlayer.Backpack)
a.RequiresHandle = false

a.Activated:connect(function()
    target = game.Players.LocalPlayer:GetMouse().Target

    if not target.Parent:FindFirstChild('AssetId') then return end
    target = target.Parent
    asset = target.AssetId.Value

    cloned = Instance.new('Model')
    primary = Instance.new('Part', cloned)
    
    primary.Anchored = true
    primary.Color = Color3.fromRGB(0, 0, 0)
    primary.CanCollide = false
    primary.Material = Enum.Material.SmoothPlastic
    primary.Size = Vector3.new(4, 4, 4)
    primary.Position = target.PrimaryPart.Position
    primary.Transparency = 0.5

    cloned.Parent = workspace
    cloned.PrimaryPart = primary
    cloned.PrimaryPart.Anchored = true
    target.PrimaryPart.Anchored = true
    selection = Instance.new('SelectionBox', target.PrimaryPart)
    selection.Adornee = target.PrimaryPart
end)

a.Equipped:connect(function()
    Frame.Visible = true
end)

a.Unequipped:connect(function()
    Frame.Visible = false
end)
