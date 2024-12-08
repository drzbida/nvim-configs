return {
    "echasnovski/mini.ai",
    version = false,
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    opts = function()
        local ai = require "mini.ai"
        return {
            n_lines = 500,
            custom_textobjects = {
                f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
                C = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
                F = ai.gen_spec.treesitter({ a = "@loop.outer", i = "@loop.inner" }, {}),
                c = ai.gen_spec.treesitter({ a = "@conditional.outer", i = "@conditional.inner" }, {}),
            },
        }
    end,
}
