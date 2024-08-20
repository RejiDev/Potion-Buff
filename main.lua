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

local function check_for_enemies(player_position, buffs, enemy_type, distance)
  local enemies = target_selector.get_near_target_list(player_position, 12)

    for _, enemy in ipairs(enemies) do
      if enemy_type == "elite" and enemy:is_elite() or enemy_type == "elite" and enemy:is_champion() or enemy_type == "elite" and enemy:is_boss() or enemy_type == "boss" and enemy:is_boss() then
        local buff_count = count_buff(needed_buff, buffs)
        check_and_use_health_potion(buff_count)
      end
    end
end

on_update(function ()
  local local_player = get_local_player()
  
  if not local_player then
    return
  end

  if not menu.elements.main_toggle:get() then
    return
  end

  local buffs = local_player:get_buffs()
  local elite_toggle = menu.elements.elite_toggle:get()
  local boss_toggle = menu.elements.boss_toggle:get()
  local player_position = get_player_position()

  local distance = menu.elements.distance_slider:get()

  if boss_toggle then
    check_for_enemies(player_position, buffs, "boss", distance)

  elseif elite_toggle then
    check_for_enemies(player_position, buffs, "elite", distance)
  else
    local closest_target = target_selector.get_target_closer(player_position, 12)

    if closest_target then
      local buff_count = count_buff(needed_buff, buffs)
      check_and_use_health_potion(buff_count)
    end
  end
end)

on_render_menu(menu.render)