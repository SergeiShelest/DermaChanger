DC_d["Menu"], DC_t["Menu"] = {}, {}

DC_t["Menu"]["TITLE"] = "Menu"

DC_d["Menu"]["Background"], DC_t["Menu"]["Background"] = Color(80, 80, 80), "Background"
DC_d["Menu"]["Hover"], DC_t["Menu"]["Hover"] = Color(227, 152, 57), "Background"
DC_d["Menu"]["Checked"], DC_t["Menu"]["Checked"] = Color(255, 255, 255), "Checked"
DC_d["Menu"]["Spacer"], DC_t["Menu"]["Spacer"] = Color(50, 50, 50), "Spacer"
DC_d["Menu"]["Line"], DC_t["Menu"]["Line"] = Color(50, 50, 50), "Line"
DC_d["Menu"]["Color"], DC_t["Menu"]["Color"] = Color(255, 255, 255), "Color"
DC_d["Menu"]["ArrowColor"], DC_t["Menu"]["ArrowColor"] = Color(255, 255, 255), "Arrow color"

function SKIN:PaintMenu( panel, w, h )
	draw.RoundedBox(0, 0, 0, w, h, DC_d["Menu"]["Background"])
end

function SKIN:PaintMenuSpacer( panel, w, h )
	surface.SetDrawColor( DC_d["Menu"]["Spacer"] )
	surface.DrawRect( 0, 0, w, h )
end

function SKIN:PaintMenuOption( panel, w, h )

	panel.m_colText = DC_d["Menu"]["Color"]

	draw.RoundedBox(0, 0, 0, h, h, DC_d["Menu"]["Line"] )

	if panel.m_bBackground and (panel.Hovered or panel.Highlight) then
		draw.RoundedBox(0, 0, 0, w, h, DC_d["Menu"]["Hover"] )
	end

	if ( panel:GetChecked() ) then

		local triangle = {
			{ x = h/2, y = 5 },
			{ x = h-5, y = h/2 },
			{ x = h/2, y = h-5 },
			{ x = 5, y = h/2 },
		}

		surface.SetDrawColor( DC_d["Menu"]["Checked"].r, DC_d["Menu"]["Checked"].g, DC_d["Menu"]["Checked"].b, DC_d["Menu"]["Checked"].a )
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

	surface.SetDrawColor( DC_d["Menu"]["ArrowColor"].r, DC_d["Menu"]["ArrowColor"].g, DC_d["Menu"]["ArrowColor"].b, DC_d["Menu"]["ArrowColor"].a )
	draw.NoTexture()
	surface.DrawPoly(triangle)
end
