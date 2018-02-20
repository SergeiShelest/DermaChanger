d["Panel"] = {}
t["Panel"] = {}

t["Panel"]["TITLE"] = "Panel"

d["Panel"]["Background"] = Color(70, 70, 70)
d["Panel"]["CornerRadius"] = 0

t["Panel"]["Background"] = "Background"
t["Panel"]["CornerRadius"] = "Corner Radius"

function SKIN:PaintPanel( panel, w, h )

	if ( !panel.m_bBackground ) then return end	

	draw.RoundedBox(d["Panel"]["CornerRadius"], 0, 0, w, h, d["Panel"]["Background"])

end