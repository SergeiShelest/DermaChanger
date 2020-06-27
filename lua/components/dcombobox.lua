DC_d.ComboBox, DC_t.ComboBox = {}, {}

DC_t.ComboBox.TITLE = "ComboBox"

DC_d.ComboBox.Background, DC_t.ComboBox.Background = Color(50, 50, 50), "Background"
DC_d.ComboBox.Border, DC_t.ComboBox.Border = Color(227, 152, 57), "Border"
DC_d.ComboBox.BackgroundFocus, DC_t.ComboBox.BackgroundFocus = Color(80, 80, 80), "BackgroundFocus"
DC_d.ComboBox.BorderFocus, DC_t.ComboBox.BorderFocus = Color(197, 122, 27), "BorderFocus"
DC_d.ComboBox.BackgroundHover, DC_t.ComboBox.BackgroundHover = Color(80, 80, 80), "BackgroundHover"
DC_d.ComboBox.BorderHover, DC_t.ComboBox.BorderHover = Color(197, 122, 27), "BorderHover"
DC_d.ComboBox.BackgroundDisabled, DC_t.ComboBox.BackgroundDisabled = Color(80, 80, 80), "BackgroundDisabled"
DC_d.ComboBox.BorderDisabled, DC_t.ComboBox.BorderDisabled = Color(50, 50, 50), "BorderDisabled"
DC_d.ComboBox.BorderSize, DC_t.ComboBox.BorderSize = 1, "BorderSize"
DC_d.ComboBox.CornerRadius, DC_t.ComboBox.CornerRadius = 3, "CornerRadius"
DC_d.ComboBox.ArrowSize, DC_t.ComboBox.ArrowSize = 3, "ArrowSize"
DC_d.ComboBox.Arrow, DC_t.ComboBox.Arrow = Color(255, 255, 255), "Arrow"
DC_d.ComboBox.ArrowDisabled, DC_t.ComboBox.ArrowDisabled = Color(50, 50, 50), "ArrowDisabled"
DC_d.ComboBox.ArrowHover, DC_t.ComboBox.ArrowHover = Color(197, 122, 27), "ArrowHover"
DC_d.ComboBox.ArrowFocus, DC_t.ComboBox.ArrowFocus = Color(197, 122, 27), "ArrowFocus"

local Col = Color(0, 0, 0, 0)
local ColBord = Color(0, 0, 0, 0)

function SKIN:PaintComboBox( panel, w, h )
	Col = DC_d.ComboBox.Background
	ColBord = DC_d.ComboBox.Border

	if panel:GetDisabled() then
		Col = DC_d.ComboBox.Background
		ColBord = DC_d.ComboBox.BorderDisabled
	end

	if panel.Depressed or panel:IsMenuOpen() then
		Col = DC_d.ComboBox.BackgroundFocus
		ColBord = DC_d.ComboBox.BorderFocus
	end
	
	if panel.Hovered then
		Col = DC_d.ComboBox.BackgroundHover
		ColBord = DC_d.ComboBox.BorderHover	
	end

	if DC_d.ComboBox.BorderSize ~= 0 then
		draw.RoundedBox(DC_d.ComboBox.CornerRadius, 0, 0, w, h, ColBord)
	end
	
	draw.RoundedBox(DC_d.ComboBox.CornerRadius, DC_d.ComboBox.BorderSize, DC_d.ComboBox.BorderSize, w-DC_d.ComboBox.BorderSize*2, h-DC_d.ComboBox.BorderSize*2, Col)
end

local ArrowCol = nil
local triangle = {}

function SKIN:PaintComboDownArrow( panel, w, h )
	triangle = {
		{ x = DC_d.ComboBox.ArrowSize, y = DC_d.ComboBox.ArrowSize + 2 },
		{ x = w -DC_d.ComboBox.ArrowSize, y = DC_d.ComboBox.ArrowSize + 2 },
		{ x = w / 2, y = h -DC_d.ComboBox.ArrowSize - 2 }
	}

	ArrowCol = DC_d.ComboBox.Arrow

	if panel.ComboBox:GetDisabled() then
		ArrowCol = DC_d.ComboBox.ArrowDisabled
	end

	if panel.ComboBox.Depressed or panel.ComboBox:IsMenuOpen() then
		ArrowCol = DC_d.ComboBox.ArrowFocus
	end

	if panel.ComboBox.Hovered then
		ArrowCol = DC_d.ComboBox.ArrowHover
	end

	surface.SetDrawColor(ArrowCol.r, ArrowCol.g, ArrowCol.b, ArrowCol.a)
	draw.NoTexture()
	surface.DrawPoly(triangle)
end