d["PropertySheet"] = {}
t["PropertySheet"] = {}

t["PropertySheet"]["TITLE"] = "Property sheet"

d["PropertySheet"]["Background"] = Color(70, 70, 70)
d["PropertySheet"]["CornerRadius"] = 0

t["PropertySheet"]["Background"] = "Background"
t["PropertySheet"]["CornerRadius"] = "Corner radius"

function SKIN:PaintPropertySheet( panel, w, h )

	draw.RoundedBox(d["PropertySheet"]["CornerRadius"], 0, 0, w, h, d["PropertySheet"]["Background"])
		
end