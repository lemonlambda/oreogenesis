local functional = require("functions.functional")
local compound_helpers = require("functions.compound-helpers")
if not storage.bio_processor_proxy_entities then storage.bio_processor_proxy_entities = {} end

script.on_event(defines.events.on_gui_opened, function(event)
  local player = game.players[event.player_index]
  local entity = event.entity

  if not entity or not entity.name:sub(1, 13) == "bio-processor" then return end
  if player.gui.relative["machine-grid"] then
    player.gui.relative["machine-grid"].destroy()
  end
  
  local root = player.gui.relative.add{
    type = "frame",
    name = "machine-grid",
    caption = "Machine Grid",
    direction = "vertical",
    anchor = {
      gui = defines.relative_gui_type.assembling_machine_gui,
      position = defines.relative_gui_position.right
    },
  }
  root.add{
    type = "button",
    name = "open-machine-grid",
    caption = "Open Machine Grid",
    tags = {
      unit_number = entity.unit_number,
    },
  }
end)

script.on_event(defines.events.on_gui_click, function(event)
  local player = game.players[event.player_index]
  if not event.element.name == "open-machine-grid" then return end
  if storage.bio_processor_proxy_entities[event.element.tags.unit_number] == nil then return end

  local machine_grid = storage.bio_processor_proxy_entities[event.element.tags.unit_number].grid
  player.opened = machine_grid
end)

script.on_event(defines.events.on_built_entity, function(event)
  local entity = event.entity
  if not compound_helpers.is_named(entity, "bio-processor") then return end

  local proxy_entity = compound_helpers.new_proxy(entity, "bio-processor-proxy-equipment-grid")
  storage.bio_processor_proxy_entities[entity.unit_number] = proxy_entity
end)

script.on_event(defines.events.on_object_destroyed, function(event)
  local entity = event.entity
  if not compound_helpers.is_named(entity, "bio-processor") then return end
  
  storage.bio_processor_proxy_entities[entity.unit_number].destroy()
  storage.bio_processor_proxy_entities[entity.unit_number] = nil
end)

script.on_event(defines.events.on_equipment_inserted, function(event)
  local entity = event.grid.entity_owner
  if not entity.name == "bio-processor-proxy-equipment-grid" then return end

  local parent_unit_number = compound_helpers.get_compound_parent_pair_from_entity(storage.bio_processor_proxy_entities, entity)[1]
  local parent = compound_helpers.find_entity_by_unit_number(entity.surface, parent_unit_number)

  if event.equipment.name == "fe3-reducer" then
    compound_helpers.replace_parent(parent, entity, "bio-processor-iron-producing")
  end
end)

script.on_event(defines.events.on_equipment_removed, function(event)
  local entity = event.grid.entity_owner
  if not entity.name == "bio-processor-proxy-equipment-grid" then return end

  local parent_unit_number = compound_helpers.get_compound_parent_pair_from_entity(storage.bio_processor_proxy_entities, entity)[1]
  local parent = compound_helpers.find_entity_by_unit_number(entity.surface, parent_unit_number)

  if event.equipment == "fe3-reducer" then
    compound_helpers.replace_parent(parent, entity, "bio-processor-blank")
  end
end)
