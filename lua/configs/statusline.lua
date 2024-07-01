local python_symbol = "🐍"
local function get_python_venv()
    local venv = require("venv-selector").venv()
    if not venv then
        venv = os.getenv "VIRTUAL_ENV"
        if venv then
            venv = venv .. " (system)"
        else
            venv = "No venv active"
        end
    end
    return python_symbol .. " " .. venv
end

return {
    theme = "default",
    order = {
        "mode",
        "file",
        "git",
        "%=",
        "lsp_msg",
        "%=",
        "lang_environment",
        "diagnostics",
        "lsp",
        "cwd",
        "cursor",
    },
    modules = {
        lang_environment = function()
            local filetype = vim.bo.filetype
            if filetype == "python" then
                return get_python_venv()
            end
            return ""
        end,
    },
}
