return {
    -- "seblj/roslyn.nvim",
    dir = "D:\\Dev\\roslyn.nvim",
    ft = "cs",
    opts = {
        config = {
            on_init = function(client)
                client.offset_encoding = "utf-8"
            end,
            -- on_attach = function(client, bufnr)
            --     if client.server_capabilities.inlayHintProvider then
            --         vim.lsp.inlay_hint.enable(true)
            --     end
            -- end,
            handlers = {
                ["textDocument/hover"] = function(err, result, ctx, config)
                    if result and result.contents and result.contents.value then
                        result.contents.value = result.contents.value:gsub("\\([^%w])", "%1")
                    end
                    vim.lsp.handlers["textDocument/hover"](err, result, ctx, config)
                end,
            },
            settings = {
                ["csharp|inlay_hints"] = {
                    csharp_enable_inlay_hints_for_implicit_object_creation = true,
                    csharp_enable_inlay_hints_for_implicit_variable_types = true,
                    csharp_enable_inlay_hints_for_lambda_parameter_types = true,
                    csharp_enable_inlay_hints_for_types = true,
                    dotnet_enable_inlay_hints_for_indexer_parameters = true,
                    dotnet_enable_inlay_hints_for_literal_parameters = true,
                    dotnet_enable_inlay_hints_for_object_creation_parameters = true,
                    dotnet_enable_inlay_hints_for_other_parameters = true,
                    dotnet_enable_inlay_hints_for_parameters = true,
                    dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
                    dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
                    dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
                },
                -- ["csharp|background_analysis"] = {
                --     dotnet_compiler_diagnostics_scope = "fullSolution",
                --     dotnet_analyzer_diagnostics_scope = "fullSolution",
                -- },
                -- ["csharp|code_lens"] = { dotnet_enable_references_code_lens = true },
            },
        },
    },
    lazy = true,
}
