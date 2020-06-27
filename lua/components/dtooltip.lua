DC_d.Tooltip, DC_t.Tooltip = {}, {}

DC_t.Tooltip.TITLE = "Tooltip"

DC_d.Tooltip.Background, DC_t.Tooltip.Background = Color(80, 80, 80), "Background"
DC_d.Tooltip.Color, DC_t.Tooltip.Color = Color(255, 255, 255), "Color"
DC_d.Tooltip.CornerRadius, DC_t.Tooltip.CornerRadius = 3, "Corner Radius"

local draw = draw

function SKIN:PaintTooltip( panel, w, h )
	panel.m_colText = DC_d.Tooltip.Color
	draw.RoundedBox(DC_d.Tooltip.CornerRadius, 0, 0, w, h, DC_d.Tooltip.Background )
end