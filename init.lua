SLASH_FRAMESTK1 = '/fs' -- For quicker access to framestack
SlashCmdList.FRAMESTK = function()
    LoadAddOn('Blizzard_DebugTools')
    FrameStackTooltip_Toggle()
end

-- Lets me use left/right arrow keys in the edit box w/o rotating your toon
for i =1, NUM_CHAT_WINDOWS do
    _G['ChatFrame'..i..'EditBox']:SetAltArrowKeyMode(false)
end

