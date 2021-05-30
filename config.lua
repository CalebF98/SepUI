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

function Config:Toggle()
    local menu = UIConfig or Config:CreateMenu()
    menu:SetShown(not menu:IsShown())
end

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

function Config:CreateCheckbox(point, name, relativeFrame, relativePoint, xOffset, yOffset, text)
    local btn = CreateFrame('CheckButton', name, UIConfig, 'UICheckButtonTemplate')
    btn:SetPoint(point, relativeFrame, relativePoint, xOffset, yOffset)  
    btn.text:SetText(text)

    return btn
end

function Config:CreateSlider(point, name, relativeFrame, relativePoint, yOffset, min, max, default)
    min = min or 0
    max = max or 100
    default = default or 50

    local slider = CreateFrame('Slider', name, UIConfig, 'OptionsSliderTemplate') 
    slider:SetPoint('center', relativeFrame, relativePoint, 0, yOffset)
    slider:SetMinMaxValues(min, max)
    slider:SetValue(default)

    return slider
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
    UIConfig.slider1 = self:CreateSlider('center', 'slider1', UIConfig.reloadBtn, 'center', -40)
    -- Slider 2
    UIConfig.slider2 = self:CreateSlider('center', 'slider2', UIConfig.slider1, 'center', -40)
    -- Check Button 1
    UIConfig.checkBox1 = self:CreateCheckbox('topleft', 'checkBtn', UIConfig.slider1, 'bottomleft', -10, -48, 'Are you Sepulchre?')
    --UIConfig.checkButton1:SetPoint('topleft', UIConfig.slider1, 'bottomleft', -10, -44)
    --UIConfig.checkButton1.text:SetText('Are you Sep?')
    
    UIConfig:Hide()
    return UIConfig
end
