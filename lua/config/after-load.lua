-- Color schema
vim.cmd [[
  colorscheme catppuccin
]]

vim.cmd('highlight Visual cterm=NONE ctermbg=White ctermfg=Black guibg=White guifg=Black')

-- Highlight on yank
vim.cmd [[augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END]]

-- Help always right
-- Функция для открытия окна помощи справа
local function open_help_on_right()
  if vim.bo.filetype == 'help' then
    vim.cmd('wincmd L')
  end
end
vim.api.nvim_create_augroup('HelpOnRight', { clear = true })
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*.txt',
  callback = open_help_on_right,
  group = 'HelpOnRight',
})

-- Format code
-- FIXME: автоформатирование
for _, file_pattern in ipairs({ "*.rs", "*.hs", "*.py", "*.lua", "*.md", "*.nix", "*.tf" }) do
  vim.api.nvim_create_autocmd(
    'BufWritePre',
    {
      pattern = file_pattern,
      callback = function() vim.lsp.buf.format(nil) end
    }
  )
end

-- Diagnostic Config and Icons
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false
})

vim.fn.sign_define("DiagnosticSignError",
  { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",
  { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",
  { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint",
  { text = "󰌵", texthl = "DiagnosticSignHint" })
