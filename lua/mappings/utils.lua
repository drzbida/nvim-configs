local map = vim.keymap.set

-- COLOR PICKER KEYBINDS
map("n", "<C-c>", "<cmd>PickColor<cr>", { noremap = true, silent = true })
map("i", "<C-c>", "<cmd>PickColorInsert<cr>", { noremap = true, silent = true })

-- VENV SELECTOR KEYBINDS
map("n", "<leader>vs", "<cmd>VenvSelect<cr>", { noremap = true, silent = true, desc = "Venv Select" })
map("n", "<leader>vc", "<cmd>VenvSelectCached<cr>", { noremap = true, silent = true, desc = "Venv Select Cached" })
