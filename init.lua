SLASH_FRAMESTK1 = '/fs' -- For quicker access to framestack
SlashCmdList.FRAMESTK = function()
    LoadAddOn('Blizzard_DebugTools')
    FrameStackTooltip_Toggle()
end

-- Lets me use left/right arrow keys in the edit box w/o rotating your toon
for i =1, NUM_CHAT_WINDOWS do
    _G['ChatFrame'..i..'EditBox']:SetAltArrowKeyMode(false)
end
-------------------------------------------------------------------------------
-- Parent Config Frame
local SepUI_Config = CreateFrame('Frame', 'SepUI_Options', UIParent, 'BasicFrameTemplateWithInset')
SepUI_Config:SetSize(300,360) -- width, height
SepUI_Config:SetPoint('center', UIParent, 'center') -- point, relativeFrame, relativePoint

-- Title text
SepUI_Config.title = SepUI_Config:CreateFontString(nil, 'OVERLAY')
SepUI_Config.title:SetFontObject('GameFontHighlight')
-- SepUI_Config.TitleBg is an inherited property from BasicFrameTemplate,
-- found at FrameXML/UIPanelTemplates.xml
SepUI_Config.title:SetPoint('left', SepUI_Config.TitleBg, 'left', 5, 0)
SepUI_Config.title:SetText('SepUI - Options')

-------------------------------- Buttons --------------------------------------
-- UI Save Button
SepUI_Config.saveButton = CreateFrame('Button', 'saveBtn', SepUI_Config, 'GameMenuButtonTemplate')
SepUI_Config.saveButton:SetPoint('center', SepUI_Config, 'top', 0, -80)
SepUI_Config.saveButton:SetSize(140,40)
SepUI_Config.saveButton:SetText('Save')
SepUI_Config.saveButton:SetNormalFontObject('GameFontNormalLarge')
SepUI_Config.saveButton:SetHighlightFontObject('GameFontNormalLarge')

-- Reset Options Button
SepUI_Config.resetButton = CreateFrame('Button', 'resetBtn', SepUI_Config, 'GameMenuButtonTemplate')
SepUI_Config.resetButton:SetPoint('center', SepUI_Config.saveButton, 'top', 0, -68)
SepUI_Config.resetButton:SetSize(140,40)
SepUI_Config.resetButton:SetText('Reset')
SepUI_Config.resetButton:SetNormalFontObject('GameFontNormalLarge')
SepUI_Config.resetButton:SetHighlightFontObject('GameFontNormalLarge')

-- Reload UI Button
SepUI_Config.reloadButton = CreateFrame('Button', 'reloadBtn', SepUI_Config, 'GameMenuButtonTemplate')
SepUI_Config.reloadButton:SetPoint('center', SepUI_Config.resetButton, 'top', 0, -68) 
SepUI_Config.reloadButton:SetSize(140,40)
SepUI_Config.reloadButton:SetText('Reload UI')
SepUI_Config.reloadButton:SetNormalFontObject('GameFontNormalLarge')
SepUI_Config.reloadButton:SetHighlightFontObject('GameFontNormalLarge')

-- Slider 1
SepUI_Config.slider1 = CreateFrame('Slider', 'slider1', SepUI_Config, 'OptionsSliderTemplate')
SepUI_Config.slider1:SetPoint('center', SepUI_Config, 'bottom', 0, 140)
SepUI_Config.slider1:SetMinMaxValues(0,100)
SepUI_Config.slider1:SetValue(50)

-- Slider 2
SepUI_Config.slider2 = CreateFrame('Slider', 'slider2', SepUI_Config, 'OptionsSliderTemplate')
SepUI_Config.slider2:SetPoint('center', SepUI_Config.slider1, 'center', 0, -36)
SepUI_Config.slider2:SetMinMaxValues(0,100)
SepUI_Config.slider2:SetValue(50)

-- Check Button 1
SepUI_Config.checkButton1 = CreateFrame('CheckButton', nil, SepUI_Config, 'UICheckButtonTemplate')
SepUI_Config.checkButton1:SetPoint('topleft', SepUI_Config.slider1, 'bottomleft', -10, -44)
SepUI_Config.checkButton1.text:SetText('Are you Sep?')
