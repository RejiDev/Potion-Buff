local needed_buff = "Rogue_Talent_Discipline_T3_N4"
local menu = require("menu")

local function count_buff(buff_name, buffs)
  local count = 0
  for _, buff in ipairs(buffs) do
    if buff:name() == buff_name then
      count = count + 1
    end
  end
  return count
end

local function check_and_use_health_potion(buff_count)
  if buff_count < 2 then
    use_health_potion()
  end
end

on_update(function ()
  local local_player = get_local_player()
  local buffs = local_player:get_buffs()

  if not menu.elements.main_toggle:get() then
    return
  end

  local elite_toggle = menu.elements.elite_toggle:get()
  local player_position = get_player_position()

  if elite_toggle then
    local enemies = target_selector.get_near_target_list(player_position, 12)

    for _, enemy in ipairs(enemies) do
      if enemy:is_elite() or enemy:is_champion() or enemy:is_boss() then
        local buff_count = count_buff(needed_buff, buffs)
        check_and_use_health_potion(buff_count)
      end
    end
  else
    local closest_target = target_selector.get_target_closer(player_position, 12)

    if closest_target then
      local buff_count = count_buff(needed_buff, buffs)
      check_and_use_health_potion(buff_count)
    end
  end
end)

-- Render the menu
on_render_menu(menu.render)
