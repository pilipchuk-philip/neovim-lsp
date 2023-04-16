vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    ------------------
    -- Core Plugins --
    ------------------
    use "tpope/vim-surround" -- Surround
    use "tpope/vim-repeat" -- Может повторять через . vimsurround
    use "cohama/lexima.vim" -- Закрывает автоматом скобки
    use "b3nj5m1n/kommentary" -- Коменты
    use "powerman/vim-plugin-ruscmd" -- Russian comand line expired
    use "MattesGroeger/vim-bookmarks" -- Bookmarks
    use {
        "nvim-telescope/telescope.nvim", tag = '0.1.0', -- Search
        requires = {
            "nvim-lua/popup.nvim",
            "nvim-telescope/telescope-media-files.nvim"
        }
    }
    use {"kkoomen/vim-doge", run = ":call doge#install()"} -- generate doc
    ------------------
    -- CODE         --
    ------------------
    use {
        "nvim-treesitter/nvim-treesitter", -- Code Highlight
        run = ":TSUpdate"
    }
    use({
        "hrsh7th/nvim-cmp",  -- Autocomplete
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
        "L3MON4D3/LuaSnip",  -- Snippets
        config = function() require('plugins.snippets.snippets') end
    }
    use "rafamadriz/friendly-snippets"
    use "j-hui/fidget.nvim" -- status for loading plugins
    use "ray-x/lsp_signature.nvim" -- Show function signature
    use "neovim/nvim-lspconfig" -- Lsp config files
    use "williamboman/nvim-lsp-installer" -- Lsp installer
    use "stsewd/sphinx.nvim" -- Sphinx intergration
    ------------------
    -- GIT          --
    ------------------
    use "mattn/webapi-vim" -- Git Gist
    use "mattn/vim-gist" -- Git Gist
    use "TimUntersberger/neogit" -- Git Client
    use "lewis6991/gitsigns.nvim" -- Git Blame
    use "airblade/vim-gitgutter" -- Git Gutter
    use "sindrets/diffview.nvim" -- Diff view
    ------------------
    -- UI           --
    ------------------
    use "lukas-reineke/indent-blankline.nvim" -- Выделение отступов
    use "RRethy/vim-illuminate" -- Highlight Same
    use "folke/tokyonight.nvim" -- Theme Tokio Night
    use "ryanoasis/vim-devicons" -- Icons
    use "kyazdani42/nvim-web-devicons" -- Icons
    use "nvim-lua/plenary.nvim" -- Telescope part
    use "preservim/nerdtree" -- NerdTree
    use {"andymass/vim-matchup", event = 'VimEnter'} -- Подсветка парных скобок
    use "nvim-lualine/lualine.nvim" -- Нижняя панель
    use "google/vim-searchindex"  -- Считает кол-во совпадений при поиске
    use {
        "gelguy/wilder.nvim",  -- Wilder
        requires = { "kyazdani42/nvim-web-devicons",},
    }
    use {"romgrk/barbar.nvim", wants = 'nvim-web-devicons'} -- Tabs Barline
    use "xiyaowong/nvim-transparent" --Transporency
    use {
        "SmiteshP/nvim-navic",    -- Navic [ Code Breadcrambs ]
        requires = "neovim/nvim-lspconfig"
    }
    use {
        "utilyre/barbecue.nvim",
        requires = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
        after = "nvim-web-devicons",
        config = function()
            require("barbecue").setup()
        end,
    }

end)
