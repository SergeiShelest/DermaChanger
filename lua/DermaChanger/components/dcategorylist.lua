d["CategoryList"], t["CategoryList"] = {}, {}

t["CategoryList"]["TITLE"] = "Category List"

d["CategoryList"]["Background"], t["CategoryList"]["Background"] = Color(50, 50, 50), "Background"
d["CategoryList"]["Border"], t["CategoryList"]["Border"] = Color(255, 255, 255), "Border"
d["CategoryList"]["BorderSize"], t["CategoryList"]["BorderSize"] = 0, "BorderSize"
d["CategoryList"]["CornerRadius"], t["CategoryList"]["CornerRadius"] = 0, "СornerRadius"
d["CategoryList"]["Expanded"], t["CategoryList"]["Expanded"] = Color(217, 142, 47), "Expanded"
d["CategoryList"]["NotExpanded"], t["CategoryList"]["NotExpanded"] = Color(60, 60, 60), "NotExpanded"
d["CategoryList"]["BorderExpanded"], t["CategoryList"]["BorderExpanded"] = Color(255, 255, 255), "BorderExpanded"
d["CategoryList"]["BorderNotExpanded"], t["CategoryList"]["BorderNotExpanded"] = Color(255, 255, 255), "BorderNotExpanded"
d["CategoryList"]["TitleBorderSize"], t["CategoryList"]["TitleBorderSize"] = 0, "TitleBorderSize"
d["CategoryList"]["TitleCornerRadius"], t["CategoryList"]["TitleCornerRadius"] = 3, "TitleCornerRadius"
d["CategoryList"]["Hover"], t["CategoryList"]["Hover"] = Color(40, 40, 40), "Hover"
d["CategoryList"]["Line"], t["CategoryList"]["Line"] = Color(40, 40, 40), "Line"
d["CategoryList"]["Select"], t["CategoryList"]["Select"] = Color(255, 220, 0), "Select"
d["CategoryList"]["BorderHover"], t["CategoryList"]["BorderHover"] = Color(255, 191, 0), "BorderHover"
d["CategoryList"]["BorderLine"], t["CategoryList"]["BorderLine"] = Color(50, 50, 50), "BorderLine"
d["CategoryList"]["BorderSelect"], t["CategoryList"]["BorderSelect"] = Color(50, 50, 50), "BorderSelect"
d["CategoryList"]["BtnBorderSize"], t["CategoryList"]["BtnBorderSize"] = 1, "BtnBorderSize"
d["CategoryList"]["BtnCornerRadius"], t["CategoryList"]["BtnCornerRadius"] = 3, "BtnCornerRadius"

function SKIN:PaintCategoryList( panel, w, h )

	if d["CategoryList"]["BorderSize"] ~= 0 then
		draw.RoundedBox(d["CategoryList"]["CornerRadius"], 0, 0, w, h, d["CategoryList"]["Border"])
	end

	draw.RoundedBox(d["CategoryList"]["CornerRadius"], d["CategoryList"]["BorderSize"], d["CategoryList"]["BorderSize"], w -d["CategoryList"]["BorderSize"] *2, h -d["CategoryList"]["BorderSize"] *2, d["CategoryList"]["Background"])

end

function SKIN:PaintCollapsibleCategory( panel, w, h )

	if panel:GetExpanded() then
		
		if d["CategoryList"]["TitleBorderSize"] ~= 0 then
			draw.RoundedBox(d["CategoryList"]["TitleCornerRadius"], 0, 0, w, 20, d["CategoryList"]["BorderExpanded"])
		end

		draw.RoundedBox(d["CategoryList"]["TitleCornerRadius"], d["CategoryList"]["TitleBorderSize"], d["CategoryList"]["TitleBorderSize"], w -d["CategoryList"]["TitleBorderSize"] *2, 20 -d["CategoryList"]["TitleBorderSize"] *2, d["CategoryList"]["Expanded"])
		
	else
		
		if d["CategoryList"]["TitleBorderSize"] ~= 0 then
			draw.RoundedBox(d["CategoryList"]["TitleCornerRadius"], 0, 0, w, h, d["CategoryList"]["BorderNotExpanded"])
		end
	
		draw.RoundedBox(d["CategoryList"]["TitleCornerRadius"], d["CategoryList"]["TitleBorderSize"], d["CategoryList"]["TitleBorderSize"], w -d["CategoryList"]["TitleBorderSize"] *2, h -d["CategoryList"]["TitleBorderSize"] *2, d["CategoryList"]["NotExpanded"])
	
	end
		
end

local CBCol = nil
local CBColBord = nil

function SKIN:PaintCategoryButton( panel, w, h )

	CBCol = d["CategoryList"]["Line"]
	CBColBord = d["CategoryList"]["BorderLine"]

	if panel.Depressed or panel.m_bSelected then
		CBCol = d["CategoryList"]["Select"]
		CBColBord = d["CategoryList"]["BorderSelect"]
	end
	
	if panel.Hovered and not panel.m_bSelected then
		CBCol = d["CategoryList"]["Hover"]
		CBColBord = d["CategoryList"]["BorderHover"]
	end

	if d["CategoryList"]["BtnBorderSize"] ~= 0 then
		draw.RoundedBox(d["CategoryList"]["BtnCornerRadius"], 0, 0, w, h, CBColBord)
	end

	draw.RoundedBox(d["CategoryList"]["BtnCornerRadius"], d["CategoryList"]["BtnBorderSize"], d["CategoryList"]["BtnBorderSize"], w -d["CategoryList"]["BtnBorderSize"] *2, h -d["CategoryList"]["BtnBorderSize"] *2, CBCol)

end
