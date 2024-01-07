require("lsp_signature").setup {
  hint_prefix = "", -- Fix disable pictogram
}
require("ibl").setup()
require("illuminate").configure({
  providers = {
    'lsp',
    'treesitter',
    'regex',
  },
  delay = 100,
  filetype_overrides = {},
  filetypes_denylist = {
    'dirvish',
  },
  filetypes_allowlist = {},
  modes_denylist = {},
  modes_allowlist = {},
  providers_regex_syntax_denylist = {},
  providers_regex_syntax_allowlist = {},
  under_cursor = true,
  large_file_cutoff = nil,
  large_file_overrides = nil,
  min_count_to_highlight = 1,
})

require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
  },
  sections = {
    lualine_a = { { 'mode', icons_enabled = true } },
    lualine_b = { 'diagnostics', { 'branch', icons_enabled = true } },
    lualine_c = { { 'filename', file_status = true, path = 1, } },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
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

require("wilder").setup({
  modes = { ':', '/', '?' },
  next_key = '<TAB>',
})

require("wilder").set_option('renderer', require("wilder").popupmenu_renderer(
  require("wilder").popupmenu_palette_theme({
    border = 'rounded',
    max_height = '75%',      -- max height of the palette
    min_height = 0,          -- set to the same as 'max_height' for a fixed height window
    prompt_position = 'top', -- 'top' or 'bottom' to set the location of the prompt
    reverse = 0,             -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
  })

))

require("autoclose").setup()
require("better-folds").setup()


