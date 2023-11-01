-- -------------------------------------------
-- Variables
-- -------------------------------------------
vim.cmd [[colorscheme onedark]]
require('onedark').setup {
  -- Main options --
  style = 'darker',             -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  transparent = false,          -- Show/hide background
  term_colors = true,           -- Change terminal color as per the selected theme style
  ending_tildes = false,        -- Show the end-of-buffer tildes. By default they are hidden
  cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
  -- toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between
  code_style = {
    comments = 'italic',
    keywords = 'italic',
    functions = 'none',
    strings = 'none',
    variables = 'none'
  },

  -- Lualine options --
  lualine = {
    transparent = false, -- lualine center bar transparency
  },

  -- Custom Highlights --
  colors = {},     -- Override default colors
  highlights = {}, -- Override highlight groups

  -- Plugins Config --
  diagnostics = {
    darker = true,     -- darker colors for diagnostic
    undercurl = true,  -- use undercurl instead of underline for diagnostics
    background = true, -- use background color for virtual text
  },
}
---------------------------------------------
-- Plugins
---------------------------------------------
vim.cmd [[ let NERDTreeRespectWildIgnore=1 ]]

require("fidget").setup {}

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

require("lspconfig").clangd.setup {
  on_attach = on_attach
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

----------------------------------------------------
-- Diagnostic (TODO message rewrite)  ✔   
----------------------------------------------------
vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn',
  { text = '', texthl = 'DiagnosticSignWarn', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DiagnosticSignHint',
  { text = '', texthl = 'DiagnosticSignInfo', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
vim.fn.sign_define('DiagnosticSignInfo',
  { text = '', texthl = 'DiagnosticSignHint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })

require("trouble").setup {
  position = "bottom",               -- position of the list can be: bottom, top, left, right
  height = 10,                       -- height of the trouble list when position is top or bottom
  width = 50,                        -- width of the list when position is left or right
  icons = true,                      -- use devicons for filenames
  mode = "document_diagnostics",     -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
  fold_open = "",                 -- icon used for open folds
  fold_closed = "",               -- icon used for closed folds
  group = true,                      -- group results by file
  padding = true,                    -- add an extra new line on top of the list
  action_keys = {
    close = "q",                     -- close the list
    cancel = "<esc>",                -- cancel the preview and get back to your last window / buffer / cursor
    refresh = "r",                   -- manually refresh
    jump = { "<cr>", "<tab>" },      -- jump to the diagnostic or open / close folds
    open_split = { "<c-x>" },        -- open buffer in new split
    open_vsplit = { "<c-v>" },       -- open buffer in new vsplit
    open_tab = { "<c-t>" },          -- open buffer in new tab
    jump_close = { "o" },            -- jump to the diagnostic and close the list
    toggle_mode = "m",               -- toggle between "workspace" and "document" diagnostics mode
    toggle_preview = "P",            -- toggle auto_preview
    hover = "K",                     -- opens a small popup with the full multiline message
    preview = "p",                   -- preview the diagnostic location
    close_folds = { "zM", "zm" },    -- close all folds
    open_folds = { "zR", "zr" },     -- open all folds
    toggle_fold = { "zA", "za" },    -- toggle fold of current file
    previous = "k",                  -- previous item
    next = "j"                       -- next item
  },
  indent_lines = true,               -- add an indent guide below the fold icons
  auto_open = false,                 -- automatically open the list when you have diagnostics
  auto_close = false,                -- automatically close the list when you have no diagnostics
  auto_preview = true,               -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
  auto_fold = false,                 -- automatically fold a file trouble list at creation
  auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
  signs = {
    error = "",
    warning = "",
    hint = "",
    information = "",
    other = "﫠"
  },
  use_diagnostic_signs = false
}
