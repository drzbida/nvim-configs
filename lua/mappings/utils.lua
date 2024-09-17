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

map("n", "<leader><leader>r", function()
    require("nvchad.term").runner {
        id = "boo",
        pos = "sp",
        cmd = function()
            local file = vim.fn.expand "%"

            local ft_cmds = {
                python = "python src\\main.py",
            }

            return ft_cmds[vim.bo.ft]
        end,
    }
end, { noremap = true, silent = true, desc = "Close Terminal" })

map("n", "<C-w>p", function()
    local picked_window = require("window-picker").pick_window()
    if picked_window then
        vim.api.nvim_set_current_win(picked_window)
    end
end, { noremap = true, silent = true, desc = "Pick Window" })

-- Markdown Previews
map("n", "<leader>tm", function()
    require("render-markdown").toggle()
end, { noremap = true, silent = true, desc = "Toggle Markdown Preview" })

local list_snips = function()
    local ft_list = require("luasnip").available()[vim.o.filetype]
    local ft_snips = {}
    for _, item in pairs(ft_list) do
        ft_snips[item.trigger] = item.name
    end
    print(vim.inspect(ft_snips))
end

vim.api.nvim_create_user_command("SnipList", list_snips, {})
