if game:GetService("ReplicatedStorage"):FindFirstChild("_RetroStudio") then
require(game:GetService("ReplicatedStorage")._RetroStudio.ScriptService.Executors.Util).isStudio = function()
    return true
end end
queueonteleport(game:HttpGet("https://raw.githubusercontent.com/xxl3rs/scripts/refs/heads/main/dogshitstudio.lua"))
