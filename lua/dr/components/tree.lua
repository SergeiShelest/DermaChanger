d["Tree"] = {}
t["Tree"] = {}

t["Tree"]["TITLE"] = "Tree"

d["Tree"]["Background"] = Color(50, 50, 50)
d["Tree"]["BackgroundLines"] = Color(200, 200, 200)
d["Tree"]["CornerRadius"] = 0
d["Tree"]["ActiveNode"] = Color(227, 152, 57)
d["Tree"]["CornerRadiusNode"] = 3
d["Tree"]["ActiveNodeText"] = Color(255, 255, 255)
d["Tree"]["NodeText"] = Color(218, 218, 218)

t["Tree"]["Background"] = "Background"
t["Tree"]["BackgroundLines"] = "Background lines"
t["Tree"]["CornerRadius"] = "Corner radius"
t["Tree"]["ActiveNode"] = "Active node"
t["Tree"]["CornerRadiusNode"] = "Corner radius node"
t["Tree"]["ActiveNodeText"] = "Active node text"
t["Tree"]["NodeText"] = "Node text"

surface.CreateFont("Node", {
	font = "CloseCaption_Normal",
	size = 12,
	weight = 700,
	antialias = true,
	additive = false,
})

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

	panel:SetColor(Color(0, 0, 0, 0))

	if ( !panel.m_bSelected ) then 

		draw.Text( {
			text = panel:GetText(),
			font = "Node",
			xalign = TEXT_ALIGN_LEFT,
			yalign = TEXT_ALIGN_CENTER,
			color = d["Tree"]["NodeText"],
			pos = {38, h/2}
		} )

	else

		draw.RoundedBox(d["Tree"]["CornerRadiusNode"], 38, 0, w + 6, h, d["Tree"]["ActiveNode"])

		draw.Text( {
			text = panel:GetText(),
			font = "Node",
			xalign = TEXT_ALIGN_LEFT,
			yalign = TEXT_ALIGN_CENTER,
			color = d["Tree"]["ActiveNodeText"],
			pos = {39, h/2}
		} )

	end

end