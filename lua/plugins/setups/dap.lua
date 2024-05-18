return {
    "mfussenegger/nvim-dap",
    config = function()
        vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define(
            "DapStopped",
            { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
        )

        require("nvim-dap-virtual-text").setup()
        require "dapconfigs.dapconfigs"
    end,
}
