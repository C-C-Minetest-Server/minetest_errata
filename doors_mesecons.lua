-- minetest_errata/doors_mesecons.lua
-- Mesecons of doors
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


-- Modified, from minetest_game/mods/doors/init.lua
local function on_rightclick(pos, dir, check_name, replace, replace_dir, params)
	pos.y = pos.y + dir
	if not minetest.get_node(pos).name == check_name then
		return
	end
	local p2 = minetest.get_node(pos).param2
	p2 = params[p2 + 1]

	minetest.swap_node(pos, { name = replace_dir, param2 = p2 })

	pos.y = pos.y - dir
	minetest.swap_node(pos, { name = replace, param2 = p2 })

	if (minetest.get_meta(pos):get_int("right") ~= 0) == (params[1] ~= 3) then
		minetest.sound_play("doors_door_close", { pos = pos, gain = 0.3, max_hear_distance = 10 })
	else
		minetest.sound_play("doors_door_open", { pos = pos, gain = 0.3, max_hear_distance = 10 })
	end
end

local function meseconify_door(name)
	if minetest.registered_items[name .. "_b_1"] then
		-- old style double-node doors
		local function toggle_state1(pos, node)
			on_rightclick(pos, 1, name .. "_t_1", name .. "_b_2", name .. "_t_2", { 1, 2, 3, 0 })
		end

		local function toggle_state2(pos, node)
			on_rightclick(pos, 1, name .. "_t_2", name .. "_b_1", name .. "_t_1", { 3, 0, 1, 2 })
		end

		minetest.override_item(name .. "_b_1", {
			mesecons = {
				effector = {
					action_on = toggle_state1,
					action_off = toggle_state1,
					rules = mesecon.rules.pplate
				}
			}
		})

		minetest.override_item(name .. "_b_2", {
			mesecons = {
				effector = {
					action_on = toggle_state2,
					action_off = toggle_state2,
					rules = mesecon.rules.pplate
				}
			}
		})
	elseif minetest.registered_items[name .. "_a"] then
		-- new style mesh node based doors
		local override = {
			mesecons = {
				effector = {
					action_on = function(pos, node)
						local door = doors.get(pos)
						if door then
							door:open()
						end
					end,
					action_off = function(pos, node)
						local door = doors.get(pos)
						if door then
							door:close()
						end
					end,
					rules = mesecon.rules.pplate
				}
			}
		}
		minetest.override_item(name .. "_a", override)
		minetest.override_item(name .. "_b", override)
	end
end


meseconify_door("doors:door_wood_solid")
meseconify_door("doors:door_steel_solid")
meseconify_door("doors:door_wood_bar")
meseconify_door("doors:door_iron_bar")
meseconify_door("doors:door_glass_protected")
meseconify_door("doors:door_obsidian_glass_protected")

if minetest.get_modpath("moreblocks") then
	meseconify_door("doors:door_clean_glass")
	meseconify_door("doors:door_coal_glass")
	meseconify_door("doors:door_iron_glass")
	meseconify_door("doors:door_iron_glass_protected")
end

-- Glass trapdoor

if doors and doors.get then
	local override = {
		mesecons = {
			effector = {
				action_on = function(pos, node)
					local door = doors.get(pos)
					if door then
						door:open()
					end
				end,
				action_off = function(pos, node)
					local door = doors.get(pos)
					if door then
						door:close()
					end
				end,
			}
		},
	}
	minetest.override_item("minetest_errata:trapdoor_glass", override)
	minetest.override_item("minetest_errata:trapdoor_glass_open", override)
end
