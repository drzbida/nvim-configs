return {
    "mfussenegger/nvim-dap-python",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
        local dap_python = require "dap-python"
        local path = require("venv-selector").get_active_venv() or os.getenv "VIRTUAL_ENV" or "python"
        dap_python.resolve_python = function()
            return path
        end
        dap_python.setup(path)
    end,
}
