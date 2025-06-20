function create_equipment(definition)
  data:extend({
    {
      type = "item",
      name = definition.name,
      icon = definition.icon or "__base__/graphics/entity/accumulator/accumulator.png",
      stack_size = definition.stack_size or 10,
      place_as_equipment_result = definition.name,
    },
    {
      type = "battery-equipment",
      name = definition.name,
      categories = definition.categories,
      shape = definition.shape,
      sprite = definition.sprite or {
        filename = "__base__/graphics/entity/accumulator/accumulator.png",
        width = 130,
        height = 189,
      },
      energy_source = definition.energy_source or {
        type = "electric",
        usage_priority = "secondary-input",
        drain = "0kW",
      },
    },
    {
      type = "recipe",
      name = definition.name,
      ingredients = definition.ingredients or {},
      results = definition.results or {
        {
          type = "item",
          name = definition.name,
          amount = 1,
        },
      },
    }
  })
end

create_equipment{
  name = "test-equipment",
  categories = {"bio-processor-equipment"},
  shape = {
    width = 2,
    height = 2,
    type = "full",
  },
}

create_equipment{
  name = "fe3-reducer",
  categories = {"bio-processor-equipment"},
  shape = {
    width = 3,
    height = 2,
    type = "full",
  },
}
