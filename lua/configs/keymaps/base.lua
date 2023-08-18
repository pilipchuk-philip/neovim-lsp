-----------------------------------------------------------------------
-- COMMON
-----------------------------------------------------------------------
vim.cmd [[ let mapleader = "'" ]]
-- if mac os
-- vim.cmd [[ vmap <C-c> "*y ]]
vim.cmd [[ vmap <C-c> "+y ]]

vim.cmd [[ nnoremap ; : ]]
vim.cmd [[ nnoremap p P ]]
vim.cmd [[ nnoremap <leader>; ;  ]]

-----------------------------------------------------------------------
--- NERDTRee
-----------------------------------------------------------------------
vim.cmd [[ nnoremap <BS> :NERDTreeToggle<CR> ]]

-----------------------------------------------------------------------
-- Toggle show/hide invisible chars
-----------------------------------------------------------------------
vim.cmd [[ nnoremap <leader>i :set list!<cr>]]

-----------------------------------------------------------------------
-- Select all
-----------------------------------------------------------------------
vim.keymap.set('n', '<C-a>', 'gg<S-v>G', { silent = true })

-----------------------------------------------------------------------
-- Tabs, Splits
-----------------------------------------------------------------------
vim.keymap.set('n', '<C-t>', ':tabedit<Return>', { silent = true })
vim.keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
vim.keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })

vim.keymap.set('n', 'sh', '<C-w>h', { silent = true })
vim.keymap.set('n', 'sl', '<C-w>l', { silent = true })
vim.keymap.set('n', 'sk', '<C-w>k', { silent = true })
vim.keymap.set('n', 'sj', '<C-w>j', { silent = true })

vim.keymap.set('n', 'sh', '<C-w>h', { silent = true })
vim.keymap.set('n', 'sl', '<C-w>l', { silent = true })
vim.keymap.set('n', 'sk', '<C-w>k', { silent = true })
vim.keymap.set('n', 'sj', '<C-w>j', { silent = true })
