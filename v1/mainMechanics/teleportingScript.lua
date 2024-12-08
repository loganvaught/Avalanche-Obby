-- inside the portal of stage 2 to move to stage 3
local ptt = game.Workspace.Checkpoints["3"] -- part to teleport
script.Parent.Touched:Connect(function(hit)
	local human = hit.Parent:FindFirstChild("Humanoid")
	local character = hit.Parent
	local player = game.Players:GetPlayerFromCharacter(character)
	local leaderstats = player:FindFirstChild("leaderstats")
	local stage = leaderstats:FindFirstChild("Stage")
	if stage.Value == 2 or stage.Value == 3 then -- stage checking
		stage.Value = 3                          -- new stage
		human.Parent.HumanoidRootPart.CFrame = ptt.CFrame
	else
		human.Health = 0
	end
end)