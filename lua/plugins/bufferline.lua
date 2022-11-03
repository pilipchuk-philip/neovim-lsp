return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  config = function()
    require("barbar").setup()
    -- Установите цвет текста для активного буфера
    vim.api.nvim_set_hl(0, 'BufferCurrent', { fg = '#696969', bg = '#ffaf87' })

    -- Установите цвет текста для видимого буфера (неактивного)
    vim.api.nvim_set_hl(0, 'BufferVisible', { fg = '#CCCCCC', bg = '#222222' })

    -- Установите цвет текста для неактивного буфера
    vim.api.nvim_set_hl(0, 'BufferInactive', { fg = '#888888', bg = '#1A1A1A' })
  end
  -- Disable top and bottom window border with 'bar'
}
