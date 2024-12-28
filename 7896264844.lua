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
                -- esp fix
                local highlight = Instance.new("Highlight")
                highlight.Parent = part  -- Attach the highlight to the part
                highlight.Adornee = part  -- Set the adornee to the part so it highlights
                highlight.FillColor = Color3.fromRGB(255, 0, 0)  -- Set the highlight fill color (red)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 0)  -- Set the outline color (yellow)
                highlight.FillTransparency = 0.5  -- Set fill transparency to make it semi-transparent
                highlight.OutlineTransparency = 0.3  -- Set outline transparency
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
