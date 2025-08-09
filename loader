-- Combined loader for both scripts

local function safeLoad(url)
    local success, result = pcall(function()
        return loadstring(game:HttpGet(url))()
    end)
    if not success then
        warn("Failed to load script from:", url, "\nError:", result)
    end
end

-- Run both scripts
task.spawn(function()
    safeLoad("https://lunor.dev/loader")
end)

task.spawn(function()
    safeLoad("https://raw.githubusercontent.com/Lunorhubb/LunorScript/refs/heads/main/Loader.lua")
end)
