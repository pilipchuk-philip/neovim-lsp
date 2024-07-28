return {
  "preservim/nerdtree",
  config = function()
    vim.cmd [[
      let NERDTreeIgnore = ['__pycache__', '\.pyc$']
    ]]
  end,
}
