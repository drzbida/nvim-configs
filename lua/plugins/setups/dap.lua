return {
    "mfussenegger/nvim-dap",
    config = function()
        vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define(
            "DapStopped",
            { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
        )

        require("nvim-dap-virtual-text").setup {
            all_references = true,
            only_first_definition = false,
        }
        require "dapconfigs.dapconfigs"
    end,
}
