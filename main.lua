local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera

local UPDATE_DELAY = 0.017

-- WEAPON SYSTEM & RARITIES
local RarityColors = {
	Common = Color3.fromRGB(255, 255, 255),
	Uncommon = Color3.fromRGB(0, 255, 0),
	Rare = Color3.fromRGB(0, 170, 255),
	Epic = Color3.fromRGB(170, 0, 255),
	Legendary = Color3.fromRGB(255, 170, 0),
	Mythic = Color3.fromRGB(255, 0, 0)
}

local Items = game:GetService("ReplicatedStorage"):WaitForChild("Items")
local WeaponRegistry = {}

local function registerItems(folder)
	for _, tool in ipairs(folder:GetChildren()) do
		if tool:IsA("Tool") then
			local handle = tool:FindFirstChild("Handle")
			local displayName = tool:GetAttribute("DisplayName") or tool.Name
			local itemId = tool:GetAttribute("ItemId") or tool:GetAttribute("Id") or tool.Name
			local rarity = tool:GetAttribute("RarityName") or "Common"
			local key

			if handle then
				local mesh = handle:FindFirstChildOfClass("SpecialMesh")
				if mesh and mesh.MeshId ~= "" then
					key = mesh.MeshId .. (mesh.TextureId or "") .. "_RARITY_" .. rarity
				elseif handle:IsA("MeshPart") and handle.MeshId ~= "" then
					key = handle.MeshId .. (handle.TextureID or "") .. "_RARITY_" .. rarity
				end
			end

			if not key and itemId and itemId ~= "" and itemId ~= tool.Name then
				key = "ITEMID_" .. itemId .. "_RARITY_" .. rarity
			end

			if not key then
				key = "NAME_" .. displayName .. "_" .. tool.Name .. "_RARITY_" .. rarity
			end

			WeaponRegistry[key] = {
				Name = displayName,
				Rarity = rarity,
				ToolName = tool.Name
			}
		end
	end
end

local function scanFolders(folder)
	registerItems(folder)

	folder.ChildAdded:Connect(function(child)
		task.wait(0.1)
		if child:IsA("Folder") then
			scanFolders(child)
		else
			registerItems(folder)
		end
	end)

	for _, child in ipairs(folder:GetChildren()) do
		if child:IsA("Folder") then
			scanFolders(child)
		end
	end
end

scanFolders(Items)

local function getItemKey(tool)
	local handle = tool:FindFirstChild("Handle")
	local displayName = tool:GetAttribute("DisplayName") or tool.Name
	local itemId = tool:GetAttribute("ItemId") or tool:GetAttribute("Id") or tool.Name
	local rarity = tool:GetAttribute("RarityName") or "Common"

	if handle then
		local mesh = handle:FindFirstChildOfClass("SpecialMesh")
		if mesh and mesh.MeshId ~= "" then
			return mesh.MeshId .. (mesh.TextureId or "") .. "_RARITY_" .. rarity
		end

		if handle:IsA("MeshPart") and handle.MeshId ~= "" then
			return handle.MeshId .. (handle.TextureID or "") .. "_RARITY_" .. rarity
		end
	end

	if itemId and itemId ~= "" and itemId ~= tool.Name then
		return "ITEMID_" .. itemId .. "_RARITY_" .. rarity
	end

	return "NAME_" .. displayName .. "_" .. tool.Name .. "_RARITY_" .. rarity
end

local function getWeaponInfo(tool)
	if not tool or not tool:IsA("Tool") then return nil end
	return WeaponRegistry[getItemKey(tool)]
end

local function getWeapons(player)
	local items = {}

	local function scan(container)
		if not container then return end
		for _, tool in ipairs(container:GetChildren()) do
			if tool:IsA("Tool") and tool.Name ~= "Fists" then
				local info = getWeaponInfo(tool)
				if info then
					table.insert(items, {
						Name = info.Name,
						Rarity = info.Rarity
					})
				end
			end
		end
	end

	scan(player:FindFirstChild("Backpack"))
	scan(player.Character)

	return items
end

-- ESP RENDER
local function createESP(player)
	local weaponDrawings = {}
	local last = 0

	RunService.RenderStepped:Connect(function()
		if tick() - last < UPDATE_DELAY then return end
		last = tick()

		local char = player.Character
		if not char then
			for _, draw in pairs(weaponDrawings) do draw.Visible = false end
			return
		end

		local head = char:FindFirstChild("Head")
		local root = char:FindFirstChild("HumanoidRootPart")
		local humanoid = char:FindFirstChildOfClass("Humanoid")

		if not head or not root or not humanoid or humanoid.Health <= 0 then
			for _, draw in pairs(weaponDrawings) do draw.Visible = false end
			return
		end

		local headPos, headVis = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 0.5, 0))
		local rootPos, rootVis = Camera:WorldToViewportPoint(root.Position - Vector3.new(0, 2.3, 0))

		if not headVis or not rootVis or headPos.Z < 0 or rootPos.Z < 0 then
			for _, draw in pairs(weaponDrawings) do draw.Visible = false end
			return
		end

		local height = math.abs(headPos.Y - rootPos.Y)
		local width = height / 2
		local x = rootPos.X - width / 2
		local y = headPos.Y

		local items = getWeapons(player)

		for _, draw in pairs(weaponDrawings) do
			draw.Visible = false
		end

		for i, w in ipairs(items) do
			if not weaponDrawings[i] then
				local txt = Drawing.new("Text")
				txt.Size = 13.75
				txt.Center = true
				txt.Outline = true
				txt.Font = 2
				weaponDrawings[i] = txt
			end

			local draw = weaponDrawings[i]
			draw.Text = w.Name -- Muestra únicamente el nombre del arma
			draw.Color = RarityColors[w.Rarity] or Color3.new(1, 1, 1) -- Mantiene el color por rareza
			draw.Position = Vector2.new(
				x + width / 2,
				y + height + 6 + ((i - 1) * 12)
			)
			draw.Visible = true
		end
	end)
end

for _, p in ipairs(Players:GetPlayers()) do
	createESP(p)
end

Players.PlayerAdded:Connect(function(p)
	task.wait(1)
	createESP(p)
end)
				local info = getWeaponInfo(tool)
				if info then
					table.insert(items, {
						Name = info.Name,
						Rarity = info.Rarity
					})
				end
			end
		end
	end

	scan(player:FindFirstChild("Backpack"))
	scan(player.Character)

	return items
end

-- ESP RENDER
local function createESP(player)
	if player == LocalPlayer then return end

	local weaponDrawings = {}
	local last = 0

	RunService.RenderStepped:Connect(function()
		if tick() - last < UPDATE_DELAY then return end
		last = tick()

		local char = player.Character
		if not char then
			for _, draw in pairs(weaponDrawings) do draw.Visible = false end
			return
		end

		local head = char:FindFirstChild("Head")
		local root = char:FindFirstChild("HumanoidRootPart")
		local humanoid = char:FindFirstChildOfClass("Humanoid")

		if not head or not root or not humanoid or humanoid.Health <= 0 then
			for _, draw in pairs(weaponDrawings) do draw.Visible = false end
			return
		end

		local headPos, headVis = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 0.5, 0))
		local rootPos, rootVis = Camera:WorldToViewportPoint(root.Position - Vector3.new(0, 2.3, 0))

		if not headVis or not rootVis or headPos.Z < 0 or rootPos.Z < 0 then
			for _, draw in pairs(weaponDrawings) do draw.Visible = false end
			return
		end

		local height = math.abs(headPos.Y - rootPos.Y)
		local width = height / 2
		local x = rootPos.X - width / 2
		local y = headPos.Y

		local items = getWeapons(player)

		for _, draw in pairs(weaponDrawings) do
			draw.Visible = false
		end

		for i, w in ipairs(items) do
			if not weaponDrawings[i] then
				local txt = Drawing.new("Text")
				txt.Size = 13.75
				txt.Center = true
				txt.Outline = true
				txt.Font = 2
				weaponDrawings[i] = txt
			end

			local draw = weaponDrawings[i]
			draw.Text = "[" .. w.Rarity .. "] " .. w.Name
			draw.Color = RarityColors[w.Rarity] or Color3.new(1, 1, 1)
			draw.Position = Vector2.new(
				x + width / 2,
				y + height + 6 + ((i - 1) * 12)
			)
			draw.Visible = true
		end
	end)
end

for _, p in ipairs(Players:GetPlayers()) do
	createESP(p)
end

Players.PlayerAdded:Connect(function(p)
	task.wait(1)
	createESP(p)
end)
