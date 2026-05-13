local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem(Config.ItemName, function(source, item)
    if not item then return end

    TriggerClientEvent('qb-physicalmap:client:useMap', source)
end)
