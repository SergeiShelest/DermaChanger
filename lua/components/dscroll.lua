DC_d.Scroll, DC_t.Scroll = {}, {}

DC_t.Scroll.TITLE = "Scroll"

DC_d.Scroll.Background, DC_t.Scroll.Background = Color(80, 80, 80), "Background"
DC_d.Scroll.CornerRadius, DC_t.Scroll.CornerRadius = 3, "Corner radius"
DC_d.Scroll.NotActive, DC_t.Scroll.NotActive = Color(227, 152, 57), "NotActive"
DC_d.Scroll.Hovered, DC_t.Scroll.Hovered = Color(197, 122, 27), "Hovered"
DC_d.Scroll.Active, DC_t.Scroll.Active = Color(187, 102, 17), "Active"
DC_d.Scroll.Disabled, DC_t.Scroll.Disabled = Color(100, 100, 100), "Disabled"
DC_d.Scroll.ArrowSize, DC_t.Scroll.ArrowSize = 3, "ArrowSize"
DC_d.Scroll.ArrowColor, DC_t.Scroll.ArrowColor = Color(255, 255, 255), "Arrow color"

local draw = draw
local surface = surface

function SKIN:PaintVScrollBar( panel, w, h )
	draw.RoundedBox(DC_d.Scroll.CornerRadius, 0, 0, w, h, DC_d.Scroll.Background)
end

local grip = Color(0, 0, 0, 0)

function SKIN:PaintScrollBarGrip( panel, w, h )
	grip = DC_d.Scroll.NotActive

	if panel:GetDisabled() then
		grip = DC_d.Scroll.Disabled
	end
	
	if panel.Depressed then
		grip = DC_d.Scroll.Active
	end

	if ( panel.Hovered ) then
		grip = DC_d.Scroll.Hovered
	end
	
	draw.RoundedBox(DC_d.Scroll.CornerRadius, 0, 0, w, h, grip)
end

local up = Color(0, 0, 0, 0)

function SKIN:PaintButtonUp( panel, w, h )
	if not panel.m_bBackground then return end

	up = DC_d.Scroll.NotActive

	if panel.Depressed or panel:IsSelected() then
		up = DC_d.Scroll.Active
	end
	
	if panel:GetDisabled() then
		up = DC_d.Scroll.Disabled
	end

	if panel.Hovered then
		up = DC_d.Scroll.Hovered
	end

	draw.RoundedBox(DC_d.Scroll.CornerRadius, 0, 0, w, h, up)

	local triangle = {
		{ x = DC_d.Scroll.ArrowSize, y = h -DC_d.Scroll.ArrowSize },
		{ x = w/2, y = DC_d.Scroll.ArrowSize },
		{ x = w -DC_d.Scroll.ArrowSize, y = h -DC_d.Scroll.ArrowSize }
	}

	surface.SetDrawColor(DC_d.Scroll.ArrowColor.r, DC_d.Scroll.ArrowColor.g, DC_d.Scroll.ArrowColor.b, DC_d.Scroll.ArrowColor.a)
	draw.NoTexture()
	surface.DrawPoly(triangle)
end

local down = Color(0, 0, 0, 0)

function SKIN:PaintButtonDown( panel, w, h )
	if not panel.m_bBackground then return end

	down = DC_d.Scroll.NotActive

	if panel.Depressed or panel:IsSelected() then
		down = DC_d.Scroll.Active
	end

	if panel:GetDisabled() then
		down = DC_d.Scroll.Disabled
	end

	if panel.Hovered then
		down = DC_d.Scroll.Hovered
	end

	draw.RoundedBox(DC_d.Scroll.CornerRadius, 0, 0, w, h, down)

	local triangle = {
		{ x = DC_d.Scroll.ArrowSize, y = DC_d.Scroll.ArrowSize },
		{ x = w -DC_d.Scroll.ArrowSize, y = DC_d.Scroll.ArrowSize },
		{ x = w/2, y = h -DC_d.Scroll.ArrowSize }
	}

	surface.SetDrawColor( DC_d.Scroll.ArrowColor.r, DC_d.Scroll.ArrowColor.g, DC_d.Scroll.ArrowColor.b, DC_d.Scroll.ArrowColor.a )
	draw.NoTexture()
	surface.DrawPoly(triangle)
end

local left = Color(0, 0, 0, 0)

function SKIN:PaintButtonLeft( panel, w, h )
	if not panel.m_bBackground then return end

	left = DC_d.Scroll.NotActive

	if panel.Depressed or panel:IsSelected() then
		left = DC_d.Scroll.Active
	end

	if panel:GetDisabled() then
		left = DC_d.Scroll.Disabled
	end
	
	if panel.Hovered then
		left = DC_d.Scroll.Hovered
	end

	draw.RoundedBox(DC_d.Scroll.CornerRadius, 0, 0, w, h, left)

	local triangle = {
		{ x = w -DC_d.Scroll.ArrowSize, y = DC_d.Scroll.ArrowSize },
		{ x = w -DC_d.Scroll.ArrowSize, y = h -DC_d.Scroll.ArrowSize },
		{ x = DC_d.Scroll.ArrowSize, y = h / 2 }
	}

	surface.SetDrawColor( DC_d.Scroll.ArrowColor.r, DC_d.Scroll.ArrowColor.g, DC_d.Scroll.ArrowColor.b, DC_d.Scroll.ArrowColor.a )
	draw.NoTexture()
	surface.DrawPoly(triangle)

end

local right = Color(0, 0, 0, 0)

function SKIN:PaintButtonRight( panel, w, h )
	if not panel.m_bBackground then return end

	right = DC_d.Scroll.NotActive

	if panel.Depressed or panel:IsSelected() then
		right = DC_d.Scroll.Active
	end
	
	if panel:GetDisabled() then
		right = DC_d.Scroll.Disabled
	end

	if panel.Hovered then
		right = DC_d.Scroll.Hovered
	end

	draw.RoundedBox(DC_d.Scroll.CornerRadius, 0, 0, w, h, right)

	local triangle = {
		{ x = DC_d.Scroll.ArrowSize, y = DC_d.Scroll.ArrowSize },
		{ x = w -DC_d.Scroll.ArrowSize, y = h/2 },
		{ x = DC_d.Scroll.ArrowSize, y = h -DC_d.Scroll.ArrowSize }
	}

	surface.SetDrawColor( DC_d.Scroll.ArrowColor.r, DC_d.Scroll.ArrowColor.g, DC_d.Scroll.ArrowColor.b, DC_d.Scroll.ArrowColor.a )
	draw.NoTexture()
	surface.DrawPoly(triangle)
end