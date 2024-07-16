return {
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
            timeout_ms = 2000,
            lsp_fallback = true,
        },

        formatters = {
            isort = {
                include_trailing_comma = true,
                command = "isort",
            },
            black = {
                command = "black",
            },
        },
    },
    config = function(_, opts)
        require("conform").setup(opts)
    end,
}
