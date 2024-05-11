return {
    -- format on save
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            css = { "prettier" },
            html = { "prettier" },
            typescript = { "eslint" },
            python = { "isort", "black" },
        },

        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
    },
    config = function(_, opts)
        require("conform").setup(opts)
    end,
}
