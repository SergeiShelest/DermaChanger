d["ComboBox"], t["ComboBox"] = {}, {}

t["ComboBox"]["TITLE"] = "ComboBox"

d["ComboBox"]["Background"], t["ComboBox"]["Background"] = Color(50, 50, 50), "Background"
d["ComboBox"]["Border"], t["ComboBox"]["Border"] = Color(227, 152, 57), "Border"
d["ComboBox"]["BackgroundFocus"], t["ComboBox"]["BackgroundFocus"] = Color(80, 80, 80), "BackgroundFocus"
d["ComboBox"]["BorderFocus"], t["ComboBox"]["BorderFocus"] = Color(197, 122, 27), "BorderFocus"
d["ComboBox"]["BackgroundHover"], t["ComboBox"]["BackgroundHover"] = Color(80, 80, 80), "BackgroundHover"
d["ComboBox"]["BorderHover"], t["ComboBox"]["BorderHover"] = Color(197, 122, 27), "BorderHover"
d["ComboBox"]["BackgroundDisabled"], t["ComboBox"]["BackgroundDisabled"] = Color(80, 80, 80), "BackgroundDisabled"
d["ComboBox"]["BorderDisabled"], t["ComboBox"]["BorderDisabled"] = Color(50, 50, 50), "BorderDisabled"
d["ComboBox"]["BorderSize"], t["ComboBox"]["BorderSize"] = 1, "BorderSize"
d["ComboBox"]["CornerRadius"], t["ComboBox"]["CornerRadius"] = 3, "CornerRadius"
d["ComboBox"]["ArrowSize"], t["ComboBox"]["ArrowSize"] = 3, "ArrowSize"
d["ComboBox"]["Arrow"], t["ComboBox"]["Arrow"] = Color(255, 255, 255), "Arrow"
d["ComboBox"]["ArrowDisabled"], t["ComboBox"]["ArrowDisabled"] = Color(50, 50, 50), "ArrowDisabled"
d["ComboBox"]["ArrowHover"], t["ComboBox"]["ArrowHover"] = Color(197, 122, 27), "ArrowHover"
d["ComboBox"]["ArrowFocus"], t["ComboBox"]["ArrowFocus"] = Color(197, 122, 27), "ArrowFocus"

local Col = Color(0, 0, 0, 0)
local ColBord = Color(0, 0, 0, 0)

function SKIN:PaintComboBox( panel, w, h )

	Col = d["ComboBox"]["Background"]
	ColBord = d["ComboBox"]["Border"]

	if panel:GetDisabled() then
		Col = d["ComboBox"]["Background"]
		ColBord = d["ComboBox"]["BorderDisabled"]
	end

	if panel.Depressed or panel:IsMenuOpen() then
		Col = d["ComboBox"]["BackgroundFocus"]
		ColBord = d["ComboBox"]["BorderFocus"]
	end
	
	if panel.Hovered then
		Col = d["ComboBox"]["BackgroundHover"]
		ColBord = d["ComboBox"]["BorderHover"]	
	end

	if d["ComboBox"]["BorderSize"] ~= 0 then
		draw.RoundedBox(d["ComboBox"]["CornerRadius"], 0, 0, w, h, ColBord)
	end
	
	draw.RoundedBox(d["ComboBox"]["CornerRadius"], d["ComboBox"]["BorderSize"], d["ComboBox"]["BorderSize"], w-d["ComboBox"]["BorderSize"]*2, h-d["ComboBox"]["BorderSize"]*2, Col)

end

local ArrowCol = nil
local triangle = {}

function SKIN:PaintComboDownArrow( panel, w, h )

	triangle = {
		{ x = d["ComboBox"]["ArrowSize"], y = d["ComboBox"]["ArrowSize"] +2 },
		{ x = w -d["ComboBox"]["ArrowSize"], y = d["ComboBox"]["ArrowSize"] +2 },
		{ x = w/2, y = h -d["ComboBox"]["ArrowSize"] -2 }
	}

	ArrowCol = d["ComboBox"]["Arrow"]

	if panel.ComboBox:GetDisabled() then
		ArrowCol = d["ComboBox"]["ArrowDisabled"]
	end

	if panel.ComboBox.Depressed or panel.ComboBox:IsMenuOpen() then
		ArrowCol = d["ComboBox"]["ArrowFocus"]
	end

	if panel.ComboBox.Hovered then
		ArrowCol = d["ComboBox"]["ArrowHover"]
	end

	surface.SetDrawColor(ArrowCol.r, ArrowCol.g, ArrowCol.b, ArrowCol.a)
	
	draw.NoTexture()
	surface.DrawPoly(triangle)

end