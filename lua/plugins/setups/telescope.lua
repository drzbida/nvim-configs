return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-telescope/telescope-ui-select.nvim" },
    config = function(_, opts)
        require("telescope").load_extension "ui-select"
        require("telescope").setup(opts)
    end,
}
