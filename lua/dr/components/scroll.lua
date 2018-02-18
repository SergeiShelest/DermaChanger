d["Scroll"] = {}
t["Scroll"] = {}

t["Scroll"]["TITLE"] = "Scroll"

d["Scroll"]["Background"] = Color(80, 80, 80)
d["Scroll"]["CornerRadius"] = 3
d["Scroll"]["NotActive"] = Color(227, 152, 57)
d["Scroll"]["Hovered"] = Color(197, 122, 27)
d["Scroll"]["Active"] = Color(187, 102, 17)
d["Scroll"]["Disabled"] = Color(100, 100, 100)

t["Scroll"]["Background"] = "Background"
t["Scroll"]["CornerRadius"] = "Corner radius"
t["Scroll"]["NotActive"] = "NotActive"
t["Scroll"]["Hovered"] = "Hovered"
t["Scroll"]["Active"] = "Active"
t["Scroll"]["Disabled"] = "Disabled"

function SKIN:PaintVScrollBar( panel, w, h )
	draw.RoundedBox(d["Scroll"]["CornerRadius"], 0, 0, w, h, d["Scroll"]["Background"])
end

function SKIN:PaintScrollBarGrip( panel, w, h )

	if ( panel:GetDisabled() ) then
		draw.RoundedBox(d["Scroll"]["CornerRadius"], 0, 0, w, h, d["Scroll"]["Disabled"])
	elseif ( panel.Depressed ) then
		draw.RoundedBox(d["Scroll"]["CornerRadius"], 0, 0, w, h, d["Scroll"]["Active"])
	elseif ( panel.Hovered ) then
		draw.RoundedBox(d["Scroll"]["CornerRadius"], 0, 0, w, h, d["Scroll"]["Hovered"])
	else
		draw.RoundedBox(d["Scroll"]["CornerRadius"], 0, 0, w, h, d["Scroll"]["NotActive"])
	end

end

function SKIN:PaintButtonDown( panel, w, h )

	if ( !panel.m_bBackground ) then return end

	if ( panel.Depressed || panel:IsSelected() ) then
		draw.RoundedBox(d["Scroll"]["CornerRadius"], 0, 0, w, h, d["Scroll"]["Active"])
	elseif ( panel:GetDisabled() ) then
		draw.RoundedBox(d["Scroll"]["CornerRadius"], 0, 0, w, h, d["Scroll"]["Disabled"])
	elseif ( panel.Hovered ) then
		draw.RoundedBox(d["Scroll"]["CornerRadius"], 0, 0, w, h, d["Scroll"]["Hovered"])
	else
		draw.RoundedBox(d["Scroll"]["CornerRadius"], 0, 0, w, h, d["Scroll"]["NotActive"])
	end

end

function SKIN:PaintButtonUp( panel, w, h )

	if ( !panel.m_bBackground ) then return end

	if ( panel.Depressed || panel:IsSelected() ) then
		draw.RoundedBox(d["Scroll"]["CornerRadius"], 0, 0, w, h, d["Scroll"]["Active"])
	elseif ( panel:GetDisabled() ) then
		draw.RoundedBox(d["Scroll"]["CornerRadius"], 0, 0, w, h, d["Scroll"]["Disabled"])
	elseif ( panel.Hovered ) then
		draw.RoundedBox(d["Scroll"]["CornerRadius"], 0, 0, w, h, d["Scroll"]["Hovered"])
	else
		draw.RoundedBox(d["Scroll"]["CornerRadius"], 0, 0, w, h, d["Scroll"]["NotActive"])
	end

end

function SKIN:PaintButtonLeft( panel, w, h )

	if ( !panel.m_bBackground ) then return end

	if ( panel.Depressed || panel:IsSelected() ) then
		draw.RoundedBox(d["Scroll"]["CornerRadius"], 0, 0, w, h, d["Scroll"]["Active"])
	elseif ( panel:GetDisabled() ) then
		draw.RoundedBox(d["Scroll"]["CornerRadius"], 0, 0, w, h, d["Scroll"]["Disabled"])
	elseif ( panel.Hovered ) then
		draw.RoundedBox(d["Scroll"]["CornerRadius"], 0, 0, w, h, d["Scroll"]["Hovered"])
	else
		draw.RoundedBox(d["Scroll"]["CornerRadius"], 0, 0, w, h, d["Scroll"]["NotActive"])
	end
	
end

function SKIN:PaintButtonRight( panel, w, h )

	if ( !panel.m_bBackground ) then return end

	if ( panel.Depressed || panel:IsSelected() ) then
		draw.RoundedBox(d["Scroll"]["CornerRadius"], 0, 0, w, h, d["Scroll"]["Active"])
	elseif ( panel:GetDisabled() ) then
		draw.RoundedBox(d["Scroll"]["CornerRadius"], 0, 0, w, h, d["Scroll"]["Disabled"])
	elseif ( panel.Hovered ) then
		draw.RoundedBox(d["Scroll"]["CornerRadius"], 0, 0, w, h, d["Scroll"]["Hovered"])
	else
		draw.RoundedBox(d["Scroll"]["CornerRadius"], 0, 0, w, h, d["Scroll"]["NotActive"])
	end

end