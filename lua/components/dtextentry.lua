DC_d.TextEntry, DC_t.TextEntry = {}, {}

DC_t.TextEntry.TITLE = "TextEntry"

DC_d.TextEntry.BackgroundDisabled, DC_t.TextEntry.BackgroundDisabled = Color(80, 80, 80), "BackgroundDisabled"
DC_d.TextEntry.BackgroundFocus, DC_t.TextEntry.BackgroundFocus = Color(80, 80, 80), "BackgroundFocus"
DC_d.TextEntry.Background, DC_t.TextEntry.Background = Color(50, 50, 50), "Background"
DC_d.TextEntry.BorderDisabled, DC_t.TextEntry.BorderDisabled = Color(50, 50, 50), "BorderDisabled"
DC_d.TextEntry.BorderFocus, DC_t.TextEntry.BorderFocus = Color(197, 122, 27), "BorderFocus"
DC_d.TextEntry.Border, DC_t.TextEntry.Border = Color(227, 152, 57), "Border"
DC_d.TextEntry.BorderSize, DC_t.TextEntry.BorderSize = 1, "BorderSize"
DC_d.TextEntry.CornerRadius, DC_t.TextEntry.CornerRadius = 3, "Corner radius"
DC_d.TextEntry.TitleColor, DC_t.TextEntry.TitleColor = Color(100, 100, 100), "Title color"
DC_d.TextEntry.TextColor, DC_t.TextEntry.TextColor = Color(255, 255, 255), "Text color"
DC_d.TextEntry.SelectColor, DC_t.TextEntry.SelectColor = Color(217, 142, 47), "Select color"

function SKIN:PaintTextEntry( panel, w, h )
	if ( panel.m_bBackground ) then
		if ( panel:GetDisabled() ) then
			draw.RoundedBox(DC_d.TextEntry.CornerRadius, 0, 0, w, h, DC_d.TextEntry.BorderDisabled)
			draw.RoundedBox(DC_d.TextEntry.CornerRadius, DC_d.TextEntry.BorderSize, DC_d.TextEntry.BorderSize, w-1, h-1, DC_d.TextEntry.BackgroundDisabled)
		elseif ( panel:HasFocus() ) then
			draw.RoundedBox(DC_d.TextEntry.CornerRadius, 0, 0, w, h, DC_d.TextEntry.BorderFocus)
			draw.RoundedBox(DC_d.TextEntry.CornerRadius, DC_d.TextEntry.BorderSize, DC_d.TextEntry.BorderSize, w-DC_d.TextEntry.BorderSize*2, h-DC_d.TextEntry.BorderSize*2, DC_d.TextEntry.BackgroundFocus)
		else
			draw.RoundedBox(DC_d.TextEntry.CornerRadius, 0, 0, w, h, DC_d.TextEntry.Border)
			draw.RoundedBox(DC_d.TextEntry.CornerRadius, DC_d.TextEntry.BorderSize, DC_d.TextEntry.BorderSize, w-DC_d.TextEntry.BorderSize*2, h-DC_d.TextEntry.BorderSize*2, DC_d.TextEntry.Background)
		end
	end

	if ( panel.GetPlaceholderText && panel.GetPlaceholderColor && panel:GetPlaceholderText() && panel:GetPlaceholderText():Trim() != "" && panel:GetPlaceholderColor() && ( !panel:GetText() || panel:GetText() == "" ) ) then
		local oldText = panel:GetText()

		local str = panel:GetPlaceholderText()
		if ( str:StartWith( "#" ) ) then str = str:sub( 2 ) end
		str = language.GetPhrase( str )

		panel:SetText( str )
		panel:DrawTextEntryText( DC_d.TextEntry.TitleColor, panel:GetHighlightColor(), panel:GetCursorColor() )
		panel:SetText( oldText )

		return
	end

	panel:DrawTextEntryText( DC_d.TextEntry.TextColor, DC_d.TextEntry.SelectColor, panel:GetCursorColor() )
end