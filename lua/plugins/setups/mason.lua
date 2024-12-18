return {
    "williamboman/mason.nvim",
    opts = {
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
            "debugpy",
            "ruff",

            -- scripting
            "bash-language-server",

            -- godot
            "gdscript",
            "godot_resource",
            "gdshader",

            -- .net
            "roslyn",
            -- "netcoredbg",

            -- rust
            "rust-analyzer",
            "codelldb",
        },
    },
}
