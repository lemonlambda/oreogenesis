local organic_material_bio_processor_recipe = {
  type = "recipe",
  name = "organic-material-bio-processor",
  icon = "__base__/graphics/entity/accumulator/accumulator.png",
  category = "bio-processor",
  ingredients = {
    {
      type = "fluid",
      name = "primordial-soup",
      amount = 100
    },
  },
  results = {
    {
      type = "item",
      name = "organic-material",
      amount = 1,
    },
  }
}

local dna = {
  type = "item",
  name = "dna",
  icon = "__base__/graphics/entity/accumulator/accumulator.png",
  icon_size = 128,
  stack_size = 50,
  spoil_ticks = hour * 2,
  spoil_result = "dead-organic-material",
}
local simple_organelle_production_recipe = {
  type = "recipe",
  name = "simple-organelle-production",
  icon = "__base__/graphics/entity/accumulator/accumulator.png",
  category = "bio-processor",
  ingredients = {
    {
      type = "item",
      name = "organic-material",
      amount = 1,
    },
  },
  results = {
    {
      type = "item",
      name = "nucleoid",
      probability = 0.90,
      amount = 1,
    },
    {
      type = "item",
      name = "ribosomes",
      probability = 0.50,
      amount = 1,
    },
    {
      type = "item",
      name = "cytoplasm",
      probability = 0.70,
      amount = 1,
    },
    {
      type = "item",
      name = "cell-membrane",
      probability = 0.80,
      amount = 1,
    },
  }
}
local ribosomes = {
  type = "item",
  name = "ribosomes",
  icon = "__oreogenesis__/graphics/icons/ribosome.png",
  icon_size = 128,
  stack_size = 50,
  spoil_ticks = hour * 2,
  spoil_result = "dead-organic-material",
}
local nucleoid = {
  type = "item",
  name = "nucleoid",
  icon = "__oreogenesis__/graphics/icons/nucleoid.png",
  icon_size = 128,
  stack_size = 50,
  spoil_ticks = hour * 2,
  spoil_result = "dead-organic-material",
}
local cytoplasm = {
  type = "item",
  name = "cytoplasm",
  icon = "__oreogenesis__/graphics/icons/cytoplasm.png",
  icon_size = 128,
  stack_size = 50,
  spoil_ticks = hour * 2,
  spoil_result = "dead-organic-material",
}
local cell_membrane = {
  type = "item",
  name = "cell-membrane",
  icon = "__oreogenesis__/graphics/icons/cell-membrane.png",
  icon_size = 128,
  stack_size = 50,
  spoil_ticks = hour * 2,
  spoil_result = "dead-organic-material",
}
local peptidoglycan_layer = {
  type = "item",
  name = "peptidoglycan_layer",
  icon = "__base__/graphics/entity/accumulator/accumulator.png",
  stack_size = 50,
  spoil_ticks = hour * 2,
  spoil_result = "dead-organic-material",
}

function new_unicelluar_organism_type(trait, additional_fields)
  local simple_unicelluar_organism = {
    type = "item",
    name = "simple-unicelluar-organism-" .. trait,
    icon = "__oreogenesis__/graphics/icons/simple-unicelluar-organism.png",
    icon_size = 128,
    stack_size = 50,
    spoil_ticks = hour * 2 or additional_fields.spoil_ticks,
    spoil_result = "dead-organic-material",
  }

  local simple_unicelluar_organism_recipe = {
    type = "recipe",
    name = "simple-unicelluar-organism-" .. trait,
    icon = "__base__/graphics/entity/accumulator/accumulator.png",
    category = "simple-unicelluar-organism-" .. trait,
    additional_categories = additional_fields.additional_categories or nil,
    ingredients = {
      {
        type = "item",
        name = "nucleoid",
        amount = 1,
      },
      {
        type = "item",
        name = "ribosomes",
        amount = 5,
      },
      {
        type = "item",
        name = "cell-membrane",
        amount = 10,
      },
      {
        type = "item",
        name = "cytoplasm",
        amount = 40,
      },
    },
    results = {
      {
        type = "item",
        name = "simple-unicelluar-organism-" .. trait,
        amount = 1,
      },
    }
  }

  local simple_unicelluar_organism_category = {
    type = "recipe-category",
    name = "simple-unicelluar-organism-" .. trait,
  }

  data.extend {
    simple_unicelluar_organism,
    simple_unicelluar_organism_recipe,
    simple_unicelluar_organism_category,
  }
end

new_unicelluar_organism_type("blank", {additional_categories = {"bio-processor",},})
new_unicelluar_organism_type("broken", {spoil_ticks = minute * 5,})
new_unicelluar_organism_type("iron-producing", {})
new_unicelluar_organism_type("copper-producing", {})


data.extend {
  organic_material_bio_processor_recipe,
  simple_organelle_production_recipe,

  ribosomes,
  nucleoid,
  cytoplasm,
  cell_membrane,
  capsule,
  peptidoglycan_layer,
}

require("iron-producing-unicelluar-organism")
