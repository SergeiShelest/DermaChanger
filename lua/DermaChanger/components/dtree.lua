d["Tree"], t["Tree"] = {}, {}

t["Tree"]["TITLE"] = "Tree"

d["Tree"]["Background"], t["Tree"]["Background"] = Color(50, 50, 50), "Background"
d["Tree"]["BackgroundLines"], t["Tree"]["BackgroundLines"] = Color(200, 200, 200), "Background lines"
d["Tree"]["CornerRadius"], t["Tree"]["CornerRadius"] = 0, "Corner radius"
d["Tree"]["ActiveNode"], t["Tree"]["ActiveNode"] = Color(227, 152, 57), "Active node"
d["Tree"]["CornerRadiusNode"], t["Tree"]["CornerRadiusNode"] = 3, "Corner radius node"
d["Tree"]["ActiveNodeText"], t["Tree"]["ActiveNodeText"] = Color(255, 255, 255), "Active node text"
d["Tree"]["NodeText"], t["Tree"]["NodeText"] = Color(218, 218, 218), "Node text"
d["Tree"]["Font"], t["Tree"]["Font"] = "DermaDefaultBold", "Font"


function SKIN:PaintTree( panel, w, h )

	draw.RoundedBox(d["Tree"]["CornerRadius"], 0, 0, w, h, d["Tree"]["Background"])
		
end

function SKIN:PaintTreeNode( panel, w, h )

	if ( !panel.m_bDrawLines ) then return end

	surface.SetDrawColor(d["Tree"]["BackgroundLines"])

	if ( panel.m_bLastChild ) then

		surface.DrawRect( 9, 0, 1, 7 )
		surface.DrawRect( 9, 7, 9, 1 )

	else
		surface.DrawRect( 9, 0, 1, h )
		surface.DrawRect( 9, 7, 9, 1 )
	end

end

function SKIN:PaintTreeNodeButton( panel, w, h )

	local w, _ = panel:GetTextSize()

	if ( !panel.m_bSelected ) then 

		panel.m_colText = d["Tree"]["NodeText"]
		panel:SetFont( d["Tree"]["Font"] )

	else

		draw.RoundedBox(d["Tree"]["CornerRadiusNode"], 38, 0, w + 6, h, d["Tree"]["ActiveNode"])

		panel.m_colText = d["Tree"]["ActiveNodeText"]
		panel:SetFont( d["Tree"]["Font"] )

	end

end