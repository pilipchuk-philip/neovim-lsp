require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

require("telescope").load_extension("git_file_history")
-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
