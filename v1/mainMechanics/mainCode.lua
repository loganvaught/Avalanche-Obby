-- placed inside game.ServerScriptService
local dataStoreService = game:GetService("DataStoreService")
local stagedata = dataStoreService:GetDataStore("stage")
local regiondata = dataStoreService:GetDataStore("region")

game.Players.PlayerAdded:Connect(function(player)
	local character = player.CharacterAdded:wait()
	local hRoot = character:WaitForChild("HumanoidRootPart")
	-- leaderstats

	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
	
	local stage = Instance.new("IntValue")
	stage.Name = "Stage"
	stage.Parent = leaderstats

	local region = Instance.new("StringValue")
	region.Name = "Region"
	region.Parent = leaderstats
	-- loading
	local storedStageData
	local storedRegionData
	local success, failed = pcall(function()
		storedStageData = stagedata:GetAsync(player.UserId..("-Stage"))
		storedRegionData = regiondata:GetAsync(player.UserId..("-Region"))
	end)
	if success then
		stage.Value = storedStageData
	
		if storedRegionData == nil or storedRegionData == "" then
			region.Value = "Mountains"
			print(player.Name.. "'s Region not loaded.")
		else
			region.Value = storedRegionData
			print(player.Name.."'s Region loaded.")
		end
		
		if stage.Value == 0 or stage.Value == nil then
			print(player.Name.. "'s stage not loaded.")
			stage.Value = 1
			local part = game.Workspace.Checkpoints:FindFirstChild(stage.Value)
			wait()
			hRoot.CFrame = part.CFrame
		else
			print(player.Name.. "'s stage loaded.")
			local part = game.Workspace.Checkpoints:FindFirstChild(stage.Value)
			wait()
			hRoot.CFrame = part.CFrame
		end
		
	else 
		print(player.Name.. "'s data failed to load.")
		warn(failed)
		wait()
		hRoot.CFrame = game.Workspace.Checkpoints["1"].CFrame
	end	
	
	player.CharacterAdded:connect(function(ch)
		print("Character loaded!")
		local hRoot = ch:WaitForChild("HumanoidRootPart")
		local part = game.Workspace.Checkpoints:FindFirstChild(stage.Value)
		if hRoot and part then
			wait()
			print(player.Name.."'s parts found!")
			hRoot.CFrame = part.CFrame
		else
			print(player.Name.."'s Parts not found!")
			wait()
			hRoot.CFrame = game.Workspace.Checkpoints["1"].CFrame
		end
	end)
end)


game.Players.PlayerRemoving:Connect(function(player)
	-- Variables
	local leaderstats = player:WaitForChild("leaderstats")
	local stage = leaderstats:WaitForChild("Stage")
	local region = leaderstats:WaitForChild("Region")
	-- Saving
	local success, failed = pcall(function()
		stagedata:SetAsync(player.UserId..("-Stage"), stage.Value)
		regiondata:SetAsync(player.UserId..("-Region"), region.Value)
	end)
	-- if successed
	if success then
		print(player.Name.."'s Data saved successfully.")
	else
		print(player.Name.."'s Error, data not saved")
		warn(failed)
	end

end)