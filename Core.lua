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
local UIConfig = CreateFrame('Frame', 'SepUI_BuffFrame', UIParent, 'BasicFrameTemplateWithInset')
UIConfig:SetSize(300,360) -- width, height
UIConfig:SetPoint('center', UIParent, 'center') -- point, relativeFrame, relativePoint

-- Title text
UIConfig.title = UIConfig:CreateFontString(nil, 'OVERLAY')
UIConfig.title:SetFontObject('GameFontHighlight')
-- UIConfig.TitleBg is an inherited property from BasicFrameTemplate,
-- found at FrameXML/UIPanelTemplates.xml
UIConfig.title:SetPoint('left', UIConfig.TitleBg, 'left', 5, 0)
UIConfig.title:SetText('SepUI - Options')

-------------------------------- Buttons --------------------------------------
-- UI Save Button
UIConfig.saveButton = CreateFrame('Button', 'saveBtn', UIConfig, 'GameMenuButtonTemplate')
UIConfig.saveButton:SetPoint('center', UIConfig, 'top', 0, -70)
UIConfig.saveButton:SetSize(140,40)
UIConfig.saveButton:SetText('Save')
UIConfig.saveButton:SetNormalFontObject('GameFontNormalLarge')
UIConfig.saveButton:SetHighlightFontObject('GameFontNormalLarge')