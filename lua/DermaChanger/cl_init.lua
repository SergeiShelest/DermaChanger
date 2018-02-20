
d = {}
t = {}

local components = file.Find("DermaChanger/components/*.lua", "lsv")

for _, component in pairs(components) do
	print("[DermaChanger] Include: "..component)
	include("DermaChanger/components/"..component)
end

include("DermaChanger/cl_gui.lua")

