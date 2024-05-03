return {
    "ziontee113/color-picker.nvim",
    event = "VeryLazy",
    opts = {
        icons = { "■", "🖉" },
    },
    config = function(_, opts)
        require("color-picker").setup(opts)
    end,
}
