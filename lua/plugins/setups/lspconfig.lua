return {
    "neovim/nvim-lspconfig",
    config = function()
        require("nvchad.configs.lspconfig").defaults()
        require "lsp.lspconfig"
    end,
}
