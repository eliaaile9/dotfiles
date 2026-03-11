-- this plugin completes html tags and can rename
return{
  "windwp/nvim-ts-autotag",
  config = function ()
        require("nvim-ts-autotag").setup({})
  end
}
