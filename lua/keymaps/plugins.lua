local keymap = vim.keymap.set
local cmd = vim.cmd             -- execute Vim commands

-----------------------------------------------------------------------
--- CheatSheat
-----------------------------------------------------------------------
cmd [[ nmap <c-h> :vsplit ~/.config/nvim/keys.txt <cr> ]]

-----------------------------------------------------------------------
--- Trouble
-----------------------------------------------------------------------
cmd[[ nnoremap <silent>t :TroubleToggle<CR> ]]

-----------------------------------------------------------------------
--- Comments
-----------------------------------------------------------------------
if vim.loop.os_uname().sysname == "Darwin" then
    cmd [[ nmap <C-/>   <Plug>kommentary_line_default  ]]
    cmd [[ vmap <C-/>   <Plug>kommentary_visual_default ]]
else
    cmd [[ nmap <C-_>   <Plug>kommentary_line_default  ]]
    cmd [[ vmap <C-_>   <Plug>kommentary_visual_default ]]
end
-----------------------------------------------------------------------
--- LSP Settings
-----------------------------------------------------------------------
cmd[[ nnoremap <silent>gD :lua vim.lsp.buf.declaration()<CR> ]]
cmd[[ nnoremap <silent>gd :lua vim.lsp.buf.definition()<CR> ]]

-----------------------------------------------------------------------
-- Hover Doc
-----------------------------------------------------------------------
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

-----------------------------------------------------------------------
-- TODO
-----------------------------------------------------------------------
cmd [[ nmap <C-t> :TodoQuickFix<CR> ]]

-----------------------------------------------------------------------
-- TAGS
-----------------------------------------------------------------------
cmd[[ nnoremap <silent>s :SymbolsOutline<CR> ]]

-----------------------------------------------------------------------
-- GIT
-----------------------------------------------------------------------
cmd[[ nnoremap <C-n> :Neogit<CR> ]]

-----------------------------------------------------------------------
-- [Telescope] Search
-----------------------------------------------------------------------
cmd [[ nnoremap <C-p> :Telescope find_files<CR> ]]
cmd [[ nnoremap <C-f> :Telescope live_grep<CR> ]]
cmd [[ nnoremap <C-e> :Telescope buffers<CR> ]]
cmd [[ nnoremap <C-g> :Telescope git_status<CR> ]]
cmd [[ nnoremap <C-l> :Telescope git_status<CR> ]]

-----------------------------------------------------------------------
-- [Telescope] Find References
-----------------------------------------------------------------------
cmd[[ nnoremap <silent>gr :lua require('telescope.builtin').lsp_references()<CR> ]]

-----------------------------------------------------------------------
-- Outline
-----------------------------------------------------------------------
cmd [[ nnoremap <C-o> :Vista nvim_lsp<CR> ]]

-----------------------------------------------------------------------
-- EasyAlign
-----------------------------------------------------------------------
cmd [[ nnoremap <C-d> :DogeGenerate<CR> ]]

