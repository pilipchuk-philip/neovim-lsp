local keymap = vim.keymap.set
local tb = require('telescope.builtin')

------------------------------------------
-- Basics
-- See `:help vim.keymap.set()`
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
keymap('n', ';', ':', { silent = true })

-- Remap for dealing with word wrap
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Tabs
keymap('n', 'te', ':tabedit<CR>', { silent = true })
keymap('n', '<tab>', ':tabnext<CR>', { silent = true })


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

-- COPY
if vim.loop.os_uname().sysname == "Darwin" then
  vim.cmd [[ vmap <C-c> "*y ]]
else
  vim.cmd [[ vmap <C-c> "+y ]]
end

------------------------------------------
-- Custom Functions and Keymaps
-- Func: C-F by name
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

-- Func: Copy Rel Path
function CopyRelativePath()
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

vim.api.nvim_set_keymap('n', '<leader>y', ':lua CopyRelativePath()<CR>', { noremap = true, silent = true })

-- Func: Autofold
function ToggleFoldMethod()
  if vim.o.foldmethod == 'indent' then
    vim.o.foldmethod = 'marker'
  else
    vim.o.foldmethod = 'indent'
  end
end

keymap('n', 'ff', ':lua ToggleFoldMethod() <CR>', { silent = true })

------------------------------------------
--- Plugins
-- CodeActions
keymap('n', '<leader>ca', ':lua require("actions-preview").code_actions()<CR>')
keymap('v', '<leader>ca', ':lua require("actions-preview").code_actions()<CR>')

--- NERDTRee
keymap({ 'n', 'v' }, '<BS>', ':NERDTreeToggle<CR>', { silent = true })

-- Hover Doc
keymap('n', 'K', vim.lsp.buf.hover)
vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })

-- LSP GOTO
keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', { silent = true })
keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', { silent = true })
keymap('n', 'gr', ':lua require("telescope.builtin").lsp_references()<CR>', { silent = true })
keymap('n', 'gb', ':Telescope vim_bookmarks all<CR>', { silent = true })
keymap('n', 'gf',
  ':lua require("telescope").extensions.git_file_history.git_file_history()<CR>',
  { silent = true }
)

-- Windows and actions
-- Search
if vim.loop.os_uname().sysname == "Darwin" then
  keymap('n', '<C-p>', ':Telescope find_files hidden=true find_command=fd,--type,f,--exclude,.git<CR>')
else
  keymap('n', '<C-p>', ':Telescope find_files hidden=true find_command=fdfind,--type,f,--exclude,.git<CR>')
end
keymap('n', '<C-a>', 'gg<S-v>G')
keymap('n', '<C-f>', ':lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>')

-- Windows
local function diagnostics_in_current_buffer()
  require("telescope.builtin").diagnostics({ bufnr = 0 })
end
keymap('n', '<C-e>', ':Telescope buffers<CR>')
keymap('n', '<C-g>', ':Telescope git_status<CR>')
keymap('n', '<C-y>', ':Telescope lsp_document_symbols ignore_symbols=variable<CR>')
keymap('n', '<C-t>', ':TodoTelescope<CR>')
keymap('n', '<C-d>', diagnostics_in_current_buffer)
keymap('n', '<C-n>', ':Telescope neoclip<CR>')
-- RENAME
--[[ keymap('n', '<C-r>', ':IncRename')
-- GIT ]]
keymap('n', '<leader>lg', ':LazyGit <CR>')
keymap('n', '<leader>gf', ':lua require("telescope").extensions.git_file_history.git_file_history()<CR>')
-- Chat
keymap('n', '<leader>g', ':ChatGPT <CR>')
keymap('v', '<leader>g', ':ChatGPTEditWithInstructions <CR>')
