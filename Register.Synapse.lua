-- Register Synapse X Script

Webhook_URL = "https://discord.com/api/webhooks/1045952435128107019/wl7bceDv_GEl2Yep0oQcLelh8MgWtUfNPJeOec-G18qB_v3UcJfh28GjmRwnmMTl7g8R"

if syn then
    rconsoleclear()
    wait(2) 
    rconsoleprint('[CGB] Synapse has been detected')
elseif identifyexecutor() then -- Script-Ware, fluxus
    game.Players.LocalPlayer:Kick("[CGB] Error: sw-0")
else
    game.Players.LocalPlayer:Kick("[CGB] Error: 0")
end

local exploitcheck =
   syn and "Synapse X" or
   getexecutorname() and "Script Ware" or "Fluxus"

local response = syn.request(
{
    Url = Webhook_URL,
    Method = 'POST',
    Headers = {
        ['Content-Type'] = 'application/json'
    },
    Body = game:GetService("HttpService"):JSONEncode({
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
                    ["name"] = "Game:",
                    ["value"] = game.PlaceId,
                    ["inline"] = false
                }
            }
        }}
    })
}
)

wait(5)
setclipboard("https://discord.gg/8NbwAuBTjm")
game.Players.LocalPlayer:Kick("Discord Copied. Create a ticket to finish registration")

