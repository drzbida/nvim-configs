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
            cs = { "csharpier" },
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
            csharpier = {
                command = "dotnet-csharpier",
                args = { "--write-stdout" },
            },
        },
    },
    config = function(_, opts)
        require("conform").setup(opts)
    end,
}
