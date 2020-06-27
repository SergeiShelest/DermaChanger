DC_d.CategoryList, DC_t.CategoryList = {}, {}

DC_t.CategoryList.TITLE = "Category List"

DC_d.CategoryList.Background, DC_t.CategoryList.Background = Color(50, 50, 50), "Background"
DC_d.CategoryList.Border, DC_t.CategoryList.Border = Color(255, 255, 255), "Border"
DC_d.CategoryList.BorderSize, DC_t.CategoryList.BorderSize = 0, "BorderSize"
DC_d.CategoryList.CornerRadius, DC_t.CategoryList.CornerRadius = 0, "СornerRadius"
DC_d.CategoryList.Expanded, DC_t.CategoryList.Expanded = Color(217, 142, 47), "Expanded"
DC_d.CategoryList.NotExpanded, DC_t.CategoryList.NotExpanded = Color(60, 60, 60), "NotExpanded"
DC_d.CategoryList.BorderExpanded, DC_t.CategoryList.BorderExpanded = Color(255, 255, 255), "BorderExpanded"
DC_d.CategoryList.BorderNotExpanded, DC_t.CategoryList.BorderNotExpanded = Color(255, 255, 255), "BorderNotExpanded"
DC_d.CategoryList.TitleBorderSize, DC_t.CategoryList.TitleBorderSize = 0, "TitleBorderSize"
DC_d.CategoryList.TitleCornerRadius, DC_t.CategoryList.TitleCornerRadius = 3, "TitleCornerRadius"
DC_d.CategoryList.Hover, DC_t.CategoryList.Hover = Color(40, 40, 40), "Hover"
DC_d.CategoryList.Line, DC_t.CategoryList.Line = Color(40, 40, 40), "Line"
DC_d.CategoryList.Select, DC_t.CategoryList.Select = Color(255, 220, 0), "Select"
DC_d.CategoryList.BorderHover, DC_t.CategoryList.BorderHover = Color(255, 191, 0), "BorderHover"
DC_d.CategoryList.BorderLine, DC_t.CategoryList.BorderLine = Color(50, 50, 50), "BorderLine"
DC_d.CategoryList.BorderSelect, DC_t.CategoryList.BorderSelect = Color(50, 50, 50), "BorderSelect"
DC_d.CategoryList.BtnBorderSize, DC_t.CategoryList.BtnBorderSize = 1, "BtnBorderSize"
DC_d.CategoryList.BtnCornerRadius, DC_t.CategoryList.BtnCornerRadius = 3, "BtnCornerRadius"

function SKIN:PaintCategoryList( panel, w, h )
	if DC_d.CategoryList.BorderSize ~= 0 then
		draw.RoundedBox(DC_d.CategoryList.CornerRadius, 0, 0, w, h, DC_d.CategoryList.Border)
	end

	draw.RoundedBox(DC_d.CategoryList.CornerRadius, DC_d.CategoryList.BorderSize, DC_d.CategoryList.BorderSize, w -DC_d.CategoryList.BorderSize *2, h -DC_d.CategoryList.BorderSize *2, DC_d.CategoryList.Background)
end

function SKIN:PaintCollapsibleCategory( panel, w, h )
	if panel:GetExpanded() then
		if DC_d.CategoryList.TitleBorderSize ~= 0 then
			draw.RoundedBox(DC_d.CategoryList.TitleCornerRadius, 0, 0, w, 20, DC_d.CategoryList.BorderExpanded)
		end

		draw.RoundedBox(DC_d.CategoryList.TitleCornerRadius, DC_d.CategoryList.TitleBorderSize, DC_d.CategoryList.TitleBorderSize, w -DC_d.CategoryList.TitleBorderSize *2, 20 -DC_d.CategoryList.TitleBorderSize *2, DC_d.CategoryList.Expanded)
	else
		if DC_d.CategoryList.TitleBorderSize ~= 0 then
			draw.RoundedBox(DC_d.CategoryList.TitleCornerRadius, 0, 0, w, h, DC_d.CategoryList.BorderNotExpanded)
		end
	
		draw.RoundedBox(DC_d.CategoryList.TitleCornerRadius, DC_d.CategoryList.TitleBorderSize, DC_d.CategoryList.TitleBorderSize, w -DC_d.CategoryList.TitleBorderSize *2, h -DC_d.CategoryList.TitleBorderSize *2, DC_d.CategoryList.NotExpanded)
	end
end

local CBCol = Color(0, 0, 0, 0)
local CBColBord = Color(0, 0, 0, 0)

function SKIN:PaintCategoryButton( panel, w, h )
	CBCol = DC_d.CategoryList.Line
	CBColBord = DC_d.CategoryList.BorderLine

	if panel.Depressed or panel.m_bSelected then
		CBCol = DC_d.CategoryList.Select
		CBColBord = DC_d.CategoryList.BorderSelect
	end
	
	if panel.Hovered and not panel.m_bSelected then
		CBCol = DC_d.CategoryList.Hover
		CBColBord = DC_d.CategoryList.BorderHover
	end

	if DC_d.CategoryList.BtnBorderSize ~= 0 then
		draw.RoundedBox(DC_d.CategoryList.BtnCornerRadius, 0, 0, w, h, CBColBord)
	end

	draw.RoundedBox(DC_d.CategoryList.BtnCornerRadius, DC_d.CategoryList.BtnBorderSize, DC_d.CategoryList.BtnBorderSize, w -DC_d.CategoryList.BtnBorderSize *2, h -DC_d.CategoryList.BtnBorderSize *2, CBCol)
end
