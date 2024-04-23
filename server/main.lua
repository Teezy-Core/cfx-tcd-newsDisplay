RegisterServerEvent("cfx-tcd-newsDisplay:Server:Broadcast")
AddEventHandler("cfx-tcd-newsDisplay:Server:Broadcast", function(title, msg, bottom, time)
    TriggerClientEvent("cfx-tcd-newsDisplay:Client:Broadcast", -1, title, msg, bottom, time)
end)