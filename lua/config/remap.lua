local keymap = vim.keymap.set

-- Custom Functions and Keymaps
function vim.getVisualSelection() -- Func: C-F by name
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
  require("telescope").extensions.live_grep_args.live_grep_args({ default_text = text })
end)

function CopyRelativePath() -- Func: Copy Rel Path
  local current_file = vim.fn.expand('%')
  local relative_path = vim.fn.fnamemodify(current_file, ':.')
  vim.fn.setreg('+', relative_path)
  print('Relative Path: ' .. relative_path)
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

-- Func: Toggle explorer
function ToggleExplorer()
  local buf_name = vim.api.nvim_buf_get_name(0)
  local is_netrw = vim.bo.filetype == 'netrw'
  if is_netrw then
    vim.cmd('silent! bwipeout') -- Закрыть буфер Netrw
  else
    vim.cmd('Explore')
  end
end

keymap({ 'n', 'v' }, '<BS>', ':lua ToggleExplorer()<CR>', { silent = true })


------------------------------------------
-- Basics
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
keymap('n', ';', ':', { silent = true })

-- Select all file
keymap('n', '<C-a>', 'gg<S-v>G')

-- Remap for dealing with word wrap
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Tabs, Splits
keymap('n', 'te', ':tabedit<CR>', { silent = true })
keymap('n', '<tab>', ':bp<CR>', { silent = true })

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

-- Comments, copy and simple file search
if vim.loop.os_uname().sysname == "Darwin" then
  keymap('n', '<C-/>', '<Plug>kommentary_line_default <CR>')
  keymap('v', '<C-/>', '<Plug>kommentary_visual_default <CR>')
  vim.cmd [[ vmap <C-c> "*y ]]
  keymap('n', '<C-p>', ':Telescope find_files hidden=true find_command=fd,--type,f,--exclude,.git<CR>')
else
  keymap('n', '<C-_>', '<Plug>kommentary_line_default<CR>')
  keymap('v', '<C-_>', '<Plug>kommentary_visual_default<CR>')
  keymap('n', '<C-p>', ':Telescope find_files hidden=true find_command=fdfind,--type,f,--exclude,.git<CR>')
  vim.cmd [[ vmap <C-c> "+y ]]
end
if vim.env.TMUX then
  keymap('n', '', '<Plug>kommentary_line_default<CR>')
  keymap('v', '', '<Plug>kommentary_visual_default<CR>')
end

-- LSP (from code)
keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', { silent = true })                       -- LSP defenition
keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', { silent = true })                        -- LSP declaration
keymap('n', 'gr', ':lua require("telescope.builtin").lsp_references()<CR>', { silent = true })   -- LSP references
vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })                        -- Hover Doc
-- File Search
keymap('n', '<C-f>', ':lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>') -- Search
--- Apps
keymap({ 'n', 'v' }, '<leader>ca', ':lua require("actions-preview").code_actions()<CR>')         -- code actions


-- Windows
local function diagnostics_in_current_buffer()
  require("telescope.builtin").diagnostics({ bufnr = 0 })
end
keymap('n', '<C-e>', ':Telescope buffers<CR>')
keymap('n', '<C-g>', ':Telescope git_status<CR>')
keymap('n', '<C-y>', ':Telescope lsp_document_symbols ignore_symbols=variable<CR>')
keymap('n', '<C-t>', ':TodoTelescope<CR>')
keymap('n', '<C-d>', diagnostics_in_current_buffer)

keymap('n', '<leader>lg', ':LazyGit <CR>')                                                                -- LazyGit
keymap('n', '<leader>gf', ':lua require("telescope").extensions.git_file_history.git_file_history()<CR>') -- LazyGit
keymap('n', '<leader>g', ':ChatGPT <CR>')                                                                 -- ChatGPT
keymap('v', '<leader>g', ':ChatGPTEditWithInstructions <CR>')

keymap('n', '<leader>n', ':Telescope neoclip<CR>')                                -- Neoclip
keymap('n', '<leader>b', ':Telescope vim_bookmarks all<CR>', { silent = true })   -- Bookmarks
keymap('n', '<leader>fh',
  ':lua require("telescope").extensions.git_file_history.git_file_history()<CR>', -- Git file history
  { silent = true }
)
