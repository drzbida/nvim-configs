local map = vim.keymap.set

-- COLOR PICKER KEYBINDS
map("n", "<C-c>", "<cmd>PickColor<cr>", { noremap = true, silent = true })
map("i", "<C-c>", "<cmd>PickColorInsert<cr>", { noremap = true, silent = true })
