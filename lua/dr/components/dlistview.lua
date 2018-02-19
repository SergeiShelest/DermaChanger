d["ListView"] = {}
t["ListView"] = {}

t["ListView"]["TITLE"] = "List view"

d["ListView"]["Background"] = Color(50, 50, 50)
d["ListView"]["CornerRadius"] = 0
d["ListView"]["Gap"] = Color(45, 45, 45)
d["ListView"]["Hovered"] = Color(217, 142, 47)
d["ListView"]["Select"] = Color(207, 132, 37)
d["ListView"]["LineCornerRadius"] = 3

t["ListView"]["Background"] = "Background"
t["ListView"]["CornerRadius"] = "Corner radius"
t["ListView"]["Gap"] = "Gap"
t["ListView"]["Hovered"] = "Hovered"
t["ListView"]["Select"] = "Select"
t["ListView"]["LineCornerRadius"] = "Line corner radius"

function SKIN:PaintListView( panel, w, h )

	draw.RoundedBox(d["ListView"]["CornerRadius"], 0, 0, w, h, d["ListView"]["Background"])

end

function SKIN:PaintListViewLine( panel, w, h )

	if ( panel:IsSelected() ) then
		draw.RoundedBox(d["ListView"]["LineCornerRadius"], 0, 0, w, h, d["ListView"]["Select"])
	elseif ( panel.Hovered ) then
		draw.RoundedBox(d["ListView"]["LineCornerRadius"], 0, 0, w, h, d["ListView"]["Hovered"])
	elseif ( panel.m_bAlt ) then
		draw.RoundedBox(d["ListView"]["LineCornerRadius"], 0, 0, w, h, d["ListView"]["Gap"])
	end

end