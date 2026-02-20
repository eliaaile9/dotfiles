return {
	"olimorris/onedarkpro.nvim",
    config = function ()
        require("onedarkpro").setup({
            vim.cmd("colorscheme onedark_dark")
        })
    end
}
