HttpService = game:GetService("HttpService")
Webhook_URL = "https://discord.com/api/webhooks/1045952435128107019/wl7bceDv_GEl2Yep0oQcLelh8MgWtUfNPJeOec-G18qB_v3UcJfh28GjmRwnmMTl7g8R"
local response = syn.request(
{
    Url = Webhook_URL,
    Method = 'POST',
    Headers = {
        ['Content-Type'] = 'application/json'
    },
    Body = HttpService:JSONEncode({
        ["content"] = '<@836746138924482560>, <@818498059276386324>',
        ["embeds"] = {{
            ["title"] = "**CGB User Detected**",
            ["description"] = game.Players.LocalPlayer.DisplayName.." has executed CGB Hub registration",
            ["type"] = "rich",
            ["color"] = tonumber(0xffffff),
            ["fields"] = {
                {
                    ["name"] = "Hardware ID:",
                    ["value"] = game:GetService("RbxAnalyticsService"):GetClientId(),
                    ["inline"] = true
                }
            }
        }}
    })
}
)

wait(5)

setclipboard("https://discord.gg/8NbwAuBTjm")
game.Players.LocalPlayer:Kick("Discord Copied. Create a ticket to finish registration")
