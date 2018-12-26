--[[
	**********************************************
	***              Soy redo                  ***
	**********************************************
]]--

local dname = "Soy"
local pname = "soy"
local step = 8

-- Load support for intllib.
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

minetest.register_node("cucina_vegana:".. pname .."_seed", {
	description = dname .. " " .. S("Seed"),
	tiles = {"cucina_vegana_" .. pname .. "_seed.png"},
	inventory_image = "cucina_vegana_".. pname .. "_seed.png",
	wield_image = "cucina_vegana_" .. pname .. "_seed.png",
	drawtype = "signlike",
	groups = {seed = 1, snappy = 3, attached_node = 1, flammable = 4},
	paramtype = "light",
	paramtype2 = "wallmounted",
	walkable = false,
	sunlight_propagates = true,
	selection_box = farming.select,
	on_place = function(itemstack, placer, pointed_thing)
		return farming.place_seed(itemstack, placer, pointed_thing, "cucina_vegana:" .. pname .. "_1")
	end,
})
	
-- Soy definition
local crop_def = {
	drawtype = "plantlike",
	tiles = {"cucina_vegana_" .. pname .. "_1.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	drop =  "",
	selection_box = farming.select,
	groups = {
		snappy = 3, flammable = 4, plant = 1, attached_node = 1,
		not_in_creative_inventory = 1, growing = 1
	},
	sounds = default.node_sound_leaves_defaults()
}

-- stage 1
minetest.register_node("cucina_vegana:" .. pname .. "_1", table.copy(crop_def))

-- stage 2
crop_def.tiles = {"cucina_vegana_" .. pname .. "_2.png"}
minetest.register_node("cucina_vegana:" .. pname .. "_2", table.copy(crop_def))

-- stage 3
crop_def.tiles = {"cucina_vegana_" .. pname .. "_3.png"}
minetest.register_node("cucina_vegana:" .. pname .. "_3", table.copy(crop_def))

-- stage 4
crop_def.tiles = {"cucina_vegana_" .. pname .. "_4.png"}
minetest.register_node("cucina_vegana:" .. pname .. "_4", table.copy(crop_def))

-- stage 5
crop_def.tiles = {"cucina_vegana_" .. pname .. "_5.png"}
crop_def.drop = {
	items = {
		{items = {"cucina_vegana:" .. pname .. "_seed"}, rarity = 1},
	}
}
minetest.register_node("cucina_vegana:" .. pname .. "_5", table.copy(crop_def))

-- stage 6
crop_def.tiles = {"cucina_vegana_" .. pname .. "_6.png"}
crop_def.drop = {
	items = {
		{items = {"cucina_vegana:" .. pname .. "_seed"}, rarity = 1},
		{items = {"cucina_vegana:" .. pname}, rarity = 2},
	}	}
minetest.register_node("cucina_vegana:" .. pname .. "_6", table.copy(crop_def))

-- stage 7
crop_def.tiles = {"cucina_vegana_" .. pname .. "_7.png"}
crop_def.drop = {
	items = {
		{items = {"cucina_vegana:" .. pname}, rarity = 1},
		{items = {"cucina_vegana:" .. pname}, rarity = 2},
		{items = {"cucina_vegana:" .. pname .. "_seed"}, rarity = 1},
		{items = {"cucina_vegana:" .. pname .. "_seed"}, rarity = 2},
	}	
}
minetest.register_node("cucina_vegana:" .. pname .. "_7", table.copy(crop_def))

-- stage 8 (final)
crop_def.tiles = {"cucina_vegana_" .. pname .. "_8.png"}
crop_def.groups.growing = 0
crop_def.drop = {
	items = {
		{items = {"cucina_vegana:" .. pname}, rarity = 1},
		{items = {"cucina_vegana:" .. pname}, rarity = 2},
		{items = {"cucina_vegana:" .. pname}, rarity = 3},
		{items = {"cucina_vegana:" .. pname .. "_seed"}, rarity = 1},
		{items = {"cucina_vegana:" .. pname .. "_seed"}, rarity = 2},
		{items = {"cucina_vegana:" .. pname .. "_seed"}, rarity = 3},
	}
}
minetest.register_node("cucina_vegana:" .. pname .. "_8", table.copy(crop_def))
	
-- Register for Mapgen
minetest.register_node("cucina_vegana:wild_" .. pname, {
	description = S("Wild " .. dname),
	paramtype = "light",
	walkable = false,
	drop = { 
			items = { 
					{items = {"cucina_vegana:" .. pname .. "_seed 3"}},
					{items = {"cucina_vegana:" .. pname}},
				}
			},
	drawtype = "plantlike",
	paramtype2 = "facedir",
	tiles = {"cucina_vegana_" .. pname .. "_8.png"},
	groups = {chopspy=2, oddly_breakable_by_hand=3, flammable=2, plant=1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, -0.35, 0.5}, -- side f
			},
	},
})

-- to import the old mod in cucina_vegana
-- can deleted if you have a clean world.

minetest.register_alias("soy:soy_1", "cucina_vegana:" .. pname .. "_1")
minetest.register_alias("soy:soy_2", "cucina_vegana:" .. pname .. "_2")
minetest.register_alias("soy:soy_3", "cucina_vegana:" .. pname .. "_3")
minetest.register_alias("soy:soy_4", "cucina_vegana:" .. pname .. "_4")
minetest.register_alias("soy:soy_5", "cucina_vegana:" .. pname .. "_5")
minetest.register_alias("soy:soy_6", "cucina_vegana:" .. pname .. "_6")
minetest.register_alias("soy:soy_7", "cucina_vegana:" .. pname .. "_7")
minetest.register_alias("soy:soy_8", "cucina_vegana:" .. pname .. "_8")

minetest.register_alias("soy:seed", "cucina_vegana:" .. pname .. "_seed")
minetest.register_alias("soy:wild_soy", "cucina_vegana:wild_" .. pname)
minetest.register_alias("soy:soy", "cucina_vegana:" .. pname)
minetest.register_alias("soy:seed_soy", "cucina_vegana:seed_" .. pname)

if (minetest.get_modpath("farming_nextgen")) then
    farmingNG.register_seed("cucina_vegana:" .. pname .. "_seed", "cucina_vegana:" .. pname .. "_1")
    farmingNG.register_harvest("cucina_vegana:" .. pname .. "_" .. step)
end
