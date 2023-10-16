print("^2[TEEZY CORE]^7: " .. GetCurrentResourceName() .. " has started.")

RegisterServerEvent("TeeztCore:Server:Broadcast")
AddEventHandler("TeeztCore:Server:Broadcast", function(title, msg, bottom, time)
    TriggerClientEvent("TeeztCore:Client:Broadcast", -1, title, msg, bottom, time)
end)