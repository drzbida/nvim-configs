return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-telescope/telescope-ui-select.nvim" },
    opts = {
        defaults = {
            path_display = { "smart" },
        },
    },
    config = function(_, opts)
        require("telescope").load_extension "ui-select"
        require("telescope").setup(opts)
    end,
}
