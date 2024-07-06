return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-live-grep-args.nvim',
    'tom-anders/telescope-vim-bookmarks.nvim',
    'isak102/telescope-git-file-history.nvim',
    'tpope/vim-fugitive',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  config = function()
    local lga_actions = require("telescope-live-grep-args.actions") -- FIXME: ошибка тут
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
      extensions = {
        live_grep_args = {
          auto_quoting = true,                        -- enable/disable auto-quoting
          -- define mappings, e.g.
          mappings = {                                -- extend mappings
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(), -- FIXME: что-то не так
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
            },
          },
        },
      },
    }

    require("telescope").load_extension("live_grep_args")
    require('telescope').load_extension('vim_bookmarks')
    require("telescope").load_extension("git_file_history")
    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')
  end,
}
