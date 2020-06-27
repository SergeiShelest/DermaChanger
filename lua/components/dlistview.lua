DC_d.ListView, DC_t.ListView = {}, {}

DC_t.ListView.TITLE = "List view"

DC_d.ListView.Background, DC_t.ListView.Background = Color(50, 50, 50), "Background"
DC_d.ListView.CornerRadius, DC_t.ListView.CornerRadius = 0, "CornerRadius"
DC_d.ListView.Hovered, DC_t.ListView.Hovered = Color(217, 142, 47), "Hovered"
DC_d.ListView.Select, DC_t.ListView.Select = Color(207, 132, 37), "Select"
DC_d.ListView.LineCornerRadius, DC_t.ListView.LineCornerRadius = 3, "LineCornerRadius"

local draw = draw

function SKIN:PaintListView( panel, w, h )
	draw.RoundedBox(DC_d.ListView.CornerRadius, 0, 0, w, h, DC_d.ListView.Background)
end

function SKIN:PaintListViewLine( panel, w, h )
	if panel:IsSelected() then
		draw.RoundedBox(DC_d.ListView.LineCornerRadius, 0, 0, w, h, DC_d.ListView.Select)
	end

	if panel.Hovered then
		draw.RoundedBox(DC_d.ListView.LineCornerRadius, 0, 0, w, h, DC_d.ListView.Hovered)
	end
end