local map = vim.keymap.set

-- DAP KEYBINDS
map("n", "<F5>", function()
    if vim.fn.filereadable ".vscode/launch.json" then
        require("dap.ext.vscode").load_launchjs()
    end
    require("dap").continue()
end, { silent = true, desc = "Start / Continue execution" })
map("n", "<F10>", require("dap").step_over, { silent = true, desc = "Step over" })
map("n", "<F11>", require("dap").step_into, { silent = true, desc = "Step into" })
map("n", "<S-F11>", require("dap").step_out, { silent = true, desc = "Step out" })
map("n", "<Leader>db", require("dap").toggle_breakpoint, { silent = true, desc = "Toggle breakpoint" })
map("n", "<Leader>dB", function()
    require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, { silent = true, desc = "Set conditional breakpoint" })
map("n", "<Leader>lp", function()
    require("dap").set_breakpoint(nil, nil, vim.fn.input "Log point message: ")
end, { silent = true, desc = "Set log point" })
map("n", "<Leader>dr", require("dap").repl.open, { silent = true, desc = "Open dap REPL" })
map("n", "<Leader>dl", require("dap").run_last, { silent = true, desc = "Run last debug session" })
-- map("n", "<Leader>du", require("dapui").toggle, { silent = true, desc = "Toggle dapui" })
map("n", "<Leader>dk", function()
    require("dapui").eval(nil)
end, { silent = true, desc = "Hover value" })
