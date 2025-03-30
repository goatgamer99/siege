local repo = 'https://raw.githubusercontent.com/goatgamer99/library/refs/heads/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    Title = 'kitten.kys',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.4
})

getgenv().MainTab = Window:AddTab('Main')
getgenv().MiscTab = Window:AddTab('Misc')

local MiscellaneousGroup = getgenv().MiscTab:AddRightGroupbox('Miscellaneous')

MiscellaneousGroup:AddButton("Unload", function()
    Library:Unload()
end)

MiscellaneousGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {
    Default = "End",
    NoUI = true,
    Text = "Menu keybind"
})
Library.ToggleKeybind = Options.MenuKeybind

Library:OnUnload(function()
    Library.Unloaded = true
end)

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })
ThemeManager:SetFolder('victimisgay')
SaveManager:SetFolder('victimisgay/runeslayer')
SaveManager:BuildConfigSection(getgenv().MiscTab)
ThemeManager:ApplyToTab(getgenv().MiscTab)
SaveManager:LoadAutoloadConfig()
