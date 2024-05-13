-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
    theme = "ayu_dark",
    nvdash = {
        load_on_startup = true,
    },
    statusline = require "configs.statusline",
    hl_override = {
        ["@variable.parameter"] = {
            bold = true,
            fg = "#d6ff07",
        },
        ["@function.method.call"] = {
            bold = true,
        },
        ["@comment"] = {
            fg = "#d6ff07",
            italic = true,
        },
        ["@keyword"] = {
            bold = true,
        },
        ["@variable.builtin"] = {
            bold = true,
        },
    },
    hl_add = {
        ["DapStopped"] = {
            bg = "#061e55",
        },
        ["NvimDapVirtualText"] = {
            fg = "#d6ff07",
        },
    },
}

return M
