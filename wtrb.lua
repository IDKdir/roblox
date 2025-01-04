function area(name)
    for i, v in pairs(workspace.BuildingAreas:GetDescendants()) do
        if v.Name == 'Player' and v:IsA('StringValue') then
            if v.Value == name then
                return v.Parent
            end
        end
    end
end

function place(asset, where)
    local ohNumber1 = asset
    local ohCFrame2 = where

    return game:GetService("ReplicatedStorage").BuildingBridge.Stamp:InvokeServer(ohNumber1, ohCFrame2)
end

function iterate(recursive)
    fixed = {}
    for i, v in recursive do
        if v:IsA('Model') then
            if v:FindFirstChild('AssetId') then
                if place(v.AssetId.Value, v.PrimaryPart.CFrame) then
                    table.insert(fixed, v)
                end
            end
        end
    end
    return fixed
end

function clone(target)
    local recursive = {}

    local mine = area(game.Players.LocalPlayer.Name)
    local copy = target.PlayerArea:Clone()
    for i, v in pairs(copy:GetDescendants()) do
        if v:IsA('BasePart') then
            v.CanCollide = false
        end
    end
    copy.PrimaryPart = copy.BasePlate
    
    copy:PivotTo(mine.PlayerArea.BasePlate.CFrame)
    for i, v in pairs(copy:GetChildren()) do
        task.spawn(function()
            if v:IsA('Model') then
                if v:FindFirstChild('AssetId') then
                    if not place(v.AssetId.Value, v.PrimaryPart.CFrame) then
                        table.insert(recursive, v)
                    end
                end
            end
        end)
        task.wait()
    end
    while #recursive > 0 do
        local result = iterate(recursive)
        for i, v in recursive do
            if table.find(result, v) then
                recursive[i] = nil
            end
        end
    end
end



clone(area('guest123458798'))