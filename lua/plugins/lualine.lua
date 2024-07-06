return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require("lualine").setup {
      options = {
        icons_enabled = true,
        -- theme = 'auto', # if theme is not catppuccin
        theme = "catppuccin",
        component_separators = { left = ')', right = '(' },
        -- section_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { { 'mode', icons_enabled = true } },
        lualine_b = { 'diagnostics', { 'filename', file_status = true, path = 1, icons_enabled = true } },
        lualine_c = { { 'branch', icons_enabled = true }, 'diff', },
        lualine_x = { 'encoding', 'fileformat', { 'filetype', icons_enabled = true } },

        lualine_y = {
          {
            function()
              return require('lsp-progress').progress()
            end,
          }, 'progress' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = { 'diff' },
        lualine_c = { 'filename' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
    }
    vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
    vim.api.nvim_create_autocmd("User", {
      group = "lualine_augroup",
      pattern = "LspProgressStatusUpdated",
      callback = require("lualine").refresh,
    })
  end,
}
