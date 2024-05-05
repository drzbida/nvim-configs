local function close_nvim_tree()
    require("nvim-tree.view").close()
end
return {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
        pre_save_cmds = { close_nvim_tree },
    },
    config = function(_, opts)
        require("auto-session").setup(opts)
    end,
}
