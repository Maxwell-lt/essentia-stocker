aspects = {
    "Aer",
    "Alienis",
    "Alkimia",
    "Aqua",
    "Auram",
    "Aversio",
    "Bestia",
    "Caeles",
    "Cognitio",
    "Coralos",
    "Desiderium",
    "Diabolus",
    "Draco",
    "Dreadia",
    "Exanimis",
    "Exitium",
    "Fabrico",
    "Fluctus",
    "Gelum",
    "Herba",
    "Humanus",
    "Ignis",
    "Imperium",
    "Infernum",
    "Instrumentum",
    "Luna",
    "Lux",
    "Machina",
    "Metallum",
    "Mortuus",
    "Motus",
    "Mythus",
    "Ordo",
    "Perditio",
    "Permutatio",
    "Potentia",
    "Praecantatio",
    "Praemunio",
    "Sensus",
    "Sol",
    "Sonus",
    "Spiritus",
    "Stellae",
    "Tenebrae",
    "Terra",
    "Vacuos",
    "Ventus",
    "Victus",
    "Vinculum",
    "Visum",
    "Vitium",
    "Vitreus",
    "Volatus"
}

dc = peripheral.wrap("storagedrawers:controller_5")
smeltery_location = "xu2:tilelargishchest_2"

jar_row_order = {
    "right",
    "back",
    "bottom",
    "left"
}

dc_slots = {}
for i = 2, 54 do
    meta = dc.getItemMeta(i)
    name = meta.displayName:gmatch("%S+")()
    dc_slots[name] = i
end

-- single run to test
needed_slots = {}
signal = redstone.getBundledInput("right")
for i = 0, 15 do
    if bit.band(signal, bit.blshift(1, i)) == 0 then
        needed_slots[#needed_slots+1] = dc_slots[aspects[i + 1]]
    end
end
signal = redstone.getBundledInput("back")
for i = 0, 15 do
    if bit.band(signal, bit.blshift(1, i)) == 0 then
        needed_slots[#needed_slots+1] = dc_slots[aspects[i + 17]]
    end
end
signal = redstone.getBundledInput("bottom")
for i = 0, 15 do
    if bit.band(signal, bit.blshift(1, i)) == 0 then
        needed_slots[#needed_slots+1] = dc_slots[aspects[i + 33]]
    end
end
signal = redstone.getBundledInput("left")
for i = 0, 4 do
    if bit.band(signal, bit.blshift(1, i)) == 0 then
        needed_slots[#needed_slots+1] = dc_slots[aspects[i + 49]]
    end
end

for i, slot in ipairs(needed_slots) do
    moved = 0
    while moved == 0 do
        moved = dc.pushItems(smeltery_location, slot, 1)
    end
end