local dap = require "dap"
local is_windows = require("helpers").is_windows

local debugpy_python = vim.fn.stdpath "data" .. "/mason/packages/debugpy/venv/bin/python"

if is_windows() then
    debugpy_python = vim.fn.stdpath "data" .. "/mason/packages/debugpy/venv/Scripts/python"
end

dap.adapters.python = function(cb, config)
    if config.request == "attach" then
        ---@diagnostic disable-next-line: undefined-field
        local port = (config.connect or config).port
        ---@diagnostic disable-next-line: undefined-field
        local host = (config.connect or config).host or "127.0.0.1"
        cb {
            type = "server",
            port = assert(port, "`connect.port` is required for a python `attach` configuration"),
            host = host,
            options = {
                source_filetype = "python",
            },
        }
    else
        cb {
            type = "executable",
            command = debugpy_python,
            args = { "-m", "debugpy.adapter" },
            options = {
                source_filetype = "python",
            },
        }
    end
end

dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
            local pythonLocation = "/bin/python"
            if is_windows() then
                pythonLocation = "/Scripts/python"
            end
            local pythonFolder = nil

            if require("venv-selector").get_active_venv() then
                pythonFolder = require("venv-selector").get_active_venv()
            elseif os.getenv "VIRTUAL_ENV" then
                pythonFolder = os.getenv "VIRTUAL_ENV"
            end

            if pythonFolder then
                return pythonFolder .. pythonLocation
            end

            return debugpy_python
        end,
    },
}
