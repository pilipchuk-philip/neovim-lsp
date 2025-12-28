return {
  'nvim-telescope/telescope.nvim',
  -- branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-live-grep-args.nvim',
    'tom-anders/telescope-vim-bookmarks.nvim',
    'kkharji/sqlite.lua',
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
    -- Neovim 0.10+ removed vim.treesitter.language.ft_to_lang; keep Telescope compatible.
    local lga_actions = require("telescope-live-grep-args.actions")
    require('telescope').setup {
      defaults = {
        layout_config = {
          width = 0.99,
          height = 0.99,
          prompt_position = 'top',
        },
        file_ignore_patterns = { "node_modules", ".mypy_cache", ".idea" },
        sorting_strategy = 'ascending',
        prompt_position = 'top',
        prompt_prefix = "  ",
        selection_caret = " ",
        mappings = {
          i = {
            ["<C-d>"] = require('telescope.actions').preview_scrolling_down,
            ["<C-u>"] = require('telescope.actions').preview_scrolling_up,
          },
          n = {
            ["<C-d>"] = require('telescope.actions').preview_scrolling_down,
            ["<C-u>"] = require('telescope.actions').preview_scrolling_up,
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
