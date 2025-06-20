local analyzer = {
  type = "assembling-machine",
  name = "analyzer",
  icon = "__oreogenesis__/graphics/research-center/research-center-icon.png",
  graphics_set = {
    animation = {
      north = {
        layers = {
          {
            filename = "__oreogenesis__/graphics/research-center/research-center-hr-shadow.png",
            size = {1200, 700},
            scale = 0.22,
            draw_as_shadow = true,
            repeat_count = 80,
          },
          {
            stripes = {{
              filename = "__oreogenesis__/graphics/research-center/research-center-animation.png",
              width_in_frames = 10,
              height_in_frames = 8,
            }},
            size = { 590, 640 },
            scale = 0.22,
            frame_count = 80,
          },
          {
            stripes = {{
              filename = "__oreogenesis__/graphics/research-center/research-center-emission1.png",
              width_in_frames = 10,
              height_in_frames = 8,
            }},
            size = { 590, 640 },
            scale = 0.22,
            draw_as_light = true,
            frame_count = 80,
          },
          {
            stripes = {{
              filename = "__oreogenesis__/graphics/research-center/research-center-emission2.png",
              width_in_frames = 10,
              height_in_frames = 8,
            }},
            size = { 590, 640 },
            scale = 0.22,
            draw_as_light = true,
            frame_count = 80,
          },
        },
      },
    },
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
    {-1.9, -1.9}, {1.9, 1.9}
  },
  selection_box = {
    {-2.2, -2.2}, {2.2, 2.2}
  },
  crafting_speed = 1.0,
}

local analyzer_item = {
  type = "item",
  name = "analyzer",
  icon = "__oreogenesis__/graphics/research-center/research-center-icon.png",
  stack_size = 50,
  place_result = "analyzer",
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
local analyze_simple_unicelluar_organism = {
  type = "recipe",
  name = "analyze-simple-unicelluar-organism",
  icon = "__Krastorio2Assets__/icons/cards/matter-research-data.png",
  category = "analyzer",
  ingredients = {
    {
      type = "item",
      name = "simple-unicelluar-organism-blank",
      amount = 1,
    },
  },
  results = {
    {
      type = "item",
      name = "organic-processed-data",
      amount = 1,
      probability = 0.01,
    },
    {
      type = "item",
      name = "dead-organic-material",
      amount = 1,
      probability = 0.5,
    },
  },
  energy_required = 1,
}

local analyze_simple_unicelluar_organism_iron_producing = {
  type = "recipe",
  name = "analyze-simple-unicelluar-organism-iron-producing",
  icon = "__Krastorio2Assets__/icons/cards/matter-research-data.png",
  category = "analyzer",
  ingredients = {
    {
      type = "item",
      name = "simple-unicelluar-organism-iron-producing",
      amount = 1,
    },
  },
  results = {
    {
      type = "item",
      name = "organic-processed-data",
      amount = 3,
      probability = 0.03,
    },
    {
      type = "item",
      name = "dead-organic-material",
      amount = 1,
      probability = 0.5,
    },
  },
  energy_required = 1,
}

data:extend{
  analyzer,
  analyzer_item,
  analyzer_recipe,
  analyzer_recipe_category,
  
  organic_processed_data,
  analyze_simple_unicelluar_organism,
  analyze_simple_unicelluar_organism_iron_producing,
}
