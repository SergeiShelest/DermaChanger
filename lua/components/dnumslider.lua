DC_d.NumSlider, DC_t.NumSlider = {}, {}

DC_t.NumSlider.TITLE = "NumSlider"

DC_d.NumSlider.Line, DC_t.NumSlider.Line = Color(255, 255, 255), "Line"
DC_d.NumSlider.NotActive, DC_t.NumSlider.NotActive = Color(227, 152, 57), "NotActive"
DC_d.NumSlider.Hovered, DC_t.NumSlider.Hovered = Color(197, 122, 27), "Hovered"
DC_d.NumSlider.Active, DC_t.NumSlider.Active = Color(187, 102, 17), "Active"
DC_d.NumSlider.Disabled, DC_t.NumSlider.Disabled = Color(100, 100, 100), "Disabled"

local draw = draw
local surface = surface

local function PaintNotches( x, y, w, h, num )
	if not num then return end

	local space = w / num

	for i = 0, num do
		surface.DrawRect( x + i * space, y + 4, 1, 5 )
	end
end

function SKIN:PaintNumSlider( panel, w, h )
	surface.SetDrawColor(DC_d.NumSlider.Line)
	surface.DrawRect(8, h / 2 - 1, w - 15, 1)

	PaintNotches(8, h / 2 - 1, w - 16, 1, panel.m_iNotches)
end

local Col = Color(0, 0, 0, 0)
local triangle = {}

function SKIN:PaintSliderKnob( panel, w, h )
	triangle = {
		{ x = 3, y = 0 },
		{ x = w-3, y = 0 },
		{ x = w-3, y = 5 },
		{ x = w/2, y = 15 },
		{ x = 3, y = 5 },

	}

	Col = DC_d.NumSlider.NotActive

	if panel:GetDisabled() then	
		Col = DC_d.NumSlider.Disabled
	end

	if panel.Depressed then
		Col = DC_d.NumSlider.Active
	end

	if panel.Hovered then
		Col = DC_d.NumSlider.Hovered
	end

	surface.SetDrawColor(Col.r, Col.g, Col.b, Col.a)
	draw.NoTexture()
	surface.DrawPoly( triangle )
end