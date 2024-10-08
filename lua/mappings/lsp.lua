local map = vim.keymap.set

-- LSP KEYBINDS
map("n", "<Leader>gr", function()
    require("telescope.builtin").lsp_references()
end, { noremap = true, silent = true, desc = "Find references" })

map("n", "<leader>cr", function()
    return ":IncRename " .. vim.fn.expand "<cword>"
end, { expr = true, desc = "LSP Rename" })
map("i", "<Tab>", function()
    if require("copilot.suggestion").is_visible() then
        require("copilot.suggestion").accept()
    else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
    end
end, { desc = "Super Tab" })

map("n", "<leader>cA", function()
    require("actions-preview").code_actions()
end, { noremap = false, silent = true, desc = "Code actions" })

map("n", "<leader>i", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { noremap = true, silent = true, desc = "Toggle inlay hints" })
