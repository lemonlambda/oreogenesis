local functional = require("functions.functional")

script.on_event(defines.events.on_gui_opened, function(event)
  local player = game.players[event.player_index]
  local entity = event.entity

  if not entity or not entity.name:sub(1, 13) == "bio-processor" then return end
  if player.gui.relative["machine-grid"] then
    player.gui.relative["machine-grid"].destroy()
  end
  
  -- Don't show vanilla GUI
  -- player.opened = nil

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
  local car = storage.bio_processor_proxy_entities[event.element.tags.unit_number].grid
  player.opened = car
end)

script.on_event(defines.events.on_built_entity, function(event)
  if not storage.bio_processor_proxy_entities then storage.bio_processor_proxy_entities = {} end

  local entity = event.entity
  if not entity.valid or not entity.name:sub(1, 13) == "bio-processor" then return end

  local proxy_entity = entity.surface.create_entity {
    name = "bio-processor-proxy-equipment-grid",
    position = entity.position,
    force = entity.force
  }
  storage.bio_processor_proxy_entities[entity.unit_number] = proxy_entity
end)

script.on_event(defines.events.on_object_destroyed, function(event)
  local entity = event.entity
  if not entity.valid or not entity.name:sub(1, 13) == "bio-processor" then return end
  
  storage.bio_processor_proxy_entities[entity.unit_number].destroy()
  storage.bio_processor_proxy_entities[entity.unit_number] = nil
end)

---@param entity LuaEntity
---@param new_entity_name string
-- @returns LuaEntity
local function replace_entity(entity, new_entity_name)
    local new_entity = entity.surface.create_entity {
        name = new_entity_name,
        position = entity.position,
        force = entity.force_index,
        create_build_effect_smoke = false
    }
    entity.destroy()

    return new_entity
end

local function find_entity_by_unit_number(surface, unit_number)
  for _, e in pairs(surface.find_entities()) do
    if e.valid and e.unit_number == unit_number then
      return e
    end
  end
end

script.on_event(defines.events.on_equipment_inserted, function(event)
  local entity = event.grid.entity_owner
  if not entity.name == "bio-processor-proxy-equipment-grid" then return end

  local parent = find_entity_by_unit_number(entity.surface, functional.filter(storage.bio_processor_proxy_entities, function(k, v)
    return v.unit_number == entity.unit_number
  end)[1][1])
  game.print(serpent.block(parent))

  if event.equipment.name == "fe3-reducer" then
    storage.bio_processor_proxy_entities[parent.unit_number] = nil
    local new_parent = replace_entity(parent, "bio-processor-iron-producing")
    storage.bio_processor_proxy_entities[new_parent.unit_number] = entity
  end
end)

script.on_event(defines.events.on_equipment_removed, function(event)
  local entity = event.grid.entity_owner
  if not entity.name == "bio-processor-proxy-equipment-grid" then return end

  local parent = find_entity_by_unit_number(entity.surface, functional.filter(storage.bio_processor_proxy_entities, function(k, v)
    return v.unit_number == entity.unit_number
  end)[1][1])
  game.print(serpent.block(parent))
  game.print(serpent.block(event))

  if event.equipment == "fe3-reducer" then
    storage.bio_processor_proxy_entities[parent.unit_number] = nil
    local new_parent = replace_entity(parent, "bio-processor-blank")
    storage.bio_processor_proxy_entities[new_parent.unit_number] = entity
  end
end)
