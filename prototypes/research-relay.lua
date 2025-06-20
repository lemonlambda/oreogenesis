local research_relay_item = {
  type = "item",
  name = "research-relay",
  icon = "__oreogenesis__/graphics/item-extractor/item-extractor-icon.png",
  place_result = "research-relay",
  stack_size = 50,
}

local research_relay_recipe = {
  type = "recipe",
  icon = "__oreogenesis__/graphics/item-extractor/item-extractor-icon.png",
  name = "research-relay",
  results = {
    {
      type = "item",
      name = "research-relay",
      amount = 1,
    },
  }
}

local research_relay = {
  type = "lab",
  name = "research-relay",
  icon = "__oreogenesis__/graphics/item-extractor/item-extractor-icon.png",
  off_animation = {
    layers = {
      {
        filename = "__oreogenesis__/graphics/item-extractor/item-extractor-hr-shadow.png",
        size = {1000, 666},
        draw_as_shadow = true,
      },
      {
          filename = "__oreogenesis__/graphics/item-extractor/item-extractor-hr-emission-1.png",
        size = { 530, 530 },
        draw_as_light = true,
      },
      {
        filename = "__oreogenesis__/graphics/item-extractor/item-extractor-hr-animation-1.png",
        size = { 530, 530 },
      },
    }
  },
  on_animation = {
    layers = {
      {
        filename = "__oreogenesis__/graphics/item-extractor/item-extractor-hr-shadow.png",
        size = {1000, 666},
        draw_as_shadow = true,
      },
      {
          filename = "__oreogenesis__/graphics/item-extractor/item-extractor-hr-emission-1.png",
        size = { 530, 530 },
        draw_as_light = true,
      },
      {
        filename = "__oreogenesis__/graphics/item-extractor/item-extractor-hr-animation-1.png",
        size = { 530, 530 },
      },
    }
  },
  minable = {
    mining_time = 1,
    result = "research-relay",
    amount = 1
  },
  inputs = {
    "organic-processed-data",
  },
  allow_copy_paste = true,
  crafting_speed = 0.5,
  energy_usage = "1000QW",
  energy_source = {
    type = "void",
  },
  collision_box = {
    {-7.5, -7.5}, {7.5, 7.5}
  },
  selection_box = {
    {-8, -8}, {8, 8}
  },
  module_slots = 40,
  researching_speed = 5,
}

data:extend({
  research_relay_item,
  research_relay_recipe,
  research_relay
})
