local induction_heater = table.deepcopy(data.raw.furnace["electric-furnace"])
induction_heater.type = "assembling-machine"
induction_heater.name = "induction-heater"
induction_heater.mineable = {
  mining_time = 1,
  result = "induction-heater",
  amount = 1
}
induction_heater.crafting_categories = { "induction-heater" }
induction_heater.crafting_speed = 0.5
induction_heater.energy_usage = "300kW"
induction_heater.energy_source = {
  type = "electric",
  buffer_capacity = "2MJ",
  usage_priority = "secondary-input",
}
induction_heater.fluid_boxes = {
  {
    production_type = "input",
    volume = 1000,
    pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {-1, -1} }},
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "input",
    volume = 1000,
    pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {1, -1} }},
    secondary_draw_orders = { north = -1 }
  },
  {
    production_type = "output",
    volume = 1000,
    pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {0, 1} }},
    secondary_draw_orders = { north = -1 }
  },
}

local induction_heater_item = {
  type = "item",
  name = "induction-heater",
  icon = "__base__/graphics/icons/electric-furnace.png",
  place_result = "induction-heater",
  stack_size = 50,
}

local induction_heater_recipe = {
  type = "recipe",
  name = "induction-heater",
  results = {
    {
      type = "item",
      name = "induction-heater",
      amount = 1,
    },
  }
}

local induction_heater_recipe_category = {
  type = "recipe-category",
  name = "induction-heater",
}

local oxygen = {
  type = "fluid",
  name = "oxygen",
  icon = "__Krastorio2Assets__/icons/fluids/oxygen.png",
  base_color = {255/255, 64/255, 64/255},
  flow_color = {255/255, 64/255, 64/255},
  default_temperature = 15,
}

local produce_iron_plate = {
  type = "recipe",
  name = "produce-iron-plate",
  icon = "__base__/graphics/icons/iron-plate.png",
  category = "induction-heater",
  ingredients = {
    {
      type = "item",
      name = "iron-ore",
      amount = 5,
    },
  },
  results = {
    {
      type = "fluid",
      name = "oxygen",
      amount = 1,
    },
    {
      type = "item",
      name = "iron-plate",
      amount = 1,
    },
  },
}

data:extend{
  induction_heater,
  induction_heater_item,
  induction_heater_recipe,
  induction_heater_recipe_category,
  oxygen,
  produce_iron_plate,
}
