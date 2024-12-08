require "nvchad.options"
local is_windows = require("helpers").is_windows

vim.o.relativenumber = true

if is_windows() then
    if vim.fn.executable "pwsh" == 1 then
        vim.o.shell = "pwsh"
    else
        vim.o.shell = "powershell"
    end

    vim.o.shellcmdflag =
        "-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';"
    vim.o.shellredir = '2>&1 | %{ "$_" } | Out-File %s; exit $LastExitCode'
    vim.o.shellpipe = '2>&1 | %{ "$_" } | Tee-Object %s; exit $LastExitCode'
    vim.o.shellquote = ""
    vim.o.shellxquote = ""
end

vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.opt.fillchars:append { diff = "╱" }
--
-- Support clipboard in wezterm ssh. Paste from clipboard does not work in wezterm.
if os.getenv "SSH_CLIENT" ~= nil or os.getenv "SSH_TTY" ~= nil then
    local function my_paste(_)
        return function(_)
            local content = vim.fn.getreg '"'
            return vim.split(content, "\n")
        end
    end

    vim.g.clipboard = {
        name = "OSC 52",
        copy = {
            ["+"] = require("vim.ui.clipboard.osc52").copy "+",
            ["*"] = require("vim.ui.clipboard.osc52").copy "*",
        },
        paste = {
            ["+"] = my_paste "+",
            ["*"] = my_paste "*",
        },
    }
end

vim.cmd "autocmd FileType * set formatoptions-=cro"
vim.cmd "autocmd FileType * setlocal formatoptions-=cro"
