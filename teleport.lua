local repo = 'https://raw.githubusercontent.com/xxl3rs/mainlib/main'

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
    Main = Window:AddTab('Main'),
    ['UI Settings'] = Window:AddTab('UI Settings'),
}
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
    Numeric = true,
    Finished = true,

    Text = 'Teleport',
    Tooltip = 'Teleport to a place via PlaceId',

    Placeholder = 'Put in PlaceId',

    Callback = function(Value)
        tps:Teleport(Value,plr)
    end
})

LeftGroupBox:AddDropdown('MyDropdown', {
    Values = list2,
    Default = 1,
    Multi = false,

    Text = 'Teleport dropdown',
    Tooltip = 'Places in the universe',

    Callback = function(Value)
        tps:Teleport(list[Value],plr)
    end
})

Library:SetWatermarkVisibility(false)


Library.KeybindFrame.Visible = false; 

local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'LeftBracket', NoUI = true, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

SaveManager:BuildConfigSection(Tabs['UI Settings'])

ThemeManager:ApplyToTab(Tabs['UI Settings'])

SaveManager:LoadAutoloadConfig()
queueonteleport([[
loadstring(game:HttpGet("https://raw.githubusercontent.com/xxl3rs/scripts/refs/heads/main/teleport.lua"))()
]])
