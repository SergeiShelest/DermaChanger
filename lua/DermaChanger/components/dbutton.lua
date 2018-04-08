d["Button"], t["Button"] = {}, {}

t["Button"]["TITLE"] = "Button"

d["Button"]["Font"], t["Button"]["Font"] = "DermaDefaultBold", "Font"
d["Button"]["NotActive"], t["Button"]["NotActive"] = Color(227, 152, 57), "NotActive"
d["Button"]["Hovered"], t["Button"]["Hovered"] = Color(197, 122, 27), "Hovered"
d["Button"]["Active"], t["Button"]["Active"] = Color(187, 102, 17), "Active"
d["Button"]["Disabled"], t["Button"]["Disabled"] = Color(100, 100, 100), "Disabled"
d["Button"]["TextNotActive"], t["Button"]["TextNotActive"] = Color(255, 255, 255), "TextNotActive"
d["Button"]["TextHovered"], t["Button"]["TextHovered"] = Color(255, 255, 255), "TextHovered"
d["Button"]["TextActive"], t["Button"]["TextActive"] = Color(255, 255, 255), "TextActive"
d["Button"]["TextDisabled"], t["Button"]["TextDisabled"] = Color(255, 255, 255), "TextDisabled"
d["Button"]["BorderNotActive"], t["Button"]["BorderNotActive"] = Color(255, 255, 255), "BorderNotActive"
d["Button"]["BorderHovered"], t["Button"]["BorderHovered"] = Color(255, 255, 255), "BorderHovered"
d["Button"]["BorderActive"], t["Button"]["BorderActive"] = Color(255, 255, 255), "BorderActive"
d["Button"]["BorderDisabled"], t["Button"]["BorderDisabled"] = Color(255, 255, 255), "BorderDisabled"
d["Button"]["BorderSize"], t["Button"]["BorderSize"] = 0, "BorderSize"
d["Button"]["CornerRadius"], t["Button"]["CornerRadius"] = 5, "Corner Radius"

local TextCol = Color(0, 0, 0, 0)
local Col = Color(0, 0, 0, 0)
local ColBorder = Color(0, 0, 0, 0)

function SKIN:PaintButton( panel, w, h )

	if not panel.m_bBackground then return end

	panel:SetDrawBorder( false )

	if panel:GetFont() == "DermaDefault" or panel:GetFont() == d["Button"]["Font"] then
		panel:SetFont( d["Button"]["Font"] )
	end

	Col = d["Button"]["NotActive"]
	ColBorder = d["Button"]["BorderNotActive"]
	TextCol = d["Button"]["TextNotActive"]

	if panel:GetDisabled() then
		Col = d["Button"]["Disabled"]
		ColBorder = d["Button"]["BorderDisabled"]
		TextCol = d["Button"]["TextDisabled"]
	end

	if panel.Hovered then
		Col = d["Button"]["Hovered"]
		ColBorder = d["Button"]["BorderHovered"]
		TextCol = d["Button"]["TextHovered"]
	end

	if panel.Depressed or panel:IsSelected() or panel:GetToggle() then
		Col = d["Button"]["Active"]
		ColBorder = d["Button"]["BorderActive"]
		TextCol = d["Button"]["TextActive"]
	end

	if d["Button"]["BorderSize"] ~= 0 then
		draw.RoundedBox(d["Button"]["CornerRadius"], 0, 0, w, h, ColBorder)
	end

	draw.RoundedBox(d["Button"]["CornerRadius"], d["Button"]["BorderSize"], d["Button"]["BorderSize"], w -d["Button"]["BorderSize"] *2, h -d["Button"]["BorderSize"] *2, Col)

	panel.m_colText = TextCol

end


