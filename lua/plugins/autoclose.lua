return {
  'm3xshen/autoclose.nvim',
  options = {
    disabled_filetypes = { "text", "markdown" },
  },
  config = function()
    require("autoclose").setup({
      options = {
        disable_when_touch = true, -- Отключает автозакрытие, когда курсор касается символа
        touch_regex = "[%w\"%)]"   -- Регулярное выражение для символов, которые отключают автозакрытие
      }
    })
  end,
}
