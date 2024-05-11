local map = vim.keymap.set

-- COLOR PICKER KEYBINDS
map("n", "<C-c>", function()
    if vim.bo.buftype ~= "terminal" then
        vim.cmd "PickColor"
    end
end, { noremap = true, silent = true })
map("i", "<C-c>", "<cmd>PickColorInsert<cr>", { noremap = true, silent = true })

-- VENV SELECTOR KEYBINDS
map("n", "<leader>vs", "<cmd>VenvSelect<cr>", { noremap = true, silent = true, desc = "Venv Select" })
map("n", "<leader>vc", "<cmd>VenvSelectCached<cr>", { noremap = true, silent = true, desc = "Venv Select Cached" })

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

map("n", "<leader><leader>f", function()
    require("nvchad.term").toggle {
        pos = "float",
    }
end, { noremap = true, silent = true, desc = "Toggle Floating Terminal" })
