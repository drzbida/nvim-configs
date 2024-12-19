return {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim" },
    opts = { name = { "venv", ".venv" } },
    branch = "regexp",
    event = "VeryLazy",
    keys = {
        { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Venv Select" },
        { "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "Venv Select Cached" },
    },
}
