vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -----------------------------------------------------------
    -- Packer
    -----------------------------------------------------------
    use 'wbthomason/packer.nvim'

    -- Bookmarks
    use 'MattesGroeger/vim-bookmarks'
    -- TODO Comments
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup {}
      end
    }

    -------------------------------------------------
    -- Core Plugins
    -------------------------------------------------
    -- Russian comand line expired
    use 'powerman/vim-plugin-ruscmd'
    use 'tpope/vim-surround'

    -- Может повторять через . vimsurround
    use 'tpope/vim-repeat'

    -- Закрывает автоматом скобки
    use 'cohama/lexima.vim'

    -- Коменты
    use 'b3nj5m1n/kommentary'
    use "lukas-reineke/indent-blankline.nvim"
    -----------------------------------------------------------
    -- SEARCH
    -----------------------------------------------------------
    use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = {{
    'nvim-lua/popup.nvim',
    'nvim-telescope/telescope-media-files.nvim'
    }}
    }
    -----------------------------------------------------------
    -- Code Highlight
    -----------------------------------------------------------
    use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
    }
    use 'RRethy/nvim-treesitter-textsubjects'
    -----------------------------------------------
    --  LSP
    -----------------------------------------------
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'j-hui/fidget.nvim'
    --  Auto Completion Utils
    use {
    "ray-x/lsp_signature.nvim",
    }
    -----------------------------------------------
    -- Snippets
    -----------------------------------------------
    use {
    "L3MON4D3/LuaSnip",
    config = function() require('plugins.snippets.snippets') end
    }
    use "rafamadriz/friendly-snippets"
    -----------------------------------------------
    -- CMP
    -----------------------------------------------
    use({
    "hrsh7th/nvim-cmp",
    -- Sources for nvim-cmp
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


    -----------------------------------------------------------
    --------------------- CODE HELPERS ------------------------
    -----------------------------------------------------------
    -- => Should be on plugin.code.name
    -----------------------------------------------------------
    -- Gist
    -----------------------------------------------------------
    use 'mattn/webapi-vim'
    use 'mattn/vim-gist'

    -------------------------------------------------
    -- GIT
    -------------------------------------------------
    use 'TimUntersberger/neogit' -- Git Changes
    use 'lewis6991/gitsigns.nvim' -- Git Blame
    use 'airblade/vim-gitgutter'
    use 'sindrets/diffview.nvim' -- Diff view

    -----------------------------------------------------------
    -- Documentation AutoGenerate
    -----------------------------------------------------------
    use {
    'kkoomen/vim-doge',
    run = ':call doge#install()'
    }
    -----------------------------------------------------------
    -- Vim Sphinx intergration
    -----------------------------------------------------------
    use 'stsewd/sphinx.nvim'

    --------------------- UI HELPERS --------------------------
    -- Highlight Same
    use 'RRethy/vim-illuminate'
    -----------------------------------------------------------
    -- => Should be on plugin.ui.name
    -----------------------------------------------------------
    use 'folke/tokyonight.nvim'
    use 'ryanoasis/vim-devicons'
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-lua/plenary.nvim'
    -- NERDTree
    use {'preservim/nerdtree', }
    -- Подсветка парных скобок
    use {'andymass/vim-matchup', event = 'VimEnter'}
    -- Нижняя панель
    use {'nvim-lualine/lualine.nvim',}
    -- TAGS панель
    use 'simrat39/symbols-outline.nvim'
    -- Считает кол-во совпадений при поиске
    use 'google/vim-searchindex'
    -----------------------------------------------------------
    -- Wilder
    -----------------------------------------------------------
    use {
        'gelguy/wilder.nvim',
        requires = {
            "kyazdani42/nvim-web-devicons", -- optional
        },
    }
    -----------------------------------------------------------
    -- Tabs Barline
    -----------------------------------------------------------
    use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}
    -----------------------------------------------------------
    -- NVIM Transporent
    -----------------------------------------------------------
    use 'xiyaowong/nvim-transparent'
    -----------------------------------------------------------
    -- Navic [ Code Breadcrambs ]
    -----------------------------------------------------------
    use {
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig"
    }
    -----------------------------------------------------------
    -- Barbecue  ?? IS IT NAVIC COPY?    Breadcrambs
    -----------------------------------------------------------
    use({
      "utilyre/barbecue.nvim",
      requires = {
        "neovim/nvim-lspconfig",
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons", -- optional dependency
      },
      after = "nvim-web-devicons", -- keep this if you're using NvChad
      config = function()
        require("barbecue").setup()
      end,
    })

end)
