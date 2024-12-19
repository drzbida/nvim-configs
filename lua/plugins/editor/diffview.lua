return {
    "sindrets/diffview.nvim",
    lazy = true,
    opts = {
        enhanced_diff_hl = true,
        view = {
            merge_tool = {
                layout = "diff3_mixed",
            },
        },
    },
    keys = {
        {
            "<Leader>st",
            function()
                if next(require("diffview.lib").views) == nil then
                    vim.cmd "DiffviewOpen"
                else
                    vim.cmd "DiffviewClose"
                end
            end,
            desc = "Toggle DiffView",
            noremap = true,
            silent = true,
        },
        {
            "<Leader>ssf",
            "<Cmd>DiffviewFileHistory %<CR>",
            desc = "File history",
            noremap = true,
            silent = true,
        },
        {
            "<Leader>ssb",
            "<Cmd>DiffviewFileHistory<CR>",
            desc = "Branch history",
            noremap = true,
            silent = true,
        },
    },
    config = function(_, opts)
        dofile(vim.g.base46_cache .. "diffview")
        require("diffview").setup(opts)
    end,
}
