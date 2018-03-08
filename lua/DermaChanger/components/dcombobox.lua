d["ComboBox"], t["ComboBox"] = {}, {}

t["ComboBox"]["TITLE"] = "ComboBox"

d["ComboBox"]["Background"], t["ComboBox"]["Background"] = Color(50, 50, 50), "Background"
d["ComboBox"]["Border"], t["ComboBox"]["Border"] = Color(227, 152, 57), "Border"
d["ComboBox"]["BackgroundFocus"], t["ComboBox"]["BackgroundFocus"] = Color(80, 80, 80), "BackgroundFocus"
d["ComboBox"]["BorderFocus"], t["ComboBox"]["BorderFocus"] = Color(197, 122, 27), "BorderFocus"
d["ComboBox"]["BackgroundHover"], t["ComboBox"]["BackgroundHover"] = Color(80, 80, 80), "BackgroundHover"
d["ComboBox"]["BorderHover"], t["ComboBox"]["BorderHover"] = Color(197, 122, 27), "BorderHover"
d["ComboBox"]["BackgroundDisabled"], t["ComboBox"]["BackgroundDisabled"] = Color(80, 80, 80), "BackgroundDisabled"
d["ComboBox"]["BorderDisabled"], t["ComboBox"]["BorderDisabled"] = Color(50, 50, 50), "BorderDisabled"
d["ComboBox"]["BorderSize"], t["ComboBox"]["BorderSize"] = 1, "BorderSize"
d["ComboBox"]["CornerRadius"], t["ComboBox"]["CornerRadius"] = 3, "Corner radius"
d["ComboBox"]["ArrowSize"], t["ComboBox"]["ArrowSize"] = 3, "ArrowSize"
d["ComboBox"]["Arrow"], t["ComboBox"]["Arrow"] = Color(255, 255, 255), "Arrow"
d["ComboBox"]["ArrowDisabled"], t["ComboBox"]["ArrowDisabled"] = Color(50, 50, 50), "BackgroundDisabled"
d["ComboBox"]["ArrowHover"], t["ComboBox"]["ArrowHover"] = Color(197, 122, 27), "BackgroundHover"
d["ComboBox"]["ArrowFocus"], t["ComboBox"]["ArrowFocus"] = Color(197, 122, 27), "BorderFocus"

function SKIN:PaintComboBox( panel, w, h )

	if ( panel:GetDisabled() ) then
		draw.RoundedBox(d["ComboBox"]["CornerRadius"], 0, 0, w, h, d["ComboBox"]["BorderDisabled"])
		draw.RoundedBox(d["ComboBox"]["CornerRadius"], d["ComboBox"]["BorderSize"], d["ComboBox"]["BorderSize"], w-d["ComboBox"]["BorderSize"]*2, h-d["ComboBox"]["BorderSize"]*2, d["ComboBox"]["BackgroundDisabled"])
	elseif ( panel.Depressed || panel:IsMenuOpen() ) then
		draw.RoundedBox(d["ComboBox"]["CornerRadius"], 0, 0, w, h, d["ComboBox"]["BorderFocus"])
		draw.RoundedBox(d["ComboBox"]["CornerRadius"], d["ComboBox"]["BorderSize"], d["ComboBox"]["BorderSize"], w-d["ComboBox"]["BorderSize"]*2, h-d["ComboBox"]["BorderSize"]*2, d["ComboBox"]["BackgroundFocus"])

	elseif ( panel.Hovered ) then
		draw.RoundedBox(d["ComboBox"]["CornerRadius"], 0, 0, w, h, d["ComboBox"]["BorderHover"])
		draw.RoundedBox(d["ComboBox"]["CornerRadius"], d["ComboBox"]["BorderSize"], d["ComboBox"]["BorderSize"], w-d["ComboBox"]["BorderSize"]*2, h-d["ComboBox"]["BorderSize"]*2, d["ComboBox"]["BackgroundHover"])
	else
		draw.RoundedBox(d["ComboBox"]["CornerRadius"], 0, 0, w, h, d["ComboBox"]["Border"])
		draw.RoundedBox(d["ComboBox"]["CornerRadius"], d["ComboBox"]["BorderSize"], d["ComboBox"]["BorderSize"], w-d["ComboBox"]["BorderSize"]*2, h-d["ComboBox"]["BorderSize"]*2, d["ComboBox"]["Background"])
	end

end

function SKIN:PaintComboDownArrow( panel, w, h )

	local triangle = {
		{ x = d["ComboBox"]["ArrowSize"], y = d["ComboBox"]["ArrowSize"] +2 },
		{ x = w -d["ComboBox"]["ArrowSize"], y = d["ComboBox"]["ArrowSize"] +2 },
		{ x = w/2, y = h -d["ComboBox"]["ArrowSize"] -2 }
	}

	surface.SetDrawColor( d["ComboBox"]["Arrow"].r, d["ComboBox"]["Arrow"].g, d["ComboBox"]["Arrow"].b, d["ComboBox"]["Arrow"].a )

	if ( panel.ComboBox:GetDisabled() ) then
		surface.SetDrawColor( d["ComboBox"]["ArrowDisabled"].r, d["ComboBox"]["ArrowDisabled"].g, d["ComboBox"]["ArrowDisabled"].b, d["ComboBox"]["ArrowDisabled"].a )
	elseif ( panel.ComboBox.Depressed || panel.ComboBox:IsMenuOpen() ) then
		surface.SetDrawColor( d["ComboBox"]["ArrowFocus"].r, d["ComboBox"]["ArrowFocus"].g, d["ComboBox"]["ArrowFocus"].b, d["ComboBox"]["ArrowFocus"].a )

	elseif ( panel.ComboBox.Hovered ) then
		surface.SetDrawColor( d["ComboBox"]["ArrowHover"].r, d["ComboBox"]["ArrowHover"].g, d["ComboBox"]["ArrowHover"].b, d["ComboBox"]["ArrowHover"].a )
	end
	
	draw.NoTexture()
	surface.DrawPoly( triangle )

end