return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter")
        configs.setup({
            -- auto_install gets automatically the highlighting of code
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
