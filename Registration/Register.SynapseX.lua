-- Register Synapse X Script

HttpService = game:GetService("HttpService")
Webhook_URL = "https://discord.com/api/webhooks/1045952435128107019/wl7bceDv_GEl2Yep0oQcLelh8MgWtUfNPJeOec-G18qB_v3UcJfh28GjmRwnmMTl7g8R"


if syn then
    rconsoleclear()
    wait(2) 
    rconsoleprint('[CGB] Synapse has been detected')
elseif fluxus then
    game.Players.LocalPlayer:Kick("[CGB] Error: fluxus-0")
elseif getexecutorname() then -- Script-Ware
    game.Players.LocalPlayer:Kick("[CGB] Error: sw-0")
else
    game.Players.LocalPlayer:Kick("[CGB] Error: 0")
end

local exploitcheck =
   syn and "Synapse X" or
   getexecutorname() and "Script Ware" or
   fluxus and "Fluxus"

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
    })
}
)


wait(5)

setclipboard("https://discord.gg/8NbwAuBTjm")
game.Players.LocalPlayer:Kick("Discord Copied. Create a ticket to finish registration")

