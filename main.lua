--====================================================--
-- PYTHON_S - SCRIPT v6.6.2 (HORIZONTAL LITE UI)
--====================================================--

local ScriptAlreadyLoaded = getgenv().PYTHON_S_V6_LOADED
if ScriptAlreadyLoaded then
    warn("[PYTHON_S] Script ya está cargado. Deteniendo ejecución duplicada.")
    return
end
getgenv().PYTHON_S_V6_LOADED = true

--====================================================--
-- SERVICIOS & UTILIDADES
--====================================================--
local cloneref = (cloneref or clonereference or function(instance) return instance end)
local Players = cloneref(game:GetService("Players"))
local RunService = cloneref(game:GetService("RunService"))
local UserInputService = cloneref(game:GetService("UserInputService"))
local HttpService = cloneref(game:GetService("HttpService"))
local TweenService = cloneref(game:GetService("TweenService"))

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local function GetSafeCamera()
    if Camera and Camera.Parent then return Camera end
    local newCam = workspace.CurrentCamera
    if newCam and newCam.Parent then Camera = newCam; return Camera end
    return nil
end

local function SafeName(player)
    if not player then return "Unknown" end
    local name = player.DisplayName
    if name and name ~= "" then return tostring(name) end
    name = player.Name
    if name and name ~= "" then return tostring(name) end
    return "Unknown"
end

--====================================================--
-- CONFIGURACIÓN GLOBAL
--====================================================--
local Aiming = {
    Enabled = false,
    LockCamera = true,
    ActivationMode = "Mantener",
    KeyString = "MouseButton2",
    AimMode = "Cabeza",
    WallCheck = false,
    FriendCheck = false,
    TeamCheck = false,
    UseMagnitude = false,
    MaxStuds = 500,
    FOV = 130,
    ShowFOV = false,
    UsePredictiveAim = false,
    UseSmoothTracking = false,
    SmoothFactor = 0.85,
    WhitelistedPlayers = {},
    ExcludedPlayers = {},
    WhitelistColor = Color3.fromRGB(0, 255, 127)
}

local ESPConfig = {
    Name = false,
    Health = false,
    HealthPercent = false,
    Chams = false,
    ChamsColor = Color3.fromRGB(180, 0, 255),
    Skeleton = false,
    CornerBox = false,
    Box = false,
    PredictionLine = false,
    Tool = false,
    MaxDistance = 50000,
    UpdateInterval = 0.1
}

local CachedState = {
    KeyActive = false,
    ActiveEnemies = {},
    CurrentTarget = nil,
    LastVisibility = {},
    PlayerDistanceCache = {},
    LastChamsColor = ESPConfig.ChamsColor
}

local CharacterPartCache = {}
local PlayerESPActive = {}
local PlayerWeaponCache = {}
local ESPDrawingObjects = {}

--====================================================--
-- SISTEMAS Y PREDICCIÓN
--====================================================--
local PredictionSystem = { TargetHistory = {}, HistoryLimit = 10 }

function PredictionSystem.RecordPosition(player, position)
    if not PredictionSystem.TargetHistory[player] then PredictionSystem.TargetHistory[player] = {} end
    local history = PredictionSystem.TargetHistory[player]
    table.insert(history, { pos = position, time = tick() })
    if #history > PredictionSystem.HistoryLimit then table.remove(history, 1) end
end

function PredictionSystem.PredictPosition(player, framesToPredict)
    local history = PredictionSystem.TargetHistory[player]
    if not history or #history < 2 then return nil end
    local latest = history[#history]
    local previous = history[#history - 1]
    if not latest or not previous then return nil end
    local velocity = (latest.pos - previous.pos) / math.max(latest.time - previous.time, 0.016)
    return latest.pos + (velocity * (framesToPredict * 0.016))
end

function PredictionSystem.Cleanup(player)
    PredictionSystem.TargetHistory[player] = nil
end

local PartCacheSystem = {}

function PartCacheSystem.Create(char, player)
    local cache = {
        player = player, character = char,
        Head = nil, HumanoidRootPart = nil, Humanoid = nil,
        LastNameUpdate = 0, CachedName = nil, connections = {}
    }
    local function Update()
        cache.Head = char:FindFirstChild("Head")
        cache.HumanoidRootPart = char:FindFirstChild("HumanoidRootPart")
        cache.Humanoid = char:FindFirstChild("Humanoid")
    end
    table.insert(cache.connections, char.DescendantAdded:Connect(Update))
    Update()
    CharacterPartCache[player] = cache
    return cache
end

function PartCacheSystem.Get(player)
    local cache = CharacterPartCache[player]
    if cache and cache.character and cache.character.Parent then return cache end
    return nil
end

function PartCacheSystem.Cleanup(player)
    local cache = CharacterPartCache[player]
    if cache then
        for _, conn in ipairs(cache.connections) do pcall(function() conn:Disconnect() end) end
        CharacterPartCache[player] = nil
    end
end

--====================================================--
-- DRAWING GRAPHICS
--====================================================--
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 1
FOVCircle.NumSides = 60
FOVCircle.Color = Color3.fromRGB(255, 255, 255)
FOVCircle.Visible = false

local function UpdateFOVCircle()
    local safeCamera = GetSafeCamera()
    if not safeCamera then return end
    FOVCircle.Visible = Aiming.ShowFOV and Aiming.Enabled
    FOVCircle.Radius = Aiming.FOV
    local mousePos = UserInputService:GetMouseLocation()
    FOVCircle.Position = mousePos
end

--====================================================--
-- ESP SYSTEM
--====================================================--
local ESPSystem = {}

function ESPSystem.CleanupDrawings(player)
    local drawings = ESPDrawingObjects[player]
    if not drawings then return end
    if drawings.skeletonLines then
        for _, line in pairs(drawings.skeletonLines) do pcall(function() line:Remove() end) end
    end
    if drawings.cornerLines then
        for _, line in pairs(drawings.cornerLines) do pcall(function() line:Remove() end) end
    end
    if drawings.predictionLine then pcall(function() drawings.predictionLine:Remove() end) end
    ESPDrawingObjects[player] = nil
end

function ESPSystem.CreatePlayerESP(char, player)
    if not char or char:FindFirstChild("ESP_Billboard") then return end

    local partCache = PartCacheSystem.Create(char, player)
    if not partCache or not partCache.Humanoid or not partCache.HumanoidRootPart then return end

    local predLine = Drawing.new("Line")
    predLine.Visible = false
    predLine.Thickness = 2

    local skeletonLines = {}
    local skeletonBones = {
        {"Head", "UpperTorso"}, {"UpperTorso", "LowerTorso"},
        {"UpperTorso", "RightUpperArm"}, {"UpperTorso", "LeftUpperArm"},
        {"LowerTorso", "RightUpperLeg"}, {"LowerTorso", "LeftUpperLeg"}
    }
    for _, bone in ipairs(skeletonBones) do
        local line = Drawing.new("Line")
        line.Thickness = 1
        line.Visible = false
        skeletonLines[bone[1] .. "_" .. bone[2]] = line
    end

    local cornerLines = {}
    for i = 1, 8 do
        local line = Drawing.new("Line")
        line.Thickness = 2
        line.Visible = false
        cornerLines[i] = line
    end

    ESPDrawingObjects[player] = {
        skeletonLines = skeletonLines,
        cornerLines = cornerLines,
        predictionLine = predLine
    }

    local box3D = Instance.new("BoxHandleAdornment")
    box3D.AlwaysOnTop = true
    box3D.ZIndex = 1
    box3D.Transparency = 0.5
    box3D.Visible = false

    local highlight = Instance.new("Highlight", char)
    highlight.Name = "ESP_Highlight"
    highlight.FillColor = ESPConfig.ChamsColor
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

    local billboard = Instance.new("BillboardGui", char)
    billboard.Name = "ESP_Billboard"
    billboard.Adornee = partCache.HumanoidRootPart
    billboard.AlwaysOnTop = true
    billboard.MaxDistance = 99999
    billboard.Size = UDim2.new(0, 180, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 2.5, 0)

    local mainFrame = Instance.new("Frame", billboard)
    mainFrame.Size = UDim2.new(1, 0, 1, 0)
    mainFrame.BackgroundTransparency = 1

    local nameLabel = Instance.new("TextLabel", mainFrame)
    nameLabel.Text = SafeName(player)
    nameLabel.Size = UDim2.new(1, 0, 0, 16)
    nameLabel.Font = Enum.Font.GothamBold
    nameLabel.TextColor3 = Color3.new(1, 1, 1)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextSize = 14

    local conn
    conn = RunService.RenderStepped:Connect(function()
        if not char or not char.Parent or not partCache.Humanoid or partCache.Humanoid.Health <= 0 then
            ESPSystem.CleanupDrawings(player)
            pcall(function() billboard:Destroy() highlight:Destroy() box3D:Destroy() end)
            PartCacheSystem.Cleanup(player)
            if conn then conn:Disconnect() end
            return
        end

        local safeCamera = GetSafeCamera()
        if not safeCamera then return end

        local dist = (safeCamera.CFrame.Position - partCache.HumanoidRootPart.Position).Magnitude
        local pos, onScreen = safeCamera:WorldToViewportPoint(partCache.HumanoidRootPart.Position)

        billboard.Enabled = onScreen and dist <= ESPConfig.MaxDistance
        highlight.Enabled = ESPConfig.Chams
        nameLabel.Visible = ESPConfig.Name

        local isTarget = (CachedState.CurrentTarget ~= nil and CachedState.CurrentTarget.Parent == char)
        local espColor = isTarget and Color3.new(1, 0, 0) or Color3.new(1, 1, 1)

        if ESPConfig.Box then
            box3D.Size = Vector3.new(3, 5, 3)
            box3D.Color3 = espColor
            box3D.Adornee = partCache.HumanoidRootPart
            box3D.Parent = partCache.HumanoidRootPart
            box3D.Visible = true
        else
            box3D.Visible = false
        end
    end)
end

--====================================================--
-- AIMBOT SYSTEM
--====================================================--
local function UpdateEnemyList()
    table.clear(CachedState.ActiveEnemies)
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            table.insert(CachedState.ActiveEnemies, p)
        end
    end
end

local function GetAimbotTarget()
    local safeCamera = GetSafeCamera()
    if not safeCamera then return nil end

    local Center = UserInputService:GetMouseLocation()
    local Target = nil
    local ClosestDist = Aiming.FOV

    for _, p in ipairs(CachedState.ActiveEnemies) do
        if Aiming.TeamCheck and p.Team == LocalPlayer.Team then continue end
        local cache = PartCacheSystem.Get(p)
        if not cache or not cache.Humanoid or cache.Humanoid.Health <= 0 then continue end

        local part = (Aiming.AimMode == "Cabeza") and cache.Head or cache.HumanoidRootPart
        if not part then continue end

        local screenPos, onScreen = safeCamera:WorldToViewportPoint(part.Position)
        if onScreen then
            local mag = (Vector2.new(screenPos.X, screenPos.Y) - Center).Magnitude
            if mag < ClosestDist then
                Target = part
                ClosestDist = mag
            end
        end
    end
    return Target
end

local function UpdateKeyState()
    local Key = Aiming.KeyString
    if not Key or Key == "" then CachedState.KeyActive = false; return end

    if string.find(Key, "MouseButton") then
        local enumVal = Enum.UserInputType[Key]
        if enumVal then CachedState.KeyActive = UserInputService:IsMouseButtonPressed(enumVal) end
    else
        local kc = Enum.KeyCode[Key:upper()]
        if kc then CachedState.KeyActive = UserInputService:IsKeyDown(kc) end
    end
end

RunService.RenderStepped:Connect(function()
    UpdateFOVCircle()
    UpdateKeyState()
    UpdateEnemyList()

    if Aiming.Enabled and (Aiming.ActivationMode == "Siempre" or CachedState.KeyActive) then
        local target = GetAimbotTarget()
        CachedState.CurrentTarget = target
        if target and Aiming.LockCamera then
            local safeCamera = GetSafeCamera()
            if safeCamera then
                local aimPos = target.Position
                if Aiming.UsePredictiveAim then
                    local player = Players:GetPlayerFromCharacter(target.Parent)
                    if player then
                        local pred = PredictionSystem.PredictPosition(player, 3)
                        if pred then aimPos = pred end
                    end
                end
                safeCamera.CFrame = CFrame.lookAt(safeCamera.CFrame.Position, aimPos)
            end
        end
    else
        CachedState.CurrentTarget = nil
    end
end)

for _, p in ipairs(Players:GetPlayers()) do
    if p ~= LocalPlayer then
        if p.Character then ESPSystem.CreatePlayerESP(p.Character, p) end
        p.CharacterAdded:Connect(function(c) ESPSystem.CreatePlayerESP(c, p) end)
    end
end
Players.PlayerAdded:Connect(function(p)
    p.CharacterAdded:Connect(function(c) ESPSystem.CreatePlayerESP(c, p) end)
end)

--====================================================--
-- INTERFAZ GRÁFICA (UI HORIZONTAL LITE)
--====================================================--
if game.CoreGui:FindFirstChild("PythonUI_Horizontal") then
    game.CoreGui:FindFirstChild("PythonUI_Horizontal"):Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PythonUI_Horizontal"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

-- Botón para Abrir/Cerrar Menú
local ToggleButton = Instance.new("TextButton", ScreenGui)
ToggleButton.Name = "OpenMenuButton"
ToggleButton.Size = UDim2.new(0, 100, 0, 35)
ToggleButton.Position = UDim2.new(0.02, 0, 0.1, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
ToggleButton.BorderSizePixel = 0
ToggleButton.Text = "MENU"
ToggleButton.TextColor3 = Color3.fromRGB(0, 220, 80)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 14
Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(0, 8)
local toggleStroke = Instance.new("UIStroke", ToggleButton)
toggleStroke.Color = Color3.fromRGB(0, 220, 80)
toggleStroke.Thickness = 1

-- Contenedor Principal (Barra Horizontal)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 720, 0, 220)
MainFrame.Position = UDim2.new(0.5, -360, 0.35, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)
local mainStroke = Instance.new("UIStroke", MainFrame)
mainStroke.Color = Color3.fromRGB(35, 35, 45)
mainStroke.Thickness = 1

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Arrastre de la Barra Horizontal
local dragging, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)
MainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

-- Título
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "PYTHON_S - LITE MENU"
Title.TextColor3 = Color3.fromRGB(240, 240, 245)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14

-- Layout Horizontal
local HorizontalContainer = Instance.new("Frame", MainFrame)
HorizontalContainer.Size = UDim2.new(1, -20, 1, -40)
HorizontalContainer.Position = UDim2.new(0, 10, 0, 35)
HorizontalContainer.BackgroundTransparency = 1

local Layout = Instance.new("UIListLayout", HorizontalContainer)
Layout.FillDirection = Enum.FillDirection.Horizontal
Layout.Padding = UDim.new(0, 10)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Helper para Crear Secciones Animadas
local function CreateSection(title)
    local frame = Instance.new("Frame", HorizontalContainer)
    frame.Size = UDim2.new(0.48, 0, 1, 0)
    frame.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
    frame.BorderSizePixel = 0
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
    
    local secTitle = Instance.new("TextLabel", frame)
    secTitle.Size = UDim2.new(1, 0, 0, 25)
    secTitle.BackgroundTransparency = 1
    secTitle.Text = title
    secTitle.TextColor3 = Color3.fromRGB(0, 220, 80)
    secTitle.Font = Enum.Font.GothamBold
    secTitle.TextSize = 13

    local scroll = Instance.new("ScrollingFrame", frame)
    scroll.Size = UDim2.new(1, -10, 1, -30)
    scroll.Position = UDim2.new(0, 5, 0, 25)
    scroll.BackgroundTransparency = 1
    scroll.BorderSizePixel = 0
    scroll.ScrollBarThickness = 2
    scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

    local list = Instance.new("UIListLayout", scroll)
    list.Padding = UDim.new(0, 5)

    return scroll
end

local function CreateToggle(parent, text, default, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.BackgroundColor3 = default and Color3.fromRGB(0, 180, 60) or Color3.fromRGB(35, 35, 45)
    btn.Text = text .. " : " .. (default and "ON" or "OFF")
    btn.TextColor3 = Color3.fromRGB(240, 240, 245)
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 12
    btn.BorderSizePixel = 0
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)

    local state = default
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = text .. " : " .. (state and "ON" or "OFF")
        btn.BackgroundColor3 = state and Color3.fromRGB(0, 180, 60) or Color3.fromRGB(35, 35, 45)
        callback(state)
    end)
end

-- SECCIÓN AIM
local AimScroll = CreateSection("AIMBOT")
CreateToggle(AimScroll, "Activar Aim", Aiming.Enabled, function(v) Aiming.Enabled = v end)
CreateToggle(AimScroll, "Mostrar FOV", Aiming.ShowFOV, function(v) Aiming.ShowFOV = v end)
CreateToggle(AimScroll, "Predicción", Aiming.UsePredictiveAim, function(v) Aiming.UsePredictiveAim = v end)

-- SECCIÓN VISUALS
local VisualsScroll = CreateSection("VISUALS")
CreateToggle(VisualsScroll, "Nombres", ESPConfig.Name, function(v) ESPConfig.Name = v end)
CreateToggle(VisualsScroll, "Chams", ESPConfig.Chams, function(v) ESPConfig.Chams = v end)
CreateToggle(VisualsScroll, "Caja 3D", ESPConfig.Box, function(v) ESPConfig.Box = v end)

print("[PYTHON_S] UI Lite Horizontal cargada con éxito.")
