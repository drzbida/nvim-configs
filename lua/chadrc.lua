-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local options = {}

options.base46 = {
    theme = "radium",
    hl_override = {
        ["@function.call"] = {
            bold = true,
        },
        ["@function.method.call"] = {
            bold = true,
        },
    },
    hl_add = {
        ["DiagnosticVirtualTextError"] = {
            fg = "#DB302D",
            bg = "#570F0E",
        },
        ["DiagnosticVirtualTextHint"] = {
            fg = "#29A298",
            bg = "#103A3C",
        },
        ["DiagnosticVirtualTextWarn"] = {
            fg = "#DDB80A",
            bg = "#574A0E",
        },
        ["DiagnosticVirtualTextInfo"] = {
            fg = "#268BD2",
            bg = "#0E2840",
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
