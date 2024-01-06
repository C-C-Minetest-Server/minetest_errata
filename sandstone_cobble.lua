-- minetest_errata/sandstone_cobble.lua
-- Add cobble variant of sandstones
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

local cobble_table = {
	{ name = "sandstone",        desc = S("Sandstone Cobble") },
	{ name = "desert_sandstone", desc = S("Desert Sandstone Cobble") },
	{ name = "silver_sandstone", desc = S("Silver Sandstone Cobble") },
}

for _, node in ipairs(cobble_table) do
	minetest.register_node("minetest_errata:" .. node.name .. "_cobble", {
		description = node.desc,
		tiles = { "minetest_errata_" .. node.name .. "_cobble.png" },
		groups = { cracky = 3, [minetest_errata.prefix .. "sandstone"] = 1 },
		is_ground_content = false,
		sounds = default.node_sound_stone_defaults(),
	})

	minetest.register_craft({
		output = "minetest_errata:" .. node.name .. "_cobble 2",
		recipe = { { "default:" .. node.name, "default:" .. node.name } },
	})

	minetest.register_craft({
		type = "cooking",
		output = "default:" .. node.name,
		recipe = "minetest_errata:" .. node.name .. "_cobble",
	})

	-- Derivative blocks

	if stairs and stairs.mod and stairs.mod == "redo" then
		stairs.register_all(node.name .. "_cobble", "minetest_errata:" .. node.name .. "_cobble",
			{ cracky = 3 },
			{ "minetest_errata_" .. node.name .. "_cobble.png" },
			S("@1 Stair", node.desc),
			S("@1 Slab", node.desc),
			default.node_sound_stone_defaults())
	elseif minetest.global_exists("stairsplus") then
		stairsplus:register_all("minetest_errata", node.name .. "_cobble", "minetest_errata:" .. node.name .. "_cobble",
			{
				description = node.desc,
				tiles = { "minetest_errata_" .. node.name .. "_cobble.png" },
				groups = { cracky = 3 },
				sounds = default.node_sound_stone_defaults(),
			})
	else
		stairs.register_stair_and_slab(node.name .. "_cobble", "minetest_errata:" .. node.name .. "_cobble",
			{ cracky = 3 },
			{ "minetest_errata_" .. node.name .. "_cobble.png" },
			S("@1 Stair", node.desc),
			S("@1 Slab", node.desc),
			default.node_sound_stone_defaults())
	end


	-- Walls
	walls.register("minetest_errata:wall_" .. node.name .. "_cobble",
		S("@1 Wall", node.desc),
		"minetest_errata_" .. node.name .. "_cobble.png",
		"minetest_errata:" .. node.name .. "_cobble",
		default.node_sound_stone_defaults()
	)

	-- procedurally-generated arcs
	if minetest.get_modpath("pkarcs") then
		pkarcs.register_node("minetest_errata:" .. node.name .. "_cobble")
	end
end
