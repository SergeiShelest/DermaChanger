d["Frame"], t["Frame"] = {}, {}

t["Frame"]["TITLE"] = "Frame"

d["Frame"]["BackgroundLine"], t["Frame"]["BackgroundLine"] = Color(60, 60, 60), "Line"
d["Frame"]["Background"], t["Frame"]["Background"] = Color(70, 70, 70), "Background"
d["Frame"]["TitleColor"], t["Frame"]["TitleColor"] = Color(255, 255, 255), "TitleColor"
d["Frame"]["CornerRadius"], t["Frame"]["CornerRadius"] = 0, "CornerRadius"

surface.CreateFont("Title", {
	font = "CloseCaption_Normal",
	size = 16,
	weight = 700,
	antialias = true,
	additive = false,
})

function SKIN:PaintFrame(panel, w, h)
	
	draw.RoundedBox(d["Frame"]["CornerRadius"], 0, 0, w, h, d["Frame"]["Background"])
	draw.RoundedBoxEx(d["Frame"]["CornerRadius"], 0, 0, w, 25, d["Frame"]["BackgroundLine"], true, true)

	if IsValid(panel.lblTitle) then
		
		panel.lblTitle:SetColor(Color(0, 0, 0, 0))

		draw.Text( {
			text = panel.lblTitle:GetText(),
			font = "Title",
			xalign = TEXT_ALIGN_LEFT,
			yalign = TEXT_ALIGN_CENTER,
			color = d["Frame"]["TitleColor"],
			pos = {10, 25/2}
		} )

	end

end