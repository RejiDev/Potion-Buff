local needed_buff = "Rogue_Talent_Discipline_T3_N4"
local menu = require("menu")

on_update(function ()

  if not menu.elements.main_toggle:get() then
    return
  end

  local player_position = get_player_position()

  local local_player = get_local_player()
  local buffs = local_player:get_buffs()

  local closest_target = target_selector.get_target_closer(player_position, 12)

  if closest_target then
    local buff_count = 0

    for _, buff in ipairs(buffs) do
      local buff_name = buff:name()

      if buff_name == needed_buff then
        buff_count = buff_count + 1
      end
    end

    if buff_count < 2 then
      use_health_potion()
    end
  end
end)

on_render_menu(menu.render)
