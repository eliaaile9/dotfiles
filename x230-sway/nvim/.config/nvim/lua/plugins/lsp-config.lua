return {
	-- Mason is used to completion and lsp
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls", --Lua
					"gopls", -- Golang
					"pyright", -- Python
					"jdtls", -- Java
					"sqlls", -- SQL
					"html", -- HTML
					"cssls", -- CSS
					"bashls", -- Bash
					"jsonls", -- JSON
					"intelephense", -- PHP
					--"ast_grep", -- Dart
					"clangd", -- C
					"asm_lsp", --Assembly
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostic = {
							globals = { "vim" },
						},
						workspace = {
							checkThirdParty = false,
							library = vim.api.nvim_get_runtime_file("", true),
						},
						telemetry = { enable = false },
					},
				},
			})

			local servers = {
				"gopls",
				"pyright",
				"jdtls",
				"sqlls",
				"html",
				"cssls",
				"bashls",
				"jsonls",
				"intelephense",
				"clangd",
				"asm_lsp",
			}
			-- lspconfig.gopls.setup({
			-- 	capabilities = capabilities,
			-- })
			-- lspconfig.pyright.setup({
			-- 	capabilities = capabilities,
			-- })
			-- lspconfig.jdtls.setup({
			-- 	capabilities = capabilities,
			-- })
			-- lspconfig.sqlls.setup({
			-- 	capabilities = capabilities,
			-- })
			-- lspconfig.html.setup({
			-- 	capabilities = capabilities,
			-- })
			-- lspconfig.cssls.setup({
			-- 	capabilities = capabilities,
			-- })
			-- lspconfig.bashls.setup({
			-- 	capabilities = capabilities,
			-- })
			-- lspconfig.jsonls.setup({
			-- 	capabilities = capabilities,
			-- })
			-- lspconfig.intelephense.setup({
			-- 	capabilities = capabilities,
			-- })
			-- lspconfig.clangd.setup({
			-- 	capabilities = capabilities,
			-- })
			-- lspconfig.asm_lsp.setup({
			-- 	capabilities = capabilities,
			-- })
		end,
	},
}
