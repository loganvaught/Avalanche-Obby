-- used to listen for when a player's region changes
game.Players.PlayerAdded:Connect(function(plr)
	local ls  = plr:WaitForChild("leaderstats")
	local region = ls:WaitForChild("Region")
	local stage = ls:WaitForChild("Stage")
	
	stage:GetPropertyChangedSignal("Value"):Connect(function()
		
		if stage.Value == 1 or  stage.Value == 2  then
			region.Value =   "Mountains"
		elseif stage.Value == 3 or stage.Value == 4 then
			region.Value =  "Desert"
		elseif  stage.Value == 5 or  stage.Value ==   6 then
			region.Value = "Forest"
		end

	end)
end)