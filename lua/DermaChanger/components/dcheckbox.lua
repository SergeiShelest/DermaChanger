d["СheckBox"], t["СheckBox"] = {}, {}

t["СheckBox"]["TITLE"] = "СheckBox"

d["СheckBox"]["NotActive"], t["СheckBox"]["NotActive"] = Color(60, 60, 60), "NotActive"
d["СheckBox"]["Hovered"], t["СheckBox"]["Hovered"] = Color(187, 102, 17), "Hovered"
d["СheckBox"]["Active"], t["СheckBox"]["Active"] = Color(197, 122, 27), "Active"
d["СheckBox"]["DisabledActive"], t["СheckBox"]["DisabledActive"] = Color(50, 50, 50), "DisabledActive"
d["СheckBox"]["Disabled"], t["СheckBox"]["Disabled"] = Color(100, 100, 100), "Disabled"

d["СheckBox"]["BorderNotActive"], t["СheckBox"]["BorderNotActive"] = Color(197, 122, 27), "BorderNotActive"
d["СheckBox"]["BorderHovered"], t["СheckBox"]["BorderHovered"] = Color(187, 102, 17), "BorderHovered"
d["СheckBox"]["BorderActive"], t["СheckBox"]["BorderActive"] = Color(197, 122, 27), "BorderActive"
d["СheckBox"]["BorderDisabledActive"], t["СheckBox"]["BorderDisabledActive"] = Color(50, 50, 50), "BorderDisabledActive"
d["СheckBox"]["BorderDisabled"], t["СheckBox"]["BorderDisabled"] = Color(100, 100, 100), "BorderDisabled"

d["СheckBox"]["BorderSize"], t["СheckBox"]["BorderSize"] = 1, "BorderSize"

d["СheckBox"]["CornerRadius"], t["СheckBox"]["CornerRadius"] = 0, "CornerRadius"

local Col = nil
local ColBord = nil

function SKIN:PaintCheckBox( panel, w, h )

	if panel:GetChecked() then

		Col = d["СheckBox"]["Active"]
		ColBord = d["СheckBox"]["BorderActive"]

		if panel:GetDisabled() then
			Col = d["СheckBox"]["DisabledActive"]
			ColBord = d["СheckBox"]["BorderDisabledActive"]
		end

		if ( panel.Hovered ) then
			Col = d["СheckBox"]["Hovered"]
			ColBord = d["СheckBox"]["BorderHovered"]
		end

	else

		Col = d["СheckBox"]["NotActive"]
		ColBord = d["СheckBox"]["BorderNotActive"]

		if panel:GetDisabled() then
			Col = d["СheckBox"]["Disabled"]
			ColBord = d["СheckBox"]["BorderDisabled"]
		end

		if panel.Hovered then
			Col = d["СheckBox"]["Hovered"]
			ColBord = d["СheckBox"]["BorderHovered"]
		end

	end

	if d["СheckBox"]["BorderSize"] ~= 0 then
		draw.RoundedBox(d["СheckBox"]["CornerRadius"], 0, 0, w, h, ColBord)
	end

	draw.RoundedBox(d["СheckBox"]["CornerRadius"], d["СheckBox"]["BorderSize"], d["СheckBox"]["BorderSize"], w -d["СheckBox"]["BorderSize"] *2, h -d["СheckBox"]["BorderSize"] *2, Col)

end