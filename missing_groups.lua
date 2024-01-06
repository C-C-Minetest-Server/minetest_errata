-- minetest_errata/missing_groups.lua
-- Block groups of nodes
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

local nodes_with_missing_groups = {
	-- Sandstone varieties
	{name = "default:sandstone", groups = {sandstone = 1}},
	{name = "default:sandstonebrick", groups = {sandstone = 1}},
	{name = "default:sandstone_block", groups = {sandstone = 1}},
	{name = "default:desert_sandstone", groups = {sandstone = 1}},
	{name = "default:desert_sandstone_brick", groups = {sandstone = 1}},
	{name = "default:desert_sandstone_block", groups = {sandstone = 1}},
	{name = "default:silver_sandstone", groups = {sandstone = 1}},
	{name = "default:silver_sandstone_brick", groups = {sandstone = 1}},
	{name = "default:silver_sandstone_block", groups = {sandstone = 1}},
	-- Red bricks
	{name = "default:brick", groups = {bricks = 1}},
	-- Obsidian
	{name = "default:obsidian", groups = {stone = 1}},
	{name = "default:obsidianbrick", groups = {stone = 1}},
	{name = "default:obsidian_block", groups = {stone = 1}},
}

for _,node in ipairs(nodes_with_missing_groups) do
	
	local entity = {}
	for name,value in pairs(minetest.registered_nodes[node.name]) do
		entity[name] = value
	end
	for g,v in pairs(node.groups) do
		entity.groups[minetest_errata.prefix .. g] = v
	end
	minetest.register_node(":" .. node.name, entity)

end

