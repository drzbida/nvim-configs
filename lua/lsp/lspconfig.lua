local lspconfig = require "lspconfig"
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
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
    "tsserver",
    "angularls",
    "basedpyright",
    "gdscript",
}

for _, lsp in ipairs(servers) do
    local ok, server_config = pcall(require, "lsp.servers." .. lsp)
    if ok then
        local config = merge(default_config(), server_config)
        lspconfig[lsp].setup(config)
    else
        vim.notify(lsp .. " configuration could not be loaded", vim.log.levels.ERROR)
    end
end
