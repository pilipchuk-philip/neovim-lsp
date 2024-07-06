return {
  'gelguy/wilder.nvim',
  config = function()
    require("wilder").setup({
      modes = { ':', '/', '?' },
      next_key = '<TAB>',
    })

    require("wilder").set_option('renderer', require("wilder").popupmenu_renderer(
      require("wilder").popupmenu_border_theme({
        border = 'rounded',
        max_height = '35%',      -- max height of the palette
        min_width = '100%',
        prompt_position = 'top', -- 'top' or 'bottom' to set the location of the prompt
        reverse = 0,             -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
        pumblend = 10,
      })
    ))
  end,
}
