-- Color schema
vim.cmd [[
  colorscheme catppuccin
]]
require("autoclose").setup()
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

--vim.cmd [[
--  highlight Visual cterm=NONE ctermbg=Black ctermfg=Black guibg=LightYellow guifg=Black
--]]
-- vim.cmd('highlight Visual cterm=NONE ctermbg=Black ctermfg=Black guibg=LightYellow guifg=Black')
vim.cmd('highlight Visual cterm=NONE ctermbg=White ctermfg=Black guibg=White guifg=Black')


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
