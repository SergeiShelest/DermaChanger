d["Frame"] = {}
t["Frame"] = {}

t["Frame"]["TITLE"] = "Frame"

d["Frame"]["BackgroundLine"] = Color(60, 60, 60)
d["Frame"]["Background"] = Color(70, 70, 70)
d["Frame"]["TitleColor"] = Color(255, 255, 255)
d["Frame"]["CornerRadius"] = 0

t["Frame"]["BackgroundLine"] = "Background line"
t["Frame"]["Background"] = "Background"
t["Frame"]["TitleColor"] = "Title color"
t["Frame"]["CornerRadius"] = "CornerRadius"

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