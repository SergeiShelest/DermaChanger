DC_d["PropertySheet"], DC_t["PropertySheet"] = {}, {}

DC_t["PropertySheet"]["TITLE"] = "PropertySheet"

DC_d["PropertySheet"]["Background"], DC_t["PropertySheet"]["Background"] = Color(70, 70, 70), "Background"
DC_d["PropertySheet"]["CornerRadius"], DC_t["PropertySheet"]["CornerRadius"] = 0, "Corner radius"

function SKIN:PaintPropertySheet( panel, w, h )

	draw.RoundedBox(DC_d["PropertySheet"]["CornerRadius"], 0, 0, w, h, DC_d["PropertySheet"]["Background"])
		
end