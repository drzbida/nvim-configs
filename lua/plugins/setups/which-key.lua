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
                c = { name = "+code" },
                d = { name = "+debug" },
                f = { name = "+find" },
                g = { name = "+git" },
                m = { name = "+marks" },
                w = { name = "+which/workspace" },
                v = { name = "+enviroment" },
                t = { name = "+terminal" },
                q = { name = "+trouble" },
            },
        }
    end,
    setup = function()
        require("core.utils").load_mappings "whichkey"
    end,
}
