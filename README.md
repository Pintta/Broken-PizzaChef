# Broken-PizzaChef
FiveM QBCore Pizza Chef script, ready to go! 

```lua
if (item.metadata && item.metadata.description) {
    description += `<br><strong>${item.metadata.description}</strong>`;
}

local metadata = {
    description = table.concat(selectedToppings, ", ")
}

Player.Functions.AddItem("pizza", 1, nil, metadata)
TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items["pizza"], "add")

```

```js
if (item.name === "taytepizza" && item.metadata && item.metadata.description) {
    description += `<br><strong>Sisältää täytteet: ${item.metadata.description}</strong>`;
}
if (item.name === "tietokone" && item.metadata && item.metadata.description) {
    description += `<br><strong>Sisältää täytteet: ${item.metadata.description}</strong>`;
}

tietokone
```
```lua
-- Pizzan raaka-aineet
taytepizza          = {name = 'taytepizza',     label = 'Pizza', weight = math.random(100, 250), type = 'item', image = 'pizza.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Pizza, jossa voi olla eri täytteitä.'},
pizzataikina        = {name = 'pizzataikina',   label = 'Pizzataikina', weight = math.random(1, 20), type = 'item', image = 'pizzataikina.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Pizzataikina, joka on leivottu rakkaudella.'},
aurajuusto          = {name = 'aurajuusto',     label = 'Aurajuusto', weight = math.random(1, 20), type = 'item', image = 'aurajuusto.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Kermainen aurajuusto.'},
pepperoni           = {name = 'pepperoni',      label = 'Pepperoni', weight = math.random(1, 20), type = 'item', image = 'pepperoni.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Maukasta pepperonia.'},
sieni               = {name = 'sieni',          label = 'Sieni', weight = math.random(1, 20), type = 'item', image = 'sieni.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Tuoreita sieniä.'},
sipuli              = {name = 'sipuli',         label = 'Sipuli', weight = math.random(1, 20), type = 'item', image = 'sipuli.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Pilko sipuli pizzaasi varten.'},
paprika             = {name = 'paprika',        label = 'Paprika', weight = math.random(1, 20), type = 'item', image = 'paprika.png', unique = false, useable = true, shouldClose = true, combinable = nil, description = 'Makeaa paprikaa pizzan päälle.'},
```
