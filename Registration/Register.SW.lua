-- Script-Ware Registration Script
Webhook_URL = "https://discord.com/api/webhooks/1045952435128107019/wl7bceDv_GEl2Yep0oQcLelh8MgWtUfNPJeOec-G18qB_v3UcJfh28GjmRwnmMTl7g8R"
HttpService = game.GetService("HttpService")

local exploitcheck =
   syn and "Synapse X" or
   getexecutorname() and "Script Ware" or
   fluxus and "Fluxus"

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
            }
        }
    }}
}
local newdata = game:GetService("HttpService"):JSONEncode(msgData)

local headers = {
   ["content-type"] = "application/json"
}
request = http.request or request
local sendMsg = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(sendMsg)