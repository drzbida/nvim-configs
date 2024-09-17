return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
        suggestion = {
            auto_trigger = true,
            keymap = {
                accept = false,
            },
        },
    },
    config = function(_, opts)
        vim.g.copilot_filetypes = { markdown = true }
        require("copilot").setup(opts)
    end,
}
