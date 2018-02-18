d["Tab"] = {}
t["Tab"] = {}

t["Tab"]["TITLE"] = "Tab"

d["Tab"]["NotActive"] = Color(50, 50, 50)
d["Tab"]["Hovered"] = Color(217, 142, 47)
d["Tab"]["Select"] = Color(207, 132, 37)
d["Tab"]["CornerRadius"] = 0
d["Tab"]["ActiveTabText"] = Color(255, 255, 255)
d["Tab"]["HoveredTabText"] = Color(255, 255, 255)
d["Tab"]["TabText"] = Color(218, 218, 218)

t["Tab"]["NotActive"] = "Not active"
t["Tab"]["Hovered"] = "Hovered"
t["Tab"]["Select"] = "Select"
t["Tab"]["CornerRadius"] = "Corner radius"
t["Tab"]["ActiveTabText"] = "Active tab text"
t["Tab"]["HoveredTabText"] = "Hovered tab text"
t["Tab"]["TabText"] = "Tab text"

surface.CreateFont("Tab", {
	font = "CloseCaption_Normal",
	size = 12,
	weight = 700,
	antialias = true,
	additive = false,
})

function SKIN:PaintTab( panel, w, h )

	if ( !panel.m_bBackground ) then return end

	panel:SetColor(Color(0, 0, 0, 0))

	if ( panel:GetPropertySheet():GetActiveTab() == panel ) then

		draw.RoundedBox(d["Tab"]["CornerRadius"], 0, 0, w, h -8, d["Tab"]["Select"])

		local triangle = {
			{ x = 0, y = h -8 },
			{ x = w, y = h -8 },
			{ x = w/2, y = h }
		}

		surface.SetDrawColor( d["Tab"]["Select"].r, d["Tab"]["Select"].g, d["Tab"]["Select"].b )
		draw.NoTexture()
		surface.DrawPoly( triangle )

		draw.Text( {
			text = panel:GetText(),
			font = "Tab",
			xalign = TEXT_ALIGN_CENTER,
			yalign = TEXT_ALIGN_CENTER,
			color = d["Tab"]["ActiveTabText"],
			pos = {w/2 +8, 10}
		} )

	elseif ( panel.Hovered ) then

		draw.RoundedBox(d["Tab"]["CornerRadius"], 0, 0, w, h, d["Tab"]["Hovered"])
		
		draw.Text( {
			text = panel:GetText(),
			font = "Tab",
			xalign = TEXT_ALIGN_CENTER,
			yalign = TEXT_ALIGN_CENTER,
			color = d["Tab"]["HoveredTabText"],
			pos = {w/2 +8, 10}
		} )

	else

		draw.RoundedBox(d["Tab"]["CornerRadius"], 0, 0, w, h, d["Tab"]["NotActive"])

		draw.Text( {
			text = panel:GetText(),
			font = "Tab",
			xalign = TEXT_ALIGN_CENTER,
			yalign = TEXT_ALIGN_CENTER,
			color = d["Tab"]["TabText"],
			pos = {w/2 +8, h/2}
		} )

	end
		
end