local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer
local ref = nil
pcall(function()
	ref = game:GetService("RbxAnalyticsService")
end)
local str = "https://montanahub-reset-hwuid.onrender.com"
local v15
do
	local ref2 = nil
	pcall(function()
		if typeofgethwid == "function" then
			ref2 = tostring(gethwid())
		end
	end)
	if not ref2 then
		pcall(function()
			if typeofget_hwid == "function" then
				ref2 = tostring(get_hwid())
			end
		end)
	end
	if  not ref2 and ref then
		pcall(function()
			ref2 = tostring(ref:GetClientId())
		end)
	end
	if  not ref2 or (ref2 == "") then
		ref2 = tostring(LocalPlayer.UserId or (0))
	end
	v15 = "HWUID_" .. ref2 
end
local str2 = "MontanaHub_Elite_Master_Config.json"
local var = ""
if writefile and readfile and isfile then
	if isfile(str2) then
		local num = 0
		local v695
		local v696
		local v697
		while true do
			if num == 0 then
				v695 = 0 
				v696 = nil
				num = 1 
			end
			if num == 1 then
				v697 = nil
				while true do
					if v695 == 0 then
						v696, v697 = pcall(function()
							return HttpService:JSONDecode(readfile(str2))
						end)
						if v696 and v697 and (typev697 == "table") and v697.Key then
							var = tostring(v697.Key)
						end
						break
					end
				end
				break
			end
		end
	end
end
local function v18(v112, v113)
	local num2 = 0
	local v115
	local v116
	local v117
	local v118
	local v119
	while true do
		if num2 == 1 then
			v117 = HttpService:JSONEncode(v113)
			v118, v119 = pcall(function()
				local num3 = 0
				local v743
				local v744
				local v745
				while true do
					if (608 - 607) == num3 then
						v745 = nil
						while true do
							if v743 == 0 then
								v744 = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request 
								if v744 then
									return v744({
										["Url"] = v115,
										["Method"] = "POST",
										["Headers"] = v116,
										["Body"] = v117
									})
								end
								v743 = 1
							end
							if 1 == v743 then
								local num4 = 0 
								while true do
									if (1623 - 1623) == num4 then
										v745 = HttpService:PostAsync(v115, v117, Enum.HttpContentType.Application_Json)
										return {
											["Body"] = v745,
											["StatusCode"] = 200
										}
									end
								end
							end
						end
						break
					end
					if num3 == 0 then
						v743 = 0 
						v744 = nil
						num3 = 1 
					end
				end
			end)
			num2 = 2
		end
		if num2 == 0 then
			v115 = str .. v112 
					v116 = {
						["Content-Type"] = "application/json",
						["User-Agent"] = "MontanaHub-Mobile-Client"
					}
					v698 = 1 
				end
				if v698 == 1 then
					num2 = 1
		end
		if num2 == 2 then
			if v118 and v119 then
				local body = v119.Body or v119.body 
				if body then
					local v1079, v1080 = pcall(function()
						return HttpService:JSONDecode(body)
					end)
					if v1079 and (typev1080 == "table") then
						return true, v1080
					end
					return false, {
						["valid"] = false,
						["message"] = "Respuesta inválida del servidor."
					}
				end
			end
			return false, {
				["valid"] = false,
				["message"] = "Error de conexión o ejecutor incompatible."
			}
		end
	end
end
pcall(function()
	if CoreGui:FindFirstChild("MontanaHub_Elite_Master_UI") then
		CoreGui.MontanaHub_Elite_Master_UI:Destroy()
	end
	if gethui then
		local hiddenUI = gethui()
		if hiddenUI and hiddenUI:FindFirstChild("MontanaHub_Elite_Master_UI") then
			hiddenUI.MontanaHub_Elite_Master_UI:Destroy()
		end
	end
end)
local Instance = Instance.new("ScreenGui")
Instance.Name = "MontanaHub_Elite_Master_UI"
Instance.ResetOnSpawn = false
Instance.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Instance.Parent = (gethui and gethui()) or CoreGui 
local Frame = Instance.new("Frame")
Frame.Parent = Instance
Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 14)
Frame.BorderSizePixel = 0 
Frame.Position = UDim2.new(0.5, - 175, 0.5, - 65)
Frame.Size = UDim2.new(0, 350, 0, 125)
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 18)
UICorner.Parent = Frame
local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(255, 30, 30)
UIStroke.Transparency = 0.15
UIStroke.Thickness = 2.2
UIStroke.Parent = Frame
local TextLabel = Instance.new("TextLabel")
TextLabel.Parent = Frame
TextLabel.BackgroundTransparency = 1 
TextLabel.Position = UDim2.new(0, 0, 0, 10)
TextLabel.Size = UDim2.new(1, 0, 0, 28)
TextLabel.Font = Enum.Font.SourceSansItalic
TextLabel.Text = "MontanaHub | Key"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 21
local Frame2 = Instance.new("Frame")
Frame2.Parent = Frame
Frame2.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
Frame2.Position = UDim2.new(0.07, 0, 0, 46)
Frame2.Size = UDim2.new(0.86, 0, 0, 38)
local UICorner2 = Instance.new("UICorner")
UICorner2.CornerRadius = UDim.new(0, 10)
UICorner2.Parent = Frame2
local UIStroke2 = Instance.new("UIStroke")
UIStroke2.Color = Color3.fromRGB(200, 30, 30)
UIStroke2.Transparency = 0.3
UIStroke2.Thickness = 1.2000000000000455 
UIStroke2.Parent = Frame2
local TextBox = Instance.new("TextBox")
TextBox.Parent = Frame2
TextBox.BackgroundTransparency = 1 
TextBox.Position = UDim2.new(0.04, 0, 0, 0)
TextBox.Size = UDim2.new(0.7999999999999545, 0, 1, 0)
TextBox.Font = Enum.Font.GothamMedium
TextBox.PlaceholderText = "Enter License Key"
TextBox.Text = var
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 130)
TextBox.TextSize = 12
TextBox.ClearTextOnFocus = false
local TextButton = Instance.new("TextButton")
TextButton.Parent = Frame2
TextButton.BackgroundTransparency = 1 
TextButton.Position = UDim2.new(0.8400000000000034, 0, 0, 0)
TextButton.Size = UDim2.new(0.16000000000008185, 0, 1, 0)
TextButton.Font = Enum.Font.GothamBold
TextButton.Text = "→"
TextButton.TextColor3 = Color3.fromRGB(255, 50, 50)
TextButton.TextSize = 20 
local TextButton2 = Instance.new("TextButton")
TextButton2.Parent = Frame
TextButton2.BackgroundTransparency = 1
TextButton2.Position = UDim2.new(0.07, 0, 0, 92)
TextButton2.Size = UDim2.new(0.86, 0, 0, 18)
TextButton2.Font = Enum.Font.GothamMedium
TextButton2.Text = "discord.gg/4Ykw44dHWk (Comprar key)"
TextButton2.TextColor3 = Color3.fromRGB(100, 170, 255)
TextButton2.TextSize = 10
TextButton2.MouseButton1Click:Connect(function()
	if setclipboard then
		local num5 = 0 
		local v652
		while true do
			if num5 == 0 then
				v652 = 0 
				while true do
					if v652 == 1 then
						task.wait(2)
						TextButton2.Text = "discord.gg/4Ykw44dHWk (Comprar key)"
						break
					end
					if v652 == 0 then
						setclipboard("https://discord.gg/4Ykw44dHWk")
						TextButton2.Text = "¡Enlace copiado al portapapeles!"
						v652 = 1
					end
				end
				break
			end
		end
	end
end)
local TextLabel2 = Instance.new("TextLabel")
TextLabel2.Parent = Instance
TextLabel2.BackgroundTransparency = 1 
TextLabel2.Position = UDim2.new(0.5, - (175), 0.5, 72)
TextLabel2.Size = UDim2.new(0, 350, 0, 25)
TextLabel2.Font = Enum.Font.GothamBold
TextLabel2.Text = ""
TextLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel2.TextSize = 11 
local function v103(v120)
	local num6 = 0 
	local v122
	while true do
		if num6 == 1 then
			if not v122 then
				return "Desconocido"
			end
			if v122 >= (31537253 - 1253) then
				return math.floor(v122 / (31536000)) .. " año(s)" 
			elseif v122 >= 2592000 then
				return math.floor(v122 / 2592000) .. " mes(es)" 
			elseif v122 >= (86620 - 220) then
				return math.floor(v122 / (86400)) .. "d" 
			elseif v122 >= 3600 then
				return math.floor(v122 / 3600) .. "h" 
			elseif v122 >= 60 then
				return math.floor(v122 / 60) .. "m" 
			else
				return v122 .. "s" 
			end
			break
		end
		if num6 == 0 then
			if (v120 == - (292 - 291)) or (v120 == "Permanente") or (tostringv120 == "inf") then
				return "Permanente"
			end
			v122 = tonumber(v120)
			num6 = 1 
		end
	end
end
local function v104(v123)
	task.spawn(function()
		while true do
			task.wait(60)
			local v653, v654 = v18("/heartbeat", {
				["key"] = v123,
				["hwuid"] = v15
			})
			if v653 and v654 then
				if not v654.valid then
					LocalPlayer:Kick("\n[MontanaHub Security]: Tu key ha expirado, fue revocada o se reinició su HWUID desde Discord. Adquiere otra en discord.gg/4Ykw44dHWk")
					break
				end
			else
				warn("[MontanaHub]: Advertencia de red al sincronizar con el servidor.")
			end
		end
	end)
end
local function v105()
	if not game:IsLoaded() then
		repeat
			task.wait()
		until game:IsLoaded()
	end
	if not ((game.PlaceId == (104715542330896)) or (game.PlaceId == (97556409405464))) then
		return
	end
	pcall(function()
		local num7 = 0
		local v342
		local v343
		while true do
			if num7 == 1 then
				v342.transition = function(v811, v812, v813, v814)
					return result
				end
				break
			end
			if num7 == 0 then
				v342 = require(RS.Modules.Game.UI.TransitionUI)
				v343 = v342.transition
				num7 = 1 
			end
		end
	end)
	pcall(function()
		local CharacterCreator = require(RS.Modules.Game.CharacterCreator.CharacterCreator)
		if CharacterCreator.start then
			local num8 = 0 
			local v700
			while true do
				if (818 - 818) == num8 then
					v700 = CharacterCreator.start
					CharacterCreator.start = function(...)
						while true do
							task.wait(1)
						end
					end
					break
				end
			end
		end
		if CharacterCreator.load_page then
			local num9 = 0
			local v702
			while true do
				if num9 == 0 then
					v702 = CharacterCreator.load_page
					CharacterCreator.load_page = function(...)
						return v702(...)
					end
					break
				end
			end
		end
		if CharacterCreator.initiate then
			local num10 = 0 
			local v704
			while true do
				if num10 == 0 then
					v704 = CharacterCreator.initiate
					CharacterCreator.initiate = function(...)
						return v704(...)
					end
					break
				end
			end
		end
	end)
	local Vehicles = workspace:WaitForChild("Vehicles")
	local tbl = {}
	local function v126()
		local num11 = 0 
		local v346
		while true do
			if num11 == 0 then
				v346 = 0 
				while true do
					if v346 == 0 then
						tbl = {}
						for v1127, v1128 in ipairs(Vehicles:GetDescendants()) do
							if v1128:IsA("VehicleSeat") and (v1128.Name == "DriverSeat") then
								local num12 = 0
								local v1324
								while true do
									if num12 == 0 then
										v1324 = v1128:FindFirstAncestorOfClass("Model")
										if v1324 then
											tbl[v1324] = true
										end
										break
									end
								end
							end
						end
						break
					end
				end
				break
			end
		end
	end
	v126()
	local function v127(v347)
		local num13 = 0 
		local v349
		while true do
			if num13 == 0 then
				v349 = v347:FindFirstAncestorOfClass("Model")
				return v349 and (tbl[v349] == true) 
			end
		end
	end
	local function v128(v350)
		if v127(v350) then
			return
		end
		v350:Destroy()
	end
	for v351, v352 in ipairs(workspace:GetDescendants()) do
		if v352:IsA("Seat") or v352:IsA("VehicleSeat") then
			if not v127(v352) then
				v128(v352)
			end
		end
	end
	Vehicles.DescendantAdded:Connect(function(arg)
		if arg:IsA("VehicleSeat") and (arg.Name == "DriverSeat") then
			v126()
		end
	end)
	workspace.DescendantAdded:Connect(function(v354)
		if v354:IsA("Seat") or v354:IsA("VehicleSeat") then
			if not v127(v354) then
				v128(v354)
			end
		end
	end)
	game:GetService("ReplicatedStorage")
	if getgenv then
		getgenv().identifyexecutor = nil
	end
	if getfenv then
		local num14 = 0
		local v657
		while true do
			if num14 == 0 then
				v657 = getfenv()
				v657.identifyexecutor = nil
				break
			end
		end
	end
	local tbl2 = {}
	local Remotes = game.ReplicatedStorage:WaitForChild("Remotes")
	local tbl3 = {
		["send"] = Remotes:WaitForChild("Send"),
		["get"] = Remotes:WaitForChild("Get")
	}
	local tbl4 = {
		["event"] = 0,
		["func"] = 0
	}
	local tbl5 = {}
	local flag = false
	local tbl6 = {}
	tbl2.on_connect = function(v355)
		if flag then
			v355()
		else
			tbl6[ # v136 + 0 ] = v355
		end
	end
	tbl2.hook = function(v356, v357)
		local num15 = 0 
		local v359
		while true do
			if 0 == num15 then
				v359 = 0
				while true do
					if v359 == 0 then
						if not v357 then
							error("Function nil for hook " .. v356)
						end
						if flag then
							if tbl5[v356] then
								warn("Overwriting hook \'" .. v356 .. "\'.")
							else
								tbl5[v356] = v357
							end
						else
							tbl2.on_connect(function()
										tbl2.hook(v356, v357)
									end)
									return
								end
							end
						end
				break
			end
		end
	end
	tbl2.is_connected = function(v360)
		return (v360:GetAttribute("IsConnected") and true) or false 
	end
	local function v139(v361, v362, v363, v364, ...)
		return v361(v362, v363, v364, ...)
	end
	task.wait(0.1)
	local send = tbl3.send
	local fireServer = tbl3.send.FireServer
	tbl2.send = function(v365, ...)
		local num16 = 0 
		local v367
		while true do
			if num16 == 0 then
				v367 = 0 
				while true do
					if v367 == 0 then
						tbl4.event = tbl4.event + 1 
						fireServer(send, tbl4.event, v365, ...)
						break
					end
				end
				break
			end
		end
	end
	local get = tbl3.get
	local invokeServer = tbl3.get.InvokeServer
	tbl2.get = function(v368, ...)
		tbl4.func = tbl4.func + (1) 
		return invokeServer(get, tbl4.func, v368, ...)
	end
	task.wait(0.1)
	local function v146()
		local num17 = 0
		while true do
			if 0 == num17 then
				tbl3.send.OnClientEvent:connect(function(v816, ...)
					if tbl5[v816] then
						tbl5[v816](...)
					else
						error("Invalid hook \'" .. v816 .. "\' fired!", 0)
					end
				end)
				tbl3.get.OnClientInvoke = function(v817, ...)
					if tbl5[v817] then
						return tbl5[v817](...)
					end
					error("Invalid hook \'" .. v817 .. "\' invoked!", 0)
				end
				num17 = 1
			end
			if num17 == 1 then
				if not pcall(function()
					for v943 = 1 , # tbl6 do
						tbl6[v943]()
					end
				end) then
					pcall(function()
						print("On connect failed for client")
						tbl2.send("issue", "On connect failed for client")
					end)
				end
				break
			end
		end
	end
	tbl2.initiate = function()
	end
	tbl2.loaded = function()
		tbl3.get.OnClientInvoke = function(v658)
			if v658 == "connect" then
				flag = true
				v146()
				return true
			end
		end
		tbl2.hook("ping", function()
			return true
		end)
	end
	print("bypassed")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local HttpService2 = game:GetService("HttpService")
	local UserInputService = game:GetService("UserInputService")
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local currentCamera = workspace.CurrentCamera
	local Debris = game:GetService("Debris")
	local Players, RunService, currentCamera2, localPlayer2, v158 = game:GetService("Players"), game:GetService("RunService"), workspace.CurrentCamera, game.Players.LocalPlayer, game.Players.LocalPlayer:GetMouse()
	local Net = require(ReplicatedStorage.Modules.Core.Net)
	local Ragdoll = require(ReplicatedStorage.Modules.Game.Ragdoll)
	local Vehicle = require(ReplicatedStorage.Modules.Game.VehicleSystem.Vehicle)
	local Char = require(ReplicatedStorage.Modules.Core.Char)
	local Sprint = require(ReplicatedStorage.Modules.Game.Sprint)
	local Crate = require(ReplicatedStorage.Modules.Game.CrateSystem.Crate)
	local tbl7 = {}
	function c()
		return tbl7
	end
	local localPlayer = Players.LocalPlayer
	local wait = localPlayer.Character or localPlayer.CharacterAdded:Wait() 
	local userId = localPlayer.UserId
	local playerGui = localPlayer.PlayerGui
	local Humanoid = wait:WaitForChild("Humanoid")
	local HumanoidRootPart = wait:WaitForChild("HumanoidRootPart")
	local Backpack = localPlayer:WaitForChild("Backpack")
	localPlayer.CharacterAdded:Connect(function(v372)
		wait = v372
		Humanoid = wait:WaitForChild("Humanoid")
		HumanoidRootPart = wait:WaitForChild("HumanoidRootPart")
		Backpack = localPlayer:WaitForChild("Backpack")
	end)
	local tbl8 = {}
	local ReplicatedStorage = require(game:GetService("ReplicatedStorage").Modules.Game.Sprint)
	local consume_stamina = ReplicatedStorage.consume_stamina
	local getupvalue = debug.getupvalue(consume_stamina, 2).sprint_bar
	local flag2 = false
	local loaded = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
	local loaded2 = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Footagesus/Icons/main/Main.lua"))()
	loaded2.SetIconsType("lucide")
	local createWindow = loaded:CreateWindow({
		["Icon"] = "rbxassetid://74826351036046",
		["IconThemed"] = true,
		["Title"] = "Montana Hub | Block Spin",
		["Author"] = "by Montana.lua",
		["Folder"] = "montana's",
		["Size"] = UDim2.fromOffset(400, 400),
		["MinSize"] = Vector2.new(560, 350),
		["MaxSize"] = Vector2.new(850, 560),
		["Transparent"] = true,
		["Theme"] = "Dark",
		["Resizable"] = true,
		["SideBarWidth"] = 200,
		["BackgroundImageTransparency"] = 0.42,
		["HideSearchBar"] = false,
		["ScrollBarEnabled"] = false,
		["OpenButton"] = {
			["Enabled"] = false
		}
	})
	createWindow:Tag({
		["Title"] = "V0.1",
		["Color"] = Color3.fromHex("#FF0000"),
		["Radius"] = 13
	})
	local CoreGui2 = game:GetService("CoreGui")
	local localPlayer2 = Players.LocalPlayer
	if CoreGui2:FindFirstChild("MontanaHubButton") then
		CoreGui2.MontanaHubButton:Destroy()
	end
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "MontanaHubButton"
	ScreenGui.Parent = CoreGui2
	ScreenGui.IgnoreGuiInset = true
	local ImageButton = Instance.new("ImageButton")
	ImageButton.Parent = ScreenGui
	ImageButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	ImageButton.BorderSizePixel = 0 
	ImageButton.Position = UDim2.new(0.5, - (22), 0, 10)
	ImageButton.Size = UDim2.new(0, 45, 0, 45)
	ImageButton.Image = "rbxassetid://74826351036046"
	ImageButton.ScaleType = Enum.ScaleType.Fit
	local UICorner3 = Instance.new("UICorner")
	UICorner3.CornerRadius = UDim.new(0, 8)
	UICorner3.Parent = ImageButton
	local UIStroke3 = Instance.new("UIStroke")
	UIStroke3.Color = Color3.fromRGB(255, 0, 0)
	UIStroke3.Thickness = 2.5 
	UIStroke3.Parent = ImageButton
	local flag3 = false
	local v203, v204
	local flag4 = false
	local num18 = 0 
	ImageButton.InputBegan:Connect(function(v373)
		if (v373.UserInputType == Enum.UserInputType.MouseButton1) or (v373.UserInputType == Enum.UserInputType.Touch) then
			local num19 = 0 
			while true do
				if num19 == 2 then
					num18 = 0 
					break
				end
				if num19 == 1 then
					v204 = ImageButton.Position
					flag4 = false
					num19 = 2 
				end
				if num19 == 0 then
					flag3 = true
					v203 = v373.Position
					num19 = 1
				end
			end
		end
	end)
	UserInputService.InputChanged:Connect(function(v374)
		if flag3 and ((v374.UserInputType == Enum.UserInputType.MouseMovement) or (v374.UserInputType == Enum.UserInputType.Touch)) then
			local num20 = 0 
			local v708
			while true do
				if num20 == 0 then
					v708 = v374.Position - v203 
					num18 = math.abs(v708.X) + math.abs(v708.Y) 
					num20 = 1 
				end
				if num20 == 1 then
					if num18 > 5 then
						flag4 = true
					end
					ImageButton.Position = UDim2.new(v204.X.Scale, v204.X.Offset + v708.X, v204.Y.Scale, v204.Y.Offset + v708.Y)
					break
				end
			end
		end
	end)
	UserInputService.InputEnded:Connect(function(v375)
		if (v375.UserInputType == Enum.UserInputType.MouseButton1) or (v375.UserInputType == Enum.UserInputType.Touch) then
			if flag3 then
				local num21 = 0
				while true do
					if (1742 - 1742) == num21 then
						flag3 = false
						if  not flag4 or (num18 <= (284 - 279)) then
							isOpen = not isOpen
									if isOpen then
										createWindow:Open()
									else
										createWindow:Close()
									end
						end
						break
					end
				end
			end
		end
	end)
	isOpen = true
	local tab = createWindow:Tab({
		["Title"] = "General",
		["Icon"] = "globe"
	})
	local button = tab:Button({
		["Title"] = "🏦 Bank Balance",
		["Desc"] = "N/A"
	})
	local button2 = tab:Button({
		["Title"] = "💸 Hand Balance",
		["Desc"] = "N/A"
	})
	local function v210()
		return tonumber(playerGui.TopRightHud.Holder.Frame.MoneyTextLabel.Text:match("%$(%d+)"))
	end
	local function v211()
		local num22 = 0
		local v377
		while true do
			if 0 == num22 then
				v377 = 0 
				while true do
					if v377 == 0 then
						for v1129, v1130 in ipairs(playerGui:GetDescendants()) do
							if v1130:IsA("TextLabel") and string.find(v1130.Text, "Bank Balance") then
								return tonumber(v1130.Text:match("%$(%d+)"))
							end
						end
						return 0 
					end
				end
				break
			end
		end
	end
	task.spawn(function()
		while task.wait(0.2) do
			button:SetDesc('<b><font color="#00FF00">$' .. (v211() or 0) .. "</font></b>")
					button2:SetDesc('<b><font color="#00f2ff">$' .. (v210() or (0)) .. "</font></b>")
		end
	end)
	tab:Section({
		["Title"] = "Player Modifier:"
	})
	local button3 = tab:Button({
		["Title"] = "Invisible",
		["Locked"] = false,
		["Callback"] = function()
			local num23 = 0 
			local v379
			while true do
				if num23 == 0 then
					v379 = 0 
					while true do
						if v379 == 0 then
							Net.send("request_respawn")
							task.wait(6.099999999999909)
							v379 = 1 
						end
						if v379 == 1 then
							Net.get("death_screen_request_respawn")
							setfflag("NextGenReplicatorEnabledWrite4", "true")
							v379 = 2 
						end
						if v379 == 2 then
							loaded:Notify({
								["Title"] = "Invisible Success",
								["Content"] = "Enjoy ครับผม <3",
								["Duration"] = 3,
								["Icon"] = "rbxassetid://116912491561156"
							})
							break
						end
					end
					break
				end
			end
		end
	})
	local localPlayer3 = Players.LocalPlayer
	local num24 = 35 
	local flag5 = false
	local function v216()
		return {
			["SpeedModifies"] = flag5,
			["SpeedAmount"] = num24
		}
	end
	local function v217()
		task.spawn(function()
			while task.wait(0.10000000000002274) do
				if Humanoid and Humanoid.Parent then
					if v216().SpeedModifies then
						pcall(function()
							local num25 = 0
							while true do
								if num25 == 1 then
									Humanoid:SetAttribute("TargetWalkSpeed", v216().SpeedAmount)
									Humanoid.WalkSpeed = v216().SpeedAmount
									break
								end
								if num25 == 0 then
									Net.send("set_sprinting_1", true)
									Sprint.sprinting.set(true)
									num25 = 1 
								end
							end
						end)
					else
						pcall(function()
							local num26 = 0 
							while true do
								if 0 == num26 then
									Humanoid:SetAttribute("TargetWalkSpeed", 8)
									Humanoid.WalkSpeed = 8
									break
								end
							end
						end)
					end
				end
			end
		end)
	end
	v217()
	tab:Toggle({
		["Title"] = "Walk Speed",
		["Flag"] = "Walk Speed",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Value"] = false,
		["Callback"] = function(v380)
			flag5 = v380
		end
	})
	tab:Slider({
		["Title"] = "Speed Value",
		["Flag"] = "speed_value",
		["Step"] = 1,
		["Value"] = {
			["Min"] = 8,
			["Max"] = 45,
			["Default"] = num24
		},
		["Callback"] = function(v381)
			local num27 = 0 
			local v383
			while true do
				if 0 == num27 then
					v383 = 0 
					while true do
						if v383 == 0 then
							num24 = v381
							if Humanoid and flag5 then
								Humanoid.WalkSpeed = v381
							end
							break
						end
					end
					break
				end
			end
		end
	})
	localPlayer3.CharacterAdded:Connect(function(v384)
		wait = v384
				Humanoid = v384:WaitForChild("Humanoid")
	end)
	local flag6 = false
	tab:Toggle({
		["Title"] = "Fly Jump",
		["Flag"] = "Fly",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Value"] = false,
		["Callback"] = function(v386)
			flag6 = v386
		end
	})
	local num28 = 0 
	local num29 = 0.12000000000000455 
	local num30 = 55
	local flag7 = false
	local function v223()
		local num31 = 0 
		local v388
		local v389
		local v390
		local v391
		local v392
		local v393
		local v394
		while true do
			if num31 == 3 then
				v394 = nil
				while true do
					if v388 == 4 then
						pcall(function()
							local num32 = 0 
							local v1134
							while true do
								if num32 == 0 then
									v1134 = 0 
									while true do
										if v1134 == 0 then
											v391.UseJumpPower = true
											v391.JumpPower = num30
											v1134 = 1 
										end
										if v1134 == 1 then
											v391.JumpHeight = 50 
											v391.Jump = true
											break
										end
									end
									break
								end
							end
						end)
						break
					end
					if v388 == 0 then
						if not flag6 then
							return
						end
						v389 = localPlayer.Character
						if not v389 then
							return
						end
						v390 = v389:FindFirstChild("HumanoidRootPart")
						v388 = 1
					end
					if v388 == 1 then
						v391 = v389:FindFirstChildOfClass("Humanoid")
						if  not v390 or not v391 or (v391.Health <= (1404 - 1404)) then
							return
						end
						HumanoidRootPart = v390
						Humanoid = v391
						v388 = 2
					end
					if v388 == 3 then
						v393 = v390.AssemblyLinearVelocity or v390.Velocity or Vector3.zero 
						v394 = Vector3.new(v393.X, num30, v393.Z)
						v390.AssemblyLinearVelocity = v394
						pcall(function()
							v390.Velocity = v394
						end)
						v388 = 4 
					end
					if v388 == 2 then
						wait = v389
						v392 = tick()
						if (v392 - num28) < num29 then
							return
						end
						num28 = v392
						v388 = 3 
					end
				end
				break
			end
			if num31 == 2 then
				v392 = nil
				v393 = nil
				num31 = 3 
			end
			if num31 == 0 then
				v388 = 0
				v389 = nil
				num31 = 1 
			end
			if 1 == num31 then
				v390 = nil
				v391 = nil
				num31 = 2 
			end
		end
	end
	UserInputService.JumpRequest:Connect(function()
		v223()
	end)
	UserInputService.InputBegan:Connect(function(v395, v396)
		if v396 then
			return
		end
		if (v395.KeyCode == Enum.KeyCode.Space) or (v395.KeyCode == Enum.KeyCode.ButtonA) then
			flag7 = true
					v223()
		end
	end)
	UserInputService.InputEnded:Connect(function(v397)
		if (v397.KeyCode == Enum.KeyCode.Space) or (v397.KeyCode == Enum.KeyCode.ButtonA) then
			flag7 = false
		end
	end)
	RunService.Heartbeat:Connect(function()
		if flag6 and flag7 then
			v223()
		end
	end)
	local flag8 = false
	tab:Toggle({
		["Title"] = "Infinite Stamina",
		["Flag"] = "Inf",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Value"] = false,
		["Callback"] = function(v398)
			flag8 = v398
		end
	})
	local update = getupvalue.update
	getupvalue.update = function(...)
		if flag8 then
			return 0.9
		else
			return update(...)
		end
	end
	tab:Section({
		["Title"] = "Utility:"
	})
	local localPlayer4 = Players.LocalPlayer
	local DroppedItems = workspace:WaitForChild("DroppedItems")
	local function v229(v399)
		local num33 = 0 
		local v401
		local v402
		while true do
			if num33 == 1 then
				v402 = v401:FindFirstChild("HumanoidRootPart")
				if not v402 then
					return math.huge
				end
				num33 = 2
			end
			if num33 == 0 then
				if not v399 then
					return math.huge
				end
				v401 = localPlayer4.Character or localPlayer4.CharacterAdded:Wait() 
				num33 = 1 
			end
			if num33 == 2 then
				return (v402.Position - v399.Position).Magnitude
			end
		end
	end
	_G.AutoPickItems = false
	_G.BlacklistRarity = {}
	local tbl9 = {}
	local function v231(v403)
		if not v403 then
			return false
		end
		if  not _G.BlacklistRarity or ( # _G.BlacklistRarity == 0) then
			return false
		end
		local itemName = v403:GetAttribute("ItemName") or v403.Name 
		if not itemName then
			return false
		end
		local tbl9 = tbl9[itemName]
		if tbl9 == nil then
			local Items = ReplicatedStorage:FindFirstChild("Items")
			if not Items then
				return false
			end
			tbl9 = false
			for v749, v750 in ipairs(Items:GetDescendants()) do
				if  not v750:IsA("ModuleScript") and not v750:IsA("Folder") and (v750.Name == itemName) then
					tbl9 = v750:GetAttribute("RarityName") or false 
					break
				end
			end
			tbl9[itemName] = tbl9
		end
		if tbl9 then
			for v751 = 1 , # _G.BlacklistRarity do
				if _G.BlacklistRarity[v751] == tbl9 then
					return true
				end
			end
		end
		return false
	end
	task.spawn(function()
		while task.wait(0.05) do
			if _G.AutoPickItems then
				local getChildren = DroppedItems:GetChildren()
				for v819 = 1 , # getChildren do
					local num34 = 0 
					local v821
					while true do
						if 0 == num34 then
							v821 = getChildren[v819]
							if v821 and not v821:GetAttribute("Locked") and not v231v821 then
								local num35 = 0 
								local v1327
								while true do
									if num35 == 0 then
										v1327 = v821:FindFirstChild("PickUpZone")
										if v1327 then
											v1327.Size = Vector3.new(22, 22, 22)
													v1327.CanCollide = false
													v1521 = 1 
												end
												if v1521 == 1 then
													Net.get("pickup_dropped_item", v821)
										end
										break
									end
								end
							end
							break
						end
					end
				end
			end
		end
	end)
	tab:Toggle({
		["Title"] = "Auto Pick Item",
		["Flag"] = "Pickitem",
		["Desc"] = "Pick up items that are far away",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Value"] = false,
		["Callback"] = function(v406)
			_G.AutoPickItems = v406
		end
	})
	local tbl10 = {
		"Common",
		"Uncommon",
		"Rare",
		"Epic",
		"Legendary"
	}
	tab:Dropdown({
		["Title"] = "Blacklist Rarity",
		["Flag"] = "BlacklistRarity",
		["Values"] = tbl10,
		["Default"] = {},
		["Multi"] = true,
		["AllowNone"] = true,
		["Callback"] = function(v407)
			_G.BlacklistRarity = v407
		end
	})
	_G.AntiLock = false
	local ref3 = nil
	local str3 = "rbxassetid://104767795538635"
	local function v235()
		local num36 = 0 
		local v409
		local v410
		local v411
		while true do
			if num36 == 0 then
				v409 = localPlayer2.Character or localPlayer2.CharacterAdded:Wait() 
				v410 = v409:WaitForChild("Humanoid")
				num36 = 1
			end
			if num36 == 1 then
				if ref3 then
					local num37 = 0
					local v948
					while true do
						if num37 == 0 then
							v948 = 0 
							while true do
								if 1 == v948 then
									ref3 = nil
									break
								end
								if v948 == 0 then
									ref3:Stop()
									ref3:Destroy()
									v948 = 1
								end
							end
							break
						end
					end
				end
				v411 = Instance.new("Animation")
				num36 = 2 
			end
			if num36 == 3 then
				ref3.Looped = true
				ref3:Play()
				num36 = 4 
			end
			if num36 == 4 then
				ref3:AdjustSpeed(1e+35)
				break
			end
			if num36 == 2 then
				v411.AnimationId = str3
				ref3 = v410:LoadAnimation(v411)
				num36 = 3 
			end
		end
	end
	local function v236()
		if ref3 then
			ref3:Stop()
					ref3:Destroy()
					v712 = 1 
				end
				if v712 == 1 then
					ref3 = nil
		end
	end
	local function v237()
		local num38 = 0 
		local v413
		local v414
		local v415
		local v416
		local v417
		while true do
			if num38 == 2 then
				v413.Velocity = v417
				v413.AssemblyLinearVelocity = v417
				v413.AssemblyAngularVelocity = v417
				num38 = 3 
			end
			if num38 == 0 then
				v413 = Char.get_hrp()
				if not v413 then
					return
				end
				v414 = v413.Velocity
				num38 = 1 
			end
			if 3 == num38 then
				RunService.RenderStepped:Wait()
				v413.Velocity = v414
				v413.AssemblyLinearVelocity = v415
				num38 = 4 
			end
			if num38 == 4 then
				v413.AssemblyAngularVelocity = v416
				break
			end
			if num38 == 1 then
				v415 = v413.AssemblyLinearVelocity
				v416 = v413.AssemblyAngularVelocity
				v417 = Vector3.new(math.random( - (16000), 16000), math.random( - (16000), 16000), math.random( - (16000), 16000))
				num38 = 2
			end
		end
	end
	local function v238()
		local num39 = 0 
		local v419
		while true do
			if num39 == 0 then
				v419 = Char.get_hrp()
				if v419 then
					v419.CustomPhysicalProperties = PhysicalProperties.new(0.0009999999999763531, 0.001, 0.001)
				end
				break
			end
		end
	end
	RunService.Heartbeat:Connect(function()
		if _G.AntiLock then
			v237()
					v238()
		end
	end)
	tab:Toggle({
		["Title"] = "Anti Lock",
		["Flag"] = "antilock",
		["Desc"] = "Prevent you from Aimlock",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Value"] = false,
		["Callback"] = function(v420)
			local num40 = 0 
			local v422
			while true do
				if num40 == 0 then
					v422 = 0 
					while true do
						if v422 == 0 then
							_G.AntiLock = v420
							if v420 then
								v235()
							else
								v236()
							end
							break
						end
					end
					break
				end
			end
		end
	})
	local function v239()
		while _G.AntiRagdoll do
			task.wait(0.1)
			pcall(function()
				local num41 = 0 
				local v715
				while true do
					if num41 == 0 then
						v715 = Ragdoll.is_ragdolling.get()
						if v715 then
							local num42 = 0 
							while true do
								if 1 == num42 then
									pcall(function()
										Net.send("clear_ragdoll")
									end)
									pcall(function()
										Net.get("end_ragdoll_early")
									end)
									num42 = 2
								end
								if num42 == 2 then
									pcall(function()
										Net.get("clear_ragdoll")
									end)
									break
								end
								if num42 == 0 then
									Ragdoll.is_ragdolling.set(false)
									pcall(function()
										Net.send("end_ragdoll_early")
									end)
									num42 = 1
								end
							end
						end
						break
					end
				end
			end)
		end
	end
	tab:Toggle({
		["Title"] = "Anti Ragdoll",
		["Desc"] = "No ragdoll lol",
		["Flag"] = "AntiRagdoll",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Value"] = false,
		["Callback"] = function(v423)
			_G.AntiRagdoll = v423
					if v423 then
						task.spawn(v239)
					end
		end
	})
	local tbl11 = {}
	local flag9 = false
	local flag10 = false
	tbl11["AntiDied"] = function()
		while task.wait(0.24) do
			if tbl7.AntiDied then
				if  not wait or not Humanoid or not HumanoidRootPart then
					local num43 = 0 
					while true do
						if num43 == 1 then
							HumanoidRootPart = wait:WaitForChild("HumanoidRootPart")
							break
						end
						if num43 == 0 then
							wait = localPlayer.Character or localPlayer.CharacterAdded:Wait() 
							Humanoid = wait:WaitForChild("Humanoid")
							num43 = 1 
						end
					end
				end
				local get_hum = Char.get_hum()
				if get_hum then
					if get_hum:GetAttribute("HasBeenDowned") then
						if not get_hum:GetAttribute("IsDead") then
							if Humanoid.Health > 0 then
								local num44 = 0 
								local v1432
								while true do
									if num44 == 1 then
										if v1432 then
											local deathScreenHolder = playerGui.DeathScreen.DeathScreenHolder
											if not deathScreenHolder.Visible then
												local num45 = 0 
												local v1603
												local v1604
												local v1605
												local v1606
												local v1607
												while true do
													if 0 == num45 then
														v1603 = 15 
														v1604 = HumanoidRootPart.Position.Y - v1603 
														v1605 = HumanoidRootPart.Position.Y
														v1606 = v1604 - v1605 
														num45 = 1 
													end
													if num45 == 1 then
														v1607 = math.random( - 5, 15)
														HumanoidRootPart.Anchored = false
														HumanoidRootPart.CanCollide = false
														HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * CFrame.new(v1607, v1606, v1607) 
														num45 = 2 
													end
													if num45 == 2 then
														HumanoidRootPart.Velocity = Vector3.new(HumanoidRootPart.Velocity.X, - (11), HumanoidRootPart.Velocity.Z)
														for v1702, v1703 in pairs(wait:GetChildren()) do
															if v1703:IsA("BasePart") then
																local num46 = 0
																while true do
																	if 1 == num46 then
																		v1703.CFrame = v1703.CFrame * CFrame.new(0, v1606, 0) 
																		v1703.Velocity = Vector3.new(v1703.Velocity.X, - 11, v1703.Velocity.Z)
																		break
																	end
																	if num46 == 0 then
																		v1703.CanCollide = false
																		v1703.Anchored = false
																		num46 = 1
																	end
																end
															end
														end
														flag9 = true
														break
													end
												end
											end
										end
										break
									end
									if num44 == 0 then
										if _G.AntiLock then
											local num47 = 0 
											while true do
												if 0 == num47 then
													flag10 = true
													_G.AntiLock = false
													num47 = 1 
												end
												if num47 == 1 then
													v236()
													loaded:Notify({
														["Title"] = "Anti System",
														["Content"] = "Anti Lock disabled (Anti Kill active)",
														["Duration"] = 2
													})
													break
												end
											end
										end
										v1432 = playerGui:FindFirstChild("DeathScreen")
										num44 = 1 
									end
								end
							else
								flag9 = false
							end
						else
							flag9 = false
						end
					elseif flag9 then
						local num48 = 0 
						local v1329
						local v1330
						local v1331
						local v1332
						while true do
							if num48 == 1 then
								local num49 = 0 
								local v1470
								while true do
									if 0 == num49 then
										v1470 = 0 
										while true do
											if v1470 == 0 then
												v1331 = HumanoidRootPart.Position.Y
												v1332 = v1330 - v1331 
												v1470 = 1 
											end
											if v1470 == 1 then
												num48 = 2 
												break
											end
										end
										break
									end
								end
							end
							if num48 == 0 then
								v1329 = 15 
										v1330 = HumanoidRootPart.Position.Y - v1329 
										v1471 = 1 
									end
									if v1471 == 1 then
										num48 = 1
							end
							if 2 == num48 then
								HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * CFrame.new(0, v1332, 0) 
								if not localPlayer:GetAttribute("IsInCombat") then
									flag9 = false
											Net.send("request_respawn")
											v1522 = 1
										end
										if v1522 == 1 then
											if flag10 then
												local num50 = 0 
												while true do
													if num50 == 1 then
														flag10 = false
														loaded:Notify({
															["Title"] = "Anti System",
															["Content"] = "Anti Lock re-enabled",
															["Duration"] = 2
														})
														break
													end
													if num50 == 0 then
														_G.AntiLock = true
														v235()
														num50 = 1 
													end
												end
											end
								end
								break
							end
						end
					end
				end
			else
				flag9 = false
						if flag10 then
							flag10 = false
						end
			end
		end
	end
	tab:Toggle({
		["Title"] = "Anti Kill",
		["Desc"] = "Normal Player cant Finish",
		["Flag"] = "antikill",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Value"] = false,
		["Callback"] = function(v425)
			local num51 = 0 
			local v427
			while true do
				if 0 == num51 then
					v427 = 0
					while true do
						if v427 == 0 then
							tbl7.AntiDied = v425
							if v425 then
								task.spawn(tbl11["AntiDied"])
							end
							break
						end
					end
					break
				end
			end
		end
	})
	tab:Toggle({
		["Title"] = "Auto Mask",
		["Flag"] = "automask",
		["Desc"] = "Equip Shiesty",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Callback"] = function(v428)
			local num52 = 0
			local v430
			local v431
			local v432
			local v433
			while true do
				if num52 == 1 then
					local num53 = 0
					local v767
					while true do
						if num53 == 0 then
							v767 = 0
							while true do
								if v767 == 1 then
									num52 = 2 
									break
								end
								if v767 == 0 then
									v431 = game.Players.LocalPlayer
									v432 = v431:WaitForChild("PlayerGui")
									v767 = 1 
								end
							end
							break
						end
					end
				end
				if num52 == 2 then
					v433 = require(v430.Modules.Core.Net)
							function GetAllInfos(v1138)
								local tbl12 = {}
								local items = v432.Items
								local ItemsHolder = items:FindFirstChild("ItemsHolder").ItemsScrollingFrame
								for v1206, v1207 in ipairs(ItemsHolder:GetChildren()) do
									if (v1207.Name ~= "Folder") and (v1207.Name ~= "UIGridLayout") and (v1207.Name ~= "ItemTemplate") then
										if v1207.ItemName.Text == v1138 then
											table.insert(tbl12, {
												["Uid"] = v1207.Name,
												["Using"] = v1207:FindFirstChild("ItemEquipped").Visible,
												["Drowning"] = v1207:FindFirstChild("DestroyedItemIcon").Visible
											})
										end
									end
								end
								return tbl12
							end
							v768 = 1 
						end
						if v768 == 1 then
							num52 = 3
				end
				if num52 == 0 then
					if not v428 then
						return
					end
					v430 = game:GetService("ReplicatedStorage")
					num52 = 1 
				end
				if num52 == 3 then
					function EquipAccessory(v822)
						local getAllInfosResult = GetAllInfos(v822)
						for v951, v952 in ipairs(getAllInfosResult) do
							if  not v952.Using and not v952.Drowning then
								v433.get("toggle_equip_item", v952.Uid)
										repeat
											task.wait()
										until GetAllInfos(v822)[1 ].Using
							end
						end
					end
					EquipAccessory("Shiesty")
					break
				end
			end
		end
	})
	tab:Toggle({
		["Title"] = "Auto Health",
		["Flag"] = "autohealth",
		["Desc"] = "Auto use Bloodbag",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Callback"] = function(v434)
			local num54 = 0 
			local v436
			local v437
			local v438
			local v439
			local v440
			local v441
			local v442
			local v443
			local v444
			while true do
				if num54 == 4 then
					function v444(v824)
						local num55 = 0
						local v826
						local v827
						local v828
						while true do
							if num55 == 1 then
								v828 = nil
								while true do
									if v826 == 1 then
										v827 = v437:FindFirstChild("Blood Bag")
										v828 = false
										v826 = 2 
									end
									if v826 == 0 then
										if v442 then
											return
										end
										v442 = true
										v826 = 1 
									end
									if v826 == 3 then
										v442 = false
										break
									end
									if v826 == 2 then
										if not v827 then
											local num56 = 0 
											while true do
												if num56 == 1 then
													task.wait(0.1)
													v827 = v437:FindFirstChild("Blood Bag") or v436.Backpack:FindFirstChild("Blood Bag") 
													break
												end
												if num56 == 0 then
													v440.get("toggle_equip_item", v824)
													v828 = true
													num56 = 1 
												end
											end
										end
										if v827 then
											while v438.Health < 90 do
														v440.get("consume_power_up", v827)
																task.wait(0.09999999999990905)
													end
													if v828 then
														v440.get("toggle_equip_item", v824)
													end
										else
											warn(" Blood Bag tool not found.")
										end
										v826 = 3 
									end
								end
								break
							end
							if num55 == 0 then
								v826 = 0
								v827 = nil
								num55 = 1
							end
						end
					end
					task.spawn(function()
						while v216().AutoBlood do
							local num57 = 0
							local v954
							while true do
								if num57 == 0 then
									v954 = 0 
									while true do
										if v954 == 0 then
											task.wait(0.2)
											if v438.Health <= 50 then
												local num58 = 0 
												local v1502
												while true do
													if 0 == num58 then
														v1502 = v443()
														if v1502 then
															v444(v1502)
														else
															warn("⚠ No bloodbag found.")
														end
														break
													end
												end
											end
											break
										end
									end
									break
								end
							end
						end
					end)
					break
				end
				if num54 == 2 then
					v440 = require(v439.Modules.Core.Net)
					v441 = v436.PlayerGui.Items.ItemsHolder.ItemsScrollingFrame
					v442 = false
					num54 = 3 
				end
				if num54 == 1 then
					v437 = v436.Character or v436.CharacterAdded:Wait() 
							v438 = v437:WaitForChild("Humanoid")
							v770 = 1 
						end
						if v770 == 1 then
							v439 = game:GetService("ReplicatedStorage")
							num54 = 2
				end
				if num54 == 0 then
					v216().AutoBlood = v434
					if not v434 then
						return
					end
					v436 = game.Players.LocalPlayer
					num54 = 1 
				end
				if num54 == 3 then
					v443 = nil
					function v443()
						for v1208, v1209 in ipairs(v441:GetChildren()) do
									if v1209:IsA("Frame") or v1209:IsA("ImageButton") then
										local num59 = 0 
										local v1370
										while true do
											if num59 == 0 then
												v1370 = v1209:GetAttribute("ItemType")
												if v1370 and (v1370:lower() == "consumable") then
													return v1209.Name
												end
									end
								end
								return nil
							end
						end
					end
					v444 = nil
					num54 = 4 
				end
			end
		end
	})
	tab:Divider()
	local flag11 = false
	local ref4 = nil
	local num60 = 70 
	tbl11["EnabledSnap"] = function()
		local num61 = 0 
		local v446
		while true do
			if num61 == 0 then
				v446 = HumanoidRootPart.Position
				while flag11 do
					task.wait()
					if not flag11 then
						break
					end
					local y = HumanoidRootPart.Position.Y
					local v446 = v446.Y - num60 
					local v831 = v446 - y 
					HumanoidRootPart.CFrame = HumanoidRootPart.CFrame * CFrame.new(0, v831, 0) 
				end
				break
			end
		end
	end
	local function v248(v447)
		local num62 = 0 
		local v449
		while true do
			if (356 - 356) == num62 then
				v449 = 0 
				while true do
					if v449 == 1 then
						if v447 then
							if not ref4 then
								ref4 = task.spawn(tbl11["EnabledSnap"])
							end
						else
							ref4 = nil
						end
						tab:Get("UndergroundToggle"):SetValue(v447)
						break
					end
					if v449 == 0 then
						if flag11 == v447 then
							return
						end
						flag11 = v447
						v449 = 1
					end
				end
				break
			end
		end
	end
	tab:Toggle({
		["Title"] = "Underground",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Value"] = false,
		["Flag"] = "UndergroundToggle",
		["Callback"] = function(v450)
			v248(v450)
		end
	})
	tab:Keybind({
		["Title"] = "Keybind",
		["Flag"] = "keybind",
		["Value"] = "G",
		["Callback"] = function()
			v248( not flag11)
		end
	})
	tab:Slider({
		["Title"] = "Snap Height",
		["Flag"] = "snap_height",
		["Step"] = 1,
		["Value"] = {
			["Min"] = 1,
			["Max"] = 100,
			["Default"] = 10
		},
		["Callback"] = function(v451)
			num60 = v451
		end
	})
	local tab2 = createWindow:Tab({
		["Title"] = "Combat",
		["Icon"] = "swords"
	})
	local num63 = 150
	local flag12 = false
	local flag13 = false
	local flag14 = false
	local ref5 = nil
	local flag15 = true
	local head = "Head"
	local num64 = 160
	local num65 = 0.165 
	local currentCamera2 = workspace.CurrentCamera
	local tbl13 = {
		"P226",
		"MP5",
		"M24",
		"Draco",
		"Glock",
		"Sawnoff",
		"Uzi",
		"G3",
		"C9",
		"Hunting Rifle",
		"Anaconda",
		"AK47",
		"Remington",
		"Double Barrel"
	}
	local tbl14 = {}
	for v452, v453 in pairs(tbl13) do
		tbl14[v453] = true
	end
	local drawing = Drawing.new("Circle")
	drawing.Color = Color3.new(1, 1, 1)
	drawing.Thickness = 2 
	drawing.NumSides = 100 
	drawing.Radius = num63
	drawing.Filled = false
	drawing.Visible = false
	local drawing2 = Drawing.new("Line")
	drawing2.Color = Color3.fromRGB(255, 60, 60)
	drawing2.Thickness = 1.400000000000091 
	drawing2.Visible = false
	local tbl15 = {}
	for v455 = 1, 4 do
		local num66 = 0 
		local v457
		while true do
			if num66 == 0 then
				v457 = Drawing.new("Line")
						v457.Color = Color3.fromRGB(255, 255, 255)
						v774 = 1 
					end
					if (602 - 601) == v774 then
						num66 = 1
			end
			if 2 == num66 then
				tbl15[v455] = v457
				break
			end
			if 1 == num66 then
				v457.Thickness = 1.6 
				v457.Visible = false
				num66 = 2
			end
		end
	end
	local num67 = 10
	local tbl16 = {}
	local tbl17 = {}
	_G.ESPZone_Enabled = true
	local tbl18 = {}
	local num68 = 0.4500000000000455 
	local function v278(v458)
		local num69 = 0 
		local v460
		local v461
		local v462
		local v463
		local v464
		while true do
			if num69 == 2 then
				v462 = v458.Character
				v463 = v462:FindFirstChildOfClass("Humanoid")
				num69 = 3 
			end
			if num69 == 3 then
				local num70 = 0 
				while true do
					if num70 == 1 then
						num69 = 4 
						break
					end
					if num70 == 0 then
						v464 = false
						if (v458:GetAttribute("InSafeZone") == true) or (v458:GetAttribute("SafeZone") == true) or (v458:GetAttribute("IsInSafeZone") == true) or (v458:GetAttribute("InZone") == true) or (v462:GetAttribute("InSafeZone") == true) or (v462:GetAttribute("SafeZone") == true) or (v463 and (v463:GetAttribute("InSafeZone") == true)) or v462:FindFirstChildOfClass("ForceField") then
							v464 = true
						end
						num70 = 1 
					end
				end
			end
			if 1 == num69 then
				v461 = tbl18[v458]
				if v461 and ((v460 - v461.lastCheck) < num68) then
					return v461.inZone
				end
				num69 = 2 
			end
			if num69 == 4 then
				tbl18[v458] = {
							["inZone"] = v464,
							["lastCheck"] = v460
						}
						return v464
					end
				end
			end
			if (756 - 756) == num69 then
				if  not v458 or not v458.Character then
					return false
				end
				v460 = tick()
				num69 = 1 
			end
		end
	end
	Players.PlayerRemoving:Connect(function(v465)
		tbl18[v465] = nil
	end)
	local tbl19 = {}
	local function v280(v467)
		local num71 = 0 
		local v469
		local v470
		local v471
		local v472
		while true do
			if num71 == 2 then
				local num72 = 0 
				while true do
					if num72 == 1 then
						num71 = 3
						break
					end
					if num72 == 0 then
						v471 = v278(v467)
						v472 = tbl19[v467]
						num72 = 1
					end
				end
			end
			if num71 == 3 then
				if v471 then
					if  not v472 or not v472.Parent then
						local num73 = 0 
						local v1144
						while true do
							if num73 == 4 then
								local num74 = 0 
								while true do
									if num74 == 1 then
										v1144.TextStrokeTransparency = 0.3 
										num73 = 5 
										break
									end
									if num74 == 0 then
										v1144.TextSize = 13 
										v1144.TextColor3 = Color3.fromRGB(0, 255, 90)
										num74 = 1
									end
								end
							end
							if num73 == 3 then
								v1144.BackgroundTransparency = 1 
								v1144.Size = UDim2.new(1, 0, 1, 0)
								v1144.Font = Enum.Font.GothamBold
								num73 = 4 
							end
							if num73 == 6 then
								tbl19[v467] = v472
								break
							end
							if (1469 - 1469) == num73 then
								v472 = Instance.new("BillboardGui")
								v472.Name = "MontanaZoneLabel"
								v472.Size = UDim2.new(0, 160, 0, 22)
								num73 = 1
							end
							if num73 == 5 then
								v1144.TextStrokeColor3 = Color3.new(0, 0, 0)
								v1144.Text = "(EN ZONA SEGURA)"
								v1144.Parent = v472
								num73 = 6 
							end
							if num73 == 2 then
								local num75 = 0
								while true do
									if 0 == num75 then
										v472.Parent = v470
										v1144 = Instance.new("TextLabel")
										num75 = 1 
									end
									if num75 == 1 then
										v1144.Name = "Label"
										num73 = 3
							end
							if num73 == 1 then
								v472.StudsOffset = Vector3.new(0, 2.6, 0)
								v472.AlwaysOnTop = true
								v472.MaxDistance = 400 
								num73 = 2
							end
						end
					else
						if v472.Parent ~= v470 then
									v472.Parent = v470
								end
								v472.Enabled = true
					end
				elseif v472 then
					v472.Enabled = false
				end
				break
			end
			if num71 == 1 then
				v470 = v469 and v469:FindFirstChild("Head") 
						if not v470 then
							return
						end
						v783 = 1
					end
					if v783 == 1 then
						num71 = 2
			end
			if num71 == 0 then
				if not _G.ESPZone_Enabled then
					local v279 = tbl19[v467]
					if v279 then
						pcall(function()
							v279:Destroy()
						end)
						tbl19[v467] = nil
					end
					return
				end
				v469 = v467.Character
				num71 = 1 
			end
		end
	end
	task.spawn(function()
		while true do
			task.wait(0.5)
					if _G.ESPZone_Enabled then
						for v1148, v1149 in ipairs(Players:GetPlayers()) do
							if v1149 ~= localPlayer2 then
								pcall(v280, v1149)
							end
						end
					else
						for v1150, v1151 in pairs(tbl19) do
							local num76 = 0 
							while true do
								if 0 == num76 then
									pcall(function()
										v1151:Destroy()
									end)
									tbl19[v1150] = nil
						end
					end
					break
				end
			end
		end
	end)
	local function v281(v473, v474, v475)
		if not tbl16[v473] then
					tbl16[v473] = {}
					tbl17[v473] = {
						["count"] = 0,
						["lastSpike"] = 0,
						["isAntiLock"] = false
					}
				end
				table.insert(tbl16[v473], {
					["pos"] = v474,
					["vel"] = v475,
					["time"] = tick()
				})
				v476 = 1
			end
			if (1661 - 1660) == v476 then
				if  # tbl16[v473] > 30 then
					table.remove(tbl16[v473], 1)
				end
				if flag15 and ( # tbl16[v473] >= 3) then
					local num77 = 0 
					local v959
					local v960
					local v961
					while true do
						if num77 == 2 then
							if (tick() - tbl17[v473].lastSpike) > 1.6 then
								tbl17[v473].count = 0 
										tbl17[v473].isAntiLock = false
							end
							break
						end
						if num77 == 1 then
							v961 = (v959.vel - v960.vel).Magnitude
							if v961 > num64 then
								tbl17[v473].count = tbl17[v473].count + (1) 
								tbl17[v473].lastSpike = tick()
								if tbl17[v473].count >= 2 then
									tbl17[v473].isAntiLock = true
								end
							end
							num77 = 2 
						end
						if num77 == 0 then
							v959 = tbl16[v473][ # tbl16[v473]]
							v960 = tbl16[v473][ # tbl16[v473] - 1 ]
							num77 = 1
						end
					end
				end
	end
	local function v282(v477)
		local v274 = tbl16[v477]
		if  not v274 or ( # v274 < (779 - 777)) then
			return Vector3.zero
		end
		if flag15 and tbl17[v477] and tbl17[v477].isAntiLock then
			local num78 = 0
			local v717
			while true do
				if num78 == 1 then
					if  # v717 > 0 then
						table.sort(v717, function(v1213, v1214)
							return v1213.Magnitude < v1214.Magnitude 
						end)
						return v717[math.ceil( # v717 / (2))]
					end
					break
				end
				if num78 == 0 then
					v717 = {}
					for v1088 = 2 , # v274 do
						local num79 = 0
						local v1090
						while true do
							if num79 == 0 then
								v1090 = v274[v1088].time - v274[v1087 ].time 
								if v1090 > 0.001 then
									table.insert(v717, (v274[v1088].pos - v274[v1087 ].pos) / v1090)
								end
								break
							end
						end
					end
					num78 = 1
				end
			end
		end
		local zero = Vector3.zero
		local num80 = 0
		local v274 = # v274
		for v661 = 2 , v274 do
			local time = v274[v661].time - v274[v660 ].time 
			if time > 0.001 then
				local v661 = v661 / v274 
				zero = zero + (((v274[v661].pos - v274[v660 ].pos) / time) * v661) 
				num80 = num80 + v661 
			end
		end
		if num80 == 0 then
			return Vector3.zero
		end
		return zero / num80 
	end
	local function v283()
		local ref6 = nil
		local huge = math.huge
		local vector2 = Vector2.new(currentCamera2.ViewportSize.X / 2, currentCamera2.ViewportSize.Y / 2)
		for v663, v664 in pairs(Players:GetPlayers()) do
			if (v664 ~= localPlayer2) and v664.Character and v664.Character:FindFirstChild("HumanoidRootPart") then
				local num81 = 0
				local v787
				local v788
				local v789
				while true do
					if num81 == 0 then
						v787 = 0
						v788 = nil
						num81 = 1 
					end
					if num81 == 1 then
						v789 = nil
						while true do
							if 0 == v787 then
								if _G.ESPZone_Enabled and v278v664 then
									continue
								end
								v788 = v664.Character.HumanoidRootPart
								v787 = 1 
							end
							if v787 == 1 then
								v789 = v664.Character:FindFirstChild("Humanoid")
								if v789 and (v789.Health > 0) then
									local num82 = 0
									local v1434
									local v1435
									local v1436
									while true do
										if num82 == 1 then
											v1436 = nil
											while true do
												if v1434 == 0 then
													v1435, v1436 = currentCamera2:WorldToViewportPoint(v788.Position)
													if v1436 then
														local num83 = 0 
														local v1619
														while true do
															if num83 == 0 then
																v1619 = (Vector2.new(v1435.X, v1435.Y) - vector2).Magnitude
																if (v1619 <= num63) and (v1619 < huge) then
																	huge = v1619
																			ref6 = v664
																end
																break
															end
														end
													end
													break
												end
											end
											break
										end
										if num82 == 0 then
											v1434 = 0 
											v1435 = nil
											num82 = 1 
										end
									end
								end
								break
							end
						end
						break
					end
				end
			end
		end
		return ref6
	end
	local function v284(v485)
		if not v485 then
					return nil
				end
				if head == "Torso" then
					return v485:FindFirstChild("HumanoidRootPart") or v485:FindFirstChild("UpperTorso") or v485:FindFirstChild("Torso") 
				elseif head == "Smart" then
					local num84 = 0
					local v1154
					local v1155
					local v1156
					while true do
						if num84 == 0 then
							v1154 = 0
							v1155 = nil
							num84 = 1 
						end
						if num84 == 1 then
							v1156 = nil
							while true do
								if 1 == v1154 then
											if v1155 and v1156 then
												local num85 = 0 
												local v1610
												local v1611
												while true do
													if num85 == 0 then
														v1610 = v1155.AssemblyLinearVelocity or v1155.Velocity or Vector3.zero 
														v1611 = v1156.AssemblyLinearVelocity or v1156.Velocity or Vector3.zero 
														num85 = 1 
													end
													if 1 == num85 then
														if v1610.Magnitude > (v1611.Magnitude + 40) then
															return v1156
														end
											end
											return v1155 or v1156 
										end
										if (517 - 517) == v1154 then
											local num86 = 0 
											local v1553
											while true do
												if num86 == 0 then
													v1553 = 0 
													while true do
														if v1553 == 0 then
															v1155 = v485:FindFirstChild("Head")
															v1156 = v485:FindFirstChild("HumanoidRootPart")
															v1553 = 1 
														end
														if v1553 == 1 then
															v1154 = 1
													break
												end
											end
										end
										break
									end
								end
							end
							break
						end
					end
				else
					return v485:FindFirstChild("Head") or v485:FindFirstChild("HumanoidRootPart") 
				end
				break
			end
		end
	end
	local function v285(v487, v488)
		local num87 = 0 
		local v490
		local v491
		local v492
		while true do
			if num87 == 3 then
				return v491
			end
			if num87 == 2 then
				if v492 and v492.Part0 then
					local num88 = 0 
					local v963
					while true do
						if num88 == 0 then
							v963 = v492.Part0.AssemblyLinearVelocity or v492.Part0.Velocity or Vector3.zero 
							v491 = v487.Position + (v963 * num65 * (1.2)) 
							break
						end
					end
				end
				if v488 then
					local num89 = 0 
					local v965
					while true do
						if num89 == 0 then
							v965 = v488:FindFirstChildOfClass("Humanoid")
							if v965 and v965.SeatPart then
								local num90 = 0 
								local v1392
								local v1393
								while true do
									if num90 == 1 then
										v491 = v487.Position + (v1393 * num65 * (1.25)) 
										break
									end
									if num90 == 0 then
										v1392 = v965.SeatPart
										v1393 = v1392.AssemblyLinearVelocity or v1392.Velocity or v490 
										num90 = 1 
									end
								end
							end
							break
						end
					end
				end
				num87 = 3 
			end
			if num87 == 0 then
				if not v487 then
					return Vector3.zero
				end
				v490 = v487.AssemblyLinearVelocity or v487.Velocity or Vector3.zero 
				num87 = 1
			end
			if num87 == 1 then
				v491 = v487.Position + (v490 * num65) 
						v492 = v487:FindFirstChildWhichIsA("WeldConstraint") or v487:FindFirstChildWhichIsA("Weld") 
						v790 = 1 
					end
					if v790 == 1 then
						num87 = 2
			end
		end
	end
	local function v286(v493)
		local num91 = 0
		local v495
		local v496
		local v497
		while true do
			if num91 == 2 then
				if v495 and (v493[2 ] == "shoot_gun") then
					return true
				end
				return false
			end
			if num91 == 0 then
				v495, v496 = pcall(function()
							return v493[3 ]
						end)
						if v495 and (typeofv496 == "Instance") and tbl14[v496.Name] then
							return true
						end
						v791 = 1 
					end
					if v791 == 1 then
						num91 = 1
			end
			if num91 == 1 then
				v497 = localPlayer2.Character
				if v497 then
					for v1091, v1092 in pairs(v497:GetChildren()) do
						if (v1092:IsA("Tool") or v1092:IsA("Model")) and tbl14[v1092.Name] then
							return true
						end
					end
				end
				num91 = 2
			end
		end
	end
	local Remotes2 = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Send")
	local v288
	v288 = hookfunction(Remotes2.FireServer, function(v498, ...)
		local tbl20 = {
			...
		}
		if flag12 and v286v499 then
			ref5 = v283()
					if ref5 and ref5.Character then
						local v284Result = v284(ref5.Character)
						if v284Result then
							local num92 = 0
							local v1336
							while true do
								if num92 == 1 then
									tbl20[5] = {
										[1] = {
											[1 ] = {
												["Instance"] = v284Result,
												["Position"] = v1336
											}
										}
									}
									break
								end
								if num92 == 0 then
									v1336 = v285(v284Result, ref5.Character)
											tbl20[4 ] = CFrame.new((1) / (0), (1) / (0), 1 / (0), NaN - (858), NaN - 1560125541, NaN - (665), NaN - 0, NaN - 0, NaN, NaN - (1671), NaN - (859), NaN)
											v1478 = 1 
										end
										if v1478 == 1 then
											num92 = 1
								end
							end
						end
					end
		end
		return v288(v498, unpack(tbl20))
	end)
	RunService.RenderStepped:Connect(function()
		local vector22 = Vector2.new(currentCamera2.ViewportSize.X / (2), currentCamera2.ViewportSize.Y / (2))
		drawing.Position = vector22
		drawing.Radius = num63
		drawing.Color = Color3.new(1, 1, 1)
		drawing.Thickness = 2 
		drawing.Visible = flag12 and flag13 
		if flag12 then
			ref5 = v283()
		else
			ref5 = nil
		end
		if ref5 and ref5.Character then
			local v284Result2 = v284(ref5.Character)
			if v284Result2 then
				local v285Result = v285(v284Result2, ref5.Character)
				local v835, v836 = currentCamera2:WorldToViewportPoint(v285Result)
				if v836 then
					local Head = localPlayer2.Character and localPlayer2.Character:FindFirstChild("Head") 
					if Head then
						local num93 = 0 
						local v1216
						while true do
							if num93 == 1 then
								drawing2.To = Vector2.new(v835.X, v835.Y)
								drawing2.Visible = true
								break
							end
							if num93 == 0 then
								v1216 = currentCamera2:WorldToViewportPoint(Head.Position)
								drawing2.From = Vector2.new(v1216.X, v1216.Y)
								num93 = 1
							end
						end
					else
						drawing2.Visible = false
					end
					local v1094, v1095 = v835.X, v835.Y
					local v273 = num67
					local tbl21 = {
						Vector2.new(v1094, v1095 - v273),
						Vector2.new(v1094 + v273, v1095),
						Vector2.new(v1094, v1095 + v273),
						Vector2.new(v1094 - v273, v1095)
					}
					for v1158 = 1 , 4 do
						tbl15[v1158].From = tbl21[v1158]
						tbl15[v1158].To = tbl21[(v1158 % 4) + 1 ]
						tbl15[v1158].Visible = true
					end
				else
					drawing2.Visible = false
					for v1164 = 1, 4 do
						tbl15[v1164].Visible = false
					end
				end
			else
				local num94 = 0
				while true do
					if (1348 - 1348) == num94 then
						drawing2.Visible = false
						for v1218 = 1 , 4 do
							tbl15[v1218].Visible = false
						end
						break
					end
				end
			end
		else
			local num95 = 0 
			local v721
			while true do
				if 0 == num95 then
					v721 = 0
					while true do
						if v721 == 0 then
							drawing2.Visible = false
							for v1337 = 1 , 4 do
								tbl15[v1337].Visible = false
							end
							break
						end
					end
					break
				end
			end
		end
	end)
	tab2:Toggle({
		["Title"] = "Silent Aim",
		["Flag"] = "silent aim",
		["Desc"] = "Auto aim to target",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Default"] = false,
		["Callback"] = function(v506)
			flag12 = v506
		end
	})
	tab2:Toggle({
		["Title"] = "Show FOV",
		["Flag"] = "show",
		["Desc"] = "Display FOV circle",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Default"] = false,
		["Callback"] = function(v507)
			flag13 = v507
		end
	})
	tab2:Toggle({
		["Title"] = "Smart Predict",
		["Flag"] = "smartpredict",
		["Desc"] = "Advanced velocity prediction + Anti-Lock Resolver",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Default"] = true,
		["Callback"] = function(v508)
			flag15 = v508
		end
	})
	tab2:Toggle({
		["Title"] = "Wallbang",
		["Flag"] = "wallbang",
		["Desc"] = "Shoot through walls",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Default"] = false,
		["Callback"] = function(v509)
			flag14 = v509
		end
	})
	tab2:Dropdown({
		["Title"] = "Target Mode",
		["Flag"] = "target_mode",
		["Desc"] = "Select aim target part",
		["Icon"] = "target",
		["Values"] = {
			"Head",
			"Torso",
			"Smart"
		},
		["Default"] = "Head",
		["Callback"] = function(v510)
			head = v510
		end
	})
	tab2:Slider({
		["Title"] = "FOV Size",
		["Flag"] = "fov_size",
		["Step"] = 1,
		["Value"] = {
			["Min"] = 20,
			["Max"] = 1000,
			["Default"] = num63
		},
		["Callback"] = function(v511)
			local num96 = 0
			local v513
			while true do
				if num96 == 0 then
					v513 = 0 
					while true do
						if v513 == 0 then
							num63 = tonumber(v511) or 150 
							drawing.Radius = num63
							break
						end
					end
					break
				end
			end
		end
	})
	tab2:Slider({
		["Title"] = "Velocity Threshold",
		["Flag"] = "velocity_threshold",
		["Step"] = 10,
		["Value"] = {
			["Min"] = 100,
			["Max"] = 500,
			["Default"] = num64
		},
		["Callback"] = function(v514)
			num64 = tonumber(v514) or 250 
		end
	})
	local function v229(v515)
		if  not v515 or not HumanoidRootPart then
							return math.huge
						end
						return (HumanoidRootPart.Position - v515.Position).Magnitude
					end
				end
			end
		end
	end
	tbl11["HitAura"] = function()
		while task.wait() do
			if not v216().HitAura then
				break
			end
			for v722, v723 in pairs(Players:GetPlayers()) do
				if (v723 ~= localPlayer) and v723.Character and v723.Character:FindFirstChild("HumanoidRootPart") then
					local HumanoidRootPart2 = v723.Character:FindFirstChild("HumanoidRootPart")
					local v229Result = v229(HumanoidRootPart2)
					if v229Result < 0 then
						for v1167, v1168 in pairs(wait:GetChildren()) do
							if v1168:IsA("Tool") and (v1168.Name == "Fists") then
								local num97 = 0
								local v1340
								while true do
									if num97 == 1 then
										table.sort(v1340)
										v1168:SetAttribute(v1340[7 ], 20)
										num97 = 2 
									end
									if num97 == 3 then
										task.wait(0)
										break
									end
									if num97 == 0 then
										v1340 = {}
										for v1511 in pairs(v1168:GetAttributes()) do
											table.insert(v1340, v1511)
										end
										num97 = 1 
									end
									if num97 == 2 then
										v1168:SetAttribute(v1340[8], 10000)
										Net.send("melee_attack", v1168, {
											v723
										}, HumanoidRootPart2.CFrame, 0)
										num97 = 3
									end
								end
							end
						end
					end
				end
			end
		end
	end
	tab2:Toggle({
		["Title"] = "Hit Aura",
		["Flag"] = "hitaura",
		["Desc"] = "Auto attack near player",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Default"] = false,
		["Callback"] = function(v517)
			local num98 = 0 
			while true do
				if (115 - 115) == num98 then
					v216().HitAura = v517
					if v517 then
						task.spawn(tbl11["HitAura"])
					end
		end
	})
	local tab3 = createWindow:Tab({
		["Title"] = "Weapon",
		["Icon"] = "wrench"
	})
	tab3:Section({
		["Title"] = "Gun Modification:"
	})
	local tbl22 = {
		["Enabled"] = false,
		["accuracy"] = math.huge,
		["range"] = math.huge,
		["Recoil"] = 0,
		["fire_rate"] = math.huge,
		["reload_time"] = 0,
		["automatic"] = true
	}
	local fire_rate = "fire_rate"
	local automatic = "automatic"
	local button4 = tab3:Button({
		["Title"] = "Current Gun",
		["Desc"] = "None"
	})
	local function v295(v519)
		local num99 = 0
		local v521
		while true do
			if num99 == 0 then
				v521 = 0 
				while true do
					if v521 == 1 then
						for v1169, v1170 in pairs(v519:GetAttributes()) do
							if (typev1169 == "string") and (v1169:sub( - 3) == "486") then
								return v1169
							end
						end
						return nil
					end
					if v521 == 0 then
						if not v519 then
							return nil
						end
						if v519:GetAttribute("fire_rate") ~= nil then
							return "fire_rate"
						end
						v521 = 1 
					end
				end
	end
	local function v296(v522)
		if not v522 then
			return nil
		end
		if v522:GetAttribute("automatic") ~= nil then
			return "automatic"
		end
		for v665, v666 in pairs(v522:GetAttributes()) do
			if (typev665 == "string") and (v665:sub( - 3) == "492") then
				return v665
			end
		end
		return nil
	end
	local function v297(v523)
		if  not v523 or not v523:IsA("Tool") then
			return false
		end
		return v523:GetAttribute("reload_time") or v523:GetAttribute("AmmoType") or v295(v523) 
	end
	local function v298(v524)
		local num100 = 0 
		while true do
			if num100 == 1 then
				return true
			end
			if num100 == 0 then
				if  not v524 or not v524:IsA("Tool") then
					return false
				end
				pcall(function()
					local num101 = 0 
					local v841
					local v842
					local v843
					while true do
						if (1295 - 1294) == num101 then
							v843 = nil
							while true do
								if v841 == 3 then
									v843 = v296(v524)
									if v843 then
										v524:SetAttribute(v843, tbl22.automatic)
												automatic = v843
									else
										v524:SetAttribute("automatic", tbl22.automatic)
									end
									break
								end
								if v841 == 2 then
									v842 = v295(v524)
									if v842 then
										local num102 = 0
										local v1481
										while true do
											if 0 == num102 then
												v1481 = 0 
												while true do
													if v1481 == 0 then
														v524:SetAttribute(v842, tbl22.fire_rate)
														fire_rate = v842
														break
													end
												end
												break
											end
										end
									else
										v524:SetAttribute("fire_rate", tbl22.fire_rate)
									end
									v841 = 3 
								end
								if v841 == 0 then
									v524:SetAttribute("accuracy", tbl22.accuracy)
									v524:SetAttribute("range", tbl22.range)
									v841 = 1
								end
								if 1 == v841 then
									v524:SetAttribute("Recoil", tbl22.Recoil)
									v524:SetAttribute("reload_time", tbl22.reload_time)
									v841 = 2 
								end
							end
							break
						end
						if num101 == 0 then
							v841 = 0
							v842 = nil
							num101 = 1 
						end
					end
				end)
				num100 = 1 
			end
		end
	end
	local function v299()
		local num103 = 0
		local v527
		while true do
			if (1164 - 1163) == num103 then
						return v527
					end
					if num103 == 0 then
						local num104 = 0
						while true do
							if num104 == 1 then
								num103 = 1 
								break
							end
							if num104 == 0 then
								v527 = 0 
								for v1394, v1395 in pairs(Backpack:GetChildren()) do
									if v297(v1395) then
										v298(v1395)
												v527 = num105
									end
								end
								num104 = 1 
							end
						end
					end
		end
	end
	local function v300()
		local num105 = 0 
		local v529
		local v530
		while true do
			if num105 == 1 then
						v530 = v529:FindFirstChildOfClass("Tool")
						if v530 and v297v530 then
							local num106 = 0 
							local v1222
							while true do
								if num106 == 0 then
									v1222 = 0 
									while true do
										local num107 = 0 
										while true do
											if (838 - 838) == num107 then
												if v1222 == 1 then
													return true
												end
												if v1222 == 0 then
													v298(v530)
													button4:SetDesc(v530.Name)
													v1222 = 1
												end
									end
									break
								end
							end
						end
						num105 = 2 
					end
					if num105 == 0 then
						v529 = localPlayer.Character
						if not v529 then
							return false
						end
						num105 = 1 
					end
					v668 = 1 
				end
				if 1 == v668 then
					if 2 == num105 then
						return false
					end
					break
				end
			end
		end
	end
	local tbl23 = {}
	local function v302(v531)
		if  not v531 or tbl23[v531] then
			return
		end
		local v295Result = v295(v531)
		if not v295Result then
			return
		end
		local getAttributeChangedSignal = v531:GetAttributeChangedSignal(v295Result):Connect(function()
			if tbl22.Enabled then
				local getAttribute = v531:GetAttribute(v295Result)
				if (getAttribute ~= math.huge) and (getAttribute ~= tbl22.fire_rate) then
					v531:SetAttribute(v295Result, tbl22.fire_rate)
				end
			end
		end)
		tbl23[v531] = getAttributeChangedSignal
	end
	local function v303(v535)
		if tbl23[v535] then
			local num108 = 0 
			local v725
			while true do
				if num108 == 0 then
					v725 = 0
					while true do
						if v725 == 0 then
							tbl23[v535]:Disconnect()
							tbl23[v535] = nil
							break
						end
					end
					break
				end
			end
		end
	end
	local function v304()
		for v844, v845 in pairs(tbl23) do
					v845:Disconnect()
				end
				tbl23 = {}
	end
	local ref7 = nil
	local ref8 = nil
	local ref9 = nil
	local function v308()
		local num109 = 0
		local v538
		local v539
		local v540
		local v541
		while true do
			if 2 == num109 then
				for v1171, v1172 in pairs(Backpack:GetChildren()) do
							if v297(v1172) then
								v302(v1172)
							end
						end
						v540 = localPlayer.Character
						v796 = 1 
					end
					if v796 == 1 then
						if v540 then
							local num110 = 0 
							local v1225
							while true do
								if num110 == 0 then
									v1225 = v540:FindFirstChildOfClass("Tool")
									if v1225 and v297v1225 then
										v302(v1225)
									end
						end
						num109 = 3 
						break
					end
				end
			end
			if num109 == 3 then
				if (v538 > 0) or v539 then
					loaded:Notify({
						["Title"] = "Gun Mod",
						["Content"] = "Modified " .. v538 .. " gun(s) + Realtime active",
						["Duration"] = 2
					})
				else
					button4:SetDesc("No Gun Found")
				end
				ref7 = Backpack.ChildAdded:Connect(function(v846)
					if tbl22.Enabled and v297v846 then
						local num111 = 0 
						local v1104
						while true do
							if num111 == 0 then
								v1104 = 0 
								while true do
									if v1104 == 0 then
										task.wait(0.05)
										v298(v846)
										v1104 = 1
									end
									if (1738 - 1737) == v1104 then
										v302(v846)
										break
									end
								end
								break
							end
						end
					end
				end)
				v540 = localPlayer.Character
				num109 = 4 
			end
			if num109 == 1 then
				v304()
				v538 = v299()
				v539 = v300()
				num109 = 2 
			end
			if num109 == 0 then
				if ref7 then
					ref7:Disconnect()
				end
				if ref8 then
					ref8:Disconnect()
				end
				if ref9 then
					ref9:Disconnect()
				end
				num109 = 1 
			end
			if num109 == 4 then
				if v540 then
					ref8 = v540.ChildAdded:Connect(function(v1105)
						if tbl22.Enabled and v297v1105 then
							local num112 = 0 
							while true do
								if num112 == 1 then
									button4:SetDesc(v1105.Name)
									v302(v1105)
									break
								end
								if num112 == 0 then
									task.wait(0.05)
									v298(v1105)
									num112 = 1 
								end
							end
						end
					end)
				end
				v541 = 0
				ref9 = game:GetService("RunService").Heartbeat:Connect(function()
					local num113 = 0 
					local v848
					local v849
					local v850
					while true do
						if num113 == 3 then
							v850 = Backpack:GetChildren()
							for v1227 = 1 , # v850 do
								local num114 = 0 
								local v1229
								while true do
									if num114 == 0 then
										v1229 = v850[v1227]
										if v297(v1229) then
											v298(v1229)
										end
										break
									end
								end
							end
							break
						end
						if num113 == 0 then
							if not tbl22.Enabled then
								return
							end
							v848 = tick()
							num113 = 1
						end
						if 1 == num113 then
							if (v848 - v541) < 0.15 then
								return
							end
							v541 = v848
							num113 = 2
						end
						if num113 == 2 then
							v849 = localPlayer.Character
									if v849 then
										local num115 = 0 
										local v1485
										while true do
											if num115 == 0 then
												v1485 = v849:FindFirstChildOfClass("Tool")
												if v1485 and v297v1485 then
													v298(v1485)
												end
									end
									v1173 = 1 
								end
								if v1173 == 1 then
									num113 = 3 
									break
								end
							end
						end
					end
				end)
				break
			end
		end
	end
	local function v309()
		local num116 = 0
		while true do
			if num116 == 2 then
				button4:SetDesc("None")
				break
			end
			if num116 == 0 then
				if ref7 then
					ref7:Disconnect()
					ref7 = nil
				end
				if ref8 then
					ref8:Disconnect()
					ref8 = nil
				end
				num116 = 1
			end
			if num116 == 1 then
				if ref9 then
					ref9:Disconnect()
							ref9 = nil
				end
				v304()
				num116 = 2 
			end
		end
	end
	tab3:Toggle({
		["Title"] = "Enable Gun Mod",
		["Flag"] = "gun_mod_enabled",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Default"] = false,
		["Callback"] = function(v543)
			tbl22.Enabled = v543
			if v543 then
				v308()
						loaded:Notify({
							["Title"] = "Gun Mod",
							["Content"] = "Enabled + Realtime Monitor",
							["Duration"] = 2
						})
			else
				v309()
						loaded:Notify({
							["Title"] = "Gun Mod",
							["Content"] = "Disabled",
							["Duration"] = 2
						})
			end
		end
	})
	tab3:Divider()
	tab3:Toggle({
		["Title"] = "INFINITE Accuracy",
		["Flag"] = "gun_max_accuracy",
		["Icon"] = "crosshair",
		["Type"] = "Checkbox",
		["Default"] = true,
		["Callback"] = function(v545)
			tbl22.accuracy = (v545 and math.huge) or 1 
			if tbl22.Enabled then
				local num117 = 0 
				while true do
					if 0 == num117 then
						v299()
						v300()
						break
					end
				end
			end
		end
	})
	tab3:Toggle({
		["Title"] = "INFINITE Range",
		["Flag"] = "gun_max_range",
		["Icon"] = "crosshair",
		["Type"] = "Checkbox",
		["Default"] = true,
		["Callback"] = function(v547)
			tbl22.range = (v547 and math.huge) or (100) 
			if tbl22.Enabled then
				v299()
				v300()
			end
		end
	})
	tab3:Toggle({
		["Title"] = "NO Recoil",
		["Flag"] = "gun_no_recoil",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Default"] = true,
		["Callback"] = function(v549)
			tbl22.Recoil = (v549 and (0)) or 1 
					if tbl22.Enabled then
						v299()
						v300()
					end
		end
	})
	tab3:Toggle({
		["Title"] = "INFINITE Fire Rate",
		["Flag"] = "gun_infinite_firerate",
		["Icon"] = "zap",
		["Type"] = "Checkbox",
		["Default"] = true,
		["Callback"] = function(v551)
			tbl22.fire_rate = (v551 and math.huge) or (0.1) 
			if tbl22.Enabled then
				local num118 = 0
				while true do
					if 0 == num118 then
						v299()
						v300()
						break
					end
				end
			end
		end
	})
	tab3:Toggle({
		["Title"] = "MIN Reload Time",
		["Flag"] = "gun_min_reload",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Default"] = true,
		["Callback"] = function(v553)
			local num119 = 0 
			local v555
			while true do
				if num119 == 0 then
					v555 = 0 
					while true do
						if v555 == 0 then
							tbl22.reload_time = (v553 and 0) or (2) 
							if tbl22.Enabled then
								v299()
										v300()
							end
							break
						end
					end
					break
				end
			end
		end
	})
	tab3:Toggle({
		["Title"] = "Automatic Mode",
		["Flag"] = "gun_automatic",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Default"] = true,
		["Callback"] = function(v556)
			tbl22.automatic = v556
					if tbl22.Enabled then
						v299()
								v300()
					end
		end
	})
	tab3:Divider()
	tab3:Button({
		["Title"] = "Refresh All Guns",
		["Desc"] = "Reapply modifications to all guns",
		["Callback"] = function()
			if tbl22.Enabled then
				local num120 = 0
				local v731
				while true do
					if 0 == num120 then
						v731 = v299()
						v300()
						num120 = 1 
					end
					if 1 == num120 then
						loaded:Notify({
							["Title"] = "Gun Mod",
							["Content"] = "Refreshed " .. v731 .. " gun(s)",
							["Duration"] = 2
						})
						break
					end
				end
			end
		end
	})
	localPlayer.CharacterAdded:Connect(function(v558)
		local num121 = 0 
		while true do
			if num121 == 2 then
				v304()
				if tbl22.Enabled then
					task.wait(0.5)
							v308()
				end
				break
			end
			if num121 == 0 then
				wait = v558
				Humanoid = wait:WaitForChild("Humanoid")
				num121 = 1 
			end
			if num121 == 1 then
				HumanoidRootPart = wait:WaitForChild("HumanoidRootPart")
				Backpack = localPlayer:WaitForChild("Backpack")
				num121 = 2 
			end
		end
	end)
		["Title"] = "Vehicle",
		["Icon"] = "car"
	})
	local function v310()
		while _G.BumpAura do
			local num122 = 0 
			local v670
			while true do
				if num122 == 0 then
					task.wait(0.09999999999990905)
					v670 = Vehicle.get_car_player_is_in()
					num122 = 1 
				end
				if num122 == 1 then
					if not v670 then
						continue
					end
					for v969, v970 in Char.get_all() do
						if v970 ~= wait then
							local num123 = 0
							local v1175
							while true do
								if num123 == 0 then
									v1175 = v970:FindFirstChild("HumanoidRootPart")
									if v1175 and (v229v1175 < 100) then
										local vector3 = v670.DriverSeat.AssemblyLinearVelocity + Vector3.new(65, 65, 65) 
										Net.send("run_over", v670, v970, vector3)
									end
									break
								end
							end
						end
					end
					break
				end
			end
		end
	end
	tab:Toggle({
		["Title"] = "Bump Aura",
		["Flag"] = "BumpAura",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Value"] = false,
		["Callback"] = function(v560)
			_G.BumpAura = v560
					if v560 then
						task.spawn(v310)
					end
		end
	})
	local tab4 = createWindow:Tab({
		["Title"] = "Visual",
		["Icon"] = "eye"
	})
	tab4:Section({
		["Title"] = "Players:"
	})
	_G.GreenESP_Enabled = true
	_G.GreenESP_MaxDist = 99999
	_G.GreenESP_ShowDist = true
	_G.GreenESP_Color = Color3.fromRGB(0, 255, 70)
	tab4:Toggle({
		["Title"] = "Green ESP",
		["Flag"] = "green_esp",
		["Desc"] = "Green body hologram + distance",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Default"] = true,
		["Callback"] = function(v562)
			_G.GreenESP_Enabled = v562
		end
	})
	tab4:Toggle({
		["Title"] = "Show Distance (M)",
		["Flag"] = "green_esp_dist",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Default"] = true,
		["Callback"] = function(v563)
			_G.GreenESP_ShowDist = v563
		end
	})
	_G.HealthESP_Enabled = true
	_G.HealthESP_ShowName = true
	tab4:Toggle({
		["Title"] = "Health ESP",
		["Flag"] = "health_esp",
		["Desc"] = "Barra de vida + nombre",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Default"] = true,
		["Callback"] = function(v564)
			_G.HealthESP_Enabled = v564
		end
	})
	tab4:Toggle({
		["Title"] = "Show Name",
		["Flag"] = "health_esp_name",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Default"] = true,
		["Callback"] = function(v565)
			_G.HealthESP_ShowName = v565
		end
	})
	tab4:Toggle({
		["Title"] = "ESP Zone",
		["Flag"] = "esp_zone",
		["Desc"] = "Detecta zona segura | Silent no apunta | Nombre/metros verdes",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Default"] = true,
		["Callback"] = function(v566)
			_G.ESPZone_Enabled = v566
		end
	})
	_G.HideName_Enabled = false
	tab4:Toggle({
		["Title"] = "Hide Name",
		["Flag"] = "hide_name",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Default"] = false,
		["Callback"] = function(v567)
			_G.HideName_Enabled = v567
		end
	})
	task.spawn(function()
		local Players2 = game:GetService("Players")
		local RunService2 = game:GetService("RunService")
		local localPlayer5 = Players2.LocalPlayer
		local tbl24 = {}
		local function v572(v671)
			local num124 = 0
			local v673
			while true do
				if num124 == 0 then
					local num125 = 0
					while true do
						if 1 == num125 then
							num124 = 1 
							break
						end
						if num125 == 0 then
							v673 = string.lower(v671.Name or "")
							if v673:find("dead") or v673:find("down") or v673:find("hurt") or v673:find("injur") or v673:find("skull") or v673:find("medic") or v673:find("bleed") or v673:find("ko") or v673:find("unconscious") or v673:find("revive") or v673:find("wounded") then
								return true
							end
							num125 = 1
						end
					end
				end
				if num124 == 1 then
					return false
				end
			end
		end
		local function v573(v674)
			local num126 = 0 
			local v676
			local v677
			while true do
				if num126 == 0 then
					if not v674 then
						return
					end
					for v971, v972 in ipairs(v674:GetDescendants()) do
						if v972:IsA("BillboardGui") and v972.Enabled and not v572v972 then
							local parent = v972.Parent
							if parent and ((parent.Name == "Head") or (parent.Name == "HumanoidRootPart") or parent:IsA("Attachment") or (parent == v674)) then
								v972.Enabled = false
								tbl24[v972] = true
							end
						end
					end
					num126 = 1
				end
				if num126 == 1 then
					v676 = localPlayer5:FindFirstChild("PlayerGui")
					if v676 then
						for v1177, v1178 in ipairs(v676:GetDescendants()) do
							if v1178:IsA("BillboardGui") and v1178.Enabled and not v572v1178 then
								local num127 = 0
								local v1344
								while true do
									if num127 == 0 then
										v1344 = string.lower(v1178.Name or "")
										if v1344:find("name") or v1344:find("level") or v1344:find("overhead") or v1344:find("tag") then
											local num128 = 0
											local v1524
											while true do
												if num128 == 0 then
													v1524 = 0 
													while true do
														if v1524 == 0 then
															v1178.Enabled = false
															tbl24[v1178] = true
															break
														end
													end
													break
												end
											end
										end
										break
									end
								end
							end
						end
					end
					num126 = 2
				end
				if num126 == 2 then
					v677 = v674:FindFirstChildOfClass("Humanoid")
					if v677 then
						pcall(function()
							local num129 = 0 
							while true do
								if 0 == num129 then
									v677.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
									v677.NameDisplayDistance = 0 
									break
								end
							end
						end)
					end
					break
				end
			end
		end
		local function v574(v678)
			local num130 = 0 
			local v680
			while true do
				if num130 == 0 then
					v680 = 0 
					while true do
						if v680 == 1 then
							if v678 then
								local num131 = 0 
								local v1346
								while true do
									if num131 == 0 then
										v1346 = v678:FindFirstChildOfClass("Humanoid")
										if v1346 then
											pcall(function()
												v1346.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer
												v1346.NameDisplayDistance = 100 
											end)
										end
										break
									end
								end
							end
							break
						end
						if v680 == 0 then
							for v1231, v1232 in pairs(tbl24) do
								if v1231 and v1231.Parent then
									pcall(function()
										v1231.Enabled = true
									end)
								end
							end
							tbl24 = {}
							v680 = 1
						end
					end
					break
				end
			end
		end
		local flag16 = false
		RunService2.Heartbeat:Connect(function()
			local num132 = 0 
			local v682
			while true do
				if num132 == 0 then
					v682 = localPlayer5.Character
					if _G.HideName_Enabled then
						flag16 = true
						v573(v682)
					elseif flag16 then
						flag16 = false
						v574(v682)
					end
					break
				end
			end
		end)
		localPlayer5.CharacterAdded:Connect(function(v683)
			task.wait(0.8)
			if _G.HideName_Enabled then
				v573(v683)
			end
		end)
	end)
	tab4:Divider()
	task.spawn(function()
		local num133 = 0 
		local v577
		local v578
		while true do
			if (781 - 781) == num133 then
				v577, v578 = pcall(function()
					local Players3 = game:GetService("Players")
					local RunService3 = game:GetService("RunService")
					local currentCamera3 = workspace.CurrentCamera
					local localPlayer6 = Players3.LocalPlayer
					local tbl25 = {}
					local function v858(v973)
						local v857 = tbl25[v973]
						if not v857 then
							return
						end
						if v857.hl then
							pcall(function()
								v857.hl:Destroy()
							end)
						end
						if v857.text then
							pcall(function()
								v857.text:Remove()
							end)
						end
						if v857.shadow then
							pcall(function()
								v857.shadow:Remove()
							end)
						end
						if v973.Character then
							for v1233, v1234 in pairs(v973.Character:GetChildren()) do
								if v1234:IsA("Highlight") and (v1234.Name == "MontanaGreenHL") then
									pcall(function()
										v1234:Destroy()
									end)
								end
							end
						end
						tbl25[v973] = nil
					end
					local function v859(v976)
						local num134 = 0 
						local v978
						local v979
						while true do
							if num134 == 1 then
								v978.Size = 15
								v978.Center = true
								v978.Outline = false
								num134 = 2 
							end
							if num134 == 0 then
								if v976 == localPlayer6 then
									return
								end
								if tbl25[v976] then
									return
								end
								v978 = Drawing.new("Text")
								num134 = 1 
							end
							if num134 == 2 then
								v978.Font = 2 
								v978.Color = Color3.new(0, 0, 0)
								v978.Transparency = 0.35000000000002274 
								num134 = 3 
							end
							if num134 == 3 then
								local num135 = 0
								while true do
									if num135 == 1 then
										v979.Size = 15 
										num134 = 4
										break
									end
									if 0 == num135 then
										v978.Visible = false
										v979 = Drawing.new("Text")
										num135 = 1
									end
								end
							end
							if num134 == 5 then
								v979.Color = Color3.fromRGB(255, 255, 255)
								v979.Visible = false
								tbl25[v976] = {
									["hl"] = nil,
									["text"] = v979,
									["shadow"] = v978
								}
								break
							end
							if num134 == 4 then
								v979.Center = true
								v979.Outline = true
								v979.Font = 2 
								num134 = 5
							end
						end
					end
					local function v860(v980)
						local num136 = 0 
						local v982
						while true do
							local num137 = 0
							while true do
								if (1300 - 1299) == num137 then
									if 2 == num136 then
										v982.OutlineTransparency = 0 
										v982.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
										v982.Parent = v980
										return v982
									end
									break
								end
								if num137 == 0 then
									if 1 == num136 then
										v982.Adornee = v980
										v982.FillColor = _G.GreenESP_Color or Color3.fromRGB(0, 255, 70) 
										v982.OutlineColor = Color3.fromRGB(180, 255, 180)
										v982.FillTransparency = 0.32 
										num136 = 2 
									end
									if num136 == 0 then
										if not v980 then
											return nil
										end
										for v1487, v1488 in pairs(v980:GetChildren()) do
											if v1488:IsA("Highlight") and (v1488.Name == "MontanaGreenHL") then
												pcall(function()
													v1488:Destroy()
												end)
											end
										end
										v982 = Instance.new("Highlight")
										v982.Name = "MontanaGreenHL"
										num136 = 1
									end
									num137 = 1 
								end
							end
						end
					end
					Players3.PlayerRemoving:Connect(function(v983)
						v858(v983)
					end)
					local function v861(v984, v985)
						if not _G.GreenESP_Enabled then
							return
						end
						task.wait(0.3)
						v859(v984)
						local v8572 = tbl25[v984]
						if v8572 then
							v8572.hl = v860(v985)
						end
					end
					for v987, v988 in pairs(Players3:GetPlayers()) do
						if v988 ~= localPlayer6 then
							v988.CharacterAdded:Connect(function(v1454)
										v861(v988, v1454)
									end)
									if v988.Character then
										v861(v988, v988.Character)
									end
						end
					end
					Players3.PlayerAdded:Connect(function(v989)
						v989.CharacterAdded:Connect(function(v1108)
							v861(v989, v1108)
						end)
					end)
					RunService3.RenderStepped:Connect(function()
						if not _G.GreenESP_Enabled then
							for v1248, v1249 in pairs(tbl25) do
								local num138 = 0 
								while true do
									if num138 == 1 then
										if v1249.shadow then
											v1249.shadow.Visible = false
										end
										break
									end
									if num138 == 0 then
										if v1249.hl then
											local num139 = 0 
											while true do
												if 0 == num139 then
													pcall(function()
														v1249.hl:Destroy()
													end)
													v1249.hl = nil
													break
												end
											end
										end
										if v1249.text then
											v1249.text.Visible = false
										end
										num138 = 1 
									end
								end
							end
							return
						end
						local character = localPlayer6.Character
						local HumanoidRootPart3 = character and character:FindFirstChild("HumanoidRootPart") 
						if not HumanoidRootPart3 then
							return
						end
						local fromRGB = _G.GreenESP_Color or Color3.fromRGB(0, 255, 70) 
						for v1109, v1110 in pairs(Players3:GetPlayers()) do
							if v1110 ~= localPlayer6 then
								local num140 = 0
								local v1252
								local v1253
								local v1254
								local v1255
								while true do
									if num140 == 0 then
										v1252 = v1110.Character
										v1253 = v1252 and v1252:FindFirstChildOfClass("Humanoid") 
										num140 = 1
									end
									if num140 == 2 then
										if v1252 and v1253 and (v1253.Health > 0) and v1254 then
											v859(v1110)
											local v8573 = tbl25[v1110]
											if v8573 then
												local num141 = 0 
												local v1543
												while true do
													if num141 == 0 then
														if  not v8573.hl or not v8573.hl.Parent then
															v8573.hl = v860(v1252)
														else
															local num142 = 0
															local v1650
															while true do
																if 0 == num142 then
																	v1650 = 0 
																	while true do
																		if v1650 == 0 then
																			v8573.hl.FillColor = fromRGB
																			v8573.hl.OutlineColor = Color3.fromRGB(180, 255, 180)
																			break
																		end
																	end
																	break
																end
															end
														end
														v1543 = (HumanoidRootPart3.Position - v1254.Position).Magnitude
														num141 = 1 
													end
													if num141 == 1 then
														if  not _G.HealthESP_Enabled and (v1543 <= (_G.GreenESP_MaxDist or (3353 - 853))) and _G.GreenESP_ShowDist then
															local num143 = 0 
															local v1652
															local v1653
															while true do
																if num143 == 0 then
																	v1652, v1653 = currentCamera3:WorldToViewportPoint(v1254.Position - Vector3.new(0, 3.1, 0))
																	if v1653 and (v1652.Z > 0) then
																		local num144 = 0 
																		local v1751
																		while true do
																			if num144 == 0 then
																				v1751 = math.floor(v1543) .. "M" 
																				v8573.shadow.Text = v1751
																				num144 = 1
																			end
																			if 2 == num144 then
																				v8573.text.Text = v1751
																				v8573.text.Position = Vector2.new(v1652.X, v1652.Y)
																				num144 = 3
																			end
																			if num144 == 3 then
																				v8573.text.Color = Color3.fromRGB(255, 255, 255)
																				v8573.text.Visible = true
																				break
																			end
																			if num144 == 1 then
																				v8573.shadow.Position = Vector2.new(v1652.X + 1, v1652.Y + (1))
																				v8573.shadow.Visible = true
																				num144 = 2 
																			end
																		end
																	else
																		v8573.text.Visible = false
																				v8573.shadow.Visible = false
																	end
																	break
																end
															end
														else
															v8573.text.Visible = false
																	v8573.shadow.Visible = false
														end
														break
													end
												end
											end
										else
											v858(v1110)
										end
										break
									end
									if (567 - 566) == num140 then
										v1254 = v1252 and v1252:FindFirstChild("HumanoidRootPart") 
										v1255 = v1252 and v1252:FindFirstChild("Head") 
										num140 = 2 
									end
								end
							end
						end
					end)
				end)
				if not v577 then
					warn("[MontanaHub] Green ESP failed: " .. tostring(v578))
				end
				break
			end
		end
	end)
	task.spawn(function()
		local num145 = 0 
		local v580
		local v581
		while true do
			if 0 == num145 then
				v580, v581 = pcall(function()
					local Players4 = game:GetService("Players")
					local RunService4 = game:GetService("RunService")
					local currentCamera4 = workspace.CurrentCamera
					local localPlayer7 = Players4.LocalPlayer
					local tbl26 = {}
					local num146 = 56 
					local num147 = 5 
					local function v869(v993)
						local tbl26 = tbl26[v993]
						if not tbl26 then
							return
						end
						for v1111, v1112 in pairs({
							"name",
							"nameShadow",
							"barBg",
							"barFill",
							"barOutline",
							"dist",
							"distShadow"
						}) do
							if tbl26[v1112] then
								pcall(function()
									tbl26[v1112]:Remove()
								end)
							end
						end
						tbl26[v993] = nil
					end
					local function v870(v996)
						local num148 = 0
						local v998
						local v999
						local v1000
						local v1001
						local v1002
						local v1003
						local v1004
						while true do
							if num148 == 2 then
								v999 = Drawing.new("Text")
								v999.Size = 13
								v999.Center = true
								v999.Outline = true
								v999.Font = 2 
								num148 = 3 
							end
							if num148 == 7 then
								local num149 = 0 
								while true do
									if num149 == 1 then
										v1003.Outline = false
										v1003.Font = 2 
										num149 = 2 
									end
									if num149 == 2 then
										v1003.Color = Color3.new(0, 0, 0)
										num148 = 8 
										break
									end
									if num149 == 0 then
										v1003.Size = 12 
										v1003.Center = true
										num149 = 1 
									end
								end
							end
							if num148 == 3 then
								v999.Color = Color3.fromRGB(255, 255, 255)
								v999.Visible = false
								v1000 = Drawing.new("Square")
								v1000.Filled = false
								v1000.Thickness = 1 
								num148 = 4
							end
							if num148 == 5 then
								v1001.Thickness = 0
								v1001.Color = Color3.fromRGB(20, 20, 20)
								v1001.Transparency = 0.25 
								v1001.Visible = false
								v1002 = Drawing.new("Square")
								num148 = 6
							end
							if num148 == 0 then
								if v996 == localPlayer7 then
									return
								end
								if tbl26[v996] then
									return
								end
								v998 = Drawing.new("Text")
								v998.Size = 13 
								v998.Center = true
								num148 = 1
							end
							if num148 == 4 then
								v1000.Color = Color3.fromRGB(0, 0, 0)
								v1000.Transparency = 0.2 
								v1000.Visible = false
								v1001 = Drawing.new("Square")
								v1001.Filled = true
								num148 = 5
							end
							if num148 == 9 then
								v1004.Outline = true
								v1004.Font = 2 
								v1004.Color = Color3.fromRGB(255, 255, 255)
								v1004.Visible = false
								tbl26[v996] = {
									["name"] = v999,
									["nameShadow"] = v998,
									["barBg"] = v1001,
									["barFill"] = v1002,
									["barOutline"] = v1000,
									["dist"] = v1004,
									["distShadow"] = v1003
								}
								break
							end
							if num148 == 1 then
								v998.Outline = false
								v998.Font = 2 
								v998.Color = Color3.new(0, 0, 0)
								v998.Transparency = 0.4
								v998.Visible = false
								num148 = 2 
							end
							if num148 == 6 then
								v1002.Filled = true
								v1002.Thickness = 0
								v1002.Color = Color3.fromRGB(0, 255, 80)
								v1002.Visible = false
								v1003 = Drawing.new("Text")
								num148 = 7
							end
							if num148 == 8 then
								v1003.Transparency = 0.35 
								v1003.Visible = false
								v1004 = Drawing.new("Text")
								v1004.Size = 12 
								v1004.Center = true
								num148 = 9
							end
						end
					end
					local function v871(v1005)
						local num150 = 0 
						while true do
							if num150 == 2 then
								v1005.barFill.Visible = false
								v1005.barOutline.Visible = false
								num150 = 3
							end
							if num150 == 3 then
								if v1005.dist then
									v1005.dist.Visible = false
								end
								if v1005.distShadow then
									v1005.distShadow.Visible = false
								end
								break
							end
							if num150 == 1 then
								v1005.nameShadow.Visible = false
								v1005.barBg.Visible = false
								num150 = 2
							end
							if num150 == 0 then
								if not v1005 then
									return
								end
								v1005.name.Visible = false
								num150 = 1 
							end
						end
					end
					Players4.PlayerRemoving:Connect(function(v1007)
						v869(v1007)
					end)
					RunService4.RenderStepped:Connect(function()
						if not _G.HealthESP_Enabled then
							for v1298, v1299 in pairs(tbl26) do
								v871(v1299)
							end
							return
						end
						local character2 = localPlayer7.Character
						local HumanoidRootPart4 = character2 and character2:FindFirstChild("HumanoidRootPart") 
						if not HumanoidRootPart4 then
							return
						end
						for v1113, v1114 in pairs(Players4:GetPlayers()) do
							if v1114 ~= localPlayer7 then
								local num151 = 0 
								local v1301
								local v1302
								local v1303
								local v1304
								while true do
									if num151 == 1 then
										v1303 = v1301 and v1301:FindFirstChild("HumanoidRootPart") 
										v1304 = v1301 and v1301:FindFirstChild("Head") 
										num151 = 2
									end
									if num151 == 0 then
										v1301 = v1114.Character
										v1302 = v1301 and v1301:FindFirstChildOfClass("Humanoid") 
										num151 = 1 
									end
									if num151 == 2 then
										if v1301 and v1302 and (v1302.Health > 0) and v1303 and v1304 then
											v870(v1114)
											local v8662 = tbl26[v1114]
											if v8662 then
												local v1544, v1545 = currentCamera4:WorldToViewportPoint(v1304.Position)
												if v1545 and (v1544.Z > 0) then
													local x = v1544.X
													local v1544 = v1544.Y - (18) 
													local v1554 = v1554 
													local v1009 = (HumanoidRootPart4.Position - v1303.Position).Magnitude
													local v867 = num146
													local num147 = num147
													local num152 = 12 
													local var2 = _G.ESPZone_Enabled and v278(v1114) 
													local fromRGB2 = Color3.fromRGB(0, 255, 80)
													local fromRGB3 = Color3.fromRGB(255, 255, 255)
													if _G.HealthESP_ShowName then
														local num153 = 0
														local v1621
														while true do
															if num153 == 4 then
																v8662.name.Color = (var2 and fromRGB2) or fromRGB3 
																v8662.name.Visible = true
																break
															end
															if (440 - 439) == num153 then
																v8662.nameShadow.Size = num152
																v8662.nameShadow.Position = Vector2.new(v1544, v1009)
																num153 = 2
															end
															if num153 == 3 then
																v8662.name.Size = num152
																v8662.name.Position = Vector2.new(x, v1554)
																num153 = 4
															end
															if num153 == 2 then
																v8662.nameShadow.Visible = true
																v8662.name.Text = v1621
																num153 = 3 
															end
															if 0 == num153 then
																v1621 = ((v1114.DisplayName ~= v1114.Name) and v1114.DisplayName) or v1114.Name 
																v8662.nameShadow.Text = v1621
																num153 = 1 
															end
														end
													else
														local num154 = 0 
														local v1623
														while true do
															if num154 == 0 then
																v1623 = 0 
																while true do
																	if v1623 == 0 then
																		v8662.name.Visible = false
																		v8662.nameShadow.Visible = false
																		break
																	end
																end
																break
															end
														end
													end
													local clamp = math.clamp(v1302.Health / math.max(v1302.MaxHealth, 1), 0, 1)
													local v867 = v867 * clamp 
													local v1579
													if clamp > (1762.5 - 1762) then
														v1579 = Color3.fromRGB(0, 255, 0)
													elseif clamp > 0.25 then
														v1579 = Color3.fromRGB(255, 220, 0)
													else
														v1579 = Color3.fromRGB(255, 30, 30)
													end
													local v1567 = x - (v867 / (2)) 
													v8662.barOutline.Size = Vector2.new(num152, var2)
													v8662.barOutline.Position = Vector2.new(v1579, x)
													v8662.barOutline.Visible = true
													v8662.barBg.Size = Vector2.new(v867, num147)
													v8662.barBg.Position = Vector2.new(v1567, v1544)
													v8662.barBg.Color = Color3.fromRGB(0, 0, 0)
													v8662.barBg.Transparency = 0.3 
													v8662.barBg.Visible = true
													v8662.barFill.Size = Vector2.new(math.max(v867, 0), num147)
													v8662.barFill.Position = Vector2.new(v1567, v1544)
													v8662.barFill.Color = v1579
													v8662.barFill.Visible = true
													if _G.GreenESP_ShowDist then
														local vector32 = v1303.Position - Vector3.new(0, 3, 0) 
														local v1625, v1626 = currentCamera4:WorldToViewportPoint(vector32)
														local floor = math.floor(v1009) .. "M" 
														if v1626 and (v1625.Z > 0) and v8662.dist then
															local num155 = 0 
															while true do
																if 0 == num155 then
																	v8662.distShadow.Text = floor
																	v8662.distShadow.Size = num152
																	num155 = 1 
																end
																if 1 == num155 then
																	v8662.distShadow.Position = Vector2.new(v1625.X + (1), v1625.Y + 1)
																	v8662.distShadow.Visible = true
																	num155 = 2 
																end
																if num155 == 2 then
																	v8662.dist.Text = floor
																	v8662.dist.Size = num152
																	num155 = 3
																end
																if num155 == 4 then
																	v8662.dist.Visible = true
																	break
																end
																if num155 == 3 then
																	v8662.dist.Position = Vector2.new(v1625.X, v1625.Y)
																	v8662.dist.Color = (var2 and fromRGB2) or fromRGB3 
																	num155 = 4 
																end
															end
														else
															local num156 = 0 
															local v1686
															while true do
																if num156 == 0 then
																	v1686 = 0 
																	while true do
																		if v1686 == 0 then
																			if v8662.dist then
																				v8662.dist.Visible = false
																			end
																			if v8662.distShadow then
																				v8662.distShadow.Visible = false
																			end
																			break
																		end
																	end
																	break
																end
															end
														end
													else
														if v8662.dist then
																	v8662.dist.Visible = false
																end
																if v8662.distShadow then
																	v8662.distShadow.Visible = false
																end
													end
												else
													v871(v8662)
												end
											end
										else
											v869(v1114)
										end
										break
									end
								end
							end
						end
					end)
				end)
				if not v580 then
					warn("[MontanaHub] Health ESP failed: " .. tostring(v581))
				end
				break
			end
		end
	end)
	_G.HackerESP_Enabled = false
	task.spawn(function()
		local num157 = 0 
		local v583
		local v584
		while true do
			if num157 == 0 then
				v583, v584 = pcall(function()
					local Players5 = game:GetService("Players")
					local RunService5 = game:GetService("RunService")
					local localPlayer8 = Players5.LocalPlayer
					local tbl27 = {}
					local tbl28 = {}
					local function v877(v1010)
						local tbl27 = tbl27[v1010]
						if tbl27 then
							local num158 = 0 
							local v1183
							while true do
								if num158 == 0 then
									v1183 = 0 
									while true do
										if v1183 == 0 then
											pcall(function()
												tbl27:Destroy()
											end)
											tbl27[v1010] = nil
											break
										end
									end
									break
								end
							end
						end
						if v1010 and v1010.Character then
							local num159 = 0 
							local v1185
							while true do
								if 0 == num159 then
									v1185 = v1010.Character:FindFirstChild("Head")
									if v1185 then
										local MontanaHackerESP = v1185:FindFirstChild("MontanaHackerESP")
										if MontanaHackerESP then
											pcall(function()
												MontanaHackerESP:Destroy()
											end)
										end
									end
									break
								end
							end
						end
					end
					local function v878(v1012)
						if v1012 == localPlayer8 then
							return nil
						end
						if tbl27[v1012] and tbl27[v1012].Parent then
							return tbl27[v1012]
						end
						local character3 = v1012.Character
						local Head2 = character3 and character3:FindFirstChild("Head") 
						if not Head2 then
							return nil
						end
						local MontanaHackerESP2 = Head2:FindFirstChild("MontanaHackerESP")
						if MontanaHackerESP2 then
							pcall(function()
								MontanaHackerESP2:Destroy()
							end)
						end
						local BillboardGui = Instance.new("BillboardGui")
						BillboardGui.Name = "MontanaHackerESP"
						BillboardGui.Size = UDim2.new(0, 90, 0, 22)
						BillboardGui.StudsOffset = Vector3.new(0, 2.55, 0)
						BillboardGui.AlwaysOnTop = true
						BillboardGui.MaxDistance = 99999 
						BillboardGui.LightInfluence = 0 
						BillboardGui.Parent = Head2
						local Frame3 = Instance.new("Frame")
						Frame3.Name = "BG"
						Frame3.Size = UDim2.new(1, 0, 1, 0)
						Frame3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
						Frame3.BackgroundTransparency = 0.35 
						Frame3.BorderSizePixel = 0 
						Frame3.Parent = BillboardGui
						local UICorner4 = Instance.new("UICorner")
						UICorner4.CornerRadius = UDim.new(0, 4)
						UICorner4.Parent = Frame3
						local TextLabel3 = Instance.new("TextLabel")
						TextLabel3.Name = "Label"
						TextLabel3.Size = UDim2.new(1, 0, 1, 0)
						TextLabel3.BackgroundTransparency = 1
						TextLabel3.Font = Enum.Font.GothamBold
						TextLabel3.TextSize = 14
						TextLabel3.TextColor3 = Color3.fromRGB(255, 25, 25)
						TextLabel3.TextStrokeTransparency = 0.39999999999997726 
						TextLabel3.TextStrokeColor3 = Color3.new(0, 0, 0)
						TextLabel3.Text = "HACKER"
						TextLabel3.Parent = Frame3
						tbl27[v1012] = BillboardGui
						return BillboardGui
					end
					local function v879(v1047)
						local num160 = 0 
						local v1049
						while true do
							if num160 == 0 then
								if not v1047 then
									return false
								end
								v1049 = v1047:FindFirstChildOfClass("Humanoid")
								num160 = 1
							end
							if num160 == 1 then
								if v1049 and v1049.SeatPart then
									return true
								end
								return false
							end
						end
					end
					local function v880(v1050)
						if not v1050 then
							return false
						end
						local tool = v1050:FindFirstChildOfClass("Tool")
						if not tool then
							return false
						end
						local lower = string.lower(tool.Name)
						return string.find(lower, "glock") or string.find(lower, "p226") or string.find(lower, "ak") or string.find(lower, "draco") or string.find(lower, "uzi") or string.find(lower, "sawnoff") or string.find(lower, "remington") or string.find(lower, "double") or string.find(lower, "m24") or string.find(lower, "hunting") or string.find(lower, "anaconda") or string.find(lower, "g3") or string.find(lower, "c9") or string.find(lower, "mp5") 
					end
					local function v881(v1053)
						local HumanoidRootPart5 = v1053 and v1053:FindFirstChild("HumanoidRootPart") 
						if not HumanoidRootPart5 then
							return false
						end
						local velocity = HumanoidRootPart5.AssemblyLinearVelocity or HumanoidRootPart5.Velocity 
						return velocity.Y > 48 
					end
					local function v882(v1056)
						local num161 = 0 
						local v1058
						local v1059
						local v1060
						local v1061
						while true do
							if num161 == 3 then
								for v1347, v1348 in pairs(v1059:GetPlayingAnimationTracks()) do
									if v1348.Speed and (v1348.Speed > 50) then
										return true
									end
									local animation = v1348.Animation
									local tostringResult = tostring((animation and animation.AnimationId) or "")
									if string.find(tostringResult, "104767795538635") then
										return true
									end
								end
								return false
							end
							if num161 == 1 then
								if  not v1058 or not v1059 then
									return false
								end
								v1060 = v1058.AssemblyLinearVelocity or v1058.Velocity 
								num161 = 2 
							end
							if num161 == 2 then
								local num162 = 0 
								while true do
									if num162 == 1 then
										num161 = 3
										break
									end
									if num162 == 0 then
										v1061 = v1058.AssemblyAngularVelocity or Vector3.zero 
										if (v1060.Magnitude > 220) or (v1061.Magnitude > 40) then
											return true
										end
										num162 = 1
									end
								end
							end
							if num161 == 0 then
								local num163 = 0 
								while true do
									if num163 == 1 then
										num161 = 1
										break
									end
									if num163 == 0 then
										v1058 = v1056 and v1056:FindFirstChild("HumanoidRootPart") 
										v1059 = v1056 and v1056:FindFirstChildOfClass("Humanoid") 
										num163 = 1 
									end
								end
							end
						end
					end
					RunService5.RenderStepped:Connect(function()
						local num164 = 0 
						while true do
							if (172 - 172) == num164 then
								if not _G.HackerESP_Enabled then
									local num165 = 0
									local v1403
									while true do
										if (1416 - 1416) == num165 then
											v1403 = 0 
											while true do
												if v1403 == 0 then
													for v1655, v1656 in pairs(tbl27) do
																v877(v1655)
															end
															return
														end
													end
												end
											end
								end
								for v1351, v1352 in pairs(Players5:GetPlayers()) do
									if v1352 ~= localPlayer8 then
										local num166 = 0 
										local v1463
										local v1464
										local v1465
										while true do
											if num166 == 1 then
												v1465 = v1463 and v1463:FindFirstChild("Head") 
												if v1463 and v1464 and (v1464.Health > 0) and v1465 then
													local num167 = 0
													local v1557
													local v1558
													while true do
														if 0 == num167 then
															if not tbl28[v1352] then
																tbl28[v1352] = {
																	["lastHigh"] = 0,
																	["lastAnti"] = 0
																}
															end
															v1557 = tbl28[v1352]
															num167 = 1 
														end
														if 2 == num167 then
															if v1558 then
																local num168 = 0 
																local v1689
																while true do
																	if num168 == 0 then
																		v1689 = v878(v1352)
																		if v1689 then
																			v1689.Enabled = true
																		end
																		break
																	end
																end
															else
																local num169 = 0 
																local v1691
																while true do
																	if 0 == num169 then
																		v1691 = tbl27[v1352]
																		if v1691 then
																			v1691.Enabled = false
																		end
																		break
																	end
																end
															end
															break
														end
														if num167 == 1 then
															v1558 = false
															if  not v879v1463 and not v880v1463 then
																local num170 = 0
																local v1693
																while true do
																	if num170 == 1 then
																		if v882(v1463) then
																			v1557.lastAnti = v1693
																		end
																		v1558 = ((v1693 - v1557.lastHigh) < (1.7999999999999998)) or ((v1693 - v1557.lastAnti) < (1.7999999999999545)) 
																		break
																	end
																	if (928 - 928) == num170 then
																		v1693 = tick()
																		if v881(v1463) then
																			v1557.lastHigh = v1693
																		end
																		num170 = 1 
																	end
																end
															end
															num167 = 2 
														end
													end
												else
													v877(v1352)
															tbl28[v1352] = nil
												end
												break
											end
											if num166 == 0 then
												v1463 = v1352.Character
														v1464 = v1463 and v1463:FindFirstChildOfClass("Humanoid") 
														v1525 = 1 
													end
													if v1525 == 1 then
														num166 = 1
											end
										end
									end
								end
								break
							end
						end
					end)
					Players5.PlayerRemoving:Connect(function(v1063)
						v877(v1063)
								tbl28[v1063] = nil
					end)
				end)
				if not v583 then
					warn("[MontanaHub] Hacker Detector failed: " .. tostring(v584))
				end
				break
			end
		end
	end)
	pcall(function()
		local num171 = 0 
		local v586
		while true do
			if num171 == 0 then
				v586 = 0
				while true do
					if v586 == 0 then
						tab4:Section({
							["Title"] = "ESP HACKER:"
						})
						tab4:Toggle({
							["Title"] = "ESP HACKER",
							["Flag"] = "hacker_detector",
							["Desc"] = "ESP HACKER (salto alto + anti-aim)",
							["Icon"] = "check",
							["Type"] = "Checkbox",
							["Default"] = false,
							["Callback"] = function(v1186)
								_G.HackerESP_Enabled = v1186
							end
						})
						break
					end
				end
				break
			end
		end
	end)
	_G.InventoryViewerEnabled = true
	tab4:Toggle({
		["Title"] = "Inventory Viewer",
		["Flag"] = "inventoryviewer",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Default"] = true,
		["Callback"] = function(v587)
			local num172 = 0
			local v589
			local v590
			local v591
			local v592
			local v593
			while true do
				if num172 == 4 then
					if v587 then
						if not _G.ViewerRunning then
							_G.ViewerRunning = true
							task.spawn(function()
								while task.wait(0.25) do
									if not _G.InventoryViewerEnabled then
									else
										pcall(function()
											for v1518, v1519 in pairs(v589:GetPlayers()) do
												if (v1519 ~= v591) and v1519.Character and v1519.Character:FindFirstChild("HumanoidRootPart") then
													local humanoidRootPart = v1519.Character.HumanoidRootPart
													local MontanaInvESP = humanoidRootPart:FindFirstChild("MontanaInvESP")
													if not MontanaInvESP then
														local num173 = 0 
														while true do
															if num173 == 2 then
																MontanaInvESP.Size = UDim2.new(0, 130, 0, 28)
																MontanaInvESP.StudsOffset = Vector3.new(0, 1.2, 0)
																num173 = 3 
															end
															if num173 == 3 then
																MontanaInvESP.MaxDistance = 99999999
																MontanaInvESP.LightInfluence = 0 
																num173 = 4
															end
															if num173 == 4 then
																MontanaInvESP.Parent = humanoidRootPart
																break
															end
															if num173 == 1 then
																MontanaInvESP.AlwaysOnTop = true
																MontanaInvESP.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
																num173 = 2 
															end
															if num173 == 0 then
																MontanaInvESP = Instance.new("BillboardGui")
																MontanaInvESP.Name = "MontanaInvESP"
																num173 = 1 
															end
														end
													else
														local num174 = 0 
														local v1596
														local v1597
														while true do
															if num174 == 4 then
																local num175 = 0
																while true do
																	if 0 == num175 then
																		v1597.FillDirection = Enum.FillDirection.Horizontal
																		v1597.HorizontalAlignment = Enum.HorizontalAlignment.Center
																		num175 = 1 
																	end
																	if num175 == 1 then
																		v1597.VerticalAlignment = Enum.VerticalAlignment.Center
																		num174 = 5 
																		break
																	end
																end
															end
															if 1 == num174 then
																local num176 = 0
																while true do
																	if (1781 - 1780) == num176 then
																		v1596.Name = "BG"
																		num174 = 2
																		break
																	end
																	if num176 == 0 then
																		MontanaInvESP.AlwaysOnTop = true
																		v1596 = Instance.new("Frame")
																		num176 = 1
																	end
																end
															end
															if 2 == num174 then
																v1596.BackgroundTransparency = 1 
																v1596.Size = UDim2.new(1, 0, 1, 0)
																v1596.AnchorPoint = Vector2.new(0.5, 0.5)
																num174 = 3 
															end
															if num174 == 5 then
																v1597.Padding = UDim.new(0, 2)
																v1597.Parent = v1596
																break
															end
															if num174 == 0 then
																MontanaInvESP.Size = UDim2.new(0, 130, 0, 28)
																		MontanaInvESP.StudsOffset = Vector3.new(0, 1.2000000000000455, 0)
																		v1673 = 1 
																	end
																	if 1 == v1673 then
																		MontanaInvESP.MaxDistance = 99999999
																		num174 = 1
															end
															if num174 == 3 then
																v1596.Position = UDim2.new(0.5, 0, 0.5, 0)
																v1596.Parent = MontanaInvESP
																v1597 = Instance.new("UIListLayout")
																num174 = 4
															end
														end
													end
													local BG = MontanaInvESP:FindFirstChild("BG")
													if BG then
														for v1613, v1614 in pairs(BG:GetChildren()) do
															if v1614:IsA("Frame") then
																v1614:Destroy()
															end
														end
														local tbl29 = {}
														local Items2 = v590:FindFirstChild("Items")
														for v1615, v1616 in pairs({
															v1519:FindFirstChild("Backpack"),
															v1519.Character
														}) do
															if v1616 then
																for v1694, v1695 in pairs(v1616:GetChildren()) do
																	if v1695:IsA("Tool") and not v1695:GetAttribute("JobTool") and not v1695:GetAttribute("Locked") and Items2 then
																		local gun = (v1695:GetAttribute("AmmoType") and Items2:FindFirstChild("gun")) or Items2:FindFirstChild("melee") 
																		if gun then
																			for v1765, v1766 in pairs(gun:GetChildren()) do
																				if (v1695:GetAttribute("RarityName") == v1766:GetAttribute("RarityName")) and (v1695:GetAttribute("RarityPrice") == v1766:GetAttribute("RarityPrice")) then
																					local imageId = v1766:GetAttribute("ImageId")
																					if imageId then
																						local name = v1766.Name
																						if not tbl29[name] then
																							local num177 = 0
																							local v1788
																							local v1789
																							local v1790
																							local v1791
																							local v1792
																							while true do
																								if num177 == 4 then
																									local num178 = 0
																									while true do
																										if num178 == 1 then
																											v1790.Parent = v1788
																											num177 = 5
																											break
																										end
																										if num178 == 0 then
																											v1790.Thickness = 2.5 
																											v1790.Color = v592(v1766:GetAttribute("RarityName"))
																											num178 = 1 
																										end
																									end
																								end
																								if 2 == num177 then
																									v1788.BorderSizePixel = 0 
																									v1788.Parent = BG
																									v1789 = Instance.new("UICorner")
																									num177 = 3 
																								end
																								if 5 == num177 then
																									v1791 = Instance.new("ImageLabel")
																									v1791.Name = "Icon"
																									v1791.Image = imageId
																									num177 = 6 
																								end
																								if 0 == num177 then
																									tbl29[name] = true
																											v1788 = Instance.new("Frame")
																											v1798 = 1
																										end
																										if v1798 == 1 then
																											v1788.Name = name .. "_c" 
																											num177 = 1
																								end
																								if num177 == 6 then
																									v1791.BackgroundTransparency = 1 
																									v1791.BorderSizePixel = 0 
																									v1791.Size = UDim2.new(0.78, 0, 0.78, 0)
																									num177 = 7
																								end
																								if 7 == num177 then
																									v1791.Position = UDim2.new(0.11, 0, 0.11, 0)
																											v1791.ScaleType = Enum.ScaleType.Fit
																											v1802 = 1 
																										end
																										if v1802 == 1 then
																											v1791.Parent = v1788
																											num177 = 8
																								end
																								if 8 == num177 then
																									v1792 = Instance.new("UICorner")
																									v1792.CornerRadius = UDim.new(1, 0)
																									v1792.Parent = v1791
																									break
																								end
																								if num177 == 1 then
																									v1788.Size = UDim2.new(0, 22, 0, 22)
																											v1788.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
																											v1805 = 1 
																										end
																										if 1 == v1805 then
																											v1788.BackgroundTransparency = 0.05
																											num177 = 2
																								end
																								if num177 == 3 then
																									v1789.CornerRadius = UDim.new(1, 0)
																									v1789.Parent = v1788
																									v1790 = Instance.new("UIStroke")
																									num177 = 4 
																								end
																							end
																						end
																					end
																					break
																				end
																			end
																		end
																	end
																end
															end
														end
														MontanaInvESP.Enabled = _G.InventoryViewerEnabled
													end
												end
											end
										end)
									end
								end
							end)
						end
					else
						_G.ViewerRunning = false
						v593()
					end
					break
				end
				if num172 == 1 then
					v590 = game:GetService("ReplicatedStorage")
					v591 = v589.LocalPlayer
					num172 = 2
				end
				if num172 == 2 then
					v592 = nil
					function v592(v883)
						local num179 = 0
						local v885
						while true do
							if num179 == 0 then
								local num180 = 0
								while true do
									if (344 - 344) == num180 then
										v885 = {
											["Common"] = Color3.fromRGB(220, 220, 220),
											["UnCommon"] = Color3.fromRGB(99, 255, 52),
											["Uncommon"] = Color3.fromRGB(99, 255, 52),
											["Rare"] = Color3.fromRGB(51, 170, 255),
											["Legendary"] = Color3.fromRGB(255, 150, 0),
											["Epic"] = Color3.fromRGB(237, 44, 255),
											["Omega"] = Color3.fromRGB(255, 20, 51)
										}
										return v885[v883] or Color3.fromRGB(255, 255, 255) 
									end
								end
							end
						end
					end
					num172 = 3
				end
				if num172 == 3 then
					local num181 = 0 
					while true do
						if num181 == 1 then
							num172 = 4 
							break
						end
						if num181 == 0 then
							v593 = nil
							function v593()
								for v1308, v1309 in pairs(v589:GetPlayers()) do
									if v1309.Character and v1309.Character:FindFirstChild("HumanoidRootPart") then
										local num182 = 0 
										local v1405
										while true do
											if num182 == 0 then
												v1405 = v1309.Character.HumanoidRootPart:FindFirstChild("MontanaInvESP")
												if v1405 then
													v1405:Destroy()
												end
												break
											end
										end
									end
								end
							end
							num181 = 1 
						end
					end
				end
				if num172 == 0 then
					_G.InventoryViewerEnabled = v587
					v589 = game:GetService("Players")
					num172 = 1 
				end
			end
		end
	})
	_G.EnabledItemDrop = true
	local tbl30 = {}
	local num183 = 90000
	local tbl31 = {
		["Common"] = Color3.fromRGB(200, 200, 200),
		["Uncommon"] = Color3.fromRGB(80, 255, 80),
		["UnCommon"] = Color3.fromRGB(80, 255, 80),
		["Rare"] = Color3.fromRGB(55, 175, 255),
		["Epic"] = Color3.fromRGB(200, 60, 255),
		["Legendary"] = Color3.fromRGB(255, 185, 0),
		["Omega"] = Color3.fromRGB(255, 30, 30),
		["Mythic"] = Color3.fromRGB(255, 30, 30),
		["Mythical"] = Color3.fromRGB(255, 30, 30)
	}
	local function v315(v594)
		return tbl31[v594] or Color3.fromRGB(55, 175, 255) 
	end
	local function v316(v595, v596)
		local num184 = 0
		local v598
		local v599
		local v600
		while true do
			if num184 == 1 then
				v600 = string.lower(tostring(v596 or ""))
				if v600:find("money") or v600:find("dinero") then
					return "Uncommon"
				end
				if v600:find("ammo") or v600:find("municion") then
					return "Rare"
				end
				if v600:find("shovel") or v600:find("pala") then
					return "Uncommon"
				end
				num184 = 2 
			end
			if num184 == 2 then
				if v600:find("energy") or v600:find("pre.?work") then
					return "Epic"
				end
				if v600:find("remington") or v600:find("double") then
					return "Legendary"
				end
				return "Rare"
			end
			if num184 == 0 then
				v598 = v595:GetAttribute("RarityName")
				if v598 then
					return v598
				end
				v599 = ReplicatedStorage:FindFirstChild("Items")
				if v599 then
					for v1115, v1116 in ipairs(v599:GetDescendants()) do
						if v1116.Name == v596 then
							local num185 = 0 
							local v1311
							while true do
								if num185 == 0 then
									v1311 = v1116:GetAttribute("RarityName")
									if v1311 then
										return v1311
									end
									break
								end
							end
						end
					end
				end
				num184 = 1 
			end
		end
	end
	local function v317(v601)
		return v601:GetAttribute("ItemName") or v601:GetAttribute("Name") or v601.Name 
	end
	local function v318(v602)
		local PickUpZone = v602:FindFirstChild("PickUpZone")
		if PickUpZone and PickUpZone:IsA("BasePart") then
			return PickUpZone
		end
		return v602:FindFirstChildWhichIsA("BasePart", true)
	end
	local function v319(v604)
		local v312 = tbl30[v604]
		if not v312 then
			return
		end
		pcall(function()
			local num186 = 0 
			while true do
				if num186 == 1 then
					if v312.orb then
						v312.orb:Remove()
					end
					if v312.dot then
						v312.dot:Remove()
					end
					num186 = 2 
				end
				if num186 == 0 then
					if v312.text then
						v312.text:Remove()
					end
					if v312.shadow then
						v312.shadow:Remove()
					end
					num186 = 1
				end
				if num186 == 2 then
					if v312.highlight then
						v312.highlight:Destroy()
					end
					if v312.billboard then
						v312.billboard:Destroy()
					end
					break
				end
			end
		end)
		tbl30[v604] = nil
	end
	local function v320(v607)
		if tbl30[v607] then
			return tbl30[v607]
		end
		local tbl32 = {}
		local Highlight = Instance.new("Highlight")
		Highlight.Name = "MontanaDropHolo"
		Highlight.FillTransparency = 0.6
		Highlight.OutlineTransparency = 0
		Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		Highlight.Parent = v607
		tbl32.highlight = Highlight
		local pcallResult = pcall(function()
			local num187 = 0 
			local v686
			local v687
			local v688
			local v689
			while true do
				if num187 == 2 then
					v687 = Drawing.new("Text")
					v687.Center = true
					v687.Outline = true
					v687.OutlineColor = Color3.new(0, 0, 0)
					num187 = 3 
				end
				if num187 == 3 then
					v687.Font = 2
					v687.Size = 18
					v687.Visible = false
					v688 = Drawing.new("Circle")
					num187 = 4 
				end
				if num187 == 5 then
					v688.Visible = false
					v689 = Drawing.new("Circle")
					v689.Thickness = 1 
					v689.NumSides = 32 
					num187 = 6
				end
				if num187 == 1 then
					v686.Size = 18
					v686.Color = Color3.new(0, 0, 0)
					v686.Transparency = 0.35 
					v686.Visible = false
					num187 = 2
				end
				if num187 == 4 then
					v688.Thickness = 1.2
					v688.NumSides = 64
					v688.Radius = 8 
					v688.Filled = false
					num187 = 5 
				end
				if num187 == 0 then
					v686 = Drawing.new("Text")
					v686.Center = true
					v686.Outline = false
					v686.Font = 2
					num187 = 1
				end
				if num187 == 7 then
					tbl32.shadow = v686
					tbl32.orb = v688
					tbl32.dot = v689
					tbl32.mode = "drawing"
					break
				end
				if num187 == 6 then
					v689.Radius = 3 
					v689.Filled = true
					v689.Visible = false
					tbl32.text = v687
					num187 = 7
				end
			end
		end)
		if not pcallResult then
			local num188 = 0
			local v733
			while true do
				if num188 == 0 then
					v733 = v318(v607)
					if v733 then
						local num189 = 0 
						local v1189
						local v1190
						while true do
							if num189 == 1 then
								v1189.Size = UDim2.new(0, 200, 0, 26)
								v1189.StudsOffset = Vector3.new(0, 1.6, 0)
								v1189.MaxDistance = num183
								num189 = 2 
							end
							if num189 == 6 then
								v1190.Parent = v1189
								tbl32.billboard = v1189
								tbl32.label = v1190
								num189 = 7
							end
							if num189 == 2 then
								v1189.LightInfluence = 0
								v1189.Parent = v733
								v1190 = Instance.new("TextLabel")
								num189 = 3 
							end
							if num189 == 5 then
								v1190.TextXAlignment = Enum.TextXAlignment.Center
								v1190.TextYAlignment = Enum.TextYAlignment.Center
								v1190.Text = ""
								num189 = 6 
							end
							if num189 == 3 then
								v1190.BackgroundTransparency = 1 
								v1190.Size = UDim2.new(1, 0, 1, 0)
								v1190.Font = Enum.Font.GothamBold
								num189 = 4 
							end
							if num189 == 0 then
								v1189 = Instance.new("BillboardGui")
								v1189.Name = "MontanaDropESP"
								v1189.AlwaysOnTop = true
								num189 = 1 
							end
							if num189 == 4 then
								v1190.TextSize = 18 
								v1190.TextStrokeTransparency = 0 
								v1190.TextStrokeColor3 = Color3.new(0, 0, 0)
								num189 = 5 
							end
							if num189 == 7 then
								tbl32.mode = "billboard"
								break
							end
						end
					end
					break
				end
			end
		end
		tbl30[v607] = tbl32
		return tbl32
	end
	tab4:Toggle({
		["Title"] = "Drop Item Viewer",
		["Flag"] = "dropitem_viewer",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Default"] = true,
		["Callback"] = function(v619)
			_G.EnabledItemDrop = v619
					if not v619 then
						for v1117, v1118 in pairs(tbl30) do
							v319(v1117)
						end
					end
		end
	})
	RunService.RenderStepped:Connect(function()
		local num190 = 0
		local v622
		local v623
		local v624
		local v625
		local v626
		while true do
			if num190 == 2 then
				for v914, v915 in ipairs(v622:GetChildren()) do
					if v915 and v915.Parent and not v915:GetAttribute("Locked") then
						local num191 = 0 
						local v1120
						while true do
							if num191 == 0 then
								v1120 = v318(v915)
								if v1120 then
									local v623 = (v623 - v1120.Position).Magnitude
									if v623 <= num183 then
										table.insert(v624, {
											["item"] = v915,
											["part"] = v1120,
											["dist"] = v623
										})
									end
								end
								break
							end
						end
					end
				end
				table.sort(v624, function(v916, v917)
					return v916.dist < v917.dist 
				end)
				v625 = {}
				num190 = 3 
			end
			if num190 == 3 then
				v626 = math.min( # v624, 120)
				for v918 = 1, v626 do
					local num192 = 0 
					local v920
					local v921
					local v922
					local v923
					while true do
						if 0 == num192 then
							v920 = v624[v918]
							v921, v922 = v920.item, v920.part
							num192 = 1
						end
						if num192 == 1 then
							v625[v921] = true
							v923 = v320(v921)
							num192 = 2 
						end
						if num192 == 2 then
							if v923 then
								local num193 = 0 
								local v1354
								local v1355
								local v1356
								while true do
									if num193 == 2 then
										if (v923.mode == "drawing") and v923.text then
											local num194 = 0 
											local v1527
											local v1528
											local v1529
											while true do
												if num194 == 1 then
													if v1529 and (v1528.Z > 0) then
														local v1631, v1632 = v1528.X, v1528.Y
														v923.shadow.Text = v1354
														v923.shadow.Size = 18 
														v923.shadow.Position = Vector2.new(v1632, v1633 + 0)
														v923.shadow.Visible = true
														v923.text.Text = v1354
														v923.text.Color = v1356
														v923.text.Size = 18
														v923.text.Position = Vector2.new(v1631, v1632)
														v923.text.Visible = true
														if v923.orb then
															local num195 = 0
															local v1697
															while true do
																if num195 == 0 then
																	v1697 = 0 
																	while true do
																		if v1697 == 1 then
																			v923.orb.Visible = true
																			break
																		end
																		if v1697 == 0 then
																			v923.orb.Color = v1356
																			v923.orb.Position = Vector2.new(v1631, v1656)
																			v1697 = 1 
																		end
																	end
																	break
																end
															end
														end
														if v923.dot then
															v923.dot.Color = v1356
																	v923.dot.Position = Vector2.new(v1631, v1656)
																	v1698 = 1 
																end
																if v1698 == 1 then
																	v923.dot.Visible = true
														end
													else
														v923.text.Visible = false
																v923.shadow.Visible = false
																v1642 = 1 
															end
															if 1 == v1642 then
																if v923.orb then
																	v923.orb.Visible = false
																end
																if v923.dot then
																	v923.dot.Visible = false
																end
													end
													break
												end
												if num194 == 0 then
													v1527 = v922.Position + Vector3.new(0, 2.2, 0) 
													v1528, v1529 = currentCamera:WorldToViewportPoint(v1527)
													num194 = 1 
												end
											end
										elseif (v923.mode == "billboard") and v923.label then
											v923.billboard.Enabled = true
													v923.label.Text = v1354
													v1560 = 1 
												end
												if v1560 == 1 then
													v923.label.TextColor3 = v1356
													if v923.billboard.Parent ~= v922 then
														v923.billboard.Parent = v922
													end
										end
										break
									end
									if 1 == num193 then
										local num196 = 0
										while true do
											if num196 == 1 then
												num193 = 2
												break
											end
											if 0 == num196 then
												v1356 = v315(v1355)
												if v923.highlight then
													local num197 = 0 
													while true do
														if (199 - 198) == num197 then
															v923.highlight.OutlineColor = v1356
															break
														end
														if num197 == 0 then
															v923.highlight.Enabled = true
															v923.highlight.FillColor = v1356
															num197 = 1
														end
													end
												end
												num196 = 1
											end
										end
									end
									if (1557 - 1557) == num193 then
										v1354 = v317(v921)
										v1355 = v316(v921, v1354)
										num193 = 1
									end
								end
							end
							break
						end
					end
				end
				for v924, v925 in pairs(tbl30) do
					if not v625[v924] then
						if v925.text then
							v925.text.Visible = false
						end
						if v925.shadow then
							v925.shadow.Visible = false
						end
						if v925.orb then
							v925.orb.Visible = false
						end
						if v925.dot then
							v925.dot.Visible = false
						end
						if v925.highlight then
							v925.highlight.Enabled = false
						end
						if v925.billboard then
							v925.billboard.Enabled = false
						end
					end
				end
				break
			end
			if num190 == 1 then
				for v926, v927 in pairs(tbl30) do
					if  not v926 or not v926.Parent then
						v319(v926)
					end
				end
				v623 = currentCamera.CFrame.Position
				v624 = {}
				num190 = 2
			end
			if num190 == 0 then
				if not _G.EnabledItemDrop then
					for v1491, v1492 in pairs(tbl30) do
										if v1492.text then
											v1492.text.Visible = false
										end
										if v1492.shadow then
											v1492.shadow.Visible = false
										end
										if v1492.orb then
											v1492.orb.Visible = false
										end
										if v1492.dot then
											v1492.dot.Visible = false
										end
										if v1492.highlight then
											v1492.highlight.Enabled = false
										end
										if v1492.billboard then
											v1492.billboard.Enabled = false
										end
									end
									return
								end
							end
						end
					end
				end
				v622 = workspace:FindFirstChild("DroppedItems") or workspace:FindFirstChild("Drops") or workspace:FindFirstChild("Dropped") 
				if not v622 then
					return
				end
				num190 = 1
			end
		end
	end)
	local tab5 = createWindow:Tab({
		["Title"] = "Misc",
		["Icon"] = "circle-ellipsis"
	})
	local flag17 = false
	tab5:Toggle({
		["Title"] = "Skip Animation",
		["Flag"] = "skip_anim",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Value"] = false,
		["Callback"] = function(v627)
			flag17 = v627
			if flag17 then
				task.spawn(function()
					while flag17 do
						local num198 = 0 
						local v929
						while true do
							if num198 == 0 then
								v929 = 0
								while true do
									if v929 == 0 then
										for v1467, v1468 in pairs(Crate.class.objects) do
											v1468.states.open.set(true)
											Crate.skipping.set(true)
										end
										task.wait(0.05)
					end
				end)
			end
		end
	})
	tab5:Toggle({
		["Title"] = "Infinite Hotbar",
		["Flag"] = "infhotbar",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Callback"] = function(v628)
			local num199 = 0
			local v630
			while true do
				if 0 == num199 then
					v630 = 0 
					while true do
						if v630 == 0 then
							if not v628 then
								return
							end
							for v1195, v1196 in pairs(getgc(true)) do
								if typev1196 == "function" then
									local num200 = 0 
									local v1358
									while true do
										if num200 == 0 then
											v1358 = debug.getinfo(v1196)
											if v1358.name == "get_max_items" then
												hookfunction(v1196, function(...)
													return 999 
												end)
											end
											break
										end
									end
								end
							end
							break
						end
					end
					break
				end
			end
		end
	})
	local tab6 = createWindow:Tab({
		["Title"] = "Spectate",
		["Icon"] = "eye"
	})
	tab6:Section({
		["Title"] = "SPECTATE"
	})
	_G.SpectateEnabled = false
	_G.SpectateTarget = nil
	local ref10 = nil
	local tbl33 = {}
	local tbl34 = {}
	local function v327()
		local num201 = 0 
		local v632
		while true do
			if num201 == 1 then
				v632 = game:GetService("Players").LocalPlayer
				for v930, v931 in ipairs(game:GetService("Players"):GetPlayers()) do
					if v931 ~= v632 then
						local v931 = ((v931.DisplayName ~= v931.Name) and (v931.DisplayName .. " (@" .. v931.Name .. ")")) or v931.Name 
						table.insert(tbl33, v931)
						tbl34[v931] = v931
					end
				end
				num201 = 2 
			end
			if num201 == 0 then
				tbl33 = {}
				tbl34 = {}
				num201 = 1 
			end
			if num201 == 2 then
				table.sort(tbl33)
				if ref10 then
					pcall(function()
						if ref10.Refresh then
							ref10:Refresh(tbl33)
						elseif ref10.SetValues then
							ref10:SetValues(tbl33)
						elseif ref10.UpdateValues then
							ref10:UpdateValues(tbl33)
						end
					end)
				end
				break
			end
		end
	end
	v327()
	tab6:Toggle({
		["Title"] = "Spectate Player",
		["Flag"] = "spectate_player",
		["Icon"] = "check",
		["Type"] = "Checkbox",
		["Default"] = false,
		["Callback"] = function(v633)
			_G.SpectateEnabled = v633
			local currentCamera5 = workspace.CurrentCamera
			local Players6 = game:GetService("Players").LocalPlayer
			if v633 then
				local spectateTarget = _G.SpectateTarget
				if spectateTarget and spectateTarget.Character then
					local num202 = 0 
					local v933
					while true do
						if num202 == 0 then
							v933 = spectateTarget.Character:FindFirstChildOfClass("Humanoid")
							if v933 then
								currentCamera5.CameraSubject = v933
										currentCamera5.CameraType = Enum.CameraType.Custom
							end
							break
						end
					end
				end
			else
				local num203 = 0 
				local v736
				local v737
				while true do
					if num203 == 1 then
						if v737 then
							currentCamera5.CameraSubject = v737
						end
						currentCamera5.CameraType = Enum.CameraType.Custom
						break
					end
					if num203 == 0 then
						v736 = Players6.Character
						v737 = v736 and v736:FindFirstChildOfClass("Humanoid") 
						num203 = 1
					end
				end
			end
		end
	})
	ref10 = tab6:Dropdown({
		["Title"] = "Select Player",
		["Flag"] = "spectate_select",
		["Values"] = tbl33,
		["Default"] = tbl33[1] or "",
		["Callback"] = function(v636)
			local num204 = 0 
			local v638
			while true do
				if num204 == 0 then
					v638 = tbl34[v636]
					_G.SpectateTarget = v638
					num204 = 1 
				end
				if num204 == 1 then
					if _G.SpectateEnabled and v638 then
						local currentCamera6 = workspace.CurrentCamera
						local character4 = v638.Character
						local humanoid = character4 and character4:FindFirstChildOfClass("Humanoid") 
						if humanoid then
							currentCamera6.CameraSubject = humanoid
							currentCamera6.CameraType = Enum.CameraType.Custom
						end
					end
					break
				end
			end
		end
	})
	Players.PlayerAdded:Connect(function()
		task.wait(0.3)
		v327()
	end)
	Players.PlayerRemoving:Connect(function(v639)
		if _G.SpectateTarget == v639 then
					_G.SpectateTarget = nil
					_G.SpectateEnabled = false
					local localPlayer9 = Players.LocalPlayer
					local currentCamera7 = workspace.CurrentCamera
					local humanoid2 = localPlayer9.Character and localPlayer9.Character:FindFirstChildOfClass("Humanoid") 
					if humanoid2 then
						currentCamera7.CameraSubject = humanoid2
					end
				end
				task.wait(0.2)
				v640 = 1 
			end
			if 1 == v640 then
				v327()
	end)
	task.spawn(function()
		local num205 = 0 
		local v642
		while true do
			if num205 == 0 then
				v642 = game:GetService("RunService")
				v642.Heartbeat:Connect(function()
					if not _G.SpectateEnabled then
						return
					end
					local spectateTarget2 = _G.SpectateTarget
					if not spectateTarget2 then
						return
					end
					local currentCamera8 = workspace.CurrentCamera
					local character5 = spectateTarget2.Character
					local humanoid3 = character5 and character5:FindFirstChildOfClass("Humanoid") 
					if humanoid3 and (currentCamera8.CameraSubject ~= humanoid3) then
						currentCamera8.CameraSubject = humanoid3
					elseif not humanoid3 then
					end
				end)
				break
			end
		end
	end)
	local tab7 = createWindow:Tab({
		["Title"] = "Graphic",
		["Icon"] = "monitor"
	})
	tab7:Button({
		["Title"] = "BoostFps",
		["Desc"] = "SuperVeryUltraLowPotato Graphic",
		["Icon"] = "rocket",
		["Locked"] = false,
		["Callback"] = function()
			loadstring(game:HttpGet("https://pastefy.app/Pmu7jqMe/raw"))()
		end
	})
	local flag18 = false
	tab7:Toggle({
		["Title"] = "White Screen",
		["Flag"] = "white_screen",
		["Desc"] = "<<<3",
		["Locked"] = false,
		["Callback"] = function(v643)
			flag18 = v643
			local RunService6 = game:GetService("RunService")
			RunService6:Set3dRenderingEnabled( not flag18)
		end
	})
	local tab8 = createWindow:Tab({
		["Title"] = "Config",
		["Icon"] = "settings"
	})
	tab8:Section({
		["Title"] = "Config Manager:"
	})
	local configManager = createWindow.ConfigManager
	local var3 = ""
	tab8:Input({
		["Title"] = "Config Name",
		["Placeholder"] = "Enter config name...",
		["Callback"] = function(v645)
			var3 = v645
		end
	})
	tab8:Button({
		["Title"] = "Save Config",
		["Icon"] = "save",
		["Callback"] = function()
			if var3 ~= "" then
				local num206 = 0 
				local v739
				while true do
					if (1825 - 1824) == num206 then
						loaded:Notify({
							["Title"] = "Config Manager",
							["Content"] = "Saved: " .. var3,
							["Duration"] = 2
						})
						break
					end
					if 0 == num206 then
						v739 = configManager:CreateConfig(var3)
						v739:Save()
						num206 = 1
					end
				end
			else
				loaded:Notify({
					["Title"] = "Config Manager",
					["Content"] = "Please enter config name!",
					["Duration"] = 2
				})
			end
		end
	})
	tab8:Button({
		["Title"] = "Load Config",
		["Icon"] = "folder-open",
		["Callback"] = function()
			if var3 ~= "" then
				local createConfig = configManager:CreateConfig(var3)
				createConfig:Load()
				loaded:Notify({
					["Title"] = "Config Manager",
					["Content"] = "Loaded: " .. var3,
					["Duration"] = 2
				})
			else
				loaded:Notify({
					["Title"] = "Config Manager",
					["Content"] = "Please enter config name!",
					["Duration"] = 2
				})
			end
		end
	})
	tab8:Button({
		["Title"] = "Delete Config",
		["Icon"] = "trash-2",
		["Callback"] = function()
			if var3 ~= "" then
				local createConfig2 = configManager:CreateConfig(var3)
				createConfig2:Delete()
				loaded:Notify({
					["Title"] = "Config Manager",
					["Content"] = "Deleted: " .. var3,
					["Duration"] = 2
				})
			else
				loaded:Notify({
					["Title"] = "Config Manager",
					["Content"] = "Please enter config name!",
					["Duration"] = 2
				})
			end
		end
	})
	task.wait(0.1)
	local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
	pcall(function()
		local num207 = 0 
		local v647
		while true do
			if num207 == 0 then
				v647 = require(ReplicatedStorage2.Modules.Game.UI.BuyPromptUI)
				if v647.loaded then
					local num208 = 0 
					local v1076
					while true do
						if num208 == 0 then
							v1076 = v647.loaded
							v647.loaded = function(...)
								local num209 = 0 
								local v1361
								while true do
									if num209 == 1 then
												return v1361
											end
											if num209 == 0 then
												v1361 = v1076(...)
												task.spawn(function()
													local num210 = 0 
													local v1562
													local v1563
													local v1564
													while true do
														if num210 == 1 then
															v1563 = require(ReplicatedStorage2.Modules.Core.UI)
															v1564 = v1563.get("SellPromptSellButton")
															num210 = 2 
														end
														if num210 == 0 then
															task.wait(0.5)
															v1562 = require(ReplicatedStorage2.Modules.Core.Util)
															num210 = 1 
														end
														if num210 == 2 then
															if v1564 and v1562.tween then
																local num211 = 0 
																local v1701
																while true do
																	if 0 == num211 then
																		v1701 = v1562.tween
																		v1562.tween = function(v1755, v1756, v1757, ...)
																			if v1755:IsA("NumberValue") and (v1757.Value == 1) then
																						if v1756.Time > 0 then
																							v1756 = TweenInfo.new(0, v1756.EasingStyle, v1756.EasingDirection, v1756.RepeatCount, v1756.Reverses, v1756.DelayTime)
																						end
																					end
																					return v1701(v1755, v1756, v1757, ...)
																				end
																			end
																		end
															end
												end)
												num209 = 1
											end
											break
										end
									end
								end
							end
							break
						end
					end
				end
				break
			end
		end
	end)
	pcall(function()
		local num212 = 0
		local v649
		while true do
			if num212 == 0 then
				v649 = require(ReplicatedStorage2.Modules.Core.Util)
				if v649.tween then
					local num213 = 0
					local v1078
					while true do
						if num213 == 0 then
							v1078 = v649.tween
							v649.tween = function(v1362, v1363, v1364, ...)
								if v1362:IsA("NumberValue") and (v1364.Value == (878 - 877)) then
									if v1363.Time > 0.1 then
										v1363 = TweenInfo.new(0.09999999999990905, v1363.EasingStyle, v1363.EasingDirection, v1363.RepeatCount, v1363.Reverses, v1363.DelayTime)
									end
								end
								return v1078(v1362, v1363, v1364, ...)
							end
							break
						end
					end
				end
				break
			end
		end
	end)
end
local flag19 = false
local function v107()
	if flag19 then
		return
	end
	local gsub = TextBox.Text:gsub("%s+", "")
	if gsub == "" then
		local num214 = 0 
		local v691
		while true do
			if num214 == 0 then
				v691 = 0 
				while true do
					if v691 == 0 then
						TextLabel2.TextColor3 = Color3.fromRGB(255, 90, 90)
						TextLabel2.Text = "⚠️ Por favor ingresa una key."
						v691 = 1
					end
					if v691 == 1 then
						return
					end
				end
				break
			end
		end
	end
	flag19 = true
	TextLabel2.TextColor3 = Color3.fromRGB(255, 220, 0)
	TextLabel2.Text = "Conectando con base de datos..."
	local v337, v338 = v18("/verify", {
		["key"] = gsub,
		["hwuid"] = v15
	})
	if v337 and v338 then
		if v338.valid then
			local v103Result = v103(v338.timeLeft or v338.expires_in or v338.remaining)
			TextLabel2.TextColor3 = Color3.fromRGB(0, 255, 100)
			TextLabel2.Text = "✅ Key correcta | Tiempo: " .. v103Result 
			if writefile then
				pcall(function()
					writefile(str2, HttpService:JSONEncode({
						["Key"] = gsub
					}))
				end)
			end
			task.wait(1.7999999999999545)
			pcall(function()
				if Instance then
					Instance:Destroy()
				end
			end)
			v104(gsub)
			print("🚀 [MontanaHub]: Acceso VIP autorizado. Iniciando hub...")
			v105()
			flag19 = false
			return
		else
			local num215 = 0
			local v809
			while true do
				if num215 == 1 then
					if v809:find("hwuid") or v809:find("dispositivo") or v809:find("otro") or v809:find("hwid") then
						TextLabel2.Text = "❌ Key en uso en otro dispositivo (Reseteala en Discord)."
					elseif v809:find("expir") or v809:find("caduc") or v809:find("tiempo") then
						TextLabel2.Text = "❌ Esta key ha expirado. Compra otra en Discord."
					elseif v809:find("ban") or v809:find("bloque") then
						TextLabel2.Text = "❌ Esta key está bloqueada permanentemente."
					elseif v809:find("inval") or v809:find("no existe") then
						TextLabel2.Text = "❌ Key incorrecta o inexistente."
					else
						TextLabel2.Text = "❌ " .. (v338.message or "Acceso denegado.") 
					end
					break
				end
				if num215 == 0 then
					TextLabel2.TextColor3 = Color3.fromRGB(255, 60, 60)
					v809 = tostring(v338.message or "Desconocido"):lower()
					num215 = 1 
				end
			end
		end
	else
		TextLabel2.TextColor3 = Color3.fromRGB(255, 60, 60)
				TextLabel2.Text = "❌ Error crítico: No se pudo contactar a Render."
	end
	flag19 = false
end
TextButton.MouseButton1Click:Connect(v107)
TextBox.FocusLost:Connect(function(v339)
	if v339 then
		v107()
	end
end)
if var ~= "" then
	task.spawn(function()
		local num216 = 0 
		while true do
			if 0 == num216 then
				task.wait(0.34999999999990905)
				v107()
				break
			end
		end
	end)
end
