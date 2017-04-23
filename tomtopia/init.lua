print("[TomTopia] Loading specific definitions for TomTopia …")

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

print("[TomTopia] Loading specific definitions for TomTopia … done.")
