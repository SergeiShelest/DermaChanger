d["NumSlider"], t["NumSlider"] = {}, {}

t["NumSlider"]["TITLE"] = "NumSlider"

d["NumSlider"]["Line"], t["NumSlider"]["Line"] = Color(255, 255, 255), "Line"
d["NumSlider"]["NotActive"], t["NumSlider"]["NotActive"] = Color(227, 152, 57), "NotActive"
d["NumSlider"]["Hovered"], t["NumSlider"]["Hovered"] = Color(197, 122, 27), "Hovered"
d["NumSlider"]["Active"], t["NumSlider"]["Active"] = Color(187, 102, 17), "Active"
d["NumSlider"]["Disabled"], t["NumSlider"]["Disabled"] = Color(100, 100, 100), "Disabled"

local function PaintNotches( x, y, w, h, num )

	if ( !num ) then return end

	local space = w / num

	for i = 0, num do

		surface.DrawRect( x + i * space, y + 4, 1, 5 )

	end

end

function SKIN:PaintNumSlider( panel, w, h )

	surface.SetDrawColor( d["NumSlider"]["Line"] )
	surface.DrawRect( 8, h / 2 - 1, w - 15, 1 )

	PaintNotches( 8, h / 2 - 1, w - 16, 1, panel.m_iNotches )

end

function SKIN:PaintSliderKnob( panel, w, h )

	local triangle = {
		{ x = 3, y = 0 },
		{ x = w-3, y = 0 },
		{ x = w-3, y = 5 },
		{ x = w/2, y = 15 },
		{ x = 3, y = 5 },

	}

	surface.SetDrawColor(d["NumSlider"]["NotActive"].r, d["NumSlider"]["NotActive"].g, d["NumSlider"]["NotActive"].b, d["NumSlider"]["NotActive"].a)


	if ( panel:GetDisabled() ) then	
		surface.SetDrawColor(d["NumSlider"]["Disabled"].r, d["NumSlider"]["Disabled"].g, d["NumSlider"]["Disabled"].b, d["NumSlider"]["Disabled"].a)		
	end

	if ( panel.Depressed ) then
		surface.SetDrawColor(d["NumSlider"]["Active"].r, d["NumSlider"]["Active"].g, d["NumSlider"]["Active"].b, d["NumSlider"]["Active"].a)
	end

	if ( panel.Hovered ) then
		surface.SetDrawColor(d["NumSlider"]["Hovered"].r, d["NumSlider"]["Hovered"].g, d["NumSlider"]["Hovered"].b, d["NumSlider"]["Hovered"].a)
	end

	draw.NoTexture()
	surface.DrawPoly( triangle )

end