-- One possible example:
-- - https://learnxinyminutes.com/docs/lua/
--  - https://neovim.io/doc/user/lua-guide.html
--

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
  { 'nyoom-engineering/oxocarbon.nvim',
    config = function()
      vim.cmd.colorscheme 'oxocarbon'
    end,
  },
  { 'xiyaowong/transparent.nvim' },
  { 'kylechui/nvim-surround' },       --
  { 'm4xshen/autoclose.nvim' },       --
  { 'snelling-a/better-folds.nvim' }, --
  { 'b3nj5m1n/kommentary' },          --
  { 'powerman/vim-plugin-ruscmd' },   --
  { 'MattesGroeger/vim-bookmarks' },  --
  { 'nvimtools/none-ls.nvim' },
  { 'ray-x/lsp_signature.nvim' },
  { 'andymass/vim-matchup' },
  { 'gelguy/wilder.nvim' },
  { 'tpope/vim-sleuth' },      -- Detect tabstop and shiftwidth automatically
  -- { 'folke/which-key.nvim', opts = {} },
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
    },
  },

  {
    'neovim/nvim-lspconfig', -- LSP Configuration & Plugins
    dependencies = {
      { 'williamboman/mason.nvim',          config = true },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'j-hui/fidget.nvim',                opts = {} },
      { 'folke/neodev.nvim' },            -- lua lang helper
      { 'ryanoasis/vim-devicons' },       -- Icons
      { 'kyazdani42/nvim-web-devicons' }, -- Icons
    },
  },
  { 'lewis6991/gitsigns.nvim', },
  --[[ {
    'sainnhe/gruvbox-material',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'gruvbox-material'
    end,
  }, ]]
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

require('keymaps')
require('opts')
require('custom.configs.telescope')
require('custom.configs.treesitter')
require('custom.configs.cmp')
require('custom.configs.lsp')
require('custom.configs.neotree')
require('custom.configs.ui')
require('custom.configs.null_ls')
require('custom.configs.git')
