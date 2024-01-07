local keymap = vim.keymap.set

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
keymap({'n', 'v'}, '<BS>', ':Neotree toggle<CR>', { silent = true })

-- Tabs, Splits
keymap('n', '<C-t>', ':tabedit<Return>', { silent = true })
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

-- Hover Doc
keymap('n', 'K', vim.lsp.buf.hover)

-- [Telescope] Search
keymap('n', '<C-p>', ':Telescope find_files<CR>')
keymap('n', '<C-f>', ':Telescope live_grep<CR>')
keymap('n', '<C-e>', ':Telescope buffers<CR>')
keymap('n', '<C-g>', ':Telescope git_status<CR>')
keymap('n', '<C-y>', ':Telescope lsp_document_symbols ignore_symbols=variable<CR>')
keymap('n', 'gr', ':lua require("telescope.builtin").lsp_references()<CR>', {silent = true})
