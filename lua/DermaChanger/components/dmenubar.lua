d["MenuBar"], t["MenuBar"] = {}, {}

t["MenuBar"]["TITLE"] = "MenuBar"

d["MenuBar"]["Background"], t["MenuBar"]["Background"] = Color(50, 50, 50), "Background"
d["MenuBar"]["CornerRadius"], t["MenuBar"]["CornerRadius"] = 0, "CornerRadius"


function SKIN:PaintMenuBar( panel, w, h )

	draw.RoundedBox(d["MenuBar"]["CornerRadius"], 0, 0, w, h, d["MenuBar"]["Background"])

end