DC_d["Frame"], DC_t["Frame"] = {}, {}

DC_t["Frame"]["TITLE"] = "Frame"

DC_d["Frame"]["BackgroundLine"], DC_t["Frame"]["BackgroundLine"] = Color(60, 60, 60), "Line"
DC_d["Frame"]["Background"], DC_t["Frame"]["Background"] = Color(70, 70, 70), "Background"
DC_d["Frame"]["TitleColor"], DC_t["Frame"]["TitleColor"] = Color(255, 255, 255), "TitleColor"
DC_d["Frame"]["CornerRadius"], DC_t["Frame"]["CornerRadius"] = 0, "CornerRadius"

surface.CreateFont("Title", {
	font = "CloseCaption_Normal",
	size = 16,
	weight = 700,
	antialias = true,
	additive = false,
})

function SKIN:PaintFrame(panel, w, h)
	
	draw.RoundedBox(DC_d["Frame"]["CornerRadius"], 0, 0, w, h, DC_d["Frame"]["Background"])
	draw.RoundedBoxEx(DC_d["Frame"]["CornerRadius"], 0, 0, w, 25, DC_d["Frame"]["BackgroundLine"], true, true)

	if IsValid(panel.lblTitle) then
		
		panel.lblTitle:SetColor(Color(0, 0, 0, 0))

		draw.Text( {
			text = panel.lblTitle:GetText(),
			font = "Title",
			xalign = TEXT_ALIGN_LEFT,
			yalign = TEXT_ALIGN_CENTER,
			color = DC_d["Frame"]["TitleColor"],
			pos = {10, 25/2}
		} )

	end

end