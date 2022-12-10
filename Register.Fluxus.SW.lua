-- Register Fluxus and Script-Ware Script

Webhook_URL = "https://discord.com/api/webhooks/1045952435128107019/wl7bceDv_GEl2Yep0oQcLelh8MgWtUfNPJeOec-G18qB_v3UcJfh28GjmRwnmMTl7g8R"



local exploitcheck =
   syn and "Synapse X" or
   identifyexecutor() and "Script Ware" and "Fluxus" 

local url = Webhook_URL
local msgData = {
    ["content"] = '<@836746138924482560>, <@818498059276386324>',
    ["embeds"] = {{
        ["title"] = "**CGB User Detected**",
        ["description"] = game.Players.LocalPlayer.Name.." has executed CGB Hub",
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
                ["value"] = exploitcheck,
                ["inline"] = false
            },
            {
                ["name"] = "Executed In:",
                ["value"] = game.PlaceId,
                ["inline"] = false
            }
        }
    }}
}
local newdata = game:GetService("HttpService"):JSONEncode(msgData)

local headers = {
   ["content-type"] = "application/json"
}
request = http.request or fluxus.request
local sendMsg = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(sendMsg)

wait(5)

setclipboard("https://discord.gg/8NbwAuBTjm")
game.Players.LocalPlayer:Kick("Discord Copied. Create a ticket to finish registration")
