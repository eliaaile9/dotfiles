return {
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = {
                    theme = "onedark_dark",
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
