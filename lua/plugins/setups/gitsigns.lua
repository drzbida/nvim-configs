return {
    "lewis6991/gitsigns.nvim",
    opts = {
        current_line_blame = true,
        current_line_blame_opts = {
            delay = 400,
            virt_text_pos = "eol",
        },
    },
    keys = {
        {
            "<Leader>sp",
            function()
                require("gitsigns").preview_hunk_inline()
            end,
            desc = "Preview hunk",
            noremap = true,
            silent = true,
        },
        {
            "<Leader>sr",
            function()
                require("gitsigns").reset_hunk()
            end,
            desc = "Reset hunk",
            noremap = true,
            silent = true,
        },
        {
            "]c",
            function()
                if vim.wo.diff then
                    vim.cmd.normal { "]c", bang = true }
                else
                    require("gitsigns").nav_hunk "next"
                end
            end,
            desc = "Next hunk",
            noremap = true,
            silent = true,
        },
        {
            "[c",
            function()
                if vim.wo.diff then
                    vim.cmd.normal { "[c", bang = true }
                else
                    require("gitsigns").nav_hunk "prev"
                end
            end,
            desc = "Previous hunk",
            noremap = true,
            silent = true,
        },
    },
}
