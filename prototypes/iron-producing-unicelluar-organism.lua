local produce_fe2_solution = {
  type = "recipe",
  name = "produce-fe2-solution",
  icon = "__base__/graphics/entity/accumulator/accumulator.png",
  category = "bio-processor",
  ingredients = {
    {
      type = "item",
      name = "nutrients",
      amount = 5,
    },
    {
      type = "fluid",
      name = "primordial-soup",
      amount = 10,
    },
    {
      type = "item",
      name = "simple-unicelluar-organism-iron-producing",
      amount = 1,
    },
  },
  results = {
    {
      type = "item",
      name = "simple-unicelluar-organism-iron-producing",
      amount = 1,
    },
    {
      type = "fluid",
      name = "fe2-solution",
      amount = 10,
    },
  }
}

local fe2_solution = {
  type = "fluid",
  name = "fe2-solution",
  icon = "__base__/graphics/icons/fluid/heavy-oil.png",
  base_color = {255/255, 220/225, 138/225},
  flow_color = {255/255, 220/225, 138/225},
  default_temperature = 15,
}

local boil_fe2_solution = {
  type = "recipe",
  name = "boil-fe2-solution",
  icon = "__base__/graphics/icons/fluid/steam.png",
  category = "induction-heater",
  ingredients = {
    {
      type = "fluid",
      name = "fe2-solution",
      amount = 50,
    },
    {
      type = "fluid",
      name = "oxygen",
      amount = 10,
    },
  },
  results = {
    {
      type = "item",
      name = "iron-ore",
      amount = 10,
    },
    {
      type = "fluid",
      name = "steam",
      amount = 40,
      temperature = 500,
    },
  },
}

data:extend{
  produce_fe2_solution,
  fe2_solution,
  boil_fe2_solution,
}
