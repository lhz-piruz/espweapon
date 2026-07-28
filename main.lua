--====================================================--
-- PYTHON_S - SCRIPT v6.6.2 (SOLO MODO AIM)
--====================================================--

-- PROTECCIÓN CONTRA DUPLICADOS
local ScriptAlreadyLoaded = getgenv().PYTHON_S_V6_LOADED
if ScriptAlreadyLoaded then
    warn("[PYTHON_S] Script ya está cargado. Deteniendo ejecución duplicada.")
    return
end
getgenv().PYTHON_S_V6_LOADED = true

-- SERVICIOS
local cloneref = (cloneref or clonereference or function(instance) return instance end)
local RunService = cloneref(game:GetService("RunService"))
local UserInputService = cloneref(game:GetService("UserInputService"))
local Players = cloneref(game:GetService("Players"))

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- CONFIGURACIÓN GLOBAL
local ScriptConfig = {
    TargetHistorySize = 10,
    PredictionFrames = 3,
    SafeCallMaxAttempts = 3,
    Debug = false
}

-- CONFIGURACIÓN DE AIMBOT
local Aiming = {
    Enabled = true,               -- Activar/Desactivar Aimbot
    LockCamera = true,            -- Fijar la cámara al objetivo
    ActivationMode = "Mantener",  -- "Mantener", "Alternar" o "Siempre"
    KeyString = "MouseButton2",   -- Tecla o botón para activar (ej. MouseButton2 = Click Derecho)
    AimPart = "Head",
    AimMode = "Cabeza",           -- "Cabeza", "Cuerpo", "RPG" o "Legit"
    FOVCenter = "Camara",
    WallCheck = false,            -- Verificar si el objetivo está detrás de una pared
    FriendCheck = false,          -- Ignorar amigos
    TeamCheck = false,            -- Ignorar compañeros de equipo
    UseMagnitude = false,         -- Límite por distancia en studs
    MaxStuds = 500,
    WhitelistedPlayers = {},
    ExcludedPlayers = {},
    FOV = 130,                    -- Radio del FOV de apuntado
    ShowFOV = true,               -- Mostrar el círculo de FOV
    ToggleState = false,
    UsePredictiveAim = false,     -- Predicción de movimiento
    UseSmoothTracking = false,    -- Apuntado suave (Smoothing)
    SmoothFactor = 0.85,
    DynamicFOV = false,
}

-- CONFIGURACIÓN WEAPON AIM
local WeaponAimConfig = {
    Enabled = true
}

-- UTILIDADES
local Utilities = {}

function Utilities.ValidatePlayer(player)
    return player and player.Parent and player.Character
        and player.Character:FindFirstChild("Humanoid")
        and player.Character:FindFirstChild("HumanoidRootPart")
end

function Utilities.GetSafeCamera()
    if Camera and Camera.Parent then
        return Camera
    end
    local newCam = workspace.CurrentCamera
    if newCam and newCam.Parent then
        Camera = newCam
        return Camera
    end
    return nil
end

function Utilities.SafeDistance(pos1, pos2)
    if not pos1 or not pos2 then return math.huge end
    return (pos1 - pos2).Magnitude
end

function Utilities.GetScreenDistance(screenPos, center)
    if not screenPos or not center then return math.huge end
    return (Vector2.new(screenPos.X, screenPos.Y) - center).Magnitude
end

function Utilities.SafeTableClear(tbl)
    if type(tbl) == "table" then
        for k in pairs(tbl) do
            tbl[k] = nil
        end
    end
end

-- SISTEMA DE PREDICCIÓN DE POSICIÓN
local PredictionSystem = {}
PredictionSystem.TargetHistory = {}
PredictionSystem.HistoryLimit = ScriptConfig.TargetHistorySize

function PredictionSystem.RecordPosition(player, position)
    if not PredictionSystem.TargetHistory[player] then
        PredictionSystem.TargetHistory[player] = {}
    end

    local history = PredictionSystem.TargetHistory[player]
    table.insert(history, {
        pos = position,
        time = tick()
    })

    if #history > PredictionSystem.HistoryLimit then
        table.remove(history, 1)
    end
end

function PredictionSystem.PredictPosition(player, framesToPredict)
    local history = PredictionSystem.TargetHistory[player]
    if not history or #history < 2 then return nil end

    local latest = history[#history]
    local previous = history[#history - 1]

    if not latest or not previous then return nil end

    local velocity = (latest.pos - previous.pos) / math.max(latest.time - previous.time, 0.016)
    local predictedPos = latest.pos + (velocity * (framesToPredict * 0.016))

    return predictedPos
end

function PredictionSystem.Cleanup(player)
    PredictionSystem.TargetHistory[player] = nil
end

-- SISTEMA DE SUAVIZADO (SMOOTHING)
local SmoothingSystem = {}

function SmoothingSystem.GetSmoothedCamera(camera, targetPos, smoothFactor)
    if not camera or not targetPos then return camera.CFrame end

    local currentDir = camera.CFrame.LookVector
    local targetDir = (targetPos - camera.CFrame.Position).Unit

    local smoothedDir = currentDir:Lerp(targetDir, 1 - smoothFactor)
    return CFrame.lookAt(camera.CFrame.Position, camera.CFrame.Position + smoothedDir)
end

-- SISTEMA DE FOV DINÁMICO
local DynamicFOVSystem = {}

function DynamicFOVSystem.CalculateFOV(targetDistance, baseDistance)
    baseDistance = baseDistance or 100
    if targetDistance <= 0 then return 300 end

    local ratio = math.min(targetDistance / baseDistance, 1)
    local dynamicFOV = 50 + (300 - 50) * ratio

    return math.clamp(dynamicFOV, 50, 300)
end

-- CACHÉ DE PERSONAJES
local CharacterPartCache = {}
local PartCacheSystem = {}

function PartCacheSystem.Create(char, player)
    local cache = {
        player = player,
        character = char,
        Head = char:FindFirstChild("Head"),
        HumanoidRootPart = char:FindFirstChild("HumanoidRootPart"),
        Humanoid = char:FindFirstChild("Humanoid")
    }
    CharacterPartCache[player] = cache
    return cache
end

function PartCacheSystem.Get(player)
    local cache = CharacterPartCache[player]
    if cache and cache.character and cache.character.Parent then
        return cache
    end
    return nil
end

function PartCacheSystem.Cleanup(player)
    CharacterPartCache[player] = nil
end

-- CÍRCULO DE FOV (DRAWING)
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 1
FOVCircle.NumSides = 60
FOVCircle.Color = Color3.fromRGB(255, 255, 255)
FOVCircle.Visible = false

-- ESTADO INTERNO
local CachedState = {
    KeyActive = false,
    ActiveEnemies = {},
    LastVisibility = {},
    LocalPlayerRoot = nil
}

local function UpdateEnemyList()
    Utilities.SafeTableClear(CachedState.ActiveEnemies)
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and not Aiming.WhitelistedPlayers[p.UserId] then
            table.insert(CachedState.ActiveEnemies, p)
        end
    end
end

local function UpdateKeyState()
    local Key = Aiming.KeyString
    if not Key or Key == "" then
        CachedState.KeyActive = false
        return
    end

    if string.find(Key, "MouseButton") then
        local enumVal = Enum.UserInputType[Key]
        if enumVal then
            CachedState.KeyActive = UserInputService:IsMouseButtonPressed(enumVal)
        else
            CachedState.KeyActive = false
        end
    else
        local kc = Enum.KeyCode[Key:upper()]
        if kc then
            CachedState.KeyActive = UserInputService:IsKeyDown(kc)
        else
            CachedState.KeyActive = false
        end
    end
end

local function IsKeyActive()
    if Aiming.ActivationMode == "Siempre" then return true end
    if Aiming.ActivationMode == "Alternar" then return Aiming.ToggleState end
    return CachedState.KeyActive
end

-- CHECK DE VISIBILIDAD (WALL CHECK)
local function IsVisible(TargetPart, Character, player)
    if not Aiming.WallCheck then return true end
    if not TargetPart or not Character or not player then return true end

    local safeCamera = Utilities.GetSafeCamera()
    if not safeCamera or not LocalPlayer.Character then return true end

    local origin = safeCamera.CFrame.Position
    local targetPos = TargetPart.Position
    local direction = targetPos - origin

    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Blacklist
    params.FilterDescendantsInstances = {LocalPlayer.Character}
    params.IgnoreWater = true

    local result = workspace:Raycast(origin, direction, params)

    if not result or result.Instance:IsDescendantOf(Character) or result.Instance == TargetPart then
        return true
    end

    return false
end

-- SISTEMA AIMBOT
local AimbotSystem = {}

function AimbotSystem.FindTarget(Center)
    if not Utilities.ValidatePlayer(LocalPlayer) then return nil end
    if #CachedState.ActiveEnemies == 0 then return nil end

    local Target = nil
    local DistFOV = Aiming.FOV

    if Aiming.DynamicFOV then
        local closestDist = math.huge
        for _, p in ipairs(CachedState.ActiveEnemies) do
            if Utilities.ValidatePlayer(p) and p.Character then
                local dist = Utilities.SafeDistance(LocalPlayer.Character.HumanoidRootPart.Position, p.Character.HumanoidRootPart.Position)
                if dist < closestDist then
                    closestDist = dist
                end
            end
        end
        DistFOV = DynamicFOVSystem.CalculateFOV(closestDist, 100)
    end

    for _, p in ipairs(CachedState.ActiveEnemies) do
        if not Utilities.ValidatePlayer(p) then continue end
        if Aiming.TeamCheck and p.Team == LocalPlayer.Team then continue end
        if Aiming.FriendCheck and LocalPlayer:IsFriendsWith(p.UserId) then continue end
        if Aiming.ExcludedPlayers[p.UserId] then continue end

        local cache = PartCacheSystem.Get(p) or PartCacheSystem.Create(p.Character, p)
        if not cache then continue end

        local hum = cache.Humanoid
        if not hum or hum.Health <= 0 then continue end

        local part = nil
        if Aiming.AimMode == "Cabeza" then
            part = cache.Head
        elseif Aiming.AimMode == "Cuerpo" or Aiming.AimMode == "RPG" then
            part = cache.HumanoidRootPart
        elseif Aiming.AimMode == "Legit" then
            local head = cache.Head
            local torso = cache.HumanoidRootPart
            local safeCamera = Utilities.GetSafeCamera()
            if not safeCamera then continue end

            local headPos, headOn = head and safeCamera:WorldToViewportPoint(head.Position) or nil, false
            local torsoPos, torsoOn = torso and safeCamera:WorldToViewportPoint(torso.Position) or nil, false

            local headDist = headOn and Utilities.GetScreenDistance(headPos, Center) or math.huge
            local torsoDist = torsoOn and Utilities.GetScreenDistance(torsoPos, Center) or math.huge

            part = headDist < torsoDist and head or torso
        end

        if not part then continue end

        local localRoot = CachedState.LocalPlayerRoot or (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart"))
        if Aiming.UseMagnitude and localRoot then
            if Utilities.SafeDistance(localRoot.Position, part.Position) > Aiming.MaxStuds then
                continue
            end
        end

        local safeCamera = Utilities.GetSafeCamera()
        if not safeCamera then continue end

        local screenPos, onScreen = safeCamera:WorldToViewportPoint(part.Position)
        if onScreen then
            local mag = Utilities.GetScreenDistance(screenPos, Center)
            if mag < DistFOV and IsVisible(part, p.Character, p) then
                Target = part
                DistFOV = mag
            end
        end
    end

    return Target
end

function AimbotSystem.LockCamera(target)
    if not target or not Aiming.LockCamera then return end

    local safeCamera = Utilities.GetSafeCamera()
    if not safeCamera then return end

    local aimPos = target.Position
    local char = target.Parent
    local hum = char and char:FindFirstChild("Humanoid")

    if hum and hum.SeatPart and hum.SeatPart:IsA("VehicleSeat") then
        local head = char:FindFirstChild("Head")
        if head then aimPos = head.Position end
    end

    if Aiming.AimMode == "RPG" then
        local rootPart = char and char:FindFirstChild("HumanoidRootPart")
        if rootPart and hum then
            local groundY = rootPart.Position.Y - (hum.HipHeight + rootPart.Size.Y / 2)
            aimPos = Vector3.new(rootPart.Position.X, groundY, rootPart.Position.Z)
        end
    end

    if Aiming.UsePredictiveAim then
        local player = Players:GetPlayerFromCharacter(target.Parent)
        if player then
            local predictedPos = PredictionSystem.PredictPosition(player, ScriptConfig.PredictionFrames)
            if predictedPos then
                aimPos = predictedPos
            end
        end
    end

    if Aiming.UseSmoothTracking then
        safeCamera.CFrame = SmoothingSystem.GetSmoothedCamera(safeCamera, aimPos, Aiming.SmoothFactor)
    else
        safeCamera.CFrame = CFrame.lookAt(safeCamera.CFrame.Position, aimPos)
    end
end

-- GESTIÓN DE JUGADORES
local function InitPlayer(player)
    if player == LocalPlayer then return end
    player.CharacterAdded:Connect(function(char)
        task.wait(0.5)
        PartCacheSystem.Cleanup(player)
        PartCacheSystem.Create(char, player)
    end)
    if player.Character then
        PartCacheSystem.Create(player.Character, player)
    end
end

for _, p in ipairs(Players:GetPlayers()) do InitPlayer(p) end
Players.PlayerAdded:Connect(InitPlayer)
Players.PlayerRemoving:Connect(function(p)
    PartCacheSystem.Cleanup(p)
    PredictionSystem.Cleanup(p)
end)

-- REGISTRO TECLA ALTERNAR (TOGGLE)
UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if Aiming.ActivationMode == "Alternar" then
        local Key = Aiming.KeyString
        if string.find(Key, "MouseButton") then
            if input.UserInputType == Enum.UserInputType[Key] then
                Aiming.ToggleState = not Aiming.ToggleState
            end
        else
            if input.KeyCode == Enum.KeyCode[Key:upper()] then
                Aiming.ToggleState = not Aiming.ToggleState
            end
        end
    end
end)

-- BUCLE PRINCIPAL (RENDERSTEPPED)
RunService.RenderStepped:Connect(function()
    local safeCamera = Utilities.GetSafeCamera()
    if not safeCamera then return end

    UpdateEnemyList()
    UpdateKeyState()

    -- Actualizar Círculo FOV
    local center = Vector2.new(safeCamera.ViewportSize.X / 2, safeCamera.ViewportSize.Y / 2)
    FOVCircle.Position = center
    FOVCircle.Radius = Aiming.FOV
    FOVCircle.Visible = Aiming.Enabled and Aiming.ShowFOV

    -- Grabar posiciones para predicción
    for _, p in ipairs(CachedState.ActiveEnemies) do
        if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            PredictionSystem.RecordPosition(p, p.Character.HumanoidRootPart.Position)
        end
    end

    -- Ejecutar Aimbot
    if Aiming.Enabled and IsKeyActive() then
        local target = AimbotSystem.FindTarget(center)
        if target then
            AimbotSystem.LockCamera(target)
        end
    end
end)

print("[PYTHON_S] Módulo de AIM cargado correctamente.")

