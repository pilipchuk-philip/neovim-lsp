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
    local lga_actions = require("telescope-live-grep-args.actions")
    require('telescope').setup {
      defaults = {
        file_ignore_patterns = { "node_modules", ".mypy_cache", ".idea" },
        prompt_prefix = "  ",
        selection_caret = " ",
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
      extensions = {
        live_grep_args = {
          auto_quoting = true,
          mappings = {
            i = {
              --TODO: Здесь можно добавить команды из ripgrep
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              ["<C-space>"] = lga_actions.to_fuzzy_refine,
            },
          },
        }
      },
    }

    require("telescope").load_extension("live_grep_args")
    require('telescope').load_extension('vim_bookmarks')
    require("telescope").load_extension("git_file_history")
    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')
  end,
}
