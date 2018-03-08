d["Menu"], t["Menu"] = {}, {}

t["Menu"]["TITLE"] = "Menu"

d["Menu"]["Background"], t["Menu"]["Background"] = Color(80, 80, 80), "Background"
d["Menu"]["Hover"], t["Menu"]["Hover"] = Color(227, 152, 57), "Background"
d["Menu"]["Checked"], t["Menu"]["Checked"] = Color(255, 255, 255), "Checked"
d["Menu"]["Spacer"], t["Menu"]["Spacer"] = Color(50, 50, 50), "Spacer"
d["Menu"]["Color"], t["Menu"]["Color"] = Color(255, 255, 255), "Color"

function SKIN:PaintMenu( panel, w, h )
	draw.RoundedBox(0, 0, 0, w, h, d["Menu"]["Background"])
end

function SKIN:PaintMenuSpacer( panel, w, h )
	surface.SetDrawColor( d["Menu"]["Spacer"] )
	surface.DrawRect( 0, 0, w, h )
end

function SKIN:PaintMenuOption( panel, w, h )

	panel.m_colText = d["Menu"]["Color"]

	if ( panel.m_bBackground && (panel.Hovered || panel.Highlight) ) then
		draw.RoundedBox(0, 0, 0, w, h, d["Menu"]["Hover"] )
	end

	if ( panel:GetChecked() ) then
		draw.RoundedBox(0, 5, 5, h-10, h-10, d["Menu"]["Checked"] )
	end

end