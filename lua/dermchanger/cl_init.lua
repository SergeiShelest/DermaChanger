DC_d = {}
DC_t = {}

local components = file.Find("components/*", "LUA")

for _, component in pairs(components) do
	print("[DermaChanger] Include: "..component)
	include("components/"..component)
end

function DCLoadTheme(table1, table2)
	for k, v in pairs(table1) do
		for k2, v2 in pairs(table2) do
			if k == k2 then
				if TypeID(v2) ~= TYPE_TABLE then
					table1[k] = v2
				else
					DCLoadTheme(table1[k], v2)
				end
			end
		end
	end
end

if not file.Exists("data/dermachanger/al.txt", "GAME") then
	print("[DermaChanger] Creating an autorun file")
	print("[DermaChanger] Creating data/dermachanger/al.txt")
	
	file.CreateDir("dermachanger")
	file.Write("dermachanger/al.txt", "{}")
end

local f = file.Read("data/dermachanger/al.txt", "GAME")
DCLoadTheme(DC_d, util.JSONToTable(f))

include("dermchanger/cl_gui.lua")

