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
        },

        format_on_save = {
            -- These options will be passed to conform.format()
            timeout_ms = 500,
            lsp_fallback = true,
        },
    },
    config = function(_, opts)
        require("conform").setup(opts)
    end,
}
