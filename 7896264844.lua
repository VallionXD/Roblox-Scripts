local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Find the Markers GUI", "DarkTheme")

local Tab = Window:NewTab("Main")

local Section = Tab:NewSection("Main Functions")

Section:NewLabel("Find The Markers GUI")

Section:NewButton("Marker ESP with Box and Names", "Show boxes around markers and display names", function()
    for _, v in pairs(game.Workspace:GetChildren()) do
        if string.find(v.Name, "Marker") and v:IsA("Model") then
            local part = v:FindFirstChildWhichIsA("Part")
            if part then
                local billboardGui = Instance.new("BillboardGui")
                billboardGui.Parent = part
                billboardGui.Adornee = part
                billboardGui.Size = UDim2.new(0, 200, 0, 50)
                billboardGui.StudsOffset = Vector3.new(0, 5, 0)

                local textLabel = Instance.new("TextLabel")
                textLabel.Parent = billboardGui
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.BackgroundTransparency = 1
                textLabel.Text = v.Name
                textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                textLabel.TextSize = 14
                textLabel.TextStrokeTransparency = 0.8
                textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                textLabel.TextAlignment = Enum.TextAlignment.Center

                local surfaceGui = Instance.new("SurfaceGui")
                surfaceGui.Parent = part
                surfaceGui.Face = Enum.NormalId.Front
                surfaceGui.AlwaysOnTop = true

                local frame = Instance.new("Frame")
                frame.Parent = surfaceGui
                frame.Size = UDim2.new(1, 0, 1, 0)
                frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                frame.BorderSizePixel = 2
                frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                frame.BackgroundTransparency = 0.5
            end
        end
    end
end)

Section:NewButton("Teleport to Random Marker", "Teleports to a random marker in the game", function()
    local MarkerTable = {}
    for _, v in pairs(game.Workspace:GetChildren()) do
        if string.find(v.Name, "Marker") then
            table.insert(MarkerTable, v)
        end
    end
    
    if #MarkerTable > 0 then
        local randomMarker = MarkerTable[math.random(1, #MarkerTable)]
        local markerPart = randomMarker:FindFirstChildWhichIsA("Part")
        if markerPart then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = markerPart.CFrame
        end
    else
        print("No markers found.")
    end
end)
