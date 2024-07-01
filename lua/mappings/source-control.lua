local map = vim.keymap.set
local gitsigns = require "gitsigns"

-- GIT KEYBINDS

map("n", "<Leader>sp", function()
    gitsigns.preview_hunk_inline()
end, { noremap = true, silent = true, desc = "Preview hunk" })

map("n", "<Leader>sr", function()
    gitsigns.reset_hunk()
end, { noremap = true, silent = true, desc = "Reset hunk" })

map("n", "]c", function()
    if vim.wo.diff then
        vim.cmd.normal { "]c", bang = true }
    else
        gitsigns.nav_hunk "next"
    end
end, { noremap = true, silent = true, desc = "Next hunk" })

map("n", "[c", function()
    if vim.wo.diff then
        vim.cmd.normal { "[c", bang = true }
    else
        gitsigns.nav_hunk "prev"
    end
end, { noremap = true, silent = true, desc = "Previous hunk" })

map("n", "<Leader>st", function()
    if next(require("diffview.lib").views) == nil then
        vim.cmd "DiffviewOpen"
    else
        vim.cmd "DiffviewClose"
    end
end, { noremap = true, silent = true, desc = "Toggle DiffView" })

map("n", "<Leader>ssf", "<Cmd>DiffviewFileHistory %<CR>", { noremap = true, silent = true, desc = "File history" })
map("n", "<Leader>ssb", "<Cmd>DiffviewFileHistory<CR>", { noremap = true, silent = true, desc = "Branch history" })
