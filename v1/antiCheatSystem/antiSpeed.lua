-- placed inside starterPlayer.starterPlayerScripts
local PlayerDefaultSpeed = 16
local player = game.Players.LocalPlayer
-- Expanding walkspeed cap for players with the gamepass.
if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(player.UserId, 12011251) then
	PlayerDefaultSpeed = PlayerDefaultSpeed + 2
end
-- Kick system.
game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
	local humanoid = char:WaitForChild("Humanoid")
	humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
		if humanoid.WalkSpeed > PlayerDefaultSpeed then
			game.Players.LocalPlayer:Kick("Detected exploits")
		end
	end)
end)