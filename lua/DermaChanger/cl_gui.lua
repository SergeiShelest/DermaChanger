local PANEL = {}

local function Menu()
	local function LoadTheme()
		PANEL.Open = vgui.Create("DFrame")
		PANEL.Open:SetSize(600, 650)
		PANEL.Open:SetSizable(false)
		PANEL.Open:Center()
		PANEL.Open:MakePopup()
		PANEL.Open:SetTitle("Open")

		PANEL.Open.Browser = vgui.Create("DFileBrowser", PANEL.Open)
		PANEL.Open.Browser:SetPos(0, 25)
		PANEL.Open.Browser:SetSize(600, 650)
		PANEL.Open.Browser:SetPath("GAME")
		PANEL.Open.Browser:SetBaseFolder("data/dermachanger/themes")
		PANEL.Open.Browser:SetOpen(true)
		PANEL.Open.Browser:SetCurrentFolder("persist")
		
		function PANEL.Open.Browser:OnSelect(path, pnl)
			local f = file.Read(path, "GAME")
			DCLoadTheme(d, util.JSONToTable(f))
		end
	end

	local function SaveTheme()
		PANEL.Save = vgui.Create("DFrame")
		PANEL.Save:SetSize(400, 55)
		PANEL.Save:SetSizable(false)
		PANEL.Save:Center()
		PANEL.Save:MakePopup()
		PANEL.Save:SetTitle("Save")

		PANEL.Save.TextEntry = vgui.Create("DTextEntry", PANEL.Save)
		PANEL.Save.TextEntry:SetPos(5, 25)
		PANEL.Save.TextEntry:SetSize(350, 25)

		PANEL.Save.Button = vgui.Create("DButton", PANEL.Save)
		PANEL.Save.Button:SetPos(360, 25)
		PANEL.Save.Button:SetSize(35, 25)
		PANEL.Save.Button:SetText("Save")
		PANEL.Save.Button.DoClick = function()
			local tab = util.TableToJSON(d)
			local name = PANEL.Save.TextEntry:GetValue()
			
			file.CreateDir("dermachanger/themes")
			file.Write("dermachanger/themes/"..name..".txt", tab)

			PANEL.Save:Remove()
		end
	end

	local function Settings()
		SetAutoLoad = vgui.Create("DButton", PANEL.Panel)
		SetAutoLoad:SetPos(30, 20)
		SetAutoLoad:SetSize(150, 28)
		SetAutoLoad:SetText("Set as startup")
		SetAutoLoad.DoClick = function()
			file.Write("dermachanger/al.txt", util.TableToJSON(d))
		end

		SetAutoLoad = vgui.Create("DButton", PANEL.Panel)
		SetAutoLoad:SetPos(30, 54)
		SetAutoLoad:SetSize(150, 28)
		SetAutoLoad:SetText("Remove startup")
		SetAutoLoad.DoClick = function()
			file.Write("dermachanger/al.txt", "{}")
		end
	end

	local function SettingColor(x, y, Label, value, value2)

		local col = d[ value ][ value2 ]
		
		local label = vgui.Create("DLabel", PANEL.Panel) 
		label:SetPos(x +35, y)
		label:SetText(Label)
		label:SizeToContents()

		local button = vgui.Create("DButton", PANEL.Panel)
		button:SetPos(x, y)
		button:SetSize(20, 20)
		button:SetText("")
		
		button.DoClick = function()
			local Frame = vgui.Create("DFrame")
			Frame:SetSize(265, 300)
			Frame:SetTitle(Label)
			Frame:SetSizable(false)
			Frame:Center()
			Frame:MakePopup()

			local Mixer = vgui.Create("DColorMixer", Frame)
			Mixer:SetPos(5, 30)
			Mixer:SetPalette(true)
			Mixer:SetAlphaBar(true)
			Mixer:SetWangs(true)
			Mixer:SetColor(col)

			local MixerButton = vgui.Create("DButton", Frame)
			MixerButton:SetPos(0, 265)
			MixerButton:SetSize(265, 35)
			MixerButton:SetText("OK")
			MixerButton.DoClick = function()
				col = Mixer:GetColor()			
				d[ value ][ value2 ] = col
			end
		end

		button.Paint = function(self, w, h)
			draw.RoundedBox(10, 0, 0, w, h, col)
		end
	end

	local function SettingInt(x, y, Label, value, value2)

		local int = d[ value ][ value2 ]

		local label = vgui.Create("DLabel", PANEL.Panel)
		label:SetPos(x +35, y)
		label:SetText(Label)
		label:SizeToContents()

		local button = vgui.Create("DButton", PANEL.Panel)
		button:SetPos(x, y)
		button:SetSize(20, 20)
		button:SetText(int)
		button.DoClick = function()
			local Frame = vgui.Create("DFrame")
			Frame:SetSize(265, 200)
			Frame:SetTitle(Label)
			Frame:SetSizable(false)
			Frame:Center()
			Frame:MakePopup()

			local NumSlider = vgui.Create("DNumSlider", Frame)
			NumSlider:SetText(Label)
			NumSlider:SetPos(5, 30)
			NumSlider:SetMin(0)
			NumSlider:SetMax(32)
			NumSlider:SetDecimals(0)
			NumSlider:SetSize(250, 100)
			NumSlider:SetValue(int)

			local NumSliderButton = vgui.Create("DButton", Frame)
			NumSliderButton:SetPos(0, 165)
			NumSliderButton:SetSize(265, 35)
			NumSliderButton:SetText("OK")
			NumSliderButton.DoClick = function()
				int = math.floor(NumSlider:GetValue())
				d[ value ][ value2 ] = int
				button:SetText(int)
			end
		end

		button.Paint = function (self, w, h)
			draw.RoundedBox(10, 0, 0, w, h, Color(50, 50, 50))
		end
	end

	local function SettingStr(x, y, Label, value, value2)

		local str = d[ value ][ value2 ]

		local label = vgui.Create("DLabel", PANEL.Panel)
		label:SetPos(x +35, y)
		label:SetText(Label)
		label:SizeToContents()

		local button = vgui.Create("DButton", PANEL.Panel)
		button:SetPos(x, y)
		button:SetSize(20, 20)
		button:SetText("STR")
		button.DoClick = function()
			local Frame = vgui.Create("DFrame")
			Frame:SetSize(400, 55)
			Frame:SetSizable(false)
			Frame:Center()
			Frame:MakePopup()
			Frame:SetTitle(Label)

			local TextEntry = vgui.Create("DTextEntry", Frame)
			TextEntry:SetPos(5, 25)
			TextEntry:SetSize(350, 25)
			TextEntry:SetText(str)

			local button = vgui.Create("DButton", Frame)
			button:SetPos(360, 25)
			button:SetSize(35, 25)
			button:SetText("ОК")
			button.DoClick = function()
				d[ value ][ value2 ] = TextEntry:GetValue()
			end
		end

		button.Paint = function (self, w, h)
			draw.RoundedBox(10, 0, 0, w, h, Color(50, 50, 50))
		end
	end

	local function label(x, y, text)
		local label = vgui.Create("DLabel", PANEL.Panel)
		label:SetPos(x, y)
		label:SizeToContents()
		label:SetText(text)
	end

	local function welcomePage()
		local label = vgui.Create("DLabel", PANEL.Panel)
		label:SetText("Welcome")
		label:SetFont("DermaLarge")
		label:SetPos(30, 30)
		label:SizeToContents()

		local label1 = vgui.Create("DLabel", PANEL.Panel)
		label1:SetText("Author:")
		label1:SetFont("DermaDefaultBold")
		label1:SetPos(40, 70)
		label1:SizeToContents()

		local label2 = vgui.Create("DLabelURL", PANEL.Panel)
		label2:SetText("Shelest_ (Steam)(steamcommunity.com/profiles/76561198171200633)")
		label2:SetURL("http://steamcommunity.com/profiles/76561198171200633")
		label2:SetColor(Color(0, 119, 255))
		label2:SetPos(40, 85)
		label2:SizeToContents()

		local label3 = vgui.Create("DLabelURL", PANEL.Panel)
		label3:SetText("SergeiShelest (GitHub)(github.com/SergeiShelest)")
		label3:SetURL("https://github.com/SergeiShelest")
		label3:SetColor(Color(0, 119, 255))
		label3:SetPos(40, 100)
		label3:SizeToContents()

		local label4 = vgui.Create("DLabel", PANEL.Panel)
		label4:SetText("Source:")
		label4:SetFont("DermaDefaultBold")
		label4:SetPos(40, 140)
		label4:SizeToContents()

		local label5 = vgui.Create("DLabelURL", PANEL.Panel)
		label5:SetText("GitHub (github.com/SergeiShelest/DermaChanger)")
		label5:SetURL("https://github.com/SergeiShelest/DermaChanger")
		label5:SetColor(Color(0, 119, 255))
		label5:SetPos(40, 155)
		label5:SizeToContents()
	end

	PANEL.Base = vgui.Create("DFrame")
	PANEL.Base:SetPos(ScrW() /2 -450, ScrH() /2 -300)
	PANEL.Base:SetSize(900, 600)
	PANEL.Base:SetTitle("DermaChanger")
	PANEL.Base:MakePopup()
	PANEL.Base:SetVerticalScrollbarEnabled(true)

	PANEL.Panel = vgui.Create("DScrollPanel", PANEL.Base)
	PANEL.Panel:SetPos(160, 30)
	PANEL.Panel:SetSize(900 -165, 565)
	PANEL.Panel:SetVerticalScrollbarEnabled(true)

	PANEL.Elements = vgui.Create("DTree", PANEL.Base)
	PANEL.Elements:SetPos(5, 30)
	PANEL.Elements:SetSize(150, 465)

	PANEL.Save = vgui.Create("DButton", PANEL.Base)
	PANEL.Save:SetPos(5, 465 +5+30)
	PANEL.Save:SetSize(150, 28)
	PANEL.Save:SetText("Save")
	PANEL.Save.DoClick = function()
		SaveTheme()
	end

	PANEL.Open = vgui.Create("DButton", PANEL.Base)
	PANEL.Open:SetPos(5, 465 +10+30+28)
	PANEL.Open:SetSize(150, 28)
	PANEL.Open:SetText("Open")
	PANEL.Open.DoClick = function()
		LoadTheme()
	end

	PANEL.Settings = vgui.Create("DButton", PANEL.Base)
	PANEL.Settings:SetPos(5, 465 +15+30+28+28)
	PANEL.Settings:SetSize(150, 28)
	PANEL.Settings:SetText("Settings")
	PANEL.Settings.DoClick = function()
		PANEL.Panel:Clear()
		Settings()
	end

	welcomePage()

	local components = table.GetKeys(d)

	for _, component in pairs(components) do

		PANEL.Elements[component] = PANEL.Elements:AddNode(t[component]["TITLE"], "icon16/application_view_tile.png")
		PANEL.Elements[component].DoClick = function()

			local px = 0
			local py = 0

			PANEL.Panel:Clear()

			for key, settting in pairs(d[component]) do
				if TypeID(settting) == TYPE_NUMBER then
					SettingInt(10 + py, px, t[component][key], component, key)
				end

				if TypeID(settting) == TYPE_STRING then
					SettingStr(10 + py, px, t[component][key], component, key)
				end

				if TypeID(settting) == TYPE_TABLE then
					SettingColor(10 + py, px, t[component][key], component, key)
				end

				py = py + 250

				if py == 750 then
				    py = 0
				    px = px + 30
				end
			end
		end
	end
end

concommand.Add("dceditor", function(ply, cmd, args)
	if !IsValid(PANEL.Base) then
		Menu()
	else
		print("[DermaChanger] The window already exists")
	end
end )
