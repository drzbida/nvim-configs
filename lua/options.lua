require "nvchad.options"

-- add yours here!

vim.o.relativenumber = true

if os.getenv "OS" == "Windows_NT" then
    if vim.fn.executable "pwsh" == 1 then
        vim.o.shell = "pwsh"
    else
        vim.o.shell = "powershell"
    end

    -- Setting shell command flags
    vim.o.shellcmdflag =
        "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';"

    -- Setting shell redirection
    vim.o.shellredir = '2>&1 | %{ "$_" } | Out-File %s; exit $LastExitCode'

    -- Setting shell pipe
    vim.o.shellpipe = '2>&1 | %{ "$_" } | Tee-Object %s; exit $LastExitCode'

    -- Setting shell quote options
    vim.o.shellquote = ""
    vim.o.shellxquote = ""
end

-- Set tab size 4

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
    config = config or {}
    config.focus_id = ctx.method
    vim.notify("HoverTest", vim.log.levels.INFO)
    if not (result and result.contents) then
        return
    end
    local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
    markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
    if vim.tbl_isempty(markdown_lines) then
        return
    end
    return vim.lsp.util.open_floating_preview(markdown_lines, "markdown", config)
end
