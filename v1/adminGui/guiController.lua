-- a handler placed inside the admin gui in StarterGui

local frame = script.Parent
local close = frame.close
local button = frame.TextButton
local text = frame.TextBox
local player = game.Players.LocalPlayer
local stage = player:WaitForChild("leaderstats"):WaitForChild("Stage")
local panel = frame.Parent.AdminPanel
local open = panel.TextButton


panel.Visible = true

open.MouseButton1Down:Connect(function()
	frame.Visible = true		panel.Visible = false
		
		
	-- Functions
	button.MouseButton1Down:Connect(function()
		print("Admin: Pressed")
	
		game.ReplicatedStorage.RemoteFunction:InvokeServer(text.Text)
	end)
	close.MouseButton1Down:Connect(function()
		frame.Visible = false
		panel.Visible = true
	end)
end)
