return {
    "folke/which-key.nvim",
    config = function(_, opts)
        dofile(vim.g.base46_cache .. "whichkey")
        require("which-key").setup(opts)
        local present, wk = pcall(require, "which-key")
        if not present then
            return
        end
        wk.register {
            ["<leader>"] = {
                s = { name = "+source control" },
                c = { name = "+code" },
                d = { name = "+debug" },
                f = { name = "+find" },
                g = { name = "+goto" },
                m = { name = "+marks" },
                w = { name = "+which/workspace" },
                v = { name = "+enviroment" },
            },
            ["<leader>s"] = {
                s = { name = "+history" },
            },
        }
    end,
    setup = function()
        require("core.utils").load_mappings "whichkey"
    end,
}
