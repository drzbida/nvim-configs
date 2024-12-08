local function close_nvim_tree()
    require("nvim-tree.view").close()
end
local function close_dap_ui()
    require("dapui").close()
end
return {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
        pre_save_cmds = { close_nvim_tree, close_dap_ui },
    },
}
