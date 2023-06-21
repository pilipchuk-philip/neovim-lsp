-- -------------------------------------------
-- Variables
-- -------------------------------------------
local cmd = vim.cmd            -- execute Vim commands
local exec = vim.api.nvim_exec -- execute Vimscript
local g = vim.g                -- global variables
local opt = vim.opt            -- global/buffer/windows-scoped options

---------------------------------------------
-- Base
---------------------------------------------
opt.cursorline = true    -- Подсветка строки с курсором
opt.number = true        -- Включаем нумерацию строк
opt.termguicolors = true --  24-bit RGB colors

---------------------------------------------
-- Theme
---------------------------------------------
--[[ require('github-theme').setup({
  options = {
    transparent = false,
    hide_end_of_buffer = true,
    hide_nc_statusline = true,
    styles = {
      comments = 'italic,bold',
      functions = 'bold',
      keywords = 'bold',
      variables = 'NONE',
    },
    darken = {
      floats = true,
      sidebars = {
        enable = true,
        list = {},
      },
    },
  },

  specs = {
    -- Change the color of only the 'github_dark' theme's 'hint' color to magenta and make the 'error' color a dim red.
    github_dark = {
      diag = {
        error = '#660000',
        hint = 'magenta.base',
      },
    },
    -- Change the "hint" color to the "orange" color, and make the "error" color bright red.
    all = {
      diag = {
        error = '#ff0000',
        hint = 'orange',
      },
    },
  },


}) ]]
-- cmd [[colorscheme github_dark_dimmed]]
cmd [[colorscheme tokyonight]]
require("tokyonight").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "storm",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "day",    -- The theme is used when the background is set to light
  transparent = false,    -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark",             -- style for sidebars, see below
    floats = "dark",               -- style for floating windows
  },
  sidebars = { "qf", "help" },     -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3,            -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false,            -- dims inactive windows
  lualine_bold = false,            -- When `true`, section headers in the lualine theme will be bold

})
cmd [[ set wildignore+=*__pycache__,*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.* ]]
---------------------------------------------
-- Plugins
---------------------------------------------
cmd [[ let NERDTreeRespectWildIgnore=1 ]]

vim.cmd [[set hidden]]
vim.cmd [[let g:netrw_bufsettings = 'nohidden noma nomod nonu nowrap ro buflisted']]

require("fidget").setup {}

require("lsp_signature").setup {
  hint_prefix = "",
}

require("indent_blankline").setup {
  show_current_context = true,
  show_current_context_start = true,
}

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
--[[ require("lualine").setup {
  extensions = { 'quickfix', 'symbols-outline' }
} ]]

require("lualine").setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
  },
  -- icons_enabled = true,
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

require("lspconfig").clangd.setup {
  on_attach = on_attach
}

----------------------------------------------------
-- Wilder
----------------------------------------------------

require("wilder").setup({
  modes = { ':', '/', '?' },
  next_key = '<TAB>',
})
require("wilder").set_option('renderer', require("wilder").popupmenu_renderer(
  require("wilder").popupmenu_palette_theme({
    -- 'single', 'double', 'rounded' or 'solid'
    border = 'rounded',
    max_height = '75%',      -- max height of the palette
    min_height = 0,          -- set to the same as 'max_height' for a fixed height window
    prompt_position = 'top', -- 'top' or 'bottom' to set the location of the prompt
    reverse = 0,             -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
  })

))

----------------------------------------------------
-- Diagnostic (TODO message rewrite) ﬀ   ✔  
----------------------------------------------------

vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn',
  { text = '', texthl = 'DiagnosticSignWarn', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DiagnosticSignHint',
  { text = 'ﬀ', texthl = 'DiagnosticSignInfo', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DiagnosticSignInfo',
  { text = '', texthl = 'DiagnosticSignHint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })

-----------------------------------------------------
-- Autoclose
-----------------------------------------------------
require("autoclose").setup()

-----------------------------------------------------
-- Better folds
-----------------------------------------------------
require("better-folds").setup()
