local M = {}

function M.merge(a, b)
    if type(a) == "table" and type(b) == "table" then
        for k, v in pairs(b) do
            if type(v) == "table" and type(a[k] or false) == "table" then
                M.merge(a[k], v)
            else
                a[k] = v
            end
        end
    end
    return a
end

function M.is_windows()
    return vim.fn.has "win32" == 1
end

local lsp_ignore_patterns = {}

local function update_telescope_ignore_patterns()
    local telescope_ignore_patterns = {}
    for _, v in pairs(lsp_ignore_patterns) do
        for _, pattern in pairs(v) do
            table.insert(telescope_ignore_patterns, pattern)
        end
    end

    require("telescope.config").set_defaults {
        file_ignore_patterns = telescope_ignore_patterns,
    }
end

local function lsp_remove_ignore_patterns(lsp_name)
    lsp_ignore_patterns[lsp_name] = nil
    update_telescope_ignore_patterns()
end

function M.lsp_add_ignore_pattern(new_pattern, lsp_name)
    lsp_ignore_patterns[lsp_name] = new_pattern
    update_telescope_ignore_patterns()

    if not vim.g.lsp_ignore_autocmd_created then
        vim.api.nvim_create_autocmd("LspDetach", {
            callback = function(args)
                local client_name = vim.lsp.get_client_by_id(args.data.client_id).name
                lsp_remove_ignore_patterns(client_name)
            end,
        })

        vim.g.lsp_ignore_autocmd_created = true
    end
end

return M
