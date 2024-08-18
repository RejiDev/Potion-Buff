local plugin_label = "REJI_POTION_BUFF"
local menu = {}

menu.elements = {
  main_tree = tree_node:new(0),
  main_toggle = checkbox:new(false, get_hash(plugin_label .. "_main_toggle")),

  elite_toggle = checkbox:new(false, get_hash(plugin_label .. "_elite_toggle"))
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

  menu.elements.elite_toggle:render("Elite Only", "Uses Potions Only Near Elites/Bosses")

end

return menu
