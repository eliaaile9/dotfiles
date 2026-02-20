-- this plugin completes every brackets
return{
  "m4xshen/autoclose.nvim",
  config = function()
    require("autoclose").setup({})
  end
}
