require "dapconfigs.settings.godot"
require "dapconfigs.settings.debugpy"
require "dapconfigs.settings.typescript"
require "dapconfigs.settings.codelldb"

local ok, _ = pcall(require, "dapconfigs.dap-dotnet.dotnet")
if not ok then
    vim.notify("dap-dotnet not installed", vim.log.levels.WARN)
end
