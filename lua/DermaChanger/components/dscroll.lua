d["Scroll"], t["Scroll"] = {}, {}

t["Scroll"]["TITLE"] = "Scroll"

d["Scroll"]["Background"], t["Scroll"]["Background"] = Color(80, 80, 80), "Background"
d["Scroll"]["CornerRadius"], t["Scroll"]["CornerRadius"] = 3, "Corner radius"
d["Scroll"]["NotActive"], t["Scroll"]["NotActive"] = Color(227, 152, 57), "NotActive"
d["Scroll"]["Hovered"], t["Scroll"]["Hovered"] = Color(197, 122, 27), "Hovered"
d["Scroll"]["Active"], t["Scroll"]["Active"] = Color(187, 102, 17), "Active"
d["Scroll"]["Disabled"], t["Scroll"]["Disabled"] = Color(100, 100, 100), "Disabled"
d["Scroll"]["ArrowSize"], t["Scroll"]["ArrowSize"] = 3, "ArrowSize"
d["Scroll"]["ArrowColor"], t["Scroll"]["ArrowColor"] = Color(255, 255, 255), "Arrow color"

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

	local triangle = {
		{ x = d["Scroll"]["ArrowSize"], y = h -d["Scroll"]["ArrowSize"] },
		{ x = w/2, y = d["Scroll"]["ArrowSize"] },
		{ x = w -d["Scroll"]["ArrowSize"], y = h -d["Scroll"]["ArrowSize"] }
	}

	surface.SetDrawColor( d["Scroll"]["ArrowColor"].r, d["Scroll"]["ArrowColor"].g, d["Scroll"]["ArrowColor"].b, d["Scroll"]["ArrowColor"].a )
	draw.NoTexture()
	surface.DrawPoly( triangle )

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

	local triangle = {
		{ x = d["Scroll"]["ArrowSize"], y = d["Scroll"]["ArrowSize"] },
		{ x = w -d["Scroll"]["ArrowSize"], y = d["Scroll"]["ArrowSize"] },
		{ x = w/2, y = h -d["Scroll"]["ArrowSize"] }
	}

	surface.SetDrawColor( d["Scroll"]["ArrowColor"].r, d["Scroll"]["ArrowColor"].g, d["Scroll"]["ArrowColor"].b, d["Scroll"]["ArrowColor"].a )
	draw.NoTexture()
	surface.DrawPoly( triangle )

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

	local triangle = {
		{ x = w -d["Scroll"]["ArrowSize"], y = d["Scroll"]["ArrowSize"] },
		{ x = w -d["Scroll"]["ArrowSize"], y = h -d["Scroll"]["ArrowSize"] },
		{ x = d["Scroll"]["ArrowSize"], y = h/2 }
	}

	surface.SetDrawColor( d["Scroll"]["ArrowColor"].r, d["Scroll"]["ArrowColor"].g, d["Scroll"]["ArrowColor"].b, d["Scroll"]["ArrowColor"].a )
	draw.NoTexture()
	surface.DrawPoly( triangle )

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

	local triangle = {
		{ x = d["Scroll"]["ArrowSize"], y = d["Scroll"]["ArrowSize"] },
		{ x = w -d["Scroll"]["ArrowSize"], y = h/2 },
		{ x = d["Scroll"]["ArrowSize"], y = h -d["Scroll"]["ArrowSize"] }
	}

	surface.SetDrawColor( d["Scroll"]["ArrowColor"].r, d["Scroll"]["ArrowColor"].g, d["Scroll"]["ArrowColor"].b, d["Scroll"]["ArrowColor"].a )
	draw.NoTexture()
	surface.DrawPoly( triangle )

end