-- ============================================================
-- MontanaHub | Block Spin (Sin Sistema de Key)
-- ============================================================

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
										break
									end
								end
								break
							end
						end
					end
				end)
			end
		end
	end
end

-- Ejecución directa del menú principal sin verificación de key
v105()
