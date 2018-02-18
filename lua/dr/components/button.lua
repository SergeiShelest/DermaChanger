d["Button"] = {}
t["Button"] = {}

t["Button"]["TITLE"] = "Button"

d["Button"]["NotActive"] = Color(227, 152, 57)
d["Button"]["Hovered"] = Color(197, 122, 27)
d["Button"]["Active"] = Color(187, 102, 17)
d["Button"]["Disabled"] = Color(100, 100, 100)
d["Button"]["TitleColor"] = Color(255, 255, 255)
d["Button"]["CornerRadius"] = 5

t["Button"]["NotActive"] = "NotActive"
t["Button"]["Hovered"] = "Hovered"
t["Button"]["Active"] = "Active"
t["Button"]["Disabled"] = "Disabled"
t["Button"]["TitleColor"] = "Title color"
t["Button"]["CornerRadius"] = "Corner Radius"

surface.CreateFont("Button", {
	font = "CloseCaption_Normal",
	size = 13,
	weight = 700,
	antialias = true,
	additive = false,
})

function SKIN:PaintButton( panel, w, h )

	if ( !panel.m_bBackground ) then return end

	if ( panel.Depressed || panel:IsSelected() || panel:GetToggle() ) then
		draw.RoundedBox(d["Button"]["CornerRadius"], 0, 0, w, h, d["Button"]["Active"])
	elseif ( panel:GetDisabled() ) then
		draw.RoundedBox(d["Button"]["CornerRadius"], 0, 0, w, h, d["Button"]["Disabled"])
	elseif ( panel.Hovered ) then
		draw.RoundedBox(d["Button"]["CornerRadius"], 0, 0, w, h, d["Button"]["Hovered"])
	else
		draw.RoundedBox(d["Button"]["CornerRadius"], 0, 0, w, h, d["Button"]["NotActive"])
	end
	
	if panel ~= "" and panel:GetFont() ~= "Marlett" then
		
		panel:SetColor(Color(0, 0, 0, 0))

		draw.Text( {
			text = panel:GetText(),
			font = "Button",
			xalign = TEXT_ALIGN_CENTER,
			yalign = TEXT_ALIGN_CENTER,
			color = d["Button"]["TitleColor"],
			pos = {w/2, h/2}
		} )

	end

end