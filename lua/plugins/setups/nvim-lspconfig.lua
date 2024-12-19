return {
    "neovim/nvim-lspconfig",
    event = "User FilePost",
    config = function()
        require "lsp.lspconfig"
    end,
}
