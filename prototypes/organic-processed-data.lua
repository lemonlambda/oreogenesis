local analyzer = {
  type = "assembling-machine",
  name = "analyzer",
  icon = "__oreogenesis__/graphics/research-center/research-center-icon.png",
  off_animation = {
    layers = {
      {
        filename = "__oreogenesis__/graphics/research-center/research-center-hr-shadow.png",
        size = {1000, 666},
        draw_as_shadow = true,
      },
      {
          filename = "__oreogenesis__/graphics/research-center/research-center-hr-emission-1.png",
        size = { 530, 530 },
        draw_as_light = true,
      },
      {
        filename = "__oreogenesis__/graphics/research-center/research-center-hr-animation-1.png",
        size = { 530, 530 },
      },
    }
  },
  on_animation = {
    layers = {
      {
        filename = "__oreogenesis__/graphics/research-center/research-center-hr-shadow.png",
        size = {1000, 666},
        draw_as_shadow = true,
      },
      {
          filename = "__oreogenesis__/graphics/research-center/research-center-hr-emission-1.png",
        size = { 530, 530 },
        draw_as_light = true,
      },
      {
        filename = "__oreogenesis__/graphics/research-center/research-center-hr-animation-1.png",
        size = { 530, 530 },
      },
    }
  },
  minable = {
    mining_time = 1,
    result = "analyzer",
    amount = 1
  },
  crafting_categories = {
    "analyzer",
  },
  allow_copy_paste = true,
  crafting_speed = 0.5,
  energy_usage = "1000QW",
  energy_source = {
    type = "void",
  },
  collision_box = {
    {-3.5, -3.5}, {3.5, 7.5}
  },
  selection_box = {
    {-4, -4}, {4, 4}
  },
  crafting_speed = 1.0,
}

local analyzer_item = {
  type = "item",
  name = "analyzer",
  icon = "__oreogenesis__/graphics/research-center/research-center-icon.png",
  stack_size = 50,
}

local analyzer_recipe = {
  type = "recipe",
  name = "analyzer",
  icon = "__oreogenesis__/graphics/research-center/research-center-icon.png",
  results = {
    {
      type = "item",
      name = "analyzer",
      amount = 1,
    },
  },
}

local analyzer_recipe_category = {
  type = "recipe-category",
  name = "analyzer",
}

local organic_processed_data = {
  type = "tool",
  name = "organic-processed-data",
  icon = "__Krastorio2Assets__/icons/cards/matter-research-data.png",
  stack_size = 100,
  durability = 10,
}

-- First real way to make opd
local opd_first = {
  
}

data:extend{
  analyzer,
  analyzer_item,
  analyzer_recipe,
  analyzer_recipe_category,
  
  organic_processed_data
}
