-- minetest_errata/mossy_blocks.lua
-- Mossy Blocks
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

local node = {
	name = "minetest_errata:mossystone",
	short_name = "mossystone",
	desc = S("Mossy Stone"),
	tile = "default_stone.png^minetest_errata_moss_overlay.png",
}

minetest.register_node(node.name, {
	description = node.desc,
	tiles = { node.tile },
	groups = { cracky = 3, stone = 1 },
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	drop = "default:mossycobble",
})

minetest.register_craft({
	output = node.name,
	type = "shapeless",
	recipe = { "default:junglegrass", "default:stone" },
})


-- Derivative blocks

if stairs and stairs.mod and stairs.mod == "redo" then
	stairs.register_all(node.short_name, node.name,
		{ cracky = 3, stone = 1 },
		{ node.tile },
		S("@1 Stair", node.desc),
		S("@1 Slab", node.desc),
		default.node_sound_wood_defaults())
elseif minetest.global_exists("stairsplus") then
	stairsplus:register_all("minetest_errata", node.short_name, node.name, {
		description = node.desc,
		tiles = { node.tile },
		groups = { cracky = 3, stone = 1 },
		sounds = default.node_sound_wood_defaults(),
	})
else
	stairs.register_stair_and_slab(node.short_name, node.name,
		{ cracky = 3, stone = 1 },
		{ node.tile },
		S("@1 Stair", node.desc),
		S("@1 Slab", node.desc),
		default.node_sound_wood_defaults())
end

if minetest.get_modpath("moreblocks") then
	local node = {
		name = "minetest_errata:mossy_stone_tile",
		short_name = "mossy_stone_tile",
		desc = S("Mossy Stone Tile"),
		tile = "moreblocks_stone_tile.png^minetest_errata_moss_overlay.png",
	}

	minetest.register_node(node.name, {
		description = node.desc,
		tiles = { node.tile },
		groups = { cracky = 3, stone = 1 },
		is_ground_content = false,
		sounds = default.node_sound_stone_defaults(),
		drop = node.name,
	})

	minetest.register_craft({
		output = node.name,
		recipe = { { "default:mossycobble", "default:mossycobble" },
			{ "default:mossycobble", "default:mossycobble" } }
	})

	if stairs and stairs.mod and stairs.mod == "redo" then
		stairs.register_all(node.short_name, node.name,
			{ cracky = 3, stone = 1 },
			{ node.tile },
			S("@1 Stair", node.desc),
			S("@1 Slab", node.desc),
			default.node_sound_wood_defaults())
	elseif minetest.global_exists("stairsplus") then
		stairsplus:register_all("minetest_errata", node.short_name, node.name, {
			description = node.desc,
			tiles = { node.tile },
			groups = { cracky = 3, stone = 1 },
			sounds = default.node_sound_wood_defaults(),
		})
	else
		stairs.register_stair_and_slab(node.short_name, node.name,
			{ cracky = 3, stone = 1 },
			{ node.tile },
			S("@1 Stair", node.desc),
			S("@1 Slab", node.desc),
			default.node_sound_wood_defaults())
	end
end
