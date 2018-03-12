d["NumSlider"], t["NumSlider"] = {}, {}

t["NumSlider"]["TITLE"] = "NumSlider"

d["NumSlider"]["Line"], t["NumSlider"]["Line"] = Color(255, 255, 255), "Line"
d["NumSlider"]["NotActive"], t["NumSlider"]["NotActive"] = Color(227, 152, 57), "NotActive"
d["NumSlider"]["Hovered"], t["NumSlider"]["Hovered"] = Color(197, 122, 27), "Hovered"
d["NumSlider"]["Active"], t["NumSlider"]["Active"] = Color(187, 102, 17), "Active"
d["NumSlider"]["Disabled"], t["NumSlider"]["Disabled"] = Color(100, 100, 100), "Disabled"

local function PaintNotches( x, y, w, h, num )

	if !num then return end

	local space = w / num

	for i = 0, num do
		surface.DrawRect( x + i * space, y + 4, 1, 5 )
	end

end

function SKIN:PaintNumSlider( panel, w, h )

	surface.SetDrawColor(d["NumSlider"]["Line"])
	surface.DrawRect(8, h / 2 - 1, w - 15, 1)

	PaintNotches(8, h / 2 - 1, w - 16, 1, panel.m_iNotches)

end

local Col = nil
local triangle = {}

function SKIN:PaintSliderKnob( panel, w, h )

	triangle = {
		{ x = 3, y = 0 },
		{ x = w-3, y = 0 },
		{ x = w-3, y = 5 },
		{ x = w/2, y = 15 },
		{ x = 3, y = 5 },

	}

	Col = d["NumSlider"]["NotActive"]

	if panel:GetDisabled() then	
		Col = d["NumSlider"]["Disabled"]
	end

	if panel.Depressed then
		Col = d["NumSlider"]["Active"]
	end

	if panel.Hovered then
		Col = d["NumSlider"]["Hovered"]
	end

	surface.SetDrawColor(Col.r, Col.g, Col.b, Col.a)
	draw.NoTexture()
	surface.DrawPoly( triangle )

end