local util = require "lspconfig/util"
local get_root_dir = function(fname)
    return util.root_pattern("*.sln", "*.csproj", "omnisharp.json", "*.godot", "function.json", ".git")(fname)
        or vim.fn.getcwd()
end
local lsp_add_ignore_pattern = require("helpers").lsp_add_ignore_pattern
return {
    on_init = function(client)
        client.offset_encoding = "utf-8"
        local fname = vim.api.nvim_buf_get_name(0)
        local root = get_root_dir(fname)
        local godot_project = root .. "/project.godot"
        if vim.fn.filereadable(godot_project) == 1 then
            lsp_add_ignore_pattern({ "Godot.SourceGenerators" }, "omnisharp")
        end
    end,
    handlers = {
        ["textDocument/definition"] = require("omnisharp_extended").handler,
    },
    cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
    root_dir = function(fname)
        return get_root_dir(fname)
    end,
    enable_roslyn_analyzers = true,
    organize_imports_on_format = true,
    enable_import_completion = true,
}
