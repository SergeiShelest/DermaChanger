d["PropertySheet"], t["PropertySheet"] = {}, {}


t["PropertySheet"]["TITLE"] = "PropertySheet"

d["PropertySheet"]["Background"], t["PropertySheet"]["Background"] = Color(70, 70, 70), "Background"
d["PropertySheet"]["CornerRadius"], t["PropertySheet"]["CornerRadius"] = 0, "Corner radius"

function SKIN:PaintPropertySheet( panel, w, h )

	draw.RoundedBox(d["PropertySheet"]["CornerRadius"], 0, 0, w, h, d["PropertySheet"]["Background"])
		
end