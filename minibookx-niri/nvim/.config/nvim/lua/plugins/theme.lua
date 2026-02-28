return {
	"metalelf0/black-metal-theme-neovim",
    config = function ()
        require("black-metal").setup({
            theme = "mayhem",
            variant = "dark",
        })
        require("black-metal").load()
    end
}
