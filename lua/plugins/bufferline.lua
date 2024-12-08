return {
  'romgrk/barbar.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  config = function()
    require("barbar").setup()
    vim.api.nvim_set_hl(0, 'BufferCurrent', { fg = '#696969', bg = '#C0C0C0' })
    vim.api.nvim_set_hl(0, 'BufferVisible', { fg = '#CCCCCC', bg = '#222222' })
    vim.api.nvim_set_hl(0, 'BufferInactive', { fg = '#888888', bg = '#1A1A1A' })
  end
}
