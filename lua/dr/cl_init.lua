
d = {}
t = {}

local components = file.Find("dr/components/*.lua", "lsv")

for _, component in pairs(components) do
	print("Include: "..component)
	include("dr/components/"..component)
end

include("dr/cl_gui.lua")

