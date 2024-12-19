return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts_extend = { "spec" },
    opts = {
        preset = "modern",
        defaults = {},
        spec = {
            {
                mode = { "n", "v" },
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
                { "<leader>n", group = "notifications" },

                { "[", group = "prev" },
                { "]", group = "next" },
                { "g", group = "goto" },
                { "z", group = "fold" },
                {
                    "<leader>b",
                    group = "buffer",
                    expand = function()
                        return require("which-key.extras").expand.buf()
                    end,
                },
                {
                    "<leader>w",
                    group = "windows",
                    proxy = "<c-w>",
                    expand = function()
                        return require("which-key.extras").expand.win()
                    end,
                },
            },
        },
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show { global = false }
            end,
            desc = "Buffer Keymaps (which-key)",
        },
        {
            "<c-w><space>",
            function()
                require("which-key").show { keys = "<c-w>", loop = true }
            end,
            desc = "Window Hydra Mode (which-key)",
        },
    },
    config = function(_, opts)
        dofile(vim.g.base46_cache .. "whichkey")
        local wk = require "which-key"
        wk.setup(opts)
        if not vim.tbl_isempty(opts.defaults) then
            print "which-key: opts.defaults is deprecated. Please use opts.spec instead."
            wk.register(opts.defaults)
        end
    end,
}
