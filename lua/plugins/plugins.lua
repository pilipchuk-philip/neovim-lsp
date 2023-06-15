vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  ------------------
  -- Core Plugins --
  ------------------
  use "kylechui/nvim-surround"                      -- Surround
  use "tpope/vim-repeat"                            -- can repeat . vimsurround
  use "m4xshen/autoclose.nvim"                      -- Autoclose
  use "snelling-a/better-folds.nvim"                -- Folds
  use "b3nj5m1n/kommentary"                         -- Comments
  use "powerman/vim-plugin-ruscmd"                  -- Russian comand line expired
  use "MattesGroeger/vim-bookmarks"                 -- Bookmarks
  use {
    "nvim-telescope/telescope.nvim", tag = '0.1.0', -- Search
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-telescope/telescope-media-files.nvim"
    }
  }
  ------------------
  -- CODE         --
  ------------------
  use "jose-elias-alvarez/null-ls.nvim"
  use {
    "nvim-treesitter/nvim-treesitter", -- Code Highlight
    run = ":TSUpdate"
  }
  use({
    "hrsh7th/nvim-cmp", -- Autocomplete
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "onsails/diaglist.nvim",
      "onsails/lspkind-nvim",
    },
  })
  use {
    "L3MON4D3/LuaSnip", -- Snippets
    config = function() require('plugins.snippets.snippets') end
  }
  use "rafamadriz/friendly-snippets"    -- Snippets
  use "ray-x/lsp_signature.nvim"        -- Show function signature
  use "neovim/nvim-lspconfig"           -- Lsp config files
  use "williamboman/nvim-lsp-installer" -- Lsp installer
  use "stsewd/sphinx.nvim"              -- Sphinx intergration
  ------------------
  -- GIT          --
  ------------------
  use "mattn/webapi-vim"        -- Git Gist
  use "mattn/vim-gist"          -- Git Gist
  use "TimUntersberger/neogit"  -- Git Client
  use "lewis6991/gitsigns.nvim" -- Git Blame
  use "sindrets/diffview.nvim"  -- Diff view
  ------------------
  -- UI           --
  ------------------
  use { "j-hui/fidget.nvim", tag = "legacy" }        -- Status for loading plugins
  use "projekt0n/github-nvim-theme"                  -- github theme
  -- use "folke/tokyonight.nvim" -- Theme Tokio Night
  use "lukas-reineke/indent-blankline.nvim"          -- Highlight spaces
  use "RRethy/vim-illuminate"                        -- Highlight Same
  use "nvim-lua/plenary.nvim"                        -- Telescope part
  use "preservim/nerdtree"                           -- NerdTree
  use { "andymass/vim-matchup", event = "VimEnter" } -- Highlight "(
  use "nvim-lualine/lualine.nvim"                    -- Bottom panal
  use "google/vim-searchindex"                       -- Count search find
  use {
    "gelguy/wilder.nvim",                            -- Wilder
    requires = { "kyazdani42/nvim-web-devicons", },
  }
  use { "romgrk/barbar.nvim", wants = 'nvim-web-devicons' } -- Tabs Barline
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
  }
  use "Bekaboo/dropbar.nvim"
  ------------------
  -- Dependency   --
  ------------------
  use "ryanoasis/vim-devicons"       -- Icons
  use "kyazdani42/nvim-web-devicons" -- Icons
end)
