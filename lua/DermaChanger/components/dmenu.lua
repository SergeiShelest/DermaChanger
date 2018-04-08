d["Menu"], t["Menu"] = {}, {}

t["Menu"]["TITLE"] = "Menu"

d["Menu"]["Background"], t["Menu"]["Background"] = Color(80, 80, 80), "Background"
d["Menu"]["Hover"], t["Menu"]["Hover"] = Color(227, 152, 57), "Background"
d["Menu"]["Checked"], t["Menu"]["Checked"] = Color(255, 255, 255), "Checked"
d["Menu"]["Spacer"], t["Menu"]["Spacer"] = Color(50, 50, 50), "Spacer"
d["Menu"]["Line"], t["Menu"]["Line"] = Color(50, 50, 50), "Line"
d["Menu"]["Color"], t["Menu"]["Color"] = Color(255, 255, 255), "Color"
d["Menu"]["ArrowColor"], t["Menu"]["ArrowColor"] = Color(255, 255, 255), "Arrow color"

function SKIN:PaintMenu( panel, w, h )
	draw.RoundedBox(0, 0, 0, w, h, d["Menu"]["Background"])
end

function SKIN:PaintMenuSpacer( panel, w, h )
	surface.SetDrawColor( d["Menu"]["Spacer"] )
	surface.DrawRect( 0, 0, w, h )
end

function SKIN:PaintMenuOption( panel, w, h )

	panel.m_colText = d["Menu"]["Color"]

	draw.RoundedBox(0, 0, 0, h, h, d["Menu"]["Line"] )

	if panel.m_bBackground and (panel.Hovered or panel.Highlight) then
		draw.RoundedBox(0, 0, 0, w, h, d["Menu"]["Hover"] )
	end

	if ( panel:GetChecked() ) then

		local triangle = {
			{ x = h/2, y = 5 },
			{ x = h-5, y = h/2 },
			{ x = h/2, y = h-5 },
			{ x = 5, y = h/2 },
		}

		surface.SetDrawColor( d["Menu"]["Checked"].r, d["Menu"]["Checked"].g, d["Menu"]["Checked"].b, d["Menu"]["Checked"].a )
		draw.NoTexture()
		surface.DrawPoly(triangle)
	end

end

function SKIN:PaintMenuRightArrow( panel, w, h )

	local triangle = {
		{ x = 5, y = 5 },
		{ x = w -5, y = h/2 },
		{ x = 5, y = h -5 }
	}

	surface.SetDrawColor( d["Menu"]["ArrowColor"].r, d["Menu"]["ArrowColor"].g, d["Menu"]["ArrowColor"].b, d["Menu"]["ArrowColor"].a )
	draw.NoTexture()
	surface.DrawPoly(triangle)
end
