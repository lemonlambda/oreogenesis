data:extend {
    {
        type = "bool-setting",
        name = "tests",
        setting_type = "startup",
        default_value = false,
        hidden = true,
    },
}
data.raw["bool-setting"]["tests"].forced_value = true
