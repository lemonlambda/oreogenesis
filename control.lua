script.on_init(function ()
  remote.call("freeplay", "set_created_items", {})
  remote.call("freeplay", "set_respawn_items", {})
  remote.call("freeplay", "set_ship_items", {})
  remote.call("freeplay", "set_debris_items", {})
end)


require("scripts.bio-processor")
