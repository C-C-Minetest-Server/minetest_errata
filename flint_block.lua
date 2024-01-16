-- minetest_errata/flint_block.lua
-- Flint Block: a good use for otherwise useless item
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
	name = "flint_block",
	desc = "Flint Block",
	tile = { "minetest_errata_flint_block.png" }
}

minetest.register_node("minetest_errata:flint_block", {
	description = S("Flint Block"),
	tiles = { "minetest_errata_flint_block.png" },
	is_ground_content = false,
	groups = { cracky = 2 },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "minetest_errata:flint_block",
	recipe = {
		{ "default:flint", "default:flint", "default:flint" },
		{ "default:flint", "default:flint", "default:flint" },
		{ "default:flint", "default:flint", "default:flint" },
	}
})

minetest.register_craft({
	output = "default:flint 9 ",
	recipe = {
		{ "minetest_errata:flint_block" },
	}
})

-- Derivative blocks


if stairs and stairs.mod and stairs.mod == "redo" then
	stairs.register_all("flint_block", "minetest_errata:flint_block",
		{ cracky = 3 },
		{ "minetest_errata_flint_block.png" },
		S("@1 Stair", S("Flint Block")),
		S("@1 Slab", S("Flint Block")),
		default.node_sound_stone_defaults())
elseif minetest.global_exists("stairsplus") then
	stairsplus:register_all("minetest_errata", "flint_block", "minetest_errata:flint_block", {
		description = S("Flint Block"),
		tiles = { "minetest_errata:flint_block" },
		groups = { cracky = 3 },
		sounds = default.node_sound_stone_defaults(),
	})
else
	stairs.register_slab("flint_block", "minetest_errata:flint_block",
		{ cracky = 2 },
		{ "minetest_errata_flint_block.png",
			"minetest_errata_flint_block.png",
			"minetest_errata_flint_block_slab.png",
			"minetest_errata_flint_block_slab.png",
			"minetest_errata_flint_block_slab.png",
			"minetest_errata_flint_block_slab.png"
		},
		S("@1 Stair", S("Flint Block")),
		default.node_sound_stone_defaults()
	)
	stairs.register_stair("flint_block", "minetest_errata:flint_block",
		{ cracky = 2 },
		{ "minetest_errata_flint_block_slab.png",
			"minetest_errata_flint_block.png",
			"minetest_errata_flint_block_stair1.png",
			"minetest_errata_flint_block_stair2.png",
			"minetest_errata_flint_block.png",
			"minetest_errata_flint_block_slab.png"
		},
		S("@1 Slab", S("Flint Block")),
		default.node_sound_stone_defaults()
	)
end


-- procedurally-generated arcs
if minetest.get_modpath("pkarcs") then
	pkarcs.register_node("minetest_errata:flint_block")
end
