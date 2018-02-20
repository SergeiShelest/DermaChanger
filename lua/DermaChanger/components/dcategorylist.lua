d["CategoryList"], t["CategoryList"] = {}, {}

t["CategoryList"]["TITLE"] = "Category List"

d["CategoryList"]["Background"], t["CategoryList"]["Background"] = Color(50, 50, 50), "Background"
d["CategoryList"]["BackgroundCornerRadius"], t["CategoryList"]["BackgroundCornerRadius"] = 0, "Background corner radius"
d["CategoryList"]["Expanded"], t["CategoryList"]["Expanded"] = Color(217, 142, 47), "Expanded"
d["CategoryList"]["NotExpanded"], t["CategoryList"]["NotExpanded"] = Color(60, 60, 60), "Not expanded"
d["CategoryList"]["TitleCornerRadius"], t["CategoryList"]["TitleCornerRadius"] = 3, "Title corner radius"

function SKIN:PaintCategoryList( panel, w, h )

	draw.RoundedBox(d["CategoryList"]["BackgroundCornerRadius"], 0, 0, w, h, d["CategoryList"]["Background"])

end

function SKIN:PaintCollapsibleCategory( panel, w, h )

	if ( panel:GetExpanded() ) then
		draw.RoundedBox(d["CategoryList"]["TitleCornerRadius"], 0, 0, w, 20, d["CategoryList"]["Expanded"])
	else
		draw.RoundedBox(d["CategoryList"]["TitleCornerRadius"], 0, 0, w, h, d["CategoryList"]["NotExpanded"])
	end
		
end
