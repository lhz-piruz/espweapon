--// Hermanos CP // Hub Loader (Protegido, Optimizado + IDs Completos)
local _P = game:GetService("Players")
local _CG = game:GetService("CoreGui")
local _TS = game:GetService("TweenService")
local _UIS = game:GetService("UserInputService")
local _LP = _P.LocalPlayer

-- CAPA DE SEGURIDAD: ProtecciÃ³n anti-duplicado de interfaces
if _CG:FindFirstChild("HermanosCPLoader_Premium") or (_LP:FindFirstChild("PlayerGui") and _LP.PlayerGui:FindFirstChild("HermanosCPLoader_Premium")) then
    return
end

-- Enlace directo de la versiÃ³n Normal
local _nLink = "https://raw.githubusercontent.com/sob76811-sketch/normal/refs/heads/main/obfuscated_script-1784562776718.lua"

-- CAPA DE SEGURIDAD: Decodificador Base64 para la versiÃ³n Light
local function _d64(data)
    local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end

local _lLink = _d64("aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL3NvYjc2ODExLXNrZXRjaC9saXRnL3JlZnMvaGVhZHMvbWFpbi9SRUFETUUubWQ=")

local function _d(y, m, d, h, n)
    return os.time({year = y, month = m, day = d, hour = h or 0, min = n or 0, sec = 0})
end

-- BASE DE DATOS COMPLETA CON TODOS LOS IDS
local _L = {
    [9091227709] = {fechaLimite = _d(2026, 8, 21, 23, 59), diasIniciales = "30", rol = "USUARIO", producto = "N/A"},
    [10908318368] = {fechaLimite = "Infinito", diasIniciales = "Infinito", rol = "OWNER", producto = "N/A"},
    [4252198913] = {fechaLimite = "Infinito", diasIniciales = "Infinito", rol = "OWNER", producto = "N/A"},
    [4187247061] = {fechaLimite = _d(2026, 7, 23, 16, 46), diasIniciales = "5 horas", rol = "PRUEBA GRATIS", producto = "N/A"},
    [8744036907] = {fechaLimite = _d(2026, 8, 15, 23, 59), diasIniciales = "25", rol = "USUARIO", producto = "N/A"},
    [5510998492] = {fechaLimite = _d(2026, 8, 13, 23, 59), diasIniciales = "23", rol = "USUARIO", producto = "N/A"},
    [9588424071] = {fechaLimite = _d(2026, 8, 14, 23, 59), diasIniciales = "24", rol = "USUARIO", producto = "N/A"},
    [9571972521] = {fechaLimite = _d(2026, 8, 4, 23, 59), diasIniciales = "14", rol = "USUARIO", producto = "N/A"},
    [10908320401] = {fechaLimite = _d(2026, 8, 14, 23, 59), diasIniciales = "24", rol = "USUARIO", producto = "N/A"},
    [2313141924] = {fechaLimite = _d(2026, 7, 26, 23, 59), diasIniciales = "5", rol = "USUARIO", producto = "N/A"},
    [2415561227] = {fechaLimite = _d(2026, 9, 5, 23, 59), diasIniciales = "45", rol = "USUARIO", producto = "N/A"},
    [9620598203] = {fechaLimite = _d(2026, 7, 27, 23, 59), diasIniciales = "5", rol = "USUARIO", producto = "N/A"},
    [10859588744] = {fechaLimite = _d(2026, 8, 16, 23, 59), diasIniciales = "25", rol = "USUARIO", producto = "N/A"},
    [11013078567] = {fechaLimite = _d(2026, 8, 22, 23, 59), diasIniciales = "30", rol = "USUARIO", producto = "N/A"},
    [10155891866] = {fechaLimite = _d(2026, 7, 27, 23, 59), diasIniciales = "5", rol = "USUARIO", producto = "N/A"},
    [9660039922] = {fechaLimite = _d(2026, 7, 27, 23, 59), diasIniciales = "5", rol = "USUARIO", producto = "N/A"},
    [5014679091] = {fechaLimite = _d(2026, 8, 2, 23, 59), diasIniciales = "10", rol = "USUARIO", producto = "N/A"},
    [9069066397] = {fechaLimite = _d(2026, 7, 28, 23, 59), diasIniciales = "5", rol = "USUARIO", producto = "N/A"},
    [9660019116] = {fechaLimite = _d(2026, 7, 28, 11, 11), diasIniciales = "5 dias", rol = "USUARIO", producto = "N/A"},
    [10796131434] = {fechaLimite = _d(2026, 7, 28, 18, 1), diasIniciales = "5 dias", rol = "USUARIO", producto = "1 rpg"},
    [9776377738] = {fechaLimite = _d(2026, 8, 17, 18, 2), diasIniciales = "25 dias", rol = "USUARIO", producto = "6 rpgs 2 muertos y 4 verdes"},
    [10726863720] = {fechaLimite = _d(2026, 7, 26, 18, 31), diasIniciales = "3 dias", rol = "PRUEBA GRATIS", producto = "rpg v"},
    [9578206766] = {fechaLimite = _d(2026, 7, 26, 19, 1), diasIniciales = "3 dias", rol = "PRUEBA GRATIS", producto = "rpg v"},
    [9546541063] = {fechaLimite = _d(2026, 8, 22, 19, 14), diasIniciales = "30 dias", rol = "USUARIO", producto = "6 rpgs v"}
}

local _uid = _LP.UserId
local _ld = _L[_uid]

if not _ld then
    _LP:Kick("No tienes una licencia registrada para Hermanos CP. Contacta al administrador.")
    return
end

task.spawn(function()
    while true do
        task.wait(1)
        local _t = os.time()
        if typeof(_ld.fechaLimite) == "number" then
            if _t >= _ld.fechaLimite then
                _LP:Kick("Tu licencia de Hermanos CP ha expirado. Renueva tus dÃ­as en el Discord.")
                break
            end
        end
    end
end)

local function _fmtT(fl)
    if fl == "Infinito" then return "Infinito" end
    local sr = fl - os.time()
    if sr <= 0 then return "Expirado" end
    local d = math.floor(sr / 86400)
    local h = math.floor((sr % 86400) / 3600)
    local m = math.floor((sr % 3600) / 60)
    local s = math.floor(sr % 60)
    return string.format("%d d, %d h, %d m, %d s", d, h, m, s)
end

local function _gp()
    local s, p = pcall(function()
        return (type(cloneref) == "function" and cloneref(_CG)) or _CG
    end)
    if s and p then return p end
    return _LP:WaitForChild("PlayerGui", 5)
end

local _Gui = Instance.new("ScreenGui")
_Gui.Name = "HermanosCPLoader_Premium"
_Gui.IgnoreGuiInset = true
_Gui.ResetOnSpawn = false
_Gui.Parent = _gp()

local _Fr = Instance.new("Frame")
_Fr.Size = UDim2.new(0, 390, 0, 330)
_Fr.Position = UDim2.new(0.5, -195, 0.5, -165)
_Fr.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
_Fr.BorderSizePixel = 0
_Fr.ClipsDescendants = true
_Fr.Parent = _Gui

local _Co = Instance.new("UICorner")
_Co.CornerRadius = UDim.new(0, 14)
_Co.Parent = _Fr

local _St = Instance.new("UIStroke")
_St.Color = Color3.fromRGB(0, 180, 255)
_St.Thickness = 1.5
_St.Transparency = 0.2
_St.Parent = _Fr

local _Gr = Instance.new("UIGradient")
_Gr.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 12, 28)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(8, 8, 12)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(5, 15, 20)),
})
_Gr.Rotation = 45
_Gr.Parent = _Fr

local _Hb = Instance.new("Frame")
_Hb.Size = UDim2.new(1, 0, 0, 48)
_Hb.BackgroundColor3 = Color3.fromRGB(14, 14, 22)
_Hb.BorderSizePixel = 0
_Hb.Parent = _Fr

local _Hbc = Instance.new("UICorner")
_Hbc.CornerRadius = UDim.new(0, 14)
_Hbc.Parent = _Hb

local _Hbb = Instance.new("Frame")
_Hbb.Size = UDim2.new(1, 0, 0, 10)
_Hbb.Position = UDim2.new(0, 0, 1, -10)
_Hbb.BackgroundColor3 = Color3.fromRGB(14, 14, 22)
_Hbb.BorderSizePixel = 0
_Hbb.Parent = _Hb

local _Hbs = Instance.new("Frame")
_Hbs.Size = UDim2.new(1, 0, 0, 1)
_Hbs.Position = UDim2.new(0, 0, 1, 0)
_Hbs.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
_Hbs.BorderSizePixel = 0
_Hbs.Parent = _Hb

local _Bk = Instance.new("TextButton")
_Bk.Size = UDim2.new(0, 26, 0, 26)
_Bk.Position = UDim2.new(0, 12, 0.5, -13)
_Bk.Text = "<"
_Bk.TextSize = 12
_Bk.Font = Enum.Font.GothamBold
_Bk.TextColor3 = Color3.fromRGB(150, 160, 185)
_Bk.BackgroundTransparency = 1
_Bk.Visible = false
_Bk.Parent = _Hb

local _Ti = Instance.new("TextLabel")
_Ti.Font = Enum.Font.Michroma
_Ti.TextSize = 11
_Ti.TextColor3 = Color3.fromRGB(255, 255, 255)
_Ti.Size = UDim2.new(1, -80, 1, 0)
_Ti.Position = UDim2.new(0, 18, 0, 0)
_Ti.BackgroundTransparency = 1
_Ti.Text = "HERMANOS CP"
_Ti.RichText = true
_Ti.TextXAlignment = Enum.TextXAlignment.Left
_Ti.Parent = _Hb

local _Cl = Instance.new("TextButton")
_Cl.Size = UDim2.new(0, 26, 0, 26)
_Cl.Position = UDim2.new(1, -38, 0.5, -13)
_Cl.Text = "X"
_Cl.TextSize = 18
_Cl.Font = Enum.Font.GothamMedium
_Cl.TextColor3 = Color3.fromRGB(255, 90, 110)
_Cl.BackgroundColor3 = Color3.fromRGB(28, 16, 22)
_Cl.BorderSizePixel = 0
_Cl.Parent = _Hb

local _Clc = Instance.new("UICorner")
_Clc.CornerRadius = UDim.new(0, 6)
_Clc.Parent = _Cl

_Cl.MouseButton1Click:Connect(function() _Gui:Destroy() end)

local _Sub = Instance.new("TextLabel")
_Sub.Font = Enum.Font.Ubuntu
_Sub.TextSize = 12
_Sub.TextColor3 = Color3.fromRGB(150, 160, 185)
_Sub.Size = UDim2.new(1, 0, 0, 20)
_Sub.Position = UDim2.new(0, 0, 0, 62)
_Sub.BackgroundTransparency = 1
_Sub.Text = "Elija la optimizacion para su sistema de juego:"
_Sub.Parent = _Fr

local _BCon = Instance.new("Frame")
_BCon.Size = UDim2.new(1, -36, 0, 156)
_BCon.Position = UDim2.new(0, 18, 0, 95)
_BCon.BackgroundTransparency = 1
_BCon.Parent = _Fr

local _Lay = Instance.new("UIListLayout")
_Lay.FillDirection = Enum.FillDirection.Vertical
_Lay.Padding = UDim.new(0, 12)
_Lay.SortOrder = Enum.SortOrder.LayoutOrder
_Lay.Parent = _BCon

local function _cB(txt, stxt, col, ord)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, 0, 0, 68)
    b.BackgroundColor3 = Color3.fromRGB(16, 16, 26)
    b.BorderSizePixel = 0
    b.Text = ""
    b.LayoutOrder = ord
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = b
    
    local st = Instance.new("UIStroke")
    st.Thickness = 1.2
    st.Color = Color3.fromRGB(32, 32, 48)
    st.Transparency = 0.4
    st.Parent = b

    local mt = Instance.new("TextLabel")
    mt.Font = Enum.Font.GothamBold
    mt.TextSize = 13
    mt.TextColor3 = Color3.fromRGB(245, 245, 250)
    mt.Size = UDim2.new(1, -50, 0, 20)
    mt.Position = UDim2.new(0, 16, 0, 8)
    mt.TextXAlignment = Enum.TextXAlignment.Left
    mt.BackgroundTransparency = 1
    mt.Text = txt
    mt.Parent = b

    local dt = Instance.new("TextLabel")
    dt.Font = Enum.Font.Ubuntu
    dt.TextSize = 11
    dt.TextColor3 = Color3.fromRGB(130, 140, 160)
    dt.Size = UDim2.new(1, -50, 0, 32)
    dt.Position = UDim2.new(0, 16, 0, 28)
    dt.TextXAlignment = Enum.TextXAlignment.Left
    dt.TextYAlignment = Enum.TextYAlignment.Top
    dt.BackgroundTransparency = 1
    dt.TextWrapped = true
    dt.Text = stxt
    dt.Parent = b
    
    local ar = Instance.new("TextLabel")
    ar.Font = Enum.Font.GothamBold
    ar.TextSize = 14
    ar.TextColor3 = Color3.fromRGB(60, 60, 80)
    ar.Size = UDim2.new(0, 20, 1, 0)
    ar.Position = UDim2.new(1, -30, 0, 0)
    ar.BackgroundTransparency = 1
    ar.Text = ">"
    ar.Parent = b

    b.MouseEnter:Connect(function()
        _TS:Create(b, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(22, 22, 38)}):Play()
        _TS:Create(st, TweenInfo.new(0.2), {Color = col, Transparency = 0}):Play()
        _TS:Create(mt, TweenInfo.new(0.2), {TextColor3 = col}):Play()
        _TS:Create(ar, TweenInfo.new(0.2), {TextColor3 = col}):Play()
    end)
    b.MouseLeave:Connect(function()
        _TS:Create(b, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(16, 16, 26)}):Play()
        _TS:Create(st, TweenInfo.new(0.2), {Color = Color3.fromRGB(32, 32, 48), Transparency = 0.4}):Play()
        _TS:Create(mt, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(245, 245, 250)}):Play()
        _TS:Create(ar, TweenInfo.new(0.2), {TextColor3 = Color3.fromRGB(60, 60, 80)}):Play()
    end)

    b.Parent = _BCon
    return b
end

local _NormB = _cB("VERSION FULL / NORMAL", "Optimizado para ordenadores de alto rendimiento con carga completa de recursos.", Color3.fromRGB(0, 210, 255), 1)
local _LightB = _cB("VERSION ULTRA LIGHT", "Configuracion de alto rendimiento disenada para reducir el consumo y maximizar tus FPS.", Color3.fromRGB(0, 255, 140), 2)

local _InfB = Instance.new("Frame")
_InfB.Size = UDim2.new(1, -36, 0, 36)
_InfB.Position = UDim2.new(0, 18, 1, -48)
_InfB.BackgroundColor3 = Color3.fromRGB(14, 14, 24)
_InfB.Parent = _Fr

local _InfBc = Instance.new("UICorner")
_InfBc.CornerRadius = UDim.new(0, 6)
_InfBc.Parent = _InfB

local _InfBs = Instance.new("UIStroke")
_InfBs.Color = Color3.fromRGB(40, 40, 60)
_InfBs.Thickness = 1
_InfBs.Parent = _InfB

local _InfT = Instance.new("TextLabel")
_InfT.Size = UDim2.new(1, -14, 1, 0)
_InfT.Position = UDim2.new(0, 10, 0, 0)
_InfT.BackgroundTransparency = 1
_InfT.Font = Enum.Font.Ubuntu
_InfT.TextSize = 11
_InfT.TextColor3 = Color3.fromRGB(180, 190, 220)
_InfT.TextXAlignment = Enum.TextXAlignment.Left
_InfT.TextWrapped = true
_InfT.Parent = _InfB

task.spawn(function()
    while true do
        local ltxt = _ld.fechaLimite == "Infinito" and "Licencia Inf\nTiempo de Licencia: Infinito" or ("Licencia Temp\nTiempo Restante: " .. _fmtT(_ld.fechaLimite))
        _InfT.Text = string.format("Usuario: %s  |  %s", _LP.Name, ltxt)
        task.wait(1)
    end
end)

if _ld.rol == "OWNER" or _uid == 10908318368 or _uid == 4252198913 then
    _InfB.Size = UDim2.new(1, -120, 0, 36)
    
    local _OwnB = Instance.new("TextButton")
    _OwnB.Size = UDim2.new(0, 75, 0, 36)
    _OwnB.Position = UDim2.new(1, -93, 1, -48)
    _OwnB.BackgroundColor3 = Color3.fromRGB(30, 15, 45)
    _OwnB.Font = Enum.Font.GothamBold
    _OwnB.TextSize = 10
    _OwnB.TextColor3 = Color3.fromRGB(255, 215, 0)
    _OwnB.Text = "OWNER"
    _OwnB.Parent = _Fr
    
    local _OwnBc = Instance.new("UICorner")
    _OwnBc.CornerRadius = UDim.new(0, 6)
    _OwnBc.Parent = _OwnB
    
    local _OwnBs = Instance.new("UIStroke")
    _OwnBs.Color = Color3.fromRGB(255, 215, 0)
    _OwnBs.Thickness = 1
    _OwnBs.Parent = _OwnB

    local _OwnP = Instance.new("Frame")
    _OwnP.Size = UDim2.new(1, 0, 1, -48)
    _OwnP.Position = UDim2.new(0, 0, 0, 48)
    _OwnP.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
    _OwnP.BorderSizePixel = 0
    _OwnP.Visible = false
    _OwnP.Parent = _Fr
    
    local _OwnSt = Instance.new("TextLabel")
    _OwnSt.Font = Enum.Font.GothamBold
    _OwnSt.TextSize = 11
    _OwnSt.TextColor3 = Color3.fromRGB(255, 215, 0)
    _OwnSt.Size = UDim2.new(1, -36, 0, 20)
    _OwnSt.Position = UDim2.new(0, 18, 0, 15)
    _OwnSt.BackgroundTransparency = 1
    _OwnSt.TextXAlignment = Enum.TextXAlignment.Left
    _OwnSt.Text = "PANEL OWNER // GESTION DE LICENCIAS"
    _OwnSt.Parent = _OwnP

    local _Sc = Instance.new("ScrollingFrame")
    _Sc.Size = UDim2.new(1, -36, 1, -85)
    _Sc.Position = UDim2.new(0, 18, 0, 45)
    _Sc.BackgroundTransparency = 1
    _Sc.AutomaticCanvasSize = Enum.AutomaticSize.Y
    _Sc.ScrollBarThickness = 2
    _Sc.ScrollBarImageColor3 = Color3.fromRGB(0, 180, 255)
    _Sc.Parent = _OwnP
    
    local _ScL = Instance.new("UIListLayout")
    _ScL.Padding = UDim.new(0, 8)
    _ScL.SortOrder = Enum.SortOrder.LayoutOrder
    _ScL.Parent = _Sc

    local _lOrd = {}
    for id, info in pairs(_L) do
        table.insert(_lOrd, {id = id, info = info})
    end

    table.sort(_lOrd, function(a, b)
        if a.info.rol == "OWNER" and b.info.rol ~= "OWNER" then return true end
        if b.info.rol == "OWNER" and a.info.rol ~= "OWNER" then return false end
        return (a.info.diasIniciales or 0) > (b.info.diasIniciales or 0)
    end)

    for _, ent in ipairs(_lOrd) do
        local id = ent.id
        local info = ent.info

        local _ic = Instance.new("Frame")
        _ic.Size = UDim2.new(1, -4, 0, 36)
        _ic.BackgroundColor3 = Color3.fromRGB(16, 16, 26)
        _ic.ClipsDescendants = true
        
        local _icc = Instance.new("UICorner")
        _icc.CornerRadius = UDim.new(0, 6)
        _icc.Parent = _ic

        local _ics = Instance.new("UIStroke")
        _ics.Color = Color3.fromRGB(30, 30, 45)
        _ics.Thickness = 1
        _ics.Parent = _ic
        
        local _ict = Instance.new("TextLabel")
        _ict.Size = UDim2.new(1, -40, 0, 36)
        _ict.Position = UDim2.new(0, 14, 0, 0)
        _ict.BackgroundTransparency = 1
        _ict.Font = Enum.Font.Ubuntu
        _ict.TextSize = 12
        _ict.TextColor3 = Color3.fromRGB(0, 210, 255)
        _ict.TextXAlignment = Enum.TextXAlignment.Left
        _ict.Text = "Buscando Servidor de Roblox..."
        _ict.Parent = _ic

        local _dBtn = Instance.new("TextButton")
        _dBtn.Font = Enum.Font.GothamBold
        _dBtn.TextSize = 11
        _dBtn.TextColor3 = Color3.fromRGB(0, 180, 255)
        _dBtn.Size = UDim2.new(0, 30, 0, 36)
        _dBtn.Position = UDim2.new(1, -30, 0, 0)
        _dBtn.BackgroundTransparency = 1
        _dBtn.Text = "v"
        _dBtn.Parent = _ic

        local _dFr = Instance.new("Frame")
        _dFr.Size = UDim2.new(1, -20, 0, 75)
        _dFr.Position = UDim2.new(0, 14, 0, 36)
        _dFr.BackgroundTransparency = 1
        _dFr.Parent = _ic

        local _dTxt = Instance.new("TextLabel")
        _dTxt.Size = UDim2.new(1, 0, 1, 0)
        _dTxt.BackgroundTransparency = 1
        _dTxt.Font = Enum.Font.Ubuntu
        _dTxt.TextSize = 11
        _dTxt.TextColor3 = Color3.fromRGB(140, 150, 175)
        _dTxt.TextXAlignment = Enum.TextXAlignment.Left
        _dTxt.TextYAlignment = Enum.TextYAlignment.Top
        _dTxt.TextWrapped = true
        _dTxt.Parent = _dFr

        _ic.Parent = _Sc

        local _cName = "ID: " .. tostring(id)
        task.spawn(function()
            local s, un = pcall(function() return _P:GetNameFromUserIdAsync(id) end)
            if s and un then _cName = un end
            
            if info.rol:find("OWNER") then
                _ict.TextColor3 = Color3.fromRGB(255, 215, 0)
                _ict.Text = string.format("%s | %s", _cName, info.rol)
                _dBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
            else
                _ict.Text = string.format("%s | %s", _cName, info.rol == "PRUEBA GRATIS" and "PRUEBA GRATIS (3 DIAS)" or string.format("USUARIO (%s)", tostring(info.diasIniciales)))
            end
        end)

        task.spawn(function()
            while true do
                local onl = _P:GetPlayerByUserId(id) ~= nil and "En linea" or "Desconectado"
                local actT = typeof(info.diasIniciales) == "number" and (info.diasIniciales .. " dias asignados") or info.diasIniciales
                
                _dTxt.Text = string.format(
                    "- Nombre: %s\n- ID Cuenta: %s\n- Tiempo Activado: %s\n- Tiempo Restante: %s\n- Estado: %s",
                    _cName, tostring(id), actT, _fmtT(info.fechaLimite), onl
                )
                task.wait(1)
            end
        end)

        local _isOpen = false
        _dBtn.MouseButton1Click:Connect(function()
            _isOpen = not _isOpen
            _dBtn.Text = _isOpen and "^" or "v"
            local tSz = _isOpen and UDim2.new(1, -4, 0, 120) or UDim2.new(1, -4, 0, 36)
            _TS:Create(_ic, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {Size = tSz}):Play()
            task.delay(0.2, function() _Sc.CanvasSize = UDim2.new(0, 0, 0, _ScL.AbsoluteContentSize.Y) end)
        end)
    end

    local function _tP(vp)
        _OwnP.Visible = vp
        _Bk.Visible = vp
        _BCon.Visible = not vp
        _Sub.Visible = not vp
        _OwnB.Visible = not vp
        _Ti.Position = vp and UDim2.new(0, 42, 0, 0) or UDim2.new(0, 18, 0, 0)
    end

    _OwnB.MouseButton1Click:Connect(function() _tP(true) end)
    _Bk.MouseButton1Click:Connect(function() _tP(false) end)
end

local function _cls(cb)
    _TS:Create(_St, TweenInfo.new(0.2), {Transparency = 1}):Play()
    local tw = _TS:Create(_Fr, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 390, 0, 0), Position = UDim2.new(0.5, -195, 0.5, 0)})
    tw:Play()
    tw.Completed:Connect(function()
        _Gui:Destroy()
        cb()
    end)
end

_NormB.MouseButton1Click:Connect(function()
    _cls(function() 
        print("[Loader] Descargando y Ejecutando VersiÃ³n Normal...")
        local success, res = pcall(function()
            local code = game:HttpGet(_nLink)
            if not code or code == "" then
                error("La URL devolviÃ³ un contenido vacÃ­o o fallÃ³ la conexiÃ³n.")
            end
            return loadstring(code)
        end)
        if not success or not res then
            warn("Error crÃ­tico al cargar la VersiÃ³n Normal: " .. tostring(res))
        else
            local runSuccess, runErr = pcall(res)
            if not runSuccess then
                warn("Error de ejecuciÃ³n en el script remoto: " .. tostring(runErr))
            end
        end
    end)
end)

_LightB.MouseButton1Click:Connect(function()
    _cls(function()
        print("[Loader] Descargando y Ejecutando VersiÃ³n Light...")
        local success, res = pcall(function()
            local code = game:HttpGet(_lLink)
            if not code or code == "" then
                error("La URL devolviÃ³ un contenido vacÃ­o o fallÃ³ la conexiÃ³n.")
            end
            return loadstring(code)
        end)
        if not success or not res then
            warn("Error crÃ­tico al cargar la VersiÃ³n Light: " .. tostring(res))
        else
            local runSuccess, runErr = pcall(res)
            if not runSuccess then
                warn("Error de ejecuciÃ³n en el script remoto: " .. tostring(runErr))
            end
        end
    end)
end)

local _drag = false
local _dSt = Vector3.zero
local _sPos = UDim2.new()

_Hb.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        _drag = true
        _dSt = input.Position
        _sPos = _Fr.Position
    end
end)

_UIS.InputChanged:Connect(function(input)
    if _drag and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local dl = input.Position - _dSt
        _TS:Create(_Fr, TweenInfo.new(0.08, Enum.EasingStyle.Linear), {
            Position = UDim2.new(_sPos.X.Scale, _sPos.X.Offset + dl.X, _sPos.Y.Scale, _sPos.Y.Offset + dl.Y)
        }):Play()
    end
end)

_UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        _drag = false
        end
