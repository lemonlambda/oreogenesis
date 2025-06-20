local bio_processor_item = {
  type = "item",
  name = "bio-processor",
  icon = "__oreogenesis__/graphics/pathogen-lab/pathogen-lab-icon.png",
  place_result = "bio-processor-blank",
  stack_size = 50,
}

local bio_processor_recipe = {
  type = "recipe",
  name = "bio-processor",
  results = {
    {
      type = "item",
      name = "bio-processor",
      amount = 1,
    },
  }
}

local bio_processor_recipe_category = {
  type = "recipe-category",
  name = "bio-processor",
}

function new_bio_processor(trait, additional_fields)
  local bio_processor = {
    type = "assembling-machine",
    name = "bio-processor-" .. trait,
    icon = "__oreogenesis__/graphics/pathogen-lab/pathogen-lab-icon.png",
    graphics_set = {
      animation = {
        north = {
          layers = {
            {
              filename = "__oreogenesis__/graphics/pathogen-lab/pathogen-lab-hr-shadow.png",
              size = {900, 700},
              scale = 0.183,
              draw_as_shadow = true,
              repeat_count = 60,
            },
            {
              stripes = {{
                filename = "__oreogenesis__/graphics/pathogen-lab/pathogen-lab-hr-emission-1.png",
                width_in_frames = 8,
                height_in_frames = 8,
              }},
              size = {500, 500},
              scale = 0.183,
              draw_as_light = true,
              frame_count = 60,
            },
            {
              stripes = {{
                filename = "__oreogenesis__/graphics/pathogen-lab/pathogen-lab-hr-animation-1.png",
                width_in_frames = 8,
                height_in_frames = 8,
              }},
              size = {500, 500},
              scale = 0.183,
              frame_count = 60,
            },
          }
        },
      },
    },
    minable = {
      mining_time = 1,
      result = "bio-processor",
      amount = 1
    },
    allow_copy_paste = true,
    crafting_speed = 0.5,
    crafting_categories = additional_fields.crafting_categories or { "bio-processor" },
    energy_usage = "100kW",
    energy_source = {
      type = "electric",
      buffer_capacity = "500kJ",
      usage_priority = "secondary-input",
    },
    fluid_boxes = {
      {
        production_type = "input",
        volume = 1000,
        pipe_connections = {{flow_direction = "input", direction = defines.direction.north, position = {0, -1}}},
        secondary_draw_orders = {north = -1}
      },
      {
        production_type = "output",
        volume = 1000,
        pipe_connections = {{flow_direction = "output", direction = defines.direction.south, position = {0, 1}}},
        secondary_draw_orders = {north = -1}
      },
    },
    collision_box = {
      {-1.2, -1.2}, {1.2, 1.2}
    },
    selection_box = {
      {-1.5, -1.5}, {1.5, 1.5}
    },
  }

  data:extend {
    bio_processor
  }
end

new_bio_processor("blank", {})
new_bio_processor("broken", {crafting_categories = {"bio-processor", "simple-unicelluar-organism-blank",},})
new_bio_processor("iron-producing", {crafting_categories = {"bio-processor", "simple-unicelluar-organism-iron-producing",},})
new_bio_processor("copper-producing", {crafting_categories = {"bio-processor", "simple-unicelluar-organism-copper-producing",},})

local bio_processor_equipment_grid = {
  type = "equipment-grid",
  name = "bio-processor-equipment-grid",
  equipment_categories = {"bio-processor-equipment"},
  width = 5,
  height = 5
}

local bio_processor_equipment_category = {
  type = "equipment-category",
  name = "bio-processor-equipment",
}

local bio_processor_proxy_equipment_grid = {
  type = "car",
  name = "bio-processor-proxy-equipment-grid",
  equipment_grid = "bio-processor-equipment-grid",
  hidden = true,
  minimap_representation = {
    filename = util.empty_sprite().filename,
    width = 1,
    height = 1,
  },
  weight = 1,
  braking_power = "1W",
  friction = 1,
  energy_per_hit_point = 1,
  inventory_size = 1,
  effectivity = 1,
  consumption = "1W",
  rotation_speed = 1,
  rotation_snap_angle = 1,
  energy_source = {type = "void"},
  collision_mask = {
    layers = {},
  },
}

data.extend {
  bio_processor_recipe_category,
  bio_processor_item,
  bio_processor_recipe,

  -- Equipment grid stuff
  bio_processor_equipment_grid,
  bio_processor_equipment_category,
  bio_processor_proxy_equipment_grid,
}

require("bio-processor-equipment")
