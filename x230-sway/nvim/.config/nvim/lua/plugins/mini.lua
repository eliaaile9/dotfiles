return {
    {
        "echasnovski/mini.nvim",
        config = function()
            require("mini.comment").setup()
            require("mini.move").setup()
        end,
    },
}
