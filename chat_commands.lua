-- minetest_errata/chat_commands.lua
-- Chat commands
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
local pending = "pending recount..."  -- Not quite possible to be shown, so do not translate

minetest_errata.stats = {
	n = pending,
	c = pending,
	t = pending,
	e = pending,
	a = pending,
	g = pending,
	l = pending,
	abms = {},
	lbms = {},
}

minetest.after(0, function()
	local n = {}
	n.n = 0
	for _, i in pairs(minetest.registered_nodes) do
		n.n = n.n + 1
	end

	n.c = 0
	for _, i in pairs(minetest.registered_craftitems) do
		n.c = n.c + 1
	end

	n.t = 0
	for _, i in pairs(minetest.registered_tools) do
		n.t = n.t + 1
	end

	n.e = 0
	for _, i in pairs(minetest.registered_entities) do
		n.e = n.e + 1
	end

	n.a = 0
	n.abms = {}
	for _, i in pairs(minetest.registered_abms) do
		n.a = n.a + 1
		local l = i.label or "no label"
		local nodenames = i.nodenames
		if type(nodenames) ~= "table" then
			nodenames = { nodenames }
		end
		table.insert(n.abms, { l, i.interval, i.chance, nodenames })
	end

	n.g = 0
	for _, i in pairs(minetest.registered_globalsteps) do
		n.g = n.g + 1
	end

	n.l = 0
	n.lbms = {}
	for _, i in pairs(minetest.registered_lbms) do
		n.l = n.l + 1
		local l = i.name or "no name"
		local nodenames = i.nodenames
		if type(nodenames) ~= "table" then
			nodenames = { nodenames }
		end
		table.insert(n.lbms, { l, i.run_at_every_load, nodenames })
	end

	minetest_errata.stats = n
end)

-- show the stats on registered nodes and suchlike
minetest.register_chatcommand("showmewhatyougot", {
	description = S("Show statistics of registered items and callbacks"),
	privs = { shout = true },
	func = function(name)
		return true, S("Registered nodes: @1", minetest_errata.stats.n) .. "\n" ..
			S("Registered craftitems: @1", minetest_errata.stats.c) .. "\n" ..
			S("Registered tools: @1", minetest_errata.stats.t) .. "\n" ..
			S("Registered entities: @1", minetest_errata.stats.e) .. "\n" ..
			S("Registered ABMs: @1", minetest_errata.stats.a) .. "\n" ..
			S("Registered LBMs: @1", minetest_errata.stats.l) .. "\n" ..
			S("Registered globalsteps: @1", minetest_errata.stats.g) .. "\n"
	end,
})

minetest.register_chatcommand("showmewhatyougot_abms", {
	description = S("Detailed statistics on ABMs"),
	privs = { shout = true },
	func = function(name)
		local rtn = {}
		for _, l in ipairs(minetest_errata.stats.abms) do
			table.insert(rtn, l[1] .. " - " .. l[2] .. " (" .. l[3] .. ") - " .. table.concat(l[4], ", "))
		end

		return true, table.concat(rtn, "\n")
	end,
})

minetest.register_chatcommand("showmewhatyougot_lbms", {
	description = S("Detailed statistics on LBMs"),
	privs = { shout = true },
	func = function(name)
		local rtn = {}
		for _, l in ipairs(minetest_errata.stats.lbms) do
			local n = ""
			if type(l[3]) == "string" then
				n = l[3]
			else
				n = table.concat(l[3], ", ")
			end
			local f = l[2] or "x"
			table.insert(rtn, l[1] .. " - " .. tostring(f) .. " - " .. n)
		end

		return true, table.concat(rtn, "\n")
	end,
})

-- provide coordinated in teleport-ready format
minetest.register_chatcommand("whereami", {
	params = "",
	description = S("Get current position, adjusted for teleporting"),
	privs = { shout = true },
	func = function(name)
		local player = minetest.get_player_by_name(name)

		local p = player:get_pos()

		local px = math.floor(p.x)
		local py = math.ceil(p.y)
		local pz = math.floor(p.z)

		return true, S("Your position: @1,@2,@3", px, py, pz)
	end,
})
