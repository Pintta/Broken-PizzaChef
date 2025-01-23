local function Taulukko(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

RegisterCommand('luopizza', function()
    local Ainekset = {
        --{label = '', value = 'tayte'},
        {label = 'Mozzarella', value = 'tayte1'},
        {label = 'Kinkku', value = 'tayte2'},
        {label = 'Salami', value = 'tayte3'},
        {label = 'Vihreä chili', value = 'tayte4'},
        {label = 'Ananas', value = 'tayte5'},
        {label = 'Aurajuusto', value = 'tayte6'},
        {label = 'Jauheliha', value = 'tayte7'},
        {label = 'Tonnikala', value = 'tayte8'},
        {label = 'Oliivi', value = 'tayte9'},
        {label = 'Valkosipuli', value = 'tayte10'},
        {label = 'Kana', value = 'tayte11'},
        {label = 'Herkkusieni', value = 'tayte12'},
        {label = 'Katkarapu', value = 'tayte13'},
        {label = 'Kebabliha', value = 'tayte14'},
        {label = 'BBQ-kastike', value = 'tayte15'},
        {label = 'Kananmuna', value = 'tayte16'},
        {label = 'Paprika', value = 'tayte17'},
        {label = 'Basilika', value = 'tayte18'},
        {label = 'Pippurisekoitus', value = 'tayte19'},
        {label = 'Tomaatti', value = 'tayte20'},
        {label = 'Feta', value = 'tayte21'},
        {label = 'Vuohenjuusto', value = 'tayte22'},
        {label = 'Parsa', value = 'tayte23'},
        {label = 'Aurinkokuivattu tomaatti', value = 'tayte24'},
        {label = 'Pestokastike', value = 'tayte25'},
        {label = 'Jalopeno', value = 'tayte26'},
        {label = 'Korianteri', value = 'tayte27'},
        {label = 'Munakoiso', value = 'tayte28'},
        {label = 'Kesäkurpitsa', value = 'tayte29'},
        {label = 'Rucola', value = 'tayte30'},
        {label = 'Simpukka', value = 'tayte31'},
        {label = 'Chilikastike', value = 'tayte32'},
        {label = 'Lime', value = 'tayte33'},
        {label = 'Punasipuli', value = 'tayte34'},
        {label = 'Pepperonimakkara', value = 'tayte35'},
        {label = 'Smetana', value = 'tayte36'},
        {label = 'Maustekurkku', value = 'tayte37'},
        {label = 'Majoneesikastike', value = 'tayte38'},
        {label = 'Kirsikka tomaatti', value = 'tayte39'},
        {label = 'Mustapippuri', value = 'tayte40'},
        {label = 'Herkkusieni', value = 'tayte41'},
        {label = 'Kanttarelli', value = 'tayte42'},
        {label = 'Tatti', value = 'tayte43'},
        {label = 'Korvasieni', value = 'tayte44'},
        {label = 'Sipuli', value = 'tayte45'}
    }
    local ValittuTuote = {}
    local function openMenu()
        local Valikko = {
            {
                header = 'Valitse täytteet pizzallesi',
                isMenuHeader = true
            }
        }
        for _, Tuote in ipairs(Ainekset) do
            Valikko[#Valikko + 1] = {
                header = Tuote.label,
                txt = 'Lisää tämä täyte pizzaan',
                params = {
                    event = 'Broken-PizzaChef:addTuote',
                    args = Tuote.value
                }
            }
        end
        Valikko[#Valikko + 1] = {
            header = 'Valmista pizza',
            txt = 'Valitsemasi täytteet: ' .. table.concat(ValittuTuote, ', '),
            params = {
                event = 'Broken-PizzaChef:finishPizza'
            }
        }
        Valikko[#Valikko + 1] = {
            header = 'Peruuta',
            txt = 'Sulje valikko',
            params = {
                event = 'qb-menu:client:closeMenu'
            }
        }
        exports['qb-menu']:openMenu(Valikko)
    end
    RegisterNetEvent('Broken-PizzaChef:addTuote', function(Tuote)
        if not Taulukko(ValittuTuote, Tuote) then
            table.insert(ValittuTuote, Tuote)
            TriggerEvent('QBCore:Notify', 'Lisäsit '..Tuote..' täytteen.', 'success')
        else
            TriggerEvent('QBCore:Notify', 'Näyttää siltä, että '..Tuote.. ' täyte on jo lisättynä..', 'error')
        end
        openMenu()
    end)
    RegisterNetEvent('Broken-PizzaChef:finishPizza', function()
        QBCore.Functions.Progressbar('taytelisays', 'Lisäät '..table.concat(ValittuTuote, ' ')..' täytettä..', 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            TriggerServerEvent('LuoBroken-PizzaChef:rauta:Tarkista', ValittuTuote)
            QBCore.Functions.Notify('Täytteen lisääminen onnistui.', 'success')
        end, function()
            QBCore.Functions.Notify('Täytteen lisääminen epäonnistui..', 'error')
        end)
        ValittuTuote = {}
    end)
    openMenu()
end, false)

RegisterNetEvent('PizzaPoyta:Taytteet', function()
    local Ainekset = {
        --{label = '', value = 'tayte'},
        {label = 'Mozzarella', value = 'tayte1'},
        {label = 'Kinkku', value = 'tayte2'},
        {label = 'Salami', value = 'tayte3'},
        {label = 'Vihreä chili', value = 'tayte4'},
        {label = 'Ananas', value = 'tayte5'},
        {label = 'Aurajuusto', value = 'tayte6'},
        {label = 'Jauheliha', value = 'tayte7'},
        {label = 'Tonnikala', value = 'tayte8'},
        {label = 'Oliivi', value = 'tayte9'},
        {label = 'Valkosipuli', value = 'tayte10'},
        {label = 'Kana', value = 'tayte11'},
        {label = 'Herkkusieni', value = 'tayte12'},
        {label = 'Katkarapu', value = 'tayte13'},
        {label = 'Kebabliha', value = 'tayte14'},
        {label = 'BBQ-kastike', value = 'tayte15'},
        {label = 'Kananmuna', value = 'tayte16'},
        {label = 'Paprika', value = 'tayte17'},
        {label = 'Basilika', value = 'tayte18'},
        {label = 'Pippurisekoitus', value = 'tayte19'},
        {label = 'Tomaatti', value = 'tayte20'},
        {label = 'Feta', value = 'tayte21'},
        {label = 'Vuohenjuusto', value = 'tayte22'},
        {label = 'Parsa', value = 'tayte23'},
        {label = 'Aurinkokuivattu tomaatti', value = 'tayte24'},
        {label = 'Pestokastike', value = 'tayte25'},
        {label = 'Jalopeno', value = 'tayte26'},
        {label = 'Korianteri', value = 'tayte27'},
        {label = 'Munakoiso', value = 'tayte28'},
        {label = 'Kesäkurpitsa', value = 'tayte29'},
        {label = 'Rucola', value = 'tayte30'},
        {label = 'Simpukka', value = 'tayte31'},
        {label = 'Chilikastike', value = 'tayte32'},
        {label = 'Lime', value = 'tayte33'},
        {label = 'Punasipuli', value = 'tayte34'},
        {label = 'Pepperonimakkara', value = 'tayte35'},
        {label = 'Smetana', value = 'tayte36'},
        {label = 'Maustekurkku', value = 'tayte37'},
        {label = 'Majoneesikastike', value = 'tayte38'},
        {label = 'Kirsikka tomaatti', value = 'tayte39'},
        {label = 'Mustapippuri', value = 'tayte40'},
        {label = 'Herkkusieni', value = 'tayte41'},
        {label = 'Kanttarelli', value = 'tayte42'},
        {label = 'Tatti', value = 'tayte43'},
        {label = 'Korvasieni', value = 'tayte44'},
        {label = 'Sipuli', value = 'tayte45'}
    }
    local ValittuTuote = {}
    local function openMenu()
        local Valikko = {
            {
                header = 'Valitse täytteet pizzallesi',
                isMenuHeader = true
            }
        }
        for _, Tuote in ipairs(Ainekset) do
            Valikko[#Valikko + 1] = {
                header = Tuote.label,
                txt = 'Lisää tämä täyte pizzaan',
                params = {
                    event = 'Broken-PizzaChef:addTuote',
                    args = Tuote.value
                }
            }
        end
        Valikko[#Valikko + 1] = {
            header = 'Valmista pizza',
            txt = 'Valitsemasi täytteet: ' .. table.concat(ValittuTuote, ', '),
            params = {
                event = 'Broken-PizzaChef:finishPizza'
            }
        }
        Valikko[#Valikko + 1] = {
            header = 'Peruuta',
            txt = 'Sulje valikko',
            params = {
                event = 'qb-menu:client:closeMenu'
            }
        }
        exports['qb-menu']:openMenu(Valikko)
    end
    RegisterNetEvent('Broken-PizzaChef:addTuote', function(Tuote)
        if not Taulukko(ValittuTuote, Tuote) then
            table.insert(ValittuTuote, Tuote)
            TriggerEvent('QBCore:Notify', 'Lisäsit '..Tuote..' täytteen.', 'success')
        else
            TriggerEvent('QBCore:Notify', 'Näyttää siltä, että '..Tuote.. ' täyte on jo lisättynä..', 'error')
        end
        openMenu()
    end)
    RegisterNetEvent('Broken-PizzaChef:finishPizza', function()
        QBCore.Functions.Progressbar('taytelisays', 'Lisäät '..table.concat(ValittuTuote, ' ')..' täytettä..', 5000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            TriggerServerEvent('LuoBroken-PizzaChef:rauta:Tarkista', ValittuTuote)
            QBCore.Functions.Notify('Täytteen lisääminen onnistui.', 'success')
        end, function()
            QBCore.Functions.Notify('Täytteen lisääminen epäonnistui..', 'error')
        end)
        ValittuTuote = {}
    end)
    openMenu()
end)

RegisterCommand("valmistapizzabeta", function()
    local firstCoord = vector3(200.0, 300.0, 40.0)  -- Ensimmäinen koordinaatti
    local secondCoord = vector3(400.0, 500.0, 40.0)  -- Toinen koordinaatti
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)
    TaskGoToCoordAnyMeans(playerPed, firstCoord.x, firstCoord.y, firstCoord.z, 3.0, 0, 0, 786603, 0)
    while true do
        Wait(500)
        local currentPos = GetEntityCoords(playerPed)
        if #(currentPos - firstCoord) < 2.0 then
            break
        end
    end
    QBCore.Functions.Progressbar("start_process_1", "Aloitetaan prosessi ensimmäisellä kohdalla", 5000, false, true, {
        animDict = "amb@world_human_hammering@male@base",
        anim = "base",
    }, {}, {}, {}, function()
        TriggerEvent("QBCore:Notify", "Prosessi suoritettu ensimmäisellä kohdalla", "success")
        TaskGoToCoordAnyMeans(playerPed, secondCoord.x, secondCoord.y, secondCoord.z, 3.0, 0, 0, 786603, 0)
        while true do
            Wait(500)
            local currentPos = GetEntityCoords(playerPed)
            if #(currentPos - secondCoord) < 2.0 then
                break
            end
        end
        QBCore.Functions.Progressbar("start_process_2", "Aloitetaan prosessi toisella kohdalla", 5000, false, true, {
            animDict = "amb@world_human_hammering@male@base",
            anim = "base",
        }, {}, {}, {}, function()
            TriggerEvent("QBCore:Notify", "Prosessi suoritettu toisella kohdalla", "success")
        end, function()
            TriggerEvent("QBCore:Notify", "Prosessi keskeytettiin", "error")
        end)
    end, function()
        TriggerEvent("QBCore:Notify", "Prosessi keskeytettiin", "error")
    end)
end, false)
