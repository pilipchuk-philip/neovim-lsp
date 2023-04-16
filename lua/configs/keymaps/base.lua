local cmd = vim.cmd             -- execute Vim commands

-----------------------------------------------------------------------
--- COMMON 
-----------------------------------------------------------------------
cmd [[ let mapleader = "'" ]]
-- if mac os
-- cmd [[ vmap <C-c> "*y ]]
cmd [[ vmap <C-c> "+y ]]

cmd [[ nnoremap ; : ]]
cmd [[ nnoremap p P ]]
cmd [[ nnoremap ; : ]]
cmd [[ nnoremap <leader>; ;  ]]

-----------------------------------------------------------------------
--- NERDTRee
-----------------------------------------------------------------------
cmd [[ nnoremap <BS> :NERDTreeToggle<CR> ]]

-----------------------------------------------------------------------
--- TODO PYTHON
-----------------------------------------------------------------------

--  Toggle show/hide invisible chars  
cmd [[ nnoremap <leader>i :set list!<cr>]]


