-- minetest_errata/doors.lua
-- Variation of blocks
--[[
    MIT License

    Copyright (c) 2018  Hans von Smacker
    Copyright (c) 2024  1F616EMO

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
]]

local S = minetest.get_translator("minetest_errata")

doors.register("door_wood_solid", {
	tiles = { { name = "minetest_errata_door_wood_solid.png", backface_culling = true } },
	description = S("Solid Wooden Door"),
	inventory_image = "minetest_errata_door_wood_solid_item.png",
	groups = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "doors:door_wood" },
		{ "group:wood" },
	}
})


doors.register("door_steel_solid", {
	tiles = { { name = "minetest_errata_door_steel_solid.png", backface_culling = true } },
	description = S("Solid Steel Door"),
	inventory_image = "minetest_errata_door_steel_solid_item.png",
	protected = true,
	groups = { cracky = 1, level = 2 },
	sounds = default.node_sound_metal_defaults(),
	sound_open = "doors_steel_door_open",
	sound_close = "doors_steel_door_close",
	recipe = {
		{ "doors:door_steel" },
		{ "default:steel_ingot" },
	}
})


doors.register("door_wood_bar", {
	tiles = { { name = "minetest_errata_door_wood_bar.png", backface_culling = true } },
	description = S("Wooden Bar Door"),
	inventory_image = "minetest_errata_door_wood_bar_item.png",
	sound_open = "doors_fencegate_open",
	sound_close = "doors_fencegate_close",
	sounds = default.node_sound_wood_defaults(),
	groups = { snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
	recipe = {
		{ "xpanes:wood_flat", },
		{ "xpanes:wood_flat", },
	}
})

doors.register("door_iron_bar", {
	tiles = { { name = "minetest_errata_door_iron_bar.png", backface_culling = true } },
	description = S("Iron Bar Door"),
	protected = true,
	inventory_image = "minetest_errata_door_iron_bar_item.png",
	sound_open = "minetest_errata_door_iron_bar_open",
	sound_close = "minetest_errata_door_iron_bar_close",
	sounds = default.node_sound_metal_defaults(),
	groups = { snappy = 2, bendy = 1, cracky = 1 },
	recipe = {
		{ "xpanes:bar_flat", },
		{ "xpanes:bar_flat", },
	}
})


-- Protected glass doors

doors.register("door_glass_protected", {
	tiles = { "doors_door_glass.png" },
	description = S("Protected Glass Door"),
	protected = true,
	inventory_image = "doors_item_glass.png^(keys_key_skeleton.png^[transformR180FX)",
	groups = { cracky = 3, oddly_breakable_by_hand = 3 },
	sound_open = "doors_glass_door_open",
	sound_close = "doors_glass_door_close",
	sounds = default.node_sound_glass_defaults(),
	recipe = {
		{ "default:glass", "default:glass", "" },
		{ "default:glass", "default:glass", "default:steel_ingot" },
		{ "default:glass", "default:glass", "" },
	}
})


doors.register("door_obsidian_glass_protected", {
	tiles = { "doors_door_obsidian_glass.png" },
	description = S("Protected Obsidian Glass Door"),
	protected = true,
	inventory_image = "doors_item_obsidian_glass.png^(keys_key_skeleton.png^[transformR180FX)",
	groups = { cracky = 3 },
	sound_open = "doors_glass_door_open",
	sound_close = "doors_glass_door_close",
	sounds = default.node_sound_glass_defaults(),
	recipe = {
		{ "default:obsidian_glass", "default:obsidian_glass", "" },
		{ "default:obsidian_glass", "default:obsidian_glass", "default:steel_ingot" },
		{ "default:obsidian_glass", "default:obsidian_glass", "" },
	},
})


doors.register_trapdoor("minetest_errata:trapdoor_glass", {
	description = S("Glass Trapdoor"),
	inventory_image = "minetest_errata_trapdoor_glass.png",
	wield_image = "minetest_errata_trapdoor_glass.png",
	tile_front = "minetest_errata_trapdoor_glass.png",
	tile_side = "minetest_errata_trapdoor_glass_side.png",
	groups = { cracky = 3, oddly_breakable_by_hand = 3, door = 1 },
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "minetest_errata:trapdoor_glass 2",
	recipe = {
		{ "default:glass", "default:glass", "default:stick" },
		{ "default:glass", "default:glass", "default:stick" },
	}
})


if minetest.get_modpath("moreblocks") then
	doors.register("door_clean_glass", {
		tiles = { { name = "minetest_errata_door_clean_glass.png", backface_culling = false } },
		description = S("Clean Glass Door"),
		inventory_image = "minetest_errata_door_clean_glass_item.png",
		sound_open = "doors_glass_door_open",
		sound_close = "doors_glass_door_close",
		sounds = default.node_sound_glass_defaults(),
		groups = { snappy = 2, bendy = 1, cracky = 1 },
		recipe = {
			{ "moreblocks:clean_glass", "moreblocks:clean_glass", "" },
			{ "moreblocks:clean_glass", "moreblocks:clean_glass", "" },
			{ "moreblocks:clean_glass", "moreblocks:clean_glass", "" },
		}
	})

	doors.register("door_coal_glass", {
		tiles = { { name = "minetest_errata_door_coal_glass.png", backface_culling = false } },
		description = S("Coal Glass Door"),
		inventory_image = "minetest_errata_door_coal_glass_item.png",
		sound_open = "doors_glass_door_open",
		sound_close = "doors_glass_door_close",
		sounds = default.node_sound_glass_defaults(),
		groups = { snappy = 2, bendy = 1, cracky = 1 },
		recipe = {
			{ "moreblocks:coal_glass", "moreblocks:coal_glass", "" },
			{ "moreblocks:coal_glass", "moreblocks:coal_glass", "" },
			{ "moreblocks:coal_glass", "moreblocks:coal_glass", "" },
		}
	})

	doors.register("door_iron_glass", {
		tiles = { { name = "minetest_errata_door_iron_glass.png", backface_culling = false } },
		description = S("Iron Glass Door"),
		inventory_image = "minetest_errata_door_iron_glass_item.png",
		sound_open = "doors_glass_door_open",
		sound_close = "doors_glass_door_close",
		sounds = default.node_sound_glass_defaults(),
		groups = { snappy = 2, bendy = 1, cracky = 1 },
		recipe = {
			{ "moreblocks:iron_glass", "moreblocks:iron_glass", "" },
			{ "moreblocks:iron_glass", "moreblocks:iron_glass", "" },
			{ "moreblocks:iron_glass", "moreblocks:iron_glass", "" },
		}
	})

	-- protected iron glass door

	doors.register("door_iron_glass_protected", {
		tiles = { { name = "minetest_errata_door_iron_glass.png", backface_culling = false } },
		description = S("Protected Iron Glass Door"),
		protected = true,
		inventory_image = "minetest_errata_door_iron_glass_item.png^(keys_key_skeleton.png^[transformR180FX)",
		sound_open = "doors_glass_door_open",
		sound_close = "doors_glass_door_close",
		sounds = default.node_sound_glass_defaults(),
		groups = { snappy = 2, bendy = 1, cracky = 1 },
		recipe = {
			{ "moreblocks:iron_glass", "moreblocks:iron_glass", "" },
			{ "moreblocks:iron_glass", "moreblocks:iron_glass", "default:steel_ingot" },
			{ "moreblocks:iron_glass", "moreblocks:iron_glass", "" },
		}
	})
end

-- Mesecons compatibility

if minetest.get_modpath("mesecons") then
	dofile(minetest_errata.modpath .. "/doors_mesecons.lua")
end
