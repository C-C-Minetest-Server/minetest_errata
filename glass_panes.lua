-- minetest_errata/glass_panes.lua
-- Glass Panes
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

-- Double pane: top is decorative and can noclip through some slopes and such

minetest.register_node("minetest_errata:pane_flat_double", {
	description = S("Double Glass Pane"),
	drawtype = "nodebox",
	tiles = { "minetest_errata_xpanes_white.png", "minetest_errata_xpanes_white.png", "default_glass.png" },
	inventory_image = "minetest_errata_double_glass_item.png",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,

	node_box = {
		type = "fixed",
		fixed = { { -1 / 2, -1 / 2, -1 / 32, 1 / 2, 3 / 2, 1 / 32 } },
	},
	selection_box = {
		type = "fixed",
		fixed = { { -1 / 2, -1 / 2, -1 / 32, 1 / 2, 1 / 2, 1 / 32 } },
	},

	groups = { cracky = 3 },
	use_texture_alpha = true,
})

minetest.register_craft({
	output = "minetest_errata:pane_flat_double",
	recipe = {
		{ "xpanes:pane_flat", },
		{ "xpanes:pane_flat", },
	},
})

minetest.register_craft({
	output = "xpanes:pane_flat 2",
	type = "shapeless",
	recipe = { "minetest_errata:pane_flat_double" }
})



-- Triple pane: top and right part are decorative

minetest.register_node("minetest_errata:pane_flat_triple", {
	description = S("Triple Glass Pane"),
	drawtype = "nodebox",
	tiles = { "minetest_errata_xpanes_white.png", "minetest_errata_xpanes_white.png", "default_glass.png" },
	inventory_image = "minetest_errata_triple_glass_item.png",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,

	node_box = {
		type = "fixed",
		fixed = { { -1 / 2, -1 / 2, -1 / 32, 1 / 2, 3 / 2, 1 / 32 },
			{ -1 / 2, -1 / 2, -1 / 32, 3 / 2, 1 / 2, 1 / 32 } },
	},
	selection_box = {
		type = "fixed",
		fixed = { { -1 / 2, -1 / 2, -1 / 32, 1 / 2, 1 / 2, 1 / 32 } },
	},

	groups = { cracky = 3 },
	use_texture_alpha = true,
})

minetest.register_craft({
	output = "minetest_errata:pane_flat_triple",
	recipe = {
		{ "xpanes:pane_flat", "" },
		{ "xpanes:pane_flat", "xpanes:pane_flat", },
	},
})

minetest.register_craft({
	output = "xpanes:pane_flat 3",
	type = "shapeless",
	recipe = { "minetest_errata:pane_flat_triple" }
})


-- Quadruple pane: all parts save for bottom left are decorative

minetest.register_node("minetest_errata:pane_flat_quadruple", {
	description = S("Quadruple Glass Pane"),
	drawtype = "nodebox",
	tiles = { "minetest_errata_xpanes_white.png", "minetest_errata_xpanes_white.png", "default_glass.png" },
	inventory_image = "minetest_errata_quadruple_glass_item.png",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,

	node_box = {
		type = "fixed",
		fixed = { { -1 / 2, -1 / 2, -1 / 32, 3 / 2, 3 / 2, 1 / 32 } },
	},
	selection_box = {
		type = "fixed",
		fixed = { { -1 / 2, -1 / 2, -1 / 32, 1 / 2, 1 / 2, 1 / 32 } },
	},

	groups = { cracky = 3 },
	use_texture_alpha = true,
})

minetest.register_craft({
	output = "minetest_errata:pane_flat_quadruple",
	recipe = {
		{ "xpanes:pane_flat", "xpanes:pane_flat", },
		{ "xpanes:pane_flat", "xpanes:pane_flat", },
	},
})

minetest.register_craft({
	output = "xpanes:pane_flat 4",
	type = "shapeless",
	recipe = { "minetest_errata:pane_flat_quadruple" }
})
