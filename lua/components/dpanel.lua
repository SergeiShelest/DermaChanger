DC_d["Panel"], DC_t["Panel"] = {}, {}

DC_t["Panel"]["TITLE"] = "Panel"

DC_d["Panel"]["Background"], DC_t["Panel"]["Background"] = Color(70, 70, 70), "Background"
DC_d["Panel"]["CornerRadius"], DC_t["Panel"]["CornerRadius"] = 0, "CornerRadius"


function SKIN:PaintPanel( panel, w, h )

	if not panel.m_bBackground then return end	

	draw.RoundedBox(DC_d["Panel"]["CornerRadius"], 0, 0, w, h, DC_d["Panel"]["Background"])

end