-- used to define all the keymaps in the neovim config
return {
	"mrjones2014/legendary.nvim",
	dependencies = {
		"kkharji/sqlite.lua",
		"nvim-telescope/telescope.nvim",
	},
	priority = 10000,
	lazy = false,
	config = function()
		require("legendary").setup({
			include_builtins = true,
			select_prompt = "Looking for something?",
			extensions = {
				lazy_nvim = true,
				nvim_tree = true,
			},
			keymaps = {
				{
					itemgroup = "Legendary",
					description = "Legendary keymaps",
					icon = "\u{f15c}",
					keymaps = {
						{
							"<C-o>",
							":Legendary<CR>",
							description = "Search keymaps, commands and autocmd using Legendary",
							mode = "n",
						},
					},
				},
				{
					itemgroup = "Telescope",
					description = "Telescope keymaps",
					icon = "\u{e209}",
					keymaps = {
						{
							"<C-t>",
							require("telescope.builtin").find_files,
							description = "Fuzzy find files using Telescope",
							mode = "n",
						},
						{
							"<C-g>",
							require("telescope.builtin").live_grep,
							description = "Live Grep in the file using Telescope",
							mode = "n",
						},
					},
				},
				{
					itemgroup = "Sessions",
					description = "Sessions keymaps",
					icon = "\u{f108}",
					keymaps = {
						{
							"<Leader>ls",
							require("auto-session.session-lens").search_session,
							description = "Change session's file using Sessions",
							mode = "n",
						},
					},
				},
				{
					itemgroup = "Completion",
					description = "Completion keymaps",
					icon = "\u{f12e}",
					keymaps = {
						{
							"<C-b>",
							description = "Scroll the completion docs up",
							mode = "i",
						},
						{
							"<C-f>",
							description = "Scroll completion docs down",
							mode = "i",
						},
						{
							"<C-c>",
							description = "Trigger completion",
							mode = "i",
						},
						{
							"<C-e>",
							description = "Abort completion",
							mode = "i",
						},
						{
							"<CR>",
							description = "Confirm selected completion",
							mode = "i",
						},
					},
				},
				{
					itemgroup = "LSP",
					description = "LSP keymaps",
					icon = "\u{f085}",
					keymaps = {
						{
							"K",
							vim.lsp.buf.hover,
							description = "Show hover definition of the LSP",
							mode = "n",
						},
						{
							"gd",
							vim.lsp.buf.definition,
							description = "Go to the definition of the LSP",
							mode = "n",
						},
						{
							"<leader>ca",
							vim.lsp.buf.code_action,
							description = "Show the possible code actions from the LSP",
							mode = { "n", "v" },
						},
						{
							"<leader>gf",
							vim.lsp.buf.format,
							description = "Format the current buffer based on LSP",
							mode = "n",
						},
					},
				},
				{
					itemgroup = "Neotree",
					description = "Neotree keymaps",
					icon = "\u{f07b}",
					keymaps = {
						{
							"<C-n>",
							":Neotree filesystem reveal left<CR>",
							description = "Toggle Neotree filesystem on the left",
							mode = "n",
						},
					},
				},
				{
					itemgroup = "MiniMove",
					description = "Move lines/selections",
					icon = "",
					keymaps = {
						{
							"<A-h>",
							function()
								require("mini.move").move_line("left")
							end,
							description = "Move line left",
							mode = "n",
						},
						{
							"<A-l>",
							function()
								require("mini.move").move_line("right")
							end,
							description = "Move line right",
							mode = "n",
						},
						{
							"<A-j>",
							function()
								require("mini.move").move_line("down")
							end,
							description = "Move line down",
							mode = "n",
						},
						{
							"<A-k>",
							function()
								require("mini.move").move_line("up")
							end,
							description = "Move line up",
							mode = "n",
						},
						{
							"<A-h>",
							function()
								require("mini.move").move_selection("left")
							end,
							description = "Move selection left",
							mode = "v",
						},
						{
							"<A-l>",
							function()
								require("mini.move").move_selection("right")
							end,
							description = "Move selection right",
							mode = "v",
						},
						{
							"<A-j>",
							function()
								require("mini.move").move_selection("down")
							end,
							description = "Move selection down",
							mode = "v",
						},
						{
							"<A-k>",
							function()
								require("mini.move").move_selection("up")
							end,
							description = "Move selection up",
							mode = "v",
						},
					},
				},
				{
					itemgroup = "Surround",
					description = "Surround keymaps",
					icon = "\u{f10c}",
					keymaps = {
						{
							"ys",
							description = "Add surround (ys<motion><char>)",
							mode = "n",
						},
						{
							"ds",
							description = "Delete surround (ds<char>)",
							mode = "n",
						},
						{
							"cs",
							description = "Change surround (cs<old><new>)",
							mode = "n",
						},
						{
							"S",
							description = "Surround selection (S<char>)",
							mode = "x",
						},
						{
							"<C-g>s",
							description = "Surround in insert mode (<C-g>s<char>)",
							mode = "i",
						},
						{
							"<C-g>S",
							description = "Surround line in insert mode (<C-g>S<char>)",
							mode = "i",
						},
					},
				},
				{
					itemgroup = "Git",
					description = "Git keymaps",
					icon = "\u{f126}",
					keymaps = {
						{
							"<leader>gp",
							":Gitsigns preview_hunk<CR>",
							description = "See chunk's preview using Gitsigns",
							mode = "n",
						},
						{
							"<leader>gt",
							"Gitsigns toggle_current_line_blame<CR>",
							description = "Toggle git blame on the current line",
							mode = "n",
						},
					},
				},
				{
					itemgroup = "Flash",
					description = "Flash keymaps",
					icon = "\u{26a1}",
					keymaps = {
						{

							"s",
							function()
								require("flash").jump()
							end,
							description = "Use Flash to jump to the desidered label",
							mode = { "n", "x", "o" },
						},
						{
							"S",
							function()
								require("flash").treesitter()
							end,
							description = "Open Flash in Treesitter mode",
							mode = { "n", "x", "o" },
						},
						{
							"r",
							function()
								require("flash").remote()
							end,
							description = "Open Flash in remote mode",
							mode = "o",
						},
						{
							"R",
							function()
								require("flash").treesitter_search()
							end,
							description = "Open Flash in Treesitter Search mode",
							mode = { "o", "x" },
						},
						{
							"<C-s>",
							function()
								require("flash").toggle()
							end,
							description = "Toggle Flash search",
							mode = { "c" },
						},
					},
				},
				{
					itemgroup = "Undotree",
					description = "Undotree keymaps",
					icon = "\u{21a9}",
					keymaps = {
						{
							"<leader>u",
                            "<cmd>UndotreeToggle<CR>",
							desc = "Toggle Undotree",
							mode = { "n" },
						},
					},
				},
			},
		})
	end,
}
