--====================================================--
-- PYTHON_S - SCRIPT v6.6.2 (MENÚ + AIM + VISUALS)
--====================================================--

-- PROTECCIÓN CONTRA DUPLICADOS
local ScriptAlreadyLoaded = getgenv().PYTHON_S_V6_LOADED
if ScriptAlreadyLoaded then
    warn("[PYTHON_S] El script ya se encuentra cargado.")
    return
end
getgenv().PYTHON_S_V6_LOADED = true

-- SERVICIOS
local cloneref = (cloneref or clonereference or function(instance) return instance end)
local RunService = cloneref(game:GetService("RunService"))
local UserInputService = cloneref(game:GetService("UserInputService"))
local Players = cloneref(game:GetService("Players"))
local CoreGui = cloneref(game:GetService("CoreGui"))

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- CONFIGURACIÓN GLOBAL
local Config = {
    -- AIMBOT
    Aim = {
        Enabled = true,
        LockCamera = true,
        ActivationMode = "Mantener", -- "Mantener", "Alternar", "Siempre"
        KeyString = "MouseButton2",
        AimPart = "Head",
        AimMode = "Cabeza",          -- "Cabeza", "Cuerpo", "Legit"
        FOV = 130,
        ShowFOV = true,
        WallCheck = false,
        TeamCheck = false,
        PredictiveAim = false,
        SmoothTracking = false,
        SmoothFactor = 0.85,
        ToggleState = false
    },
    -- VISUALS (ESP)
    Visuals = {
        Enabled = true,
        Boxes = true,
        Names = true,
        Distance = true,
        HealthBar = true,
        Tracers = false,
        TeamCheck = false,
        BoxColor = Color3.fromRGB(255, 50, 50),
        TracerColor = Color3.fromRGB(255, 255, 255),
        TextColor = Color3.fromRGB(255, 255, 255)
    },
    -- UI MENU
    UI = {
        MenuOpen = true,
        ToggleKey = Enum.KeyCode.RightShift
    }
}

-- UTILIDADES
local Utilities = {}

function Utilities.ValidatePlayer(player)
    return player and player.Parent and player.Character
        and player.Character:FindFirstChild("Humanoid")
        and player.Character:FindFirstChild("HumanoidRootPart")
end

function Utilities.GetSafeCamera()
    if Camera and Camera.Parent then return Camera end
    Camera = workspace.CurrentCamera
    return Camera
end

-- ====================================================--
-- SISTEMA DE VISUALES (ESP)
-- ====================================================--
local ESPCache = {}

local function CreateESP(player)
    if ESPCache[player] then return end

    local esp = {
        Box = Drawing.new("Square"),
        Name = Drawing.new("Text"),
        Distance = Drawing.new("Text"),
        HealthBarOutline = Drawing.new("Square"),
        HealthBar = Drawing.new("Square"),
        Tracer = Drawing.new("Line")
    }

    esp.Box.Thickness = 1
    esp.Box.Filled = false
    esp.Box.Color = Config.Visuals.BoxColor

    esp.Name.Size = 14
    esp.Name.Center = true
    esp.Name.Outline = true
    esp.Name.Color = Config.Visuals.TextColor

    esp.Distance.Size = 12
    esp.Distance.Center = true
    esp.Distance.Outline = true
    esp.Distance.Color = Config.Visuals.TextColor

    esp.HealthBarOutline.Thickness = 1
    esp.HealthBarOutline.Filled = true
    esp.HealthBarOutline.Color = Color3.fromRGB(0, 0, 0)

    esp.HealthBar.Thickness = 1
    esp.HealthBar.Filled = true
    esp.HealthBar.Color = Color3.fromRGB(0, 255, 0)

    esp.Tracer.Thickness = 1
    esp.Tracer.Color = Config.Visuals.TracerColor

    ESPCache[player] = esp
end

local function RemoveESP(player)
    if ESPCache[player] then
        for _, obj in pairs(ESPCache[player]) do
            obj:Remove()
        end
        ESPCache[player] = nil
    end
end

local function UpdateESP()
    local safeCamera = Utilities.GetSafeCamera()
    if not safeCamera then return end

    for player, esp in pairs(ESPCache) do
        if Config.Visuals.Enabled and Utilities.ValidatePlayer(player) and player ~= LocalPlayer then
            if Config.Visuals.TeamCheck and player.Team == LocalPlayer.Team then
                for _, obj in pairs(esp) do obj.Visible = false end
                continue
            end

            local char = player.Character
            local root = char.HumanoidRootPart
            local head = char:FindFirstChild("Head")
            local hum = char.Humanoid

            local rootPos, onScreen = safeCamera:WorldToViewportPoint(root.Position)

            if onScreen and head then
                local headPos = safeCamera:WorldToViewportPoint(head.Position + Vector3.new(0, 0.5, 0))
                local legPos = safeCamera:WorldToViewportPoint(root.Position - Vector3.new(0, 3, 0))

                local height = math.abs(headPos.Y - legPos.Y)
                local width = height / 2

                -- Box ESP
                esp.Box.Size = Vector2.new(width, height)
                esp.Box.Position = Vector2.new(rootPos.X - width / 2, rootPos.Y - height / 2)
                esp.Box.Color = Config.Visuals.BoxColor
                esp.Box.Visible = Config.Visuals.Boxes

                -- Name ESP
                esp.Name.Text = player.Name
                esp.Name.Position = Vector2.new(rootPos.X, (rootPos.Y - height / 2) - 16)
                esp.Name.Visible = Config.Visuals.Names

                -- Distance ESP
                local dist = math.floor((root.Position - safeCamera.CFrame.Position).Magnitude)
                esp.Distance.Text = dist .. "m"
                esp.Distance.Position = Vector2.new(rootPos.X, (rootPos.Y + height / 2) + 2)
                esp.Distance.Visible = Config.Visuals.Distance

                -- HealthBar ESP
                if Config.Visuals.HealthBar then
                    local healthPct = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
                    esp.HealthBarOutline.Size = Vector2.new(4, height)
                    esp.HealthBarOutline.Position = Vector2.new((rootPos.X - width / 2) - 6, rootPos.Y - height / 2)
                    esp.HealthBarOutline.Visible = true

                    esp.HealthBar.Size = Vector2.new(2, height * healthPct)
                    esp.HealthBar.Position = Vector2.new((rootPos.X - width / 2) - 5, (rootPos.Y + height / 2) - (height * healthPct))
                    esp.HealthBar.Color = Color3.fromRGB(255 * (1 - healthPct), 255 * healthPct, 0)
                    esp.HealthBar.Visible = true
                else
                    esp.HealthBarOutline.Visible = false
                    esp.HealthBar.Visible = false
                end

                -- Tracers ESP
                if Config.Visuals.Tracers then
                    esp.Tracer.From = Vector2.new(safeCamera.ViewportSize.X / 2, safeCamera.ViewportSize.Y)
                    esp.Tracer.To = Vector2.new(rootPos.X, rootPos.Y)
                    esp.Tracer.Color = Config.Visuals.TracerColor
                    esp.Tracer.Visible = true
                else
                    esp.Tracer.Visible = false
                end
            else
                for _, obj in pairs(esp) do obj.Visible = false end
            end
        else
            for _, obj in pairs(esp) do obj.Visible = false end
        end
    end
end

-- ====================================================--
-- CÍRCULO DE FOV Y AIMBOT
-- ====================================================--
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 1
FOVCircle.NumSides = 60
FOVCircle.Color = Color3.fromRGB(255, 255, 255)
FOVCircle.Visible = false

local function IsKeyActive()
    if Config.Aim.ActivationMode == "Siempre" then return true end
    if Config.Aim.ActivationMode == "Alternar" then return Config.Aim.ToggleState end
    return UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
end

local function GetTarget(Center)
    local safeCamera = Utilities.GetSafeCamera()
    if not safeCamera then return nil end

    local Target = nil
    local ClosestMag = Config.Aim.FOV

    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and Utilities.ValidatePlayer(p) then
            if Config.Aim.TeamCheck and p.Team == LocalPlayer.Team then continue end

            local char = p.Character
            local hum = char.Humanoid
            if hum.Health <= 0 then continue end

            local part = (Config.Aim.AimMode == "Cabeza") and char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart")
            if not part then continue end

            local screenPos, onScreen = safeCamera:WorldToViewportPoint(part.Position)
            if onScreen then
                local mag = (Vector2.new(screenPos.X, screenPos.Y) - Center).Magnitude
                if mag < ClosestMag then
                    Target = part
                    ClosestMag = mag
                end
            end
        end
    end

    return Target
end

-- ====================================================--
-- INTERFAZ GRÁFICA (MENÚ UI)
-- ====================================================--
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PYTHON_S_UI"
ScreenGui.ResetOnSpawn = false
pcall(function() ScreenGui.Parent = CoreGui end) or pcall(function() ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end)

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 380, 0, 320)
MainFrame.Position = UDim2.new(0.5, -190, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
Title.Text = "  🐍 PYTHON_S v6.6.2"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18

local Container = Instance.new("Frame", MainFrame)
Container.Size = UDim2.new(1, -20, 1, -50)
Container.Position = UDim2.new(0, 10, 0, 40)
Container.BackgroundTransparency = 1

local UIList = Instance.new("UIListLayout", Container)
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 8)

local function CreateToggleButton(text, defaultState, callback)
    local btn = Instance.new("TextButton", Container)
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.BackgroundColor3 = defaultState and Color3.fromRGB(40, 160, 80) or Color3.fromRGB(45, 45, 55)
    btn.Text = "  " .. text .. ": " .. (defaultState and "ON" or "OFF")
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 16
    btn.TextXAlignment = Enum.TextXAlignment.Left

    local state = defaultState
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.BackgroundColor3 = state and Color3.fromRGB(40, 160, 80) or Color3.fromRGB(45, 45, 55)
        btn.Text = "  " .. text .. ": " .. (state and "ON" or "OFF")
        callback(state)
    end)
end

-- BOTONES DEL MENÚ
CreateToggleButton("Aimbot Activo", Config.Aim.Enabled, function(v) Config.Aim.Enabled = v end)
CreateToggleButton("Mostrar FOV", Config.Aim.ShowFOV, function(v) Config.Aim.ShowFOV = v end)
CreateToggleButton("Visuales ESP", Config.Visuals.Enabled, function(v) Config.Visuals.Enabled = v end)
CreateToggleButton("ESP Boxes", Config.Visuals.Boxes, function(v) Config.Visuals.Boxes = v end)
CreateToggleButton("ESP Nombres", Config.Visuals.Names, function(v) Config.Visuals.Names = v end)
CreateToggleButton("ESP Distancia", Config.Visuals.Distance, function(v) Config.Visuals.Distance = v end)
CreateToggleButton("ESP Barra de Vida", Config.Visuals.HealthBar, function(v) Config.Visuals.HealthBar = v end)
CreateToggleButton("ESP Tracers", Config.Visuals.Tracers, function(v) Config.Visuals.Tracers = v end)

-- MOSTRAR / OCULTAR MENÚ CON TECLA
UserInputService.InputBegan:Connect(function(input, processed)
    if not processed and input.KeyCode == Config.UI.ToggleKey then
        Config.UI.MenuOpen = not Config.UI.MenuOpen
        MainFrame.Visible = Config.UI.MenuOpen
    end
end)

-- GESTIÓN DE JUGADORES (ESP)
for _, p in ipairs(Players:GetPlayers()) do
    if p ~= LocalPlayer then CreateESP(p) end
end
Players.PlayerAdded:Connect(CreateESP)
Players.PlayerRemoving:Connect(RemoveESP)

-- BUCLE PRINCIPAL
RunService.RenderStepped:Connect(function()
    local safeCamera = Utilities.GetSafeCamera()
    if not safeCamera then return end

    -- Actualizar Visuales ESP
    UpdateESP()

    -- Actualizar Círculo FOV
    local center = Vector2.new(safeCamera.ViewportSize.X / 2, safeCamera.ViewportSize.Y / 2)
    FOVCircle.Position = center
    FOVCircle.Radius = Config.Aim.FOV
    FOVCircle.Visible = Config.Aim.Enabled and Config.Aim.ShowFOV

    -- Actualizar Aimbot
    if Config.Aim.Enabled and IsKeyActive() then
        local target = GetTarget(center)
        if target then
            safeCamera.CFrame = CFrame.lookAt(safeCamera.CFrame.Position, target.Position)
        end
    end
end)

print("[PYTHON_S] Menú UI, Aimbot y Visuales ESP cargados correctamente. Presiona 'RightShift' para ocultar/mostrar el menú.")
