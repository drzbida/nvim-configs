return {
    "williamboman/mason.nvim",
    opts = {
        registries = {
            "github:mason-org/mason-registry",
            "github:syndim/mason-registry",
        },
        ensure_installed = {
            -- lua

            "lua-language-server",
            "stylua",

            -- webdev
            "html-lsp",
            "css-lsp",
            "prettier",
            "typescript-language-server",
            "eslint_d",
            "angular-language-server",
            "js-debug-adapter",

            -- python
            "basedpyright",
            "isort",
            "black",
            "debugpy",

            -- scripting
            "bash-language-server",

            -- godot
            "gdscript",
            "godot_resource",
            "gdshader",

            -- .net
            "roslyn",
            "netcoredbg",

            -- rust
            "rust-analyzer",
            "codelldb",
        },
    },
}
