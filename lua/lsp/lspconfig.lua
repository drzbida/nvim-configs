local map = vim.keymap.set

local lspconfig = require "lspconfig"
local on_attach = function(_, bufnr)
    local function opts(desc)
        return { buffer = bufnr, desc = "LSP " .. desc }
    end

    map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
    map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
    map("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
    map("n", "<leader>sh", vim.lsp.buf.signature_help, opts "Show signature help")
    map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
    map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

    map("n", "<leader>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts "List workspace folders")

    map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")
    map("n", "<leader>ra", require "nvchad.lsp.renamer", opts "NvRenamer")

    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
    map("n", "gr", vim.lsp.buf.references, opts "Show references")
end

local on_init = function(client, _)
    if client.supports_method "textDocument/semanticTokens" then
        client.server_capabilities.semanticTokensProvider = nil
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}

local merge = require("helpers").merge

local function default_config()
    return {
        on_attach = on_attach,
        on_init = on_init,
        capabilities = capabilities,
    }
end

local servers = {
    "html",
    "cssls",
    "ts_ls",
    "angularls",
    "basedpyright",
    "gdscript",
    "bashls",
    "ruff",
    "lua_ls",
}

dofile(vim.g.base46_cache .. "lsp")
require("nvchad.lsp").diagnostic_config()

for _, lsp in ipairs(servers) do
    local ok, server_config = pcall(require, "lsp.servers." .. lsp)
    if ok then
        local config = merge(default_config(), server_config)
        lspconfig[lsp].setup(config)
    else
        vim.notify(lsp .. " configuration could not be loaded", vim.log.levels.ERROR)
    end
end
