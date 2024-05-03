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
        require("copilot").setup(opts)
    end,
}
