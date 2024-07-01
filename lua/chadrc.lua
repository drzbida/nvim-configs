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
        ["DiffChange"] = {
            bg = "#2e2e42",
            fg = "NONE",
        },
        ["DiffAdd"] = {
            bg = "#337d20",
            fg = "NONE",
        },
        ["DiffDelete"] = {
            bg = "#873f2b",
            fg = "NONE",
        },
    },
    hl_add = {
        ["DapStopped"] = {
            bg = "#061e55",
        },
        ["NvimDapVirtualText"] = {
            fg = "#d6ff07",
        },
        ["DapUIExceptionSettingsTitle"] = {
            fg = "#00F1F5",
        },
        ["DapUIExceptionSettingsBreakpointActive"] = {
            fg = "#F70067",
        },
        ["DapUIExceptionSettingsBreakpointInactive"] = {
            fg = "#424242",
        },
        ["WindowPickerStatusLineNC"] = {
            fg = "#f07174",
            bg = "#12151b",
            bold = true,
        },
    },
}

return M
