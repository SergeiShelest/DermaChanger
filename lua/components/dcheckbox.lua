DC_d["СheckBox"], DC_t["СheckBox"] = {}, {}

DC_t["СheckBox"]["TITLE"] = "СheckBox"

DC_d["СheckBox"]["NotActive"], DC_t["СheckBox"]["NotActive"] = Color(60, 60, 60), "NotActive"
DC_d["СheckBox"]["Hovered"], DC_t["СheckBox"]["Hovered"] = Color(187, 102, 17, 50), "Hovered"
DC_d["СheckBox"]["BorderHovered"], DC_t["СheckBox"]["BorderHovered"] = Color(187, 102, 17, 50), "BorderHovered"
DC_d["СheckBox"]["ActiveHovered"], DC_t["СheckBox"]["ActiveHovered"] = Color(197, 122, 27, 50), "ActiveHovered"
DC_d["СheckBox"]["ActiveBorderHovered"], DC_t["СheckBox"]["ActiveBorderHovered"] = Color(197, 122, 27, 50), "ActiveBorderHovered"
DC_d["СheckBox"]["Active"], DC_t["СheckBox"]["Active"] = Color(197, 122, 27), "Active"
DC_d["СheckBox"]["DisabledActive"], DC_t["СheckBox"]["DisabledActive"] = Color(50, 50, 50), "DisabledActive"
DC_d["СheckBox"]["Disabled"], DC_t["СheckBox"]["Disabled"] = Color(100, 100, 100), "Disabled"
DC_d["СheckBox"]["BorderNotActive"], DC_t["СheckBox"]["BorderNotActive"] = Color(197, 122, 27), "BorderNotActive"
DC_d["СheckBox"]["BorderActive"], DC_t["СheckBox"]["BorderActive"] = Color(197, 122, 27), "BorderActive"
DC_d["СheckBox"]["BorderDisabledActive"], DC_t["СheckBox"]["BorderDisabledActive"] = Color(50, 50, 50), "BorderDisabledActive"
DC_d["СheckBox"]["BorderDisabled"], DC_t["СheckBox"]["BorderDisabled"] = Color(100, 100, 100), "BorderDisabled"
DC_d["СheckBox"]["BorderSize"], DC_t["СheckBox"]["BorderSize"] = 1, "BorderSize"
DC_d["СheckBox"]["CornerRadius"], DC_t["СheckBox"]["CornerRadius"] = 0, "CornerRadius"

local Col = Color(0, 0, 0, 0)
local ColBord = Color(0, 0, 0, 0)

function SKIN:PaintCheckBox( panel, w, h )

	if panel:GetChecked() then

		Col = DC_d["СheckBox"]["Active"]
		ColBord = DC_d["СheckBox"]["BorderActive"]

		if panel:GetDisabled() then
			Col = DC_d["СheckBox"]["DisabledActive"]
			ColBord = DC_d["СheckBox"]["BorderDisabledActive"]
		end

		if panel.Hovered then
			Col = DC_d["СheckBox"]["ActiveHovered"]
			ColBord = DC_d["СheckBox"]["ActiveBorderHovered"]
		end

	else

		Col = DC_d["СheckBox"]["NotActive"]
		ColBord = DC_d["СheckBox"]["BorderNotActive"]

		if panel:GetDisabled() then
			Col = DC_d["СheckBox"]["Disabled"]
			ColBord = DC_d["СheckBox"]["BorderDisabled"]
		end

		if panel.Hovered then
			Col = DC_d["СheckBox"]["Hovered"]
			ColBord = DC_d["СheckBox"]["BorderHovered"]
		end

	end

	if DC_d["СheckBox"]["BorderSize"] ~= 0 then
		draw.RoundedBox(DC_d["СheckBox"]["CornerRadius"], 0, 0, w, h, ColBord)
	end

	draw.RoundedBox(DC_d["СheckBox"]["CornerRadius"], DC_d["СheckBox"]["BorderSize"], DC_d["СheckBox"]["BorderSize"], w -DC_d["СheckBox"]["BorderSize"] *2, h -DC_d["СheckBox"]["BorderSize"] *2, Col)

end