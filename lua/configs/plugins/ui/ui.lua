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
require('github-theme').setup({
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


})
cmd [[colorscheme github_dark_dimmed]]
cmd [[ set wildignore+=*__pycache__,*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.* ]]
---------------------------------------------
-- Plugins
---------------------------------------------
cmd [[ let NERDTreeRespectWildIgnore=1 ]]

local navic = require("nvim-navic")
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

vim.cmd [[set hidden]]
vim.cmd [[let g:netrw_bufsettings = 'nohidden noma nomod nonu nowrap ro buflisted']]

require("fidget").setup {}

require("lsp_signature").setup {}

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
require("lualine").setup {
  extensions = { 'quickfix', 'symbols-outline' }
}

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

require("lspconfig").clangd.setup {
  on_attach = on_attach
}

----------------------------------------------------
-- Tansporecy
----------------------------------------------------
--[[ require("transparent").setup({
  groups = { -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLineNr', 'EndOfBuffer',
  },
  extra_groups = {},   -- table: additional groups that should be cleared
  exclude_groups = {}, -- table: groups you don't want to clear
}) ]]
----------------------------------------------------
-- Wilder
----------------------------------------------------

require("wilder").setup({
  modes = { ':', '/', '?' },
  next_key = '<TAB>',
})
require("wilder").set_option('renderer', require("wilder").popupmenu_renderer(
  require("wilder").popupmenu_border_theme({
    left = { ' ', require("wilder").popupmenu_devicons() },
    highlighter = require("wilder").basic_highlighter(),
    min_width = '100%',
    min_height = '20%',
    max_height = '10%',
    highlights = {
      border = 'Normal', -- highlight to use for the border
    },
    border = 'rounded',
  })
))

----------------------------------------------------
-- Diagnostic (TODO message rewrite)
----------------------------------------------------

vim.fn.sign_define('DiagnosticSignError', { text = '⚠', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn',
  { text = '?', texthl = 'DiagnosticSignWarn', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DiagnosticSignHint',
  { text = 'H', texthl = 'DiagnosticSignInfo', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DiagnosticSignInfo',
  { text = 'I', texthl = 'DiagnosticSignHint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
