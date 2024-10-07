local map = vim.keymap.set

-- COLOR PICKER KEYBINDS
map("n", "<C-c>", function()
    if vim.bo.buftype ~= "terminal" then
        require("minty.huefy").open()
    end
end, { noremap = true, silent = true })
map("i", "<C-c>", function()
    if vim.bo.buftype ~= "terminal" then
        require("minty.huefy").open()
    end
end, { noremap = true, silent = true })

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

map("n", "<C-w>p", function()
    local picked_window = require("window-picker").pick_window()
    if picked_window then
        vim.api.nvim_set_current_win(picked_window)
    end
end, { noremap = true, silent = true, desc = "Pick Window" })
