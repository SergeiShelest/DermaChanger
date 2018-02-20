d["Button"], t["Button"] = {}, {}

t["Button"]["TITLE"] = "Button"

d["Button"]["Font"], t["Button"]["Font"] = "DermaDefaultBold", "Font"
d["Button"]["Color"], t["Button"]["Color"] = Color(255, 255, 255), "Font color"
d["Button"]["NotActive"], t["Button"]["NotActive"] = Color(227, 152, 57), "NotActive"
d["Button"]["Hovered"], t["Button"]["Hovered"] = Color(197, 122, 27), "Hovered"
d["Button"]["Active"], t["Button"]["Active"] = Color(187, 102, 17), "Active"
d["Button"]["Disabled"], t["Button"]["Disabled"] = Color(100, 100, 100), "Disabled"
d["Button"]["CornerRadius"], t["Button"]["CornerRadius"] = 5, "Corner Radius"

function SKIN:PaintButton( panel, w, h )

	panel:SetDrawBorder( false )

	if ( !panel.m_bBackground ) then return end

	if ( panel:GetFont() == "DermaDefault" or panel:GetFont() == d["Button"]["Font"] ) then
		panel:SetFont( d["Button"]["Font"] )
	end

	if ( panel.m_colText == Color(255, 255, 255, 255) ) then
		panel.m_colText = d["Button"]["Color"]
	end

	if ( panel.Depressed || panel:IsSelected() || panel:GetToggle() ) then
		draw.RoundedBox(d["Button"]["CornerRadius"], 0, 0, w, h, d["Button"]["Active"])
	elseif ( panel:GetDisabled() ) then
		draw.RoundedBox(d["Button"]["CornerRadius"], 0, 0, w, h, d["Button"]["Disabled"])
	elseif ( panel.Hovered ) then
		draw.RoundedBox(d["Button"]["CornerRadius"], 0, 0, w, h, d["Button"]["Hovered"])
	else
		draw.RoundedBox(d["Button"]["CornerRadius"], 0, 0, w, h, d["Button"]["NotActive"])
	end

end


