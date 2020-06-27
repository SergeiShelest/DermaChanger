DC_d.Button, DC_t.Button = {}, {}

DC_t.Button.TITLE = "Button"

DC_d.Button.Font, DC_t.Button.Font = "DermaDefaultBold", "Font"
DC_d.Button.NotActive, DC_t.Button.NotActive = Color(227, 152, 57), "NotActive"
DC_d.Button.Hovered, DC_t.Button.Hovered = Color(197, 122, 27), "Hovered"
DC_d.Button.Active, DC_t.Button.Active = Color(187, 102, 17), "Active"
DC_d.Button.Disabled, DC_t.Button.Disabled = Color(100, 100, 100), "Disabled"
DC_d.Button.TextNotActive, DC_t.Button.TextNotActive = Color(255, 255, 255), "TextNotActive"
DC_d.Button.TextHovered, DC_t.Button.TextHovered = Color(255, 255, 255), "TextHovered"
DC_d.Button.TextActive, DC_t.Button.TextActive = Color(255, 255, 255), "TextActive"
DC_d.Button.TextDisabled, DC_t.Button.TextDisabled = Color(255, 255, 255), "TextDisabled"
DC_d.Button.BorderNotActive, DC_t.Button.BorderNotActive = Color(255, 255, 255), "BorderNotActive"
DC_d.Button.BorderHovered, DC_t.Button.BorderHovered = Color(255, 255, 255), "BorderHovered"
DC_d.Button.BorderActive, DC_t.Button.BorderActive = Color(255, 255, 255), "BorderActive"
DC_d.Button.BorderDisabled, DC_t.Button.BorderDisabled = Color(255, 255, 255), "BorderDisabled"
DC_d.Button.BorderSize, DC_t.Button.BorderSize = 0, "BorderSize"
DC_d.Button.CornerRadius, DC_t.Button.CornerRadius = 5, "Corner Radius"

local TextCol = Color(0, 0, 0, 0)
local Col = Color(0, 0, 0, 0)
local ColBorder = Color(0, 0, 0, 0)

function SKIN:PaintButton( panel, w, h )
	if not panel.m_bBackground then return end

	panel:SetDrawBorder( false )

	if panel:GetFont() == "DermaDefault" or panel:GetFont() == DC_d.Button.Font then
		panel:SetFont( DC_d.Button.Font )
	end

	Col = DC_d.Button.NotActive
	ColBorder = DC_d.Button.BorderNotActive
	TextCol = DC_d.Button.TextNotActive

	if panel:GetDisabled() then
		Col = DC_d.Button.Disabled
		ColBorder = DC_d.Button.BorderDisabled
		TextCol = DC_d.Button.TextDisabled
	end

	if panel.Hovered then
		Col = DC_d.Button.Hovered
		ColBorder = DC_d.Button.BorderHovered
		TextCol = DC_d.Button.TextHovered
	end

	if panel.Depressed or panel:IsSelected() or panel:GetToggle() then
		Col = DC_d.Button.Active
		ColBorder = DC_d.Button.BorderActive
		TextCol = DC_d.Button.TextActive
	end

	if DC_d.Button.BorderSize ~= 0 then
		draw.RoundedBox(DC_d.Button.CornerRadius, 0, 0, w, h, ColBorder)
	end

	draw.RoundedBox(DC_d.Button.CornerRadius, DC_d.Button.BorderSize, DC_d.Button.BorderSize, w -DC_d.Button.BorderSize *2, h -DC_d.Button.BorderSize *2, Col)
	panel.m_colText = TextCol
end


