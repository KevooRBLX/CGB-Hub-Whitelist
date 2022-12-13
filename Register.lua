-- Registeration Script

Webhook_URL = "https://discord.com/api/webhooks/1045952435128107019/wl7bceDv_GEl2Yep0oQcLelh8MgWtUfNPJeOec-G18qB_v3UcJfh28GjmRwnmMTl7g8R"
HttpService = game:GetService("HttpService")

function Http(HttpReq)
    if syn then 
        syn.request(HttpReq)
    elseif identifyexecutor() then
        request(HttpReq)
    else
        game.Players.LocalPlayer:Kick("CGB Error: 1")
    end
end

local Asset = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

local RobloxUrl = "https://roblox.com/"
local GameUrl = RobloxUrl.."games/"..game.PlaceId
local ProfileUrl = RobloxUrl.."profile/"..game.Players.LocalPlayer.UserId
local GameValue = "["..Asset.Name.."]("..GameUrl..")"

local exploitcheck =
   syn and "Synapse X" or
   getexecutorname() and "Script Ware" or "Fluxus"

local exploiturl =
    syn and "https://x.synapse.to" or
    getexecutorname() and "https://scriptware.com" or "https://fluxteam.net"

local ExpValue = 
    "["..exploitcheck.."]("..exploiturl..")"


local url = Webhook_URL
local msgData = {
    ["content"] = '@everyone',
    ["embeds"] = {{
        ["title"] = "**CGB User Detected**",
        ["description"] = "["..game.Players.LocalPlayer.Name.."]("..ProfileUrl..") has executed CGB Hub",
        ["type"] = "rich",
        ["color"] = tonumber(0xffffff),
        ["fields"] = {
            {
                ["name"] = "Hardware ID:",
                ["value"] = game:GetService("RbxAnalyticsService"):GetClientId(),
                ["inline"] = true
            },
            {
                ["name"] = "Executor:",
                ["value"] = ExpValue,
                ["inline"] = false
            },
            {
                ["name"] = "Executed In:",
                ["value"] = GameValue,
                ["inline"] = false
            }
        }
    }}
}
local newdata = game:GetService("HttpService"):JSONEncode(msgData)

local headers = {
   ["content-type"] = "application/json"
}

local sendMsg = {Url = url, Body = newdata, Method = "POST", Headers = headers}
Http(sendMsg)

wait(5)
local DiscordUrl = "discord.gg/8NbwAuBTjm"
setclipboard(DiscordUrl)
game.Players.LocalPlayer:Kick("")
wait(2)
rconsoleprint("@@RED@@")
rconsoleprint("Discord: "..DiscordUrl)
rconsoleprint("\n")
wait(2)
rconsoleprint("@@WHITE@@")
rconsoleprint("[CGB] Discord has been copied")
wait(1)
rconsoleprint("\n")
rconsoleprint("[CGB] Please create a ticket in Discord to finish registration")
