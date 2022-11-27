local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()


-- Load local HWID data
local HWIDWhitelist = loadstring(game:HttpGet("", true))()
local HWIDBlacklist = loadstring(game:HttpGet("", true))()
local HWID = game:GetService("RbxAnalyticsService"):GetClientId()

-- Check if Client ID is in whitelist

for i,v in pairs(HWIDWhitelist) do
    if v == HWID then
        -- Execute Key System Script & Send OrionLib Notification
        OrionLib:MakeNotification({
            Name = "CGB Whitelist",
            Content = "Your whitelist has been found, "..game.Players.LocalPlayer.DisplayName.."!",
            Time = 5
        })
    else
        -- Send OrionLib Notification
        OrionLib:MakeNotification({
            Name = "CGB Whitelist",
            Content = game.Players.LocalPlayer.Discord..", your whitelist was not found\nIf you are registered, please create a ticket in Discord.",
            Time = 5
        })
        -- Create ticket in Discord to reset HWID
        wait(10)
        game.Players.LocalPlayer:Kick("You are not whitelisted")
    end
end

-- Check if Client ID is in blacklist

for i,v in pairs(HWIDBlacklist) do
    if v == HWID then
        wait(5)
        game.Players.LocalPlayer:Kick("You are blacklisted")
    end
end