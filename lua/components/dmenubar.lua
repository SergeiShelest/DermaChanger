DC_d.MenuBar, DC_t.MenuBar = {}, {}

DC_t.MenuBar.TITLE = "MenuBar"

DC_d.MenuBar.Background, DC_t.MenuBar.Background = Color(50, 50, 50), "Background"
DC_d.MenuBar.CornerRadius, DC_t.MenuBar.CornerRadius = 0, "CornerRadius"

local draw = draw

function SKIN:PaintMenuBar( panel, w, h )
	draw.RoundedBox(DC_d.MenuBar.CornerRadius, 0, 0, w, h, DC_d.MenuBar.Background)
end