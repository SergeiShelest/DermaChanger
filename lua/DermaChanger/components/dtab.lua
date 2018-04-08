d["Tab"], t["Tab"] = {}, {}

t["Tab"]["TITLE"] = "Tab"

d["Tab"]["NotActive"], t["Tab"]["NotActive"] = Color(50, 50, 50), "Not active"
d["Tab"]["Hovered"], t["Tab"]["Hovered"] = Color(217, 142, 47), "Hovered"
d["Tab"]["Select"], t["Tab"]["Select"] = Color(207, 132, 37), "Select"
d["Tab"]["CornerRadius"], t["Tab"]["CornerRadius"] = 0, "Corner radius"
d["Tab"]["ActiveTextColor"], t["Tab"]["ActiveTextColor"] = Color(255, 255, 255), "Active text color"
d["Tab"]["HoveredTextColor"], t["Tab"]["HoveredTextColor"] = Color(255, 255, 255), "Hovered text color"
d["Tab"]["TextColor"], t["Tab"]["TextColor"] = Color(218, 218, 218), "Text color"
d["Tab"]["Font"], t["Tab"]["Font"] = "DermaDefaultBold", "Font"

function SKIN:PaintTab( panel, w, h )

	if not panel.m_bBackground then return end

	panel:SetFont(d["Tab"]["Font"])

	if panel:GetPropertySheet():GetActiveTab() == panel then

		draw.RoundedBox(d["Tab"]["CornerRadius"], 0, 0, w, h -8, d["Tab"]["Select"])

		local triangle = {
			{ x = 0, y = h -8 },
			{ x = w, y = h -8 },
			{ x = w/2, y = h }
		}

		surface.SetDrawColor( d["Tab"]["Select"].r, d["Tab"]["Select"].g, d["Tab"]["Select"].b )
		draw.NoTexture()
		surface.DrawPoly( triangle )

		panel.m_colText = d["Tab"]["ActiveTextColor"]

	elseif panel.Hovered then

		draw.RoundedBox(d["Tab"]["CornerRadius"], 0, 0, w, h, d["Tab"]["Hovered"])
		
		panel.m_colText = d["Tab"]["HoveredTextColor"]

	else

		draw.RoundedBox(d["Tab"]["CornerRadius"], 0, 0, w, h, d["Tab"]["NotActive"])

		panel.m_colText = d["Tab"]["TextColor"]

	end
		
end