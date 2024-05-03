local util = require "lspconfig/util"
return {
    root_dir = function(fname)
        return util.root_pattern("pyrightconfig.json", ".git")(fname) or vim.fn.getcwd()
    end,
}
