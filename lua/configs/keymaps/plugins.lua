local keymap = vim.keymap.set
local cmd = vim.cmd -- execute Vim commands

-----------------------------------------------------------------------
--- Empty ctrl
-----------------------------------------------------------------------
--| ctrl - ;
--| ctrl - <
--| ctrl - m
--| ctrl - q - vusual block?
--| ctrl - y
--| cltr - i
--| cltr - o
--| cltr - d
--| cltr - h
--| cltr - x
--| cltr - b
--| cltr - m
------------------------------------------------------------------------
-- Surround
------------------------------------------------------------------------
--  Old text                    Command         New text
------------------------------------------------------------------------
--   surr*ound_words             ysiw)           (surround_words)
--   *make strings               ys$"            "make strings"
--   [delete ar*ound me!]        ds]             delete around me!
--   remove <b>HTML t*ags</b>    dst             remove HTML tags
--   'change quot*es'            cs'"            "change quotes"
--   <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
--   delete(functi*on calls)     dsf             function calls

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
cmd [[ nnoremap <silent>gD :lua vim.lsp.buf.declaration()<CR> ]]
cmd [[ nnoremap <silent>gd :lua vim.lsp.buf.definition()<CR> ]]

-----------------------------------------------------------------------
-- Hover Doc
-----------------------------------------------------------------------
vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

-----------------------------------------------------------------------
-- TODO
-----------------------------------------------------------------------
cmd [[ nmap <C-t> :TroubleToggle<CR> ]]

-----------------------------------------------------------------------
-- GIT
-----------------------------------------------------------------------
cmd [[ nnoremap <C-n> :Neogit<CR> ]]

-----------------------------------------------------------------------
-- [Telescope] Search
-----------------------------------------------------------------------
cmd [[ nnoremap <C-p> :Telescope find_files<CR> ]]
cmd [[ nnoremap <C-f> :Telescope live_grep<CR> ]]
cmd [[ nnoremap <C-e> :Telescope buffers<CR> ]]
cmd [[ nnoremap <C-g> :Telescope git_status<CR> ]]
cmd [[ nnoremap <silent>gr :lua require('telescope.builtin').lsp_references()<CR> ]] -- Find References
