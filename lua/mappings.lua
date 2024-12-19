local map = vim.keymap.set
local unmap = vim.keymap.del

-- LSP KEYBINDS
map("n", "<leader>i", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { noremap = true, silent = true, desc = "Toggle inlay hints" })

map("n", "<leader>cr", function()
    require "nvchad.lsp.renamer"()
end, { noremap = true, silent = true, desc = "Rename references" })

-- WINDOW MANAGEMENT
map({ "n", "v" }, "<C-Left>", "<C-W>>", { desc = "Increase window to left" })
map({ "n", "v" }, "<C-Right>", "<C-W><", { desc = "Increase window to right" })
map({ "n", "v" }, "<C-Up>", "<C-W>+", { desc = "Increase window to up" })
map({ "n", "v" }, "<C-Down>", "<C-W>-", { desc = "Increase window to down" })

-- OVERWRITE VIM BEHAVIOUR
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzz")
map("n", "N", "Nzz")

-- COLOR PICKER KEYBINDS
map("i", "<C-c>", function()
    if vim.bo.buftype ~= "terminal" then
        require("minty.huefy").open()
    end
end, { noremap = true, silent = true })

-- SPAWN TERMINAL KEYBINDS
map("n", "<leader><leader>s", function()
    require("nvchad.term").new {
        pos = "sp",
    }
end, { noremap = true, silent = true, desc = "Spawn Horizontal Terminal" })

map("n", "<leader><leader>v", function()
    require("nvchad.term").new {
        pos = "vsp",
        size = 0.3,
    }
end, { noremap = true, silent = true, desc = "Spawn Vertical Terminal" })

map({ "n", "t" }, "<C-_>", function()
    require("nvchad.term").toggle {
        pos = "float",
    }
end, { noremap = true, silent = true, desc = "Toggle Floating Terminal" })

-- DELETE DEFAULT MAPPINGS
-- unmap("n", "<Leader>n") -- line numbers
-- unmap("n", "<Leader>h") -- horizontal window
-- unmap("n", "<Leader>v") -- vertical window
-- unmap("n", "<M-v>") -- Toggleable vertical terminal
-- unmap("n", "<M-h>") -- New horizontal terminal
-- unmap("n", "<M-i>") -- Toggleable floating terminal
