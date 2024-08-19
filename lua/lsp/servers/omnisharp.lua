local on_init = require("nvchad.configs.lspconfig").on_init
local util = require "lspconfig/util"
return {
    on_init = on_init,
    handlers = {
        ["textDocument/definition"] = require("omnisharp_extended").handler,
    },
    cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
    root_dir = function(fname)
        return util.root_pattern("*.sln", "*.csproj", "omnisharp.json", "*.godot", "function.json", ".git")(fname)
            or vim.fn.getcwd()
    end,
}
