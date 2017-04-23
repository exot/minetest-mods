-- add bones to dirt
minetest.override_item("default:dirt", {
	drop = {
		max_items = 1,
		items = {
			{
				items = {'bone:bone', 'default:dirt'},
				rarity = 50,
			},
			{
				items = {'default:dirt'},
			}
		}
	},
})

-- add bones to dirt with grass
minetest.override_item("default:dirt_with_grass", {
	drop = {
		max_items = 1,
		items = {
			{
				items = {'bone:bone', 'default:dirt'},
				rarity = 50,
			},
			{
				items = {'default:dirt'},
			}
		}
	},
})

-- bone item
minetest.register_craftitem("bone:bone", {
	description = "Bone",
	inventory_image = "bone_bone.png",
})

-- bonemeal recipe
minetest.register_craft({
	output = 'bone:bonemeal 5',
	recipe = {{'bone:bone'}},
})

-- apple tree definition
local apple_tree = {
	axiom = "FFFFFAFFBF",
	rules_a = "[&&&FFFFF&&FFFF][&&&++++FFFFF&&FFFF][&&&----FFFFF&&FFFF]",
	rules_b = "[&&&++FFFFF&&FFFF][&&&--FFFFF&&FFFF][&&&------FFFFF&&FFFF]",
	trunk = "default:tree",
	leaves = "default:leaves",
	angle = 30,
	iterations = 2,
	random_level = 0,
	trunk_type = "single",
	thin_branches = true,
	fruit_chance = 10,
	fruit="default:apple"
}

local n
local n2
local pos
local plant_tab = {}
local rnd_max = 5

minetest.after(0.5, function()
	plant_tab[0] = "air"
	plant_tab[1] = "default:grass_1"
	plant_tab[2] = "default:grass_2"
	plant_tab[3] = "default:grass_3"
	plant_tab[4] = "default:grass_4"
	plant_tab[5] = "default:grass_5"

	if minetest.get_modpath("flowers") ~= nil then
		rnd_max = 11
		plant_tab[6] = "flowers:dandelion_white"
		plant_tab[7] = "flowers:dandelion_yellow"
		plant_tab[8] = "flowers:geranium"
		plant_tab[9] = "flowers:rose"
		plant_tab[10] = "flowers:tulip"
		plant_tab[11] = "flowers:viola"
	end

end)

local function duengen(pointed_thing)

	pos = pointed_thing.under
	n = minetest.get_node(pos)
	if n.name == "" then return end
	local stage = ""

	-- grow sapling into tree
	if n.name == "default:sapling" then
		minetest.set_node(pos, {name="air"})
		if minetest.get_mapgen_params().mgname == "v6" then
			default.grow_tree(pos, math.random(1, 4) == 1)
		else
			default.grow_new_apple_tree(pos)
		end

	-- grow wheat
	elseif string.find(n.name, "farming:wheat_") ~= nil then
		stage = string.sub(n.name, 15)
		if stage == "3" then
			minetest.set_node(pos, {name="farming:wheat"})
		elseif math.random(1,5) < 3 then
			minetest.set_node(pos, {name="farming:wheat"})
		else
			minetest.set_node(pos, {name="farming:wheat_"..math.random(2,3)})
		end

	-- grow cotton
	elseif string.find(n.name, "farming:cotton_") ~= nil then
		stage = tonumber(string.sub(n.name, 16))
		if stage == 1 then
			minetest.set_node(pos, {name="farming:cotton_"..math.random(stage, 2)})
		else
			minetest.set_node(pos, {name="farming:cotton"})
		end

	-- grow pumpkin
	elseif string.find(n.name, "farming:pumpkin_") ~= nil then
		stage = tonumber(string.sub(n.name, 17))
		if stage == 1 then
			minetest:set_node(pos, {name="farming:pumpkin_"..math.random(stage, 2)})
		else
			minetest:set_node(pos, {name="farming:pumpkin"})
		end

	-- grow grass and flowers
	elseif n.name == "default:dirt_with_grass" then
		for i = -2, 3, 1 do
			for j = -3, 2, 1 do
				pos = pointed_thing.above
				pos = {x = pos.x + i, y = pos.y, z = pos.z + j}
				n = minetest.get_node(pos)
				n2 = minetest.get_node({x = pos.x, y = pos.y-1, z = pos.z})

				if n.name ~= ""
				 and n.name == "air"
				 and n2.name == "default:dirt_with_grass" then
					if math.random(0,5) > 3 then
						minetest.set_node(pos,
							{name=plant_tab[math.random(0, rnd_max)]})
					else
						minetest.set_node(pos,
							{name=plant_tab[math.random(0, 5)]})
					end
				end
			end
		end
	end
end

-- bonemeal item
minetest.register_craftitem("bone:bonemeal", {
	description = "Bone Meal",
	inventory_image = "bone_bonemeal.png",
	liquids_pointable = false,
	stack_max = 99,
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.type == "node" then
			if not minetest.setting_getbool("creative_mode") then
				local item = user:get_wielded_item()
				item:take_item()
				user:set_wielded_item(item)
			end
			duengen(pointed_thing)
			itemstack:take_item()
			return itemstack
		end
	end,
})
