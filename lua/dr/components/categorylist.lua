d["CategoryList"] = {}
t["CategoryList"] = {}

t["CategoryList"]["TITLE"] = "Category List"

d["CategoryList"]["Background"] = Color(50, 50, 50)
d["CategoryList"]["BackgroundCornerRadius"] = 0
d["CategoryList"]["Expanded"] = Color(217, 142, 47)
d["CategoryList"]["NotExpanded"] = Color(60, 60, 60)
d["CategoryList"]["TitleCornerRadius"] = 3

t["CategoryList"]["Background"] = "Background"
t["CategoryList"]["BackgroundCornerRadius"] = "Background corner radius"
t["CategoryList"]["Expanded"] = "Expanded"
t["CategoryList"]["NotExpanded"] = "Not expanded"
t["CategoryList"]["TitleCornerRadius"] = "Title corner radius"


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
