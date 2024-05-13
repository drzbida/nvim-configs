return {
    --https://stackoverflow.com/questions/77495184/nvim-failed-to-run-config-for-nvim-dap-loader-lua369-attemp-to-call-field-s
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require "dap"

        vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define(
            "DapStopped",
            { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
        )

        local dapui = require "dapui"
        require("nvim-dap-virtual-text").setup()

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end

        require "dapconfigs.dapconfigs"
    end,
}
