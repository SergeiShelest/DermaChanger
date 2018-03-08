d["Tooltip"], t["Tooltip"] = {}, {}

t["Tooltip"]["TITLE"] = "Tooltip"

d["Tooltip"]["Background"], t["Tooltip"]["Background"] = Color(80, 80, 80), "Background"
d["Tooltip"]["Color"], t["Tooltip"]["Color"] = Color(255, 255, 255), "Color"
d["Tooltip"]["CornerRadius"], t["Tooltip"]["CornerRadius"] = 3, "Corner Radius"

function SKIN:PaintTooltip( panel, w, h )

	panel.m_colText = d["Tooltip"]["Color"]
	draw.RoundedBox(d["Tooltip"]["CornerRadius"], 0, 0, w, h, d["Tooltip"]["Background"] )

end