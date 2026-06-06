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
					"clangd", -- C
					"asm_lsp", --Assembly
                    "texlab", --LaTeX
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, {})

			vim.lsp.config("lua_ls", {
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
            vim.lsp.enable("lua_ls")

            vim.lsp.config("texlab", {
                capabilities = capabilities,
                settings = {
                    texlab = {
                        build = {
                            -- IMPORTANTE: false! Lasciamo compilare a VimTeX per evitare conflitti
                            onSave = false, 
                        },
                        forwardSearch = {
                            -- Configurato per Okular. Se usi Evince, cambia in "evince"
                            executable = "zathura", 
                            args = { "--synctex-forward", "%l:1:%f", "%p" },
                        },
                        chktex = {
                            onOpenAndSave = true,
                            onType = false,
                        },
                    },
                },
            })
            vim.lsp.enable("texlab")

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
