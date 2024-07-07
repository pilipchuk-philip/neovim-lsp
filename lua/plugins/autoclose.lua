return {
  'm4xshen/autoclose.nvim',
  options = {
    disabled_filetypes = { "text", "markdown" },
  },
  config = function()
    require("autoclose").setup()
  end,
}
