return {
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = {
                    theme = 'auto',
                },
                sections = {
                    lualine_b = { "branch" },
                    lualine_c = { "filename", "filetype" },
                    lualine_x = { "encoding", "fileformat" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
            })
        end,
    },
}
