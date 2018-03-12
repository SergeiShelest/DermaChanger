d["ListView"], t["ListView"] = {}, {}

t["ListView"]["TITLE"] = "List view"

d["ListView"]["Background"], t["ListView"]["Background"] = Color(50, 50, 50), "Background"
d["ListView"]["CornerRadius"], t["ListView"]["CornerRadius"] = 0, "CornerRadius"
d["ListView"]["Hovered"], t["ListView"]["Hovered"] = Color(217, 142, 47), "Hovered"
d["ListView"]["Select"], t["ListView"]["Select"] = Color(207, 132, 37), "Select"
d["ListView"]["LineCornerRadius"], t["ListView"]["LineCornerRadius"] = 3, "LineCornerRadius"

function SKIN:PaintListView( panel, w, h )

	draw.RoundedBox(d["ListView"]["CornerRadius"], 0, 0, w, h, d["ListView"]["Background"])

end

function SKIN:PaintListViewLine( panel, w, h )

	if panel:IsSelected() then
		draw.RoundedBox(d["ListView"]["LineCornerRadius"], 0, 0, w, h, d["ListView"]["Select"])
	end

	if panel.Hovered then
		draw.RoundedBox(d["ListView"]["LineCornerRadius"], 0, 0, w, h, d["ListView"]["Hovered"])
	end

end