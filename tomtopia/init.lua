minetest.log("action", "[TomTopia] Loading …")


-- Custom crafting recipes

minetest.register_craft({
  output = 'default:gravel 1',
  recipe = {{'default:cobble'}},
})

minetest.register_craft({
  output = 'default:sand 1',
  recipe = {{'default:gravel'}},
})

minetest.register_craft({
  output = 'default:dirt 1',
  recipe = {{'default:sand'}},
})

minetest.register_craft({
  output = 'default:desert_sand 1',
  recipe = {{'default:dirt'}},
})

minetest.register_craft({
  output = 'default:sand 1',
  recipe = {{'default:desert_sand'}},
})

minetest.register_craft({
  type = "shapeless",
  output = "default:clay 4",
  recipe = {"default:dirt", "default:dirt", "default:sand", "default:sand", "bucket:bucket_water"},
  replacements = {
     {"bucket:bucket_water", "bucket:bucket_empty"}
  }
})

minetest.register_craft({
  type = "shapeless",
  output = "darkage:chalk 1",
  recipe = {"darkage:chalk_powder", "darkage:chalk_powder"}
})

minetest.register_craft({
  type = "shapeless",
  output = "homedecor:oil_extract",
  recipe = {"flowers:sunflower", "flowers:sunflower"}
})

colors_from_plants = {
   ["dye:yellow"] = {"flowers:sunflower"},
   ["dye:orange"] = {"farming:pumpkin_slice"},
   ["dye:blue"]   = {"farming:blueberry"},
   ["dye:red"]    = {"farming:tomato"}
}

for color,ingredients in pairs(colors_from_plants) do
   minetest.register_craft({
      type = "shapeless",
      output = color,
      recipe = ingredients
   })
end


-- Debug output when new blocks are generated

minetest.register_on_generated(function(minp, maxp, seed)
  local debug = "New block generated with minp="..(minetest.pos_to_string(minp))..", maxp="..(minetest.pos_to_string(maxp))..", seed="..seed
  print(debug)
  minetest.chat_send_all(debug)
end)


-- End

minetest.log("action", "[TomTopia] Loaded!")
