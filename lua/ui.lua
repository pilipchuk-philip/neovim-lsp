------- Theme -------
require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  background = {     -- :h background
    light = "latte",
    dark = "mocha",
  },
  transparent_background = false, -- disables setting the background color.
  show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
  term_colors = false,            -- sets terminal colors (e.g. `g:terminal_color_0`)
  dim_inactive = {
    enabled = false,              -- dims the background color of inactive window
    shade = "dark",
    percentage = 0.15,            -- percentage of the shade to apply to the inactive window
  },
  no_italic = false,              -- Force no italic
  no_bold = false,                -- Force no bold
  no_underline = false,           -- Force no underline
  styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic" },      -- Change the style of comments
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  color_overrides = {
    all = {

    }
  },
  custom_highlights = {},
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    notify = false,
    mini = {
      enabled = true,
      indentscope_color = "",
    },
    -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

------- Indent Blank Lines -------
require("ibl").setup {
  scope = { enabled = false },
}

------- Lua Line -------
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
    lualine_c = { { 'branch', icons_enabled = true } },
    lualine_x = { 'encoding', 'fileformat', { 'filetype', icons_enabled = true } },
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

------- Wilder -------
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

------- Autoclose -------
require("autoclose").setup()
------- Folds -------
require("better-folds").setup()
------- transparent -------
require("transparent").setup({ -- Optional, you don't have to run setup.
  groups = {                   -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
    'EndOfBuffer',
  },
  extra_groups = {},   -- table: additional groups that should be cleared
  exclude_groups = {}, -- table: groups you don't want to clear
})

vim.cmd [[
  highlight Visual cterm=NONE ctermbg=Black ctermfg=Black guibg=LightYellow guifg=Black
]]

------- Documentation nice bordered floating window  -------
require("hover").setup {
  init = function()
    require("hover.providers.lsp")
  end,
  preview_opts = {
    border = 'single'
  },
  preview_window = false,
  title = true,
  mouse_providers = {
    'LSP'
  },
  mouse_delay = 1000
}

------- Highlight on yank -------
vim.cmd [[augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END]]

------- Signature -------
require "lsp_signature".setup({
  hint_prefix = "", -- Fix disable pictogram
  bind = true,
  handler_opts = {
    border = "rounded"
  }
})
