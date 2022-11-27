local httprequest = syn and syn.request or request;
local hwidlist = loadstring(game:HttpGet("", true))()

local body = http_request({Url = "https://httpbin.org/get"; Method = 'GET';}).Body;
local decoded = game:GetService("HttpService"):JSONDecode(body)
local hwid = decoded.headers['Syn-Fingerprint']

for i, v in pairs(hwidlist) do 
    if v == hwid then
        print('Whitelisted.')
    else
        game.Players.LocalPlayer:Kick("CGB Hub | NOT whitelisted")
    end
end