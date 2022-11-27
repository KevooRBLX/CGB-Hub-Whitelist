local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()


-- Load local HWID data
local HWIDWhitelist = loadstring(game:HttpGet("https://github.com/CGB-CoolGamerBoy/CGB-Hub-Whitelist/raw/main/HWID_Whitelist.lua"))()
local HWIDBlacklist = loadstring(game:HttpGet("https://raw.githubusercontent.com/CGB-CoolGamerBoy/CGB-Hub-Whitelist/main/HWID_Blacklist.lua"))()
local HWID = game:GetService("RbxAnalyticsService"):GetClientId()

-- Check if Client ID is in whitelist

for i,v in pairs(HWIDWhitelist) do
    if v == HWID then
        -- Execute Key System Script & Send OrionLib Notification
        OrionLib:MakeNotification({
            Name = "CGB Whitelist",
            Content = "Your whitelist has been found, "..game.Players.LocalPlayer.DisplayName.."!",
            Time = 10
        })
        wait(2)
        OrionLib:MakeNotification({
            Name = "CGB Whitelist",
            Content = "Your whitelist has been found, "..game.Players.LocalPlayer.DisplayName.."!",
            Time = 10
        })
        wait(5)
        OrionLib:Destroy()
        wait(5)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CGB-CoolGamerBoy/CGBHub/main/main.lua", true))()
    else
        -- Send OrionLib Notification
        OrionLib:MakeNotification({
            Name = "CGB Whitelist",
            Content = game.Players.LocalPlayer.DisplayName..", your whitelist was not found\nIf you are registered, please create a ticket in Discord.",
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

OrionLib:Init()