-- minetest_errata/xpanes.lua
-- Panes
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

xpanes.register_pane("paper", {
	description = S("Paper Barrier"),
	inventory_image = "minetest_errata_paperwall.png",
	wield_image = "minetest_errata_paperwall.png",
	textures = { "minetest_errata_paperwall.png", "minetest_errata_paperwall.png", "minetest_errata_paperwall.png" },
	groups = { snappy = 3, flammable = 4, pane = 1 },
	sounds = {
		footstep = { name = "minetest_errata_paper_step", gain = 0.1, max_hear_distance = 7 },
		place = { name = "minetest_errata_paper_step", gain = 0.3, max_hear_distance = 13 },
		dig = { name = "minetest_errata_paper_dig", gain = 0.1, max_hear_distance = 11 },
		dug = { name = "minetest_errata_paper_dug", gain = 0.2, max_hear_distance = 13 },
	},
	recipe = {
		{ "default:paper", "default:paper", "default:paper" },
		{ "default:paper", "default:paper", "default:paper" },
	}
})


xpanes.register_pane("wood", {
	description = S("Wooden Bars"),
	inventory_image = "minetest_errata_wooden_bar.png",
	wield_image = "minetest_errata_wooden_bar.png",
	textures = { "minetest_errata_wooden_bar.png", "minetest_errata_wooden_bar_side.png", "minetest_errata_wooden_bar_y.png" },
	groups = { choppy = 3, oddly_breakable_by_hand = 2, flammable = 2, pane = 1 },
	sounds = default.node_sound_wood_defaults(),
	recipe = {
		{ "group:wood", "", "group:wood" },
		{ "group:wood", "", "group:wood" },
		{ "group:wood", "", "group:wood" },
	}
})


local extra_groups = {
	"group:bakedclay",
	"group:" .. minetest_errata.prefix .. "sandstone",
	"group:" .. minetest_errata.prefix .. "stone",
	"group:" .. minetest_errata.prefix .. "bricks",
}

local xpane_nodes = { "xpanes:bar", "xpanes:pane", "xpanes:wood", "xpanes:paper" }

for _, node in ipairs(xpane_nodes) do
	local entity = {}
	for name, value in pairs(minetest.registered_nodes[node]) do
		entity[name] = value
	end

	for _, g in ipairs(extra_groups) do
		table.insert(entity.connects_to, g)
	end

	minetest.register_node(":" .. node, entity)
end

if minetest.get_modpath("glass_stained") then
	local entity = {}
	for name, value in pairs(minetest.registered_nodes["xpanes:bar_top"]) do
		entity[name] = value
	end

	for _, g in ipairs(extra_groups) do
		table.insert(entity.connects_to, g)
	end

	minetest.register_node(":xpanes:bar_top", entity)
end
