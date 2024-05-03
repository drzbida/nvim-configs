return {
    "smjonas/inc-rename.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
        require("inc_rename").setup(opts)
    end,
}
