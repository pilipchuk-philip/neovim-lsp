vim.g.mapleader = ' ' -- Set <space> as the leader key
vim.g.maplocalleader = ' '

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  { "rmagatti/auto-session" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  },
  {
    'aznhe21/actions-preview.nvim',
    config = function()
      vim.keymap.set({ 'v', 'n' }, 'gf', require('actions-preview').code_actions)
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    config = function()
      require("refactoring").setup({})
    end,
  },
  {
    "lewis6991/hover.nvim",
  },
  { 'davidgranstrom/nvim-markdown-preview' },
  { 'xiyaowong/transparent.nvim' },
  { 'kylechui/nvim-surround' },
  { 'm4xshen/autoclose.nvim' },
  { 'snelling-a/better-folds.nvim' },
  { 'b3nj5m1n/kommentary' },
  { 'powerman/vim-plugin-ruscmd' },
  { 'MattesGroeger/vim-bookmarks' },
  { 'nvimtools/none-ls.nvim' },
  { 'ray-x/lsp_signature.nvim' },
  { 'andymass/vim-matchup' },
  { 'gelguy/wilder.nvim' },
  { 'tpope/vim-sleuth' },      -- Detect tabstop and shiftwidth automatically
  { 'RRethy/vim-illuminate' }, -- Highlight Same
  {
    'hrsh7th/nvim-cmp',        -- Autocompletion
    dependencies = {
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-cmdline' },
      { 'onsails/lspkind-nvim' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-path' },
      { 'rafamadriz/friendly-snippets' },
      { 'lukas-reineke/cmp-under-comparator' },
    },
  },

  {
    'neovim/nvim-lspconfig', -- LSP Configuration & Plugins
    dependencies = {
      { 'williamboman/mason.nvim',          config = true },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'j-hui/fidget.nvim',                opts = {} },
      { 'folke/neodev.nvim' },      -- lua lang helper
      { 'ryanoasis/vim-devicons' }, -- Icons
      -- { 'kyazdani42/nvim-web-devicons' }, -- Icons
    },
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  { 'lewis6991/gitsigns.nvim', },
  { 'nvim-lualine/lualine.nvim', },
  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {},
  },
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      {
        's1n7ax/nvim-window-picker',
        version = '2.*',
        config = function()
          require 'window-picker'.setup({
            filter_rules = {
              include_current_win = false,
              autoselect_one = true,
              bo = {
                filetype = { 'neo-tree', "neo-tree-popup", "notify" },
                buftype = { 'terminal', "quickfix" },
              },
            },
          })
        end,
      },
    },
  },
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = true
  },
  { 'akinsho/git-conflict.nvim', version = "*", config = true },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    },
  },

}, {})

require("keymaps")
require("core")         -- + ?
require("git")          -- -
require("autocomplete") -- +
require("diagnostics")  -- +
require("highlight")    -- +
require("search")       -- + возможно его нужно удалить
require("ui")           -- +
require("lsp")          -- +
require("neotree")      -- +
