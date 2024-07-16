return {
    "folke/which-key.nvim",
    config = function(_, opts)
        dofile(vim.g.base46_cache .. "whichkey")
        require("which-key").setup(opts)
        local present, wk = pcall(require, "which-key")
        if not present then
            return
        end
        wk.add {
            { "<leader>c", group = "code" },
            { "<leader>d", group = "debug" },
            { "<leader>f", group = "find" },
            { "<leader>g", group = "goto" },
            { "<leader>m", group = "marks" },
            { "<leader>s", group = "source control" },
            { "<leader>ss", group = "history" },
            { "<leader>v", group = "enviroment" },
            { "<leader>w", group = "which/workspace" },
            { "<leader><leader>", group = "terminal" },
            { "<leader>q", group = "trouble" },
        }
    end,
    setup = function()
        require("core.utils").load_mappings "whichkey"
    end,
}
