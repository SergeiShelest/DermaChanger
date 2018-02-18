if CLIENT then
	
	local init = false

	local function Initialize()
		if SKIN ~= nil and not init then
			include("dr/cl_init.lua")
			init = true
		end
	end

	local function PieceOfShit()
		timer.Create("Kostil", 5, 0, Initialize)	
	end

	hook.Add("Initialize", "PieceOfShit", PieceOfShit)
	
end
