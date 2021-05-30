-------------------------------------------------
-- Namespaces
-------------------------------------------------
local _, core = ...;
-- Parent Config Frame
core.Config = {} -- ads Config table to addon namespace
local Config = core.Config
local UIConfig

-------------------------------------------------
-- Defaults (usually a database!)
-------------------------------------------------
local defaults = {
    theme = {
	r = 0,
	g = 0.8,
	b = 1,
	hex = '00ccff',
    }
}

function Config:CreateButton(point, name, relativeFrame, relativePoint, yOffset, text)
    name = name or nil
    local btn = CreateFrame('Button', name, UIConfig, 'GameMenuButtonTemplate')
    btn:SetPoint(point, relativeFrame, relativePoint, 0, yOffset)
    btn:SetSize(140, 40)
    btn:SetText(text)
    btn:SetNormalFontObject('GameFontNormalLarge')
    btn:SetHighlightFontObject('GameFontNormalLarge')
    return btn
end

function Config:CreateMenu()
    UIConfig = CreateFrame('Frame', 'SepUI_Options', UIParent, 'BasicFrameTemplateWithInset')
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
    UIConfig.saveBtn = self:CreateButton('center', 'save', UIConfig, 'top', -80, 'Save')
    -- Reset Options Button
    UIConfig.resetBtn = self:CreateButton('center', 'reset', UIConfig.saveBtn, 'center', -48, 'Reset')
    -- Reload UI Button
    UIConfig.reloadBtn = self:CreateButton('center', 'reload', UIConfig.resetBtn, 'center', -48,' Reload UI')
    -- Slider 1
    UIConfig.slider1 = CreateFrame('Slider', 'slider1', UIConfig, 'OptionsSliderTemplate')
    UIConfig.slider1:SetPoint('center', UIConfig, 'bottom', 0, 140)
    UIConfig.slider1:SetMinMaxValues(0,100)
    UIConfig.slider1:SetValue(50)

    -- Slider 2
    UIConfig.slider2 = CreateFrame('Slider', 'slider2', UIConfig, 'OptionsSliderTemplate')
    UIConfig.slider2:SetPoint('center', UIConfig.slider1, 'center', 0, -36)
    UIConfig.slider2:SetMinMaxValues(0,100)
    UIConfig.slider2:SetValue(50)

    -- Check Button 1
    UIConfig.checkButton1 = CreateFrame('CheckButton', nil, UIConfig, 'UICheckButtonTemplate')
    UIConfig.checkButton1:SetPoint('topleft', UIConfig.slider1, 'bottomleft', -10, -44)
    UIConfig.checkButton1.text:SetText('Are you Sep?')

    return UIConfig
end
