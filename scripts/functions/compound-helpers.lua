local functional = require("functional")
local helpers = {}

function helpers.is_named(entity, name)
  if not entity.valid or string.find(entity.name, name) == nil then return false end
  return true
end

function helpers.new_proxy(parent, name)
  return parent.surface.create_entity {
    name = name,
    position = parent.position,
    force = parent.force
  }
end

---@param entity LuaEntity
---@param new_entity_name string
-- @returns LuaEntity
function helpers.replace_entity(entity, new_entity_name)
    local new_entity = entity.surface.create_entity {
        name = new_entity_name,
        position = entity.position,
        force = entity.force_index,
        create_build_effect_smoke = false
    }
    entity.destroy()

    return new_entity
end

function helpers.find_entity_by_unit_number(surface, unit_number)
  local filtered = functional.filter(surface.find_entities(), function(k, v)
    return v.valid and v.unit_number == unit_number
  end)
  return filtered[1][2]
end

-- Replaces parent with a new entity and changes the child to the new parent
function helpers.replace_parent(parent, child, new_name)
  storage.bio_processor_proxy_entities[parent.unit_number] = nil
  local new_parent = helpers.replace_entity(parent, new_name)
  storage.bio_processor_proxy_entities[new_parent.unit_number] = child
end

-- Gets a parent - child pair of entities from a unit number
function helpers.get_compound_parent_pair_from_entity(array, entity)
  return functional.filter(array, function(k, v)
    return v.unit_number == entity.unit_number
  end)[1]
end

return helpers
