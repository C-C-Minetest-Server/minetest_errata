-- minetest_errata/init.lua
-- Fixes small errors and omissions in other mods
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

minetest_errata = {}
minetest_errata.prefix = "me_"
minetest_errata.modpath = minetest.get_modpath("minetest_errata")

dofile(minetest_errata.modpath.."/books.lua")

dofile(minetest_errata.modpath.."/doors.lua")

dofile(minetest_errata.modpath.."/sandstone_cobble.lua")

dofile(minetest_errata.modpath.."/flint_block.lua")

dofile(minetest_errata.modpath.."/missing_groups.lua")

dofile(minetest_errata.modpath.."/xpanes.lua")

dofile(minetest_errata.modpath.."/glass_panes.lua")

dofile(minetest_errata.modpath.."/mossy_blocks.lua")

dofile(minetest_errata.modpath.."/shelves.lua")

dofile(minetest_errata.modpath.."/chat_commands.lua")
