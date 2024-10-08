local plugin_label = "REJI_POTION_BUFF"
local menu = {}

menu.elements = {
  main_tree = tree_node:new(0),
  main_toggle = checkbox:new(false, get_hash(plugin_label .. "_main_toggle")),

  distance_slider = slider_int:new(2, 10, 10, get_hash(plugin_label .. "_distance_slider")),

  elite_toggle = checkbox:new(false, get_hash(plugin_label .. "_elite_toggle")),
  boss_toggle = checkbox:new(false, get_hash(plugin_label .. "_boss_toggle")),
}

function menu.render()
  if not menu.elements.main_tree:push("Potion Buff (Reji)") then
    return
  end

  menu.elements.main_toggle:render("Enable", "Toggles Potion Buff on/off")
  if not menu.elements.main_toggle:get() then
    menu.elements.main_tree:pop()
    return
  end

  menu.elements.distance_slider:render("Distance (Default 10m)", "Distance from monsters to use Potion")
  menu.elements.elite_toggle:render("Elite Only", "Uses Potions Only Near Elites/Bosses")
  menu.elements.boss_toggle:render("Boss Only", "Uses Potions Only Near Bosses")

end

return menu
