return {
  "preservim/nerdtree",
  config = function()
    vim.cmd [[
      let NERDTreeShowHidden=1
      let NERDTreeIgnore=['\.git$', '\.idea$', '\.vscode$', '\.history$']
    ]]
  end
}
