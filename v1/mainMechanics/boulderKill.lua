-- placed inside each boulder
local boulder = script.Parent


boulder.Touched:Connect(function(hit)
	local h = hit.Parent:FindFirstChild("Humanoid")
	if h ~= nil then
		h.Health = 0
	end
end)