return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-telescope/telescope-ui-select.nvim" },
    opts = {
        defaults = {
            path_display = { "smart" },
        },
    },
    keys = {
        {
            "<leader>gr",
            function()
                require("telescope.builtin").lsp_references()
            end,
            desc = "Find references",
        },
    },
    config = function(_, opts)
        require("telescope").load_extension "ui-select"
        require("telescope").setup(opts)
    end,
}
