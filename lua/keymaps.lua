local keymap = vim.keymap.set
local tb = require('telescope.builtin')

keymap('n', ';', ':', { silent = true })

if vim.loop.os_uname().sysname == "Darwin" then
  vim.cmd [[ vmap <C-c> "*y ]]
else
  vim.cmd [[ vmap <C-c> "+y ]]
end

-------------- Func: C-F by name ---------
function vim.getVisualSelection()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg('v')
  vim.fn.setreg('v', {})

  text = string.gsub(text, "\n", "")
  if #text > 0 then
    return text
  else
    return ''
  end
end

keymap('v', '<C-f>', function()
  local text = vim.getVisualSelection()
  tb.live_grep({ default_text = text })
end)
-------------- Func: Copy Rel Path ---------
function copy_relative_path()
  -- Получаем путь к текущему файлу в буфере
  local current_file = vim.fn.expand('%')
  -- Получаем рабочую директорию проекта
  local project_root = vim.fn.getcwd()
  -- Определяем относительный путь
  local relative_path = vim.fn.fnamemodify(current_file, ':.')
  -- Копируем относительный путь в буфер обмена
  vim.fn.setreg('+', relative_path)
  print('Относительный путь скопирован в буфер обмена: ' .. relative_path)
end

vim.api.nvim_set_keymap('n', '<leader>y', ':lua copy_relative_path()<CR>', { noremap = true, silent = true })

-------------- Func: Autofold -----------
-- methods by indent
function ToggleFoldMethod()
  if vim.o.foldmethod == 'indent' then
    vim.o.foldmethod = 'marker'
  else
    vim.o.foldmethod = 'indent'
  end
end

keymap('n', 'ff', ':lua ToggleFoldMethod() <CR>', { silent = true })

-- See `:help vim.keymap.set()`
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
keymap('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

--- NERDTRee
keymap({ 'n', 'v' }, '<BS>', ':NERDTreeToggle<CR>', { silent = true })

-- Tabs, Splits
keymap('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

keymap('n', 'sh', '<C-w>h', { silent = true })
keymap('n', 'sl', '<C-w>l', { silent = true })
keymap('n', 'sk', '<C-w>k', { silent = true })
keymap('n', 'sj', '<C-w>j', { silent = true })

keymap('n', 'sh', '<C-w>h', { silent = true })
keymap('n', 'sl', '<C-w>l', { silent = true })
keymap('n', 'sk', '<C-w>k', { silent = true })
keymap('n', 'sj', '<C-w>j', { silent = true })



-- Comments
if vim.loop.os_uname().sysname == "Darwin" then
  keymap('n', '<C-/>', '<Plug>kommentary_line_default <CR>')
  keymap('v', '<C-/>', '<Plug>kommentary_visual_default <CR>')
else
  keymap('n', '<C-_>', '<Plug>kommentary_line_default<CR>')
  keymap('v', '<C-_>', '<Plug>kommentary_visual_default<CR>')
end

if vim.env.TMUX then
  keymap('n', '', '<Plug>kommentary_line_default<CR>')
  keymap('v', '', '<Plug>kommentary_visual_default<CR>')
end

-- Hover Doc
keymap('n', 'K', vim.lsp.buf.hover)
vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })

--------------- LSP ---------------
keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', { silent = true })
keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', { silent = true })
keymap('n', 'gr', ':lua require("telescope.builtin").lsp_references()<CR>', { silent = true })
vim.keymap.set({ 'v', 'n' }, 'ga', require('actions-preview').code_actions)
keymap('n', 'gf',
  ':lua require("telescope").extensions.git_file_history.git_file_history()<CR>',
  { silent = true }
)
keymap('n', 'gt', ':TodoTelescope<CR>', { silent = true })
vim.keymap.set({ 'v', 'n' }, 'ga', require('actions-preview').code_actions)



--------------- TELESCOPE ---------------
if vim.loop.os_uname().sysname == "Darwin" then
  keymap('n', '<C-p>', ':Telescope find_files hidden=true find_command=fd,--type,f,--exclude,.git<CR>')
else
  keymap('n', '<C-p>', ':Telescope find_files hidden=true find_command=fdfind,--type,f,--exclude,.git<CR>')
end
keymap('n', '<C-f>', ':Telescope live_grep<CR>')
keymap('n', '<C-e>', ':Telescope buffers<CR>')
keymap('n', '<C-g>', ':Telescope git_status<CR>')
keymap('n', '<C-g>g', ':Telescope git_file_history<CR>')
keymap('n', '<C-y>', ':Telescope lsp_document_symbols ignore_symbols=variable<CR>')
keymap('n', '<C-t>', ':Telescope diagnostics burfnr=0<CR>')
keymap('n', '<leader>b', ':Telescope vim_bookmarks all<CR>')

--------------- RENAME ---------------
keymap('n', '<leader>r', ':IncRename')

--------------- GIT ---------------
keymap('n', '<leader>lg', ':LazyGit <CR>')
keymap('n', '<leader>gh', ':lua package.loaded.gitsigns.preview_hunk()')
keymap('n', '<leader>gf', ':lua require("telescope").extensions.git_file_history.git_file_history()<CR>')

--------------- CodeActions ---------------
keymap('n', '<leader>ca', ':lua require("actions-preview").code_actions()<CR>')
--
--------------- Chat ---------------
keymap('n', '<leader>c', ':ChatGPT <CR>')
keymap('v', '<leader>c', ':ChatGPTEditWithInstructions <CR>')
