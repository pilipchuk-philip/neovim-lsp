return {
  "preservim/nerdtree",
  config = function()
    -- FIXME: похоже это не работает
    vim.cmd [[
      autocmd BufEnter * if winnr() == winnr('h') && bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
      \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
    ]]
    vim.cmd [[
      let NERDTreeIgnore = ['__pycache__', '\.pyc$']
    ]]
  end,
}
