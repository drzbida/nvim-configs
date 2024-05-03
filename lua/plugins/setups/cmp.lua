return {
    "hrsh7th/nvim-cmp",
    opts = {
        mapping = {
            ["<C-j>"] = require("cmp").mapping.select_next_item { behavior = require("cmp").SelectBehavior.Select },
            ["<C-k>"] = require("cmp").mapping.select_prev_item { behavior = require("cmp").SelectBehavior.Select },
            ["<Tab>"] = function(fallback)
                fallback()
            end,
            ["<CR>"] = function(fallback)
                if require("cmp").visible() then
                    require("cmp").confirm {
                        behavior = require("cmp").ConfirmBehavior.Replace,
                        select = true,
                    }
                else
                    fallback()
                end
            end,
        },
        experimental = {
            ghost_text = false,
        },
    },
}
