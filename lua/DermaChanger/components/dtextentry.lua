d["TextEntry"], t["TextEntry"] = {}, {}

t["TextEntry"]["TITLE"] = "TextEntry"

d["TextEntry"]["BackgroundDisabled"], t["TextEntry"]["BackgroundDisabled"] = Color(80, 80, 80), "BackgroundDisabled"
d["TextEntry"]["BackgroundFocus"], t["TextEntry"]["BackgroundFocus"] = Color(80, 80, 80), "BackgroundFocus"
d["TextEntry"]["Background"], t["TextEntry"]["Background"] = Color(50, 50, 50), "Background"
d["TextEntry"]["CornerRadius"], t["TextEntry"]["CornerRadius"] = 0, "Corner radius"
d["TextEntry"]["TitleColor"], t["TextEntry"]["TitleColor"] = Color(100, 100, 100), "Title color"
d["TextEntry"]["TextColor"], t["TextEntry"]["TextColor"] = Color(255, 255, 255), "Text color"
d["TextEntry"]["SelectColor"], t["TextEntry"]["SelectColor"] = Color(217, 142, 47), "Select color"

function SKIN:PaintTextEntry( panel, w, h )

	if ( panel.m_bBackground ) then

		if ( panel:GetDisabled() ) then
			draw.RoundedBox(d["TextEntry"]["CornerRadius"], 0, 0, w, h, d["TextEntry"]["BackgroundDisabled"])
		elseif ( panel:HasFocus() ) then
			draw.RoundedBox(d["TextEntry"]["CornerRadius"], 0, 0, w, h, d["TextEntry"]["BackgroundFocus"])
		else
			draw.RoundedBox(d["TextEntry"]["CornerRadius"], 0, 0, w, h, d["TextEntry"]["Background"])
		end

	end

	if ( panel.GetPlaceholderText && panel.GetPlaceholderColor && panel:GetPlaceholderText() && panel:GetPlaceholderText():Trim() != "" && panel:GetPlaceholderColor() && ( !panel:GetText() || panel:GetText() == "" ) ) then

		local oldText = panel:GetText()

		local str = panel:GetPlaceholderText()
		if ( str:StartWith( "#" ) ) then str = str:sub( 2 ) end
		str = language.GetPhrase( str )

		panel:SetText( str )
		panel:DrawTextEntryText( d["TextEntry"]["TitleColor"], panel:GetHighlightColor(), panel:GetCursorColor() )
		panel:SetText( oldText )

		return
	end

	panel:DrawTextEntryText( d["TextEntry"]["TextColor"], d["TextEntry"]["SelectColor"], panel:GetCursorColor() )

end