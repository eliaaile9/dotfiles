return {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    event = {
        "BufReadPre /home/elia/obsidian/*.md",
        "BufNewFile /home/elia/obsidian/*.md",
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "hrsh7th/nvim-cmp",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("obsidian").setup({
            workspaces = {
                {
                    name = "learning",
                    path = "~/obsidian",
                },
            },
            completion = {
                nvim_cmp = true,
                min_chars = 2,
            },
            mappings = {
                -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
                -- Toggle check-boxes.
                ["<leader>ch"] = {
                    action = function()
                        return require("obsidian").util.toggle_checkbox()
                    end,
                    opts = { buffer = true },
                },
                -- Smart action depending on context, either follow link or toggle checkbox.
                ["<cr>"] = {
                    action = function()
                        return require("obsidian").util.smart_action()
                    end,
                    opts = { buffer = true, expr = true },
                },
            },
            open_app_foreground = false,
            picker = {
                name = "telescope.nvim",
            },
            ui = {
                enable = true,
            },
            attachements = {
                img_folder = "Allegati",
            },
        })
    end,
}
