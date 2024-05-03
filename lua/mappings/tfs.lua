local map = vim.keymap.set

-- TFS KEYBINDS
map("n", "<Leader>gC", function()
    local path = vim.fn.expand "%:p"
    vim.cmd(
        '!& "C:\\Program Files\\Microsoft Visual Studio\\2022\\Professional\\Common7\\IDE\\CommonExtensions\\Microsoft\\TeamFoundation\\Team Explorer\\TF.exe" checkout '
            .. path
    )
end, { silent = false, desc = "TFS Checkout" })
