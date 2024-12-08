return {
    "smjonas/inc-rename.nvim",
    lazy = true,
    opts = {},
    keys = {
        {
            "<Leader>cr",
            function()
                return ":IncRename " .. vim.fn.expand "<cword>"
            end,
            expr = true,
            desc = "LSP Rename",
        },
    },
}
