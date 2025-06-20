require("util")

local primordial_soup_tile = table.deepcopy(data.raw.tile["water"])
primordial_soup_tile.name = "primordial-soup"
primordial_soup_tile.fluid = "primordial-soup"
local primordial_soup = table.deepcopy(data.raw.fluid["water"])
primordial_soup.name = "primordial-soup"

local primordial_soup_cetrifugate_to_oxygen = {
  type = "recipe",
  name = "primordial-soup-centrifugate-to-oxygen",
  icon = "__Krastorio2Assets__/icons/fluids/oxygen.png",
  category = "oil-processing",
  ingredients = {
    {
      type = "fluid",
      name = "primordial-soup",
      amount = 100,
    },
  },
  results = {
    {
      type = "fluid",
      name = "oxygen",
      amount = 50,
    },
  },
}

data:extend({
  primordial_soup_tile,
  primordial_soup,
  primordial_soup_cetrifugate_to_oxygen,
})

local dead_organic_material = {
  type = "item",
  name = "dead-organic-material",
  icon = "__Krastorio2Assets__/icons/capsules/poop.png",
  stack_size = 50,
}
local organic_material = {
  type = "item",
  name = "organic-material",
  icon = "__Krastorio2Assets__/icons/items/biomass.png",
  stack_size = 50,
  spoil_ticks = hour*2,
  spoil_result = "dead-organic-material",
}
data:extend{
  dead_organic_material,
  organic_material,
}

require("prototypes.unicelluar-organism")
require("prototypes.bio-processor")
require("prototypes.research-relay")
require("prototypes.nutrients")
require("prototypes.induction-heater")
require("prototypes.organic-processed-data")
