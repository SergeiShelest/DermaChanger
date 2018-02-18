d["MenuBar"] = {}
t["MenuBar"] = {}

t["MenuBar"]["TITLE"] = "Menu bar"

d["MenuBar"]["Background"] = Color(50, 50, 50)
d["MenuBar"]["CornerRadius"] = 0

t["MenuBar"]["Background"] = "Background"
t["MenuBar"]["CornerRadius"] = "Corner radius"

function SKIN:PaintMenuBar( panel, w, h )

	draw.RoundedBox(d["MenuBar"]["CornerRadius"], 0, 0, w, h, d["MenuBar"]["Background"])
	
end