
game.ReplicatedStorage.RemoteFunction.OnServerInvoke = function(player, val)
	local stage = player:WaitForChild("leaderstats"):WaitForChild("Stage")
	if val and stage then
		print("Admin: Stage request transferred ("..val..")")
		stage.Value = val
		print("Admin: Recieved request ("..stage.Value..")")
		print("Admin: Ended request.")
		local humanoid = player.Character.Humanoid
		local hRoot = humanoid.Parent.HumanoidRootPart
		hRoot.CFrame = game.Workspace.Checkpoints:FindFirstChild(stage.Value).CFrame
	end
end
