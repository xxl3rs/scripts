local plr = game:GetService("Players").LocalPlayer
plr.Chatted:Connect(function(msg)
    local split = msg:split(" ")
    if split[1] == "!tp" then
        game:GetService("TeleportService"):Teleport(tonumber(split[2]),plr)
    elseif split[1] == "/e" and split[2] == "!tp" then
        game:GetService("TeleportService"):Teleport(tonumber(split[3]),plr)
    end
end)
game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(state)
    queueonteleport("loadstring(game:HttpGet(''))()")
end)
