local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('LuoBroken-PizzaChef:rauta:Tarkista', function(ValittuTuote)
    local src = source
    local Ukko = QBCore.Functions.GetPlayer(src)
    local P1 = {
        P2 = 'Sisältää: ' .. table.concat(ValittuTuote, ", ")
    }
    for _, Tuote in ipairs(ValittuTuote) do
        local item = Ukko.Functions.GetItemByName(Tuote)
        if not item or item.amount < 1 then
            TriggerClientEvent('QBCore:Notify', src, 'Sinulta puuttuu: ' ..Tuote..' täyte..', 'error')
            return
        end
    end
    for _, Tuote in ipairs(ValittuTuote) do
        Ukko.Functions.RemoveItem(Tuote, 1)
    end
    Ukko.Functions.AddItem('pizza', 1, nil, P1)
    TriggerClientEvent('QBCore:Notify', src, 'Valmistit pizzan täytteillä: ' ..P1.P2, 'success')
end)
