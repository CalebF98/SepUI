local _, core = ...

function core:init(event, name)
    -- Lets me use left/right arrow keys in the edit box w/o rotating your toon
    for i =1, NUM_CHAT_WINDOWS do
	_G['ChatFrame'..i..'EditBox']:SetAltArrowKeyMode(false)
    end

    SLASH_FRAMESTK1 = '/fs' -- For quicker access to framestack
    SlashCmdList.FRAMESTK = function()
	LoadAddOn('Blizzard_DebugTools')
	FrameStackTooltip_Toggle()
    end

    -- Load options menu
    core.Config:CreateMenu()
end

local events = CreateFrame('Frame')
events:RegisterEvent('ADDON_LOADED')
events:SetScript('OnEvent', core.init)
