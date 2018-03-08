d["TextEntry"], t["TextEntry"] = {}, {}

t["TextEntry"]["TITLE"] = "TextEntry"

d["TextEntry"]["BackgroundDisabled"], t["TextEntry"]["BackgroundDisabled"] = Color(80, 80, 80), "BackgroundDisabled"
d["TextEntry"]["BackgroundFocus"], t["TextEntry"]["BackgroundFocus"] = Color(80, 80, 80), "BackgroundFocus"
d["TextEntry"]["Background"], t["TextEntry"]["Background"] = Color(50, 50, 50), "Background"
d["TextEntry"]["BorderDisabled"], t["TextEntry"]["BorderDisabled"] = Color(50, 50, 50), "BorderDisabled"
d["TextEntry"]["BorderFocus"], t["TextEntry"]["BorderFocus"] = Color(197, 122, 27), "BorderFocus"
d["TextEntry"]["Border"], t["TextEntry"]["Border"] = Color(227, 152, 57), "Border"
d["TextEntry"]["BorderSize"], t["TextEntry"]["BorderSize"] = 1, "BorderSize"
d["TextEntry"]["CornerRadius"], t["TextEntry"]["CornerRadius"] = 3, "Corner radius"
d["TextEntry"]["TitleColor"], t["TextEntry"]["TitleColor"] = Color(100, 100, 100), "Title color"
d["TextEntry"]["TextColor"], t["TextEntry"]["TextColor"] = Color(255, 255, 255), "Text color"
d["TextEntry"]["SelectColor"], t["TextEntry"]["SelectColor"] = Color(217, 142, 47), "Select color"

function SKIN:PaintTextEntry( panel, w, h )

	if ( panel.m_bBackground ) then

		if ( panel:GetDisabled() ) then
			draw.RoundedBox(d["TextEntry"]["CornerRadius"], 0, 0, w, h, d["TextEntry"]["BorderDisabled"])
			draw.RoundedBox(d["TextEntry"]["CornerRadius"], d["TextEntry"]["BorderSize"], d["TextEntry"]["BorderSize"], w-1, h-1, d["TextEntry"]["BackgroundDisabled"])
		elseif ( panel:HasFocus() ) then
			draw.RoundedBox(d["TextEntry"]["CornerRadius"], 0, 0, w, h, d["TextEntry"]["BorderFocus"])
			draw.RoundedBox(d["TextEntry"]["CornerRadius"], d["TextEntry"]["BorderSize"], d["TextEntry"]["BorderSize"], w-d["TextEntry"]["BorderSize"]*2, h-d["TextEntry"]["BorderSize"]*2, d["TextEntry"]["BackgroundFocus"])
		else
			draw.RoundedBox(d["TextEntry"]["CornerRadius"], 0, 0, w, h, d["TextEntry"]["Border"])
			draw.RoundedBox(d["TextEntry"]["CornerRadius"], d["TextEntry"]["BorderSize"], d["TextEntry"]["BorderSize"], w-d["TextEntry"]["BorderSize"]*2, h-d["TextEntry"]["BorderSize"]*2, d["TextEntry"]["Background"])
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