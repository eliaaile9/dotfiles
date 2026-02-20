return {
	"mbbill/undotree",
	init = function()
		vim.g.undotree_SetFocusWhenToggle = 1 -- Tenta di dare il focus automatico
		vim.g.undotree_WindowLayout = 3 -- Layout con finestra a destra
	end,
}
