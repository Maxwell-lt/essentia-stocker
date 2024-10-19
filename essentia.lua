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
rs_name = "redstone_integrator_"
rs_start = 24
rs_side = "east"

dc_slots = {}
for i = 2, 54 do
    meta = dc.getItemMeta(i)
    name = meta.displayName:gmatch("%S+")()
    dc_slots[name] = i
end

while true do
    needed_slots = {}
    for i = 0, 52 do
        if peripheral.call(rs_name .. (rs_start + i), "getAnalogInput", rs_side) < 14 do
            needed_slots[#needed_slots+1] = dc_slots[aspects[i + 1]]
        end
    end

    if #needed_slots > 0 do
        print("Moving " .. #needed_slots .. " Vis Pods")
        while #(peripheral.call(smeltery_location, "list")) > 0 do
            sleep(5)
        end
        for i, slot in ipairs(needed_slots) do
            moved = 0
            while moved == 0 do
                moved = dc.pushItems(smeltery_location, slot, 1)
            end
        end
    else
        print("All jars full, sleeping for 600t")
        sleep(600)
    end
end