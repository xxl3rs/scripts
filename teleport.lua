-- New example script written by wally
-- You can suggest changes with a pull request or something

local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'Gui',
    Center = true,
    AutoShow = false,
    TabPadding = 8,
    MenuFadeTime = 0.2
})
Library:Notify("Loaded!", 5)
local tps = game:GetService("TeleportService")
local AssetService = game:GetService("AssetService")
local plr = game:GetService("Players").LocalPlayer
local placePages = AssetService:GetGamePlacesAsync()
local list = {}
local list2 = {}
while true do
	for _, place in placePages:GetCurrentPage() do
        list[place.Name] = place.PlaceId
	end
	if placePages.IsFinished then
		break
	end
	placePages:AdvanceToNextPageAsync()
end
for i,v in next, list do
    list2[v] = i
end

local Tabs = {
    -- Creates a new tab titled Main
    Main = Window:AddTab('Main'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

-- Groupbox and Tabbox inherit the same functions
-- except Tabboxes you have to call the functions on a tab (Tabbox:AddTab(name))
local LeftGroupBox = Tabs.Main:AddLeftGroupbox('Groupbox')



LeftGroupBox:AddButton({
    Text = 'Current Place',
    Func = function()
        local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
        Library:Notify("Name: "..GameName..", PlaceId: "..game.PlaceId,5)
    end,
    DoubleClick = false,
    Tooltip = 'Gives u the current PlaceId and game name'
})

LeftGroupBox:AddInput('MyTextbox', {
    Default = 'Teleport',
    Numeric = true, -- true / false, only allows numbers
    Finished = true, -- true / false, only calls callback when you press enter

    Text = 'Teleport',
    Tooltip = 'Teleport to a place via PlaceId', -- Information shown when you hover over the textbox

    Placeholder = 'Put in PlaceId',

    Callback = function(Value)
        tps:Teleport(Value,plr)
    end
})

LeftGroupBox:AddDropdown('MyDropdown', {
    Values = list2,
    Default = 1, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected

    Text = 'Teleport dropdown',
    Tooltip = 'Places in the universe', -- Information shown when you hover over the dropdown

    Callback = function(Value)
        tps:Teleport(list[Value],plr)
    end
})

Library:SetWatermarkVisibility(false)


Library.KeybindFrame.Visible = false; 

-- UI Settings
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

-- I set NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'LeftBracket', NoUI = true, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs['UI Settings'])

ThemeManager:ApplyToTab(Tabs['UI Settings'])

SaveManager:LoadAutoloadConfig()
queueonteleport([[
-- New example script written by wally
-- You can suggest changes with a pull request or something

local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'Gui',
    Center = true,
    AutoShow = false,
    TabPadding = 8,
    MenuFadeTime = 0.2
})
Library:Notify("Loaded!", 5)
local tps = game:GetService("TeleportService")
local AssetService = game:GetService("AssetService")
local plr = game:GetService("Players").LocalPlayer
local placePages = AssetService:GetGamePlacesAsync()
local list = {}
local list2 = {}
while true do
	for _, place in placePages:GetCurrentPage() do
        list[place.Name] = place.PlaceId
	end
	if placePages.IsFinished then
		break
	end
	placePages:AdvanceToNextPageAsync()
end
for i,v in next, list do
    list2[v] = i
end

local Tabs = {
    -- Creates a new tab titled Main
    Main = Window:AddTab('Main'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

-- Groupbox and Tabbox inherit the same functions
-- except Tabboxes you have to call the functions on a tab (Tabbox:AddTab(name))
local LeftGroupBox = Tabs.Main:AddLeftGroupbox('Groupbox')



LeftGroupBox:AddButton({
    Text = 'Current Place',
    Func = function()
        local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
        Library:Notify("Name: "..GameName..", PlaceId: "..game.PlaceId,5)
    end,
    DoubleClick = false,
    Tooltip = 'Gives u the current PlaceId and game name'
})

LeftGroupBox:AddInput('MyTextbox', {
    Default = 'Teleport',
    Numeric = true, -- true / false, only allows numbers
    Finished = true, -- true / false, only calls callback when you press enter

    Text = 'Teleport',
    Tooltip = 'Teleport to a place via PlaceId', -- Information shown when you hover over the textbox

    Placeholder = 'Put in PlaceId',

    Callback = function(Value)
        tps:Teleport(Value,plr)
    end
})

LeftGroupBox:AddDropdown('MyDropdown', {
    Values = list2,
    Default = 1, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected

    Text = 'Teleport dropdown',
    Tooltip = 'Places in the universe', -- Information shown when you hover over the dropdown

    Callback = function(Value)
        tps:Teleport(list[Value],plr)
    end
})

Library:SetWatermarkVisibility(false)


Library.KeybindFrame.Visible = false; 

-- UI Settings
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

-- I set NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'LeftBracket', NoUI = true, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs['UI Settings'])

ThemeManager:ApplyToTab(Tabs['UI Settings'])

SaveManager:LoadAutoloadConfig()
]])
