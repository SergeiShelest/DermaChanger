DC_d.Tree, DC_t.Tree = {}, {}

DC_t.Tree.TITLE = "Tree"

DC_d.Tree.Background, DC_t.Tree.Background = Color(50, 50, 50), "Background"
DC_d.Tree.BackgroundLines, DC_t.Tree.BackgroundLines = Color(200, 200, 200), "Background lines"
DC_d.Tree.CornerRadius, DC_t.Tree.CornerRadius = 0, "Corner radius"
DC_d.Tree.ActiveNode, DC_t.Tree.ActiveNode = Color(227, 152, 57), "Active node"
DC_d.Tree.CornerRadiusNode, DC_t.Tree.CornerRadiusNode = 3, "Corner radius node"
DC_d.Tree.ActiveNodeText, DC_t.Tree.ActiveNodeText = Color(255, 255, 255), "Active node text"
DC_d.Tree.NodeText, DC_t.Tree.NodeText = Color(218, 218, 218), "Node text"
DC_d.Tree.Font, DC_t.Tree.Font = "DermaDefaultBold", "Font"

local draw = draw
local surface = surface

function SKIN:PaintTree( panel, w, h )
	draw.RoundedBox(DC_d.Tree.CornerRadius, 0, 0, w, h, DC_d.Tree.Background)
end

function SKIN:PaintTreeNode( panel, w, h )
	if !panel.m_bDrawLines then return end

	surface.SetDrawColor(DC_d.Tree.BackgroundLines)

	if panel.m_bLastChild then
		surface.DrawRect( 9, 0, 1, 7 )
		surface.DrawRect( 9, 7, 9, 1 )
	else
		surface.DrawRect( 9, 0, 1, h )
		surface.DrawRect( 9, 7, 9, 1 )
	end
end

function SKIN:PaintTreeNodeButton( panel, w, h )
	local w, _ = panel:GetTextSize()

	if !panel.m_bSelected then 
		panel.m_colText = DC_d.Tree.NodeText
		panel:SetFont( DC_d.Tree.Font )
	else
		draw.RoundedBox(DC_d.Tree.CornerRadiusNode, 38, 0, w + 6, h, DC_d.Tree.ActiveNode)
		panel.m_colText = DC_d.Tree.ActiveNodeText
		panel:SetFont( DC_d.Tree.Font )
	end
end