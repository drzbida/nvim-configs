local unmap = vim.keymap.del

-- DELETE DEFAULT MAPPINGS
unmap("n", "<Leader>n") -- line numbers
unmap("n", "<Leader>h") -- horizontal window
unmap("n", "<Leader>v") -- vertical window
unmap("n", "<Leader>q") -- LSP diagnostics quickfix
unmap("n", "<Leader>th") -- Telescope themes
unmap("n", "<Leader>lf") -- LSP floating diagnostics
unmap("n", "<Leader>lp") -- Set log point
unmap("n", "<M-v>") -- Toggleable vertical terminal
unmap("n", "<M-h>") -- New horizontal terminal
unmap("n", "<M-i>") -- Toggleable floating terminal
