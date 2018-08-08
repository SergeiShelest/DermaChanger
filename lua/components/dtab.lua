DC_d["Tab"], DC_t["Tab"] = {}, {}

DC_t["Tab"]["TITLE"] = "Tab"

DC_d["Tab"]["NotActive"], DC_t["Tab"]["NotActive"] = Color(50, 50, 50), "Not active"
DC_d["Tab"]["Hovered"], DC_t["Tab"]["Hovered"] = Color(217, 142, 47), "Hovered"
DC_d["Tab"]["Select"], DC_t["Tab"]["Select"] = Color(207, 132, 37), "Select"
DC_d["Tab"]["CornerRadius"], DC_t["Tab"]["CornerRadius"] = 0, "Corner radius"
DC_d["Tab"]["ActiveTextColor"], DC_t["Tab"]["ActiveTextColor"] = Color(255, 255, 255), "Active text color"
DC_d["Tab"]["HoveredTextColor"], DC_t["Tab"]["HoveredTextColor"] = Color(255, 255, 255), "Hovered text color"
DC_d["Tab"]["TextColor"], DC_t["Tab"]["TextColor"] = Color(218, 218, 218), "Text color"
DC_d["Tab"]["Font"], DC_t["Tab"]["Font"] = "DermaDefaultBold", "Font"

function SKIN:PaintTab( panel, w, h )

	if not panel.m_bBackground then return end

	panel:SetFont(DC_d["Tab"]["Font"])

	if panel:GetPropertySheet():GetActiveTab() == panel then

		draw.RoundedBox(DC_d["Tab"]["CornerRadius"], 0, 0, w, h -8, DC_d["Tab"]["Select"])

		local triangle = {
			{ x = 0, y = h -8 },
			{ x = w, y = h -8 },
			{ x = w/2, y = h }
		}

		surface.SetDrawColor( DC_d["Tab"]["Select"].r, DC_d["Tab"]["Select"].g, DC_d["Tab"]["Select"].b )
		draw.NoTexture()
		surface.DrawPoly( triangle )

		panel.m_colText = DC_d["Tab"]["ActiveTextColor"]

	elseif panel.Hovered then

		draw.RoundedBox(DC_d["Tab"]["CornerRadius"], 0, 0, w, h, DC_d["Tab"]["Hovered"])
		
		panel.m_colText = DC_d["Tab"]["HoveredTextColor"]

	else

		draw.RoundedBox(DC_d["Tab"]["CornerRadius"], 0, 0, w, h, DC_d["Tab"]["NotActive"])

		panel.m_colText = DC_d["Tab"]["TextColor"]

	end
		
end