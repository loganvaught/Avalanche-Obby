local PhysicsService = game:GetService("PhysicsService")
PhysicsService:CreateCollisionGroup("Players")

PhysicsService:CollisionGroupSetCollidable("Players", "Players", false)

game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		repeat wait(1) until character:WaitForChild("Humanoid")
		
		for _, characterPart in pairs (character:GetChildren()) do
			if characterPart:IsA("BasePart") then
				PhysicsService:SetPartCollisionGroup(characterPart, "Players")
			end
		end
	end)	
end)