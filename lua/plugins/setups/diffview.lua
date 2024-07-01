return {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    opts = {
        enhanced_diff_hl = true,
        view = {
            merge_tool = {
                layout = "diff3_mixed",
            },
        },
    },
}
