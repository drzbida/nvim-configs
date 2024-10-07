-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local options = {}

options.base46 = {
    theme = "rosepine",
    hl_override = {
        ["@function.call"] = {
            bold = true,
        },
        ["@variable.parameter"] = {
            bold = true,
        },
        ["@comment"] = {
            italic = true,
        },
        ["@keyword.conditional"] = {
            link = "@keyword.repeat",
        },
    },
}

options.ui = {
    statusline = require "configs.statusline",
}

options.nvdash = {
    load_on_startup = true,
}

return options
