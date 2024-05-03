local map = vim.keymap.set

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
