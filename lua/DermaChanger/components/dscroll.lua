d["Scroll"], t["Scroll"] = {}, {}

t["Scroll"]["TITLE"] = "Scroll"

d["Scroll"]["Background"], t["Scroll"]["Background"] = Color(80, 80, 80), "Background"
d["Scroll"]["CornerRadius"], t["Scroll"]["CornerRadius"] = 3, "Corner radius"
d["Scroll"]["NotActive"], t["Scroll"]["NotActive"] = Color(227, 152, 57), "NotActive"
d["Scroll"]["Hovered"], t["Scroll"]["Hovered"] = Color(197, 122, 27), "Hovered"
d["Scroll"]["Active"], t["Scroll"]["Active"] = Color(187, 102, 17), "Active"
d["Scroll"]["Disabled"], t["Scroll"]["Disabled"] = Color(100, 100, 100), "Disabled"
d["Scroll"]["ArrowSize"], t["Scroll"]["ArrowSize"] = 3, "ArrowSize"
d["Scroll"]["ArrowColor"], t["Scroll"]["ArrowColor"] = Color(255, 255, 255), "Arrow color"

function SKIN:PaintVScrollBar( panel, w, h )

	draw.RoundedBox(d["Scroll"]["CornerRadius"], 0, 0, w, h, d["Scroll"]["Background"])

end

local grip = Color(0, 0, 0, 0)

function SKIN:PaintScrollBarGrip( panel, w, h )

	grip = d["Scroll"]["NotActive"]

	if panel:GetDisabled() then
		grip = d["Scroll"]["Disabled"]
	end
	
	if panel.Depressed then
		grip = d["Scroll"]["Active"]
	end

	if ( panel.Hovered ) then
		grip = d["Scroll"]["Hovered"]
	end
	
	draw.RoundedBox(d["Scroll"]["CornerRadius"], 0, 0, w, h, grip)

end

local up = Color(0, 0, 0, 0)

function SKIN:PaintButtonUp( panel, w, h )

	if not panel.m_bBackground then return end

	up = d["Scroll"]["NotActive"]

	if panel.Depressed or panel:IsSelected() then
		up = d["Scroll"]["Active"]
	end
	
	if panel:GetDisabled() then
		up = d["Scroll"]["Disabled"]
	end

	if panel.Hovered then
		up = d["Scroll"]["Hovered"]
	end

	draw.RoundedBox(d["Scroll"]["CornerRadius"], 0, 0, w, h, up)

	local triangle = {
		{ x = d["Scroll"]["ArrowSize"], y = h -d["Scroll"]["ArrowSize"] },
		{ x = w/2, y = d["Scroll"]["ArrowSize"] },
		{ x = w -d["Scroll"]["ArrowSize"], y = h -d["Scroll"]["ArrowSize"] }
	}

	surface.SetDrawColor(d["Scroll"]["ArrowColor"].r, d["Scroll"]["ArrowColor"].g, d["Scroll"]["ArrowColor"].b, d["Scroll"]["ArrowColor"].a)
	draw.NoTexture()
	surface.DrawPoly(triangle)

end

local down = Color(0, 0, 0, 0)

function SKIN:PaintButtonDown( panel, w, h )

	if not panel.m_bBackground then return end

	down = d["Scroll"]["NotActive"]

	if panel.Depressed or panel:IsSelected() then
		down = d["Scroll"]["Active"]
	end

	if panel:GetDisabled() then
		down = d["Scroll"]["Disabled"]
	end

	if panel.Hovered then
		down = d["Scroll"]["Hovered"]
	end

	draw.RoundedBox(d["Scroll"]["CornerRadius"], 0, 0, w, h, down)

	local triangle = {
		{ x = d["Scroll"]["ArrowSize"], y = d["Scroll"]["ArrowSize"] },
		{ x = w -d["Scroll"]["ArrowSize"], y = d["Scroll"]["ArrowSize"] },
		{ x = w/2, y = h -d["Scroll"]["ArrowSize"] }
	}

	surface.SetDrawColor( d["Scroll"]["ArrowColor"].r, d["Scroll"]["ArrowColor"].g, d["Scroll"]["ArrowColor"].b, d["Scroll"]["ArrowColor"].a )
	draw.NoTexture()
	surface.DrawPoly(triangle)

end

local left = Color(0, 0, 0, 0)

function SKIN:PaintButtonLeft( panel, w, h )

	if not panel.m_bBackground then return end

	left = d["Scroll"]["NotActive"]

	if panel.Depressed or panel:IsSelected() then
		left = d["Scroll"]["Active"]
	end

	if panel:GetDisabled() then
		left = d["Scroll"]["Disabled"]
	end
	
	if panel.Hovered then
		left = d["Scroll"]["Hovered"]
	end

	draw.RoundedBox(d["Scroll"]["CornerRadius"], 0, 0, w, h, left)

	local triangle = {
		{ x = w -d["Scroll"]["ArrowSize"], y = d["Scroll"]["ArrowSize"] },
		{ x = w -d["Scroll"]["ArrowSize"], y = h -d["Scroll"]["ArrowSize"] },
		{ x = d["Scroll"]["ArrowSize"], y = h/2 }
	}

	surface.SetDrawColor( d["Scroll"]["ArrowColor"].r, d["Scroll"]["ArrowColor"].g, d["Scroll"]["ArrowColor"].b, d["Scroll"]["ArrowColor"].a )
	draw.NoTexture()
	surface.DrawPoly(triangle)

end

local right = Color(0, 0, 0, 0)

function SKIN:PaintButtonRight( panel, w, h )

	if not panel.m_bBackground then return end

	right = d["Scroll"]["NotActive"]

	if panel.Depressed or panel:IsSelected() then
		right = d["Scroll"]["Active"]
	end
	
	if panel:GetDisabled() then
		right = d["Scroll"]["Disabled"]
	end

	if panel.Hovered then
		right = d["Scroll"]["Hovered"]
	end

	draw.RoundedBox(d["Scroll"]["CornerRadius"], 0, 0, w, h, right)

	local triangle = {
		{ x = d["Scroll"]["ArrowSize"], y = d["Scroll"]["ArrowSize"] },
		{ x = w -d["Scroll"]["ArrowSize"], y = h/2 },
		{ x = d["Scroll"]["ArrowSize"], y = h -d["Scroll"]["ArrowSize"] }
	}

	surface.SetDrawColor( d["Scroll"]["ArrowColor"].r, d["Scroll"]["ArrowColor"].g, d["Scroll"]["ArrowColor"].b, d["Scroll"]["ArrowColor"].a )
	draw.NoTexture()
	surface.DrawPoly(triangle)

end