d["СheckBox"] = {}
t["СheckBox"] = {}

t["СheckBox"]["TITLE"] = "СheckBox"

d["СheckBox"]["NotActive"] = Color(60, 60, 60)
d["СheckBox"]["Hovered"] = Color(187, 102, 17)
d["СheckBox"]["Active"] = Color(197, 122, 27)
d["СheckBox"]["DisabledActive"] = Color(50, 50, 50)
d["СheckBox"]["Disabled"] = Color(100, 100, 100)
d["СheckBox"]["CornerRadius"] = 0

t["СheckBox"]["NotActive"] = "Not active"
t["СheckBox"]["Hovered"] = "Hovered"
t["СheckBox"]["Active"] = "Active"
t["СheckBox"]["DisabledActive"] = "Disabled active"
t["СheckBox"]["Disabled"] = "Disabled"
t["СheckBox"]["CornerRadius"] = "Corner radius"

function SKIN:PaintCheckBox( panel, w, h )

	if ( panel:GetChecked() ) then
		if ( panel:GetDisabled() ) then
				draw.RoundedBox(d["СheckBox"]["CornerRadius"], 0, 0, w, h, d["СheckBox"]["DisabledActive"])
		elseif ( panel.Hovered ) then
			draw.RoundedBox(d["СheckBox"]["CornerRadius"], 0, 0, w, h, d["СheckBox"]["Hovered"])
		else
			draw.RoundedBox(d["СheckBox"]["CornerRadius"], 0, 0, w, h, d["СheckBox"]["Active"])
		end
	else
		if ( panel:GetDisabled() ) then
			draw.RoundedBox(d["СheckBox"]["CornerRadius"], 0, 0, w, h, d["СheckBox"]["Disabled"])
		elseif ( panel.Hovered ) then
			draw.RoundedBox(d["СheckBox"]["CornerRadius"], 0, 0, w, h, d["СheckBox"]["Hovered"])
		else
			draw.RoundedBox(d["СheckBox"]["CornerRadius"], 0, 0, w, h, d["СheckBox"]["NotActive"])
		end
	end	

end