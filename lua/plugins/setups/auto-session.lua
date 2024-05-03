return {
    "rmagatti/auto-session",
    lazy = false,
    opts = {},
    config = function(_, opts)
        require("auto-session").setup(opts)
    end,
}
