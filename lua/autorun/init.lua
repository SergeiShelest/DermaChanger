if SERVER then
	AddCSLuaFile()
	AddCSLuaFile("dermchanger/cl_init.lua")
	AddCSLuaFile("dermchanger/cl_gui.lua")

	local components = file.Find("components/*", "LUA")

	for _, component in pairs(components) do
		AddCSLuaFile("components/"..component)
	end

end

if CLIENT then
	timer.Simple( 0 , function() include("dermchanger/cl_init.lua") end )

	list.Set(
		"DesktopWindows",
		"dceditor",
		{
			title = "DermaChanger",
			icon = "icon64/dermachanger.png",
			onewindow = true,
			init = function(icn, pnl)
				pnl:Remove()
				RunConsoleCommand("dceditor")
			end
		}
	)
end
