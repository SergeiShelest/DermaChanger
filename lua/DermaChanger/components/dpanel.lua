d["Panel"], t["Panel"] = {}, {}

t["Panel"]["TITLE"] = "Panel"

d["Panel"]["Background"], t["Panel"]["Background"] = Color(70, 70, 70), "Background"
d["Panel"]["CornerRadius"], t["Panel"]["CornerRadius"] = 0, "CornerRadius"


function SKIN:PaintPanel( panel, w, h )

	if not panel.m_bBackground then return end	

	draw.RoundedBox(d["Panel"]["CornerRadius"], 0, 0, w, h, d["Panel"]["Background"])

end