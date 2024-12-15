return {
    "mfussenegger/nvim-dap",
    config = function()
        vim.fn.sign_define("DapBreakpoint", { text = "🤡", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DapBreakpointCondition", { text = "💀", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DapBreakpointRejected", { text = "😵", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define(
            "DapStopped",
            { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
        )
        dofile(vim.g.base46_cache .. "dap")

        require("nvim-dap-virtual-text").setup()
        require "dapconfigs.dapconfigs"
    end,
}
