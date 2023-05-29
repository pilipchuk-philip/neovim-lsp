vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    ------------------
    -- Core Plugins --
    ------------------
    use "tpope/vim-surround" -- Surround
    use "tpope/vim-repeat" -- can repeat . vimsurround
    use "cohama/lexima.vim" -- Close closures
    use "b3nj5m1n/kommentary" -- Comments
    use "powerman/vim-plugin-ruscmd" -- Russian comand line expired
    use "MattesGroeger/vim-bookmarks" -- Bookmarks
    use {
        "nvim-telescope/telescope.nvim", tag = '0.1.0', -- Search
        requires = {
            "nvim-lua/popup.nvim",
            "nvim-telescope/telescope-media-files.nvim"
        }
    }
    use {"kkoomen/vim-doge", run = ":call doge#install()"} -- Generate doc
    ------------------
    -- CODE         --
    ------------------
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
        "L3MON4D3/LuaSnip",  -- Snippets
        config = function() require('plugins.snippets.snippets') end
    }
    use "rafamadriz/friendly-snippets" -- Snippets
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
    use "sindrets/diffview.nvim" -- Diff view
    ------------------
    -- UI           --
    ------------------
    use "j-hui/fidget.nvim" -- Status for loading plugins
    use "projekt0n/github-nvim-theme" -- github theme
    -- use "folke/tokyonight.nvim" -- Theme Tokio Night
    use "lukas-reineke/indent-blankline.nvim" -- Highlight spaces
    use "RRethy/vim-illuminate" -- Highlight Same
    use "nvim-lua/plenary.nvim" -- Telescope part
    use "preservim/nerdtree" -- NerdTree
    use {"andymass/vim-matchup", event = "VimEnter"} -- Highlight "(
    use "nvim-lualine/lualine.nvim" -- Bottom panal
    use "google/vim-searchindex"  -- Count search find
    use {
        "gelguy/wilder.nvim",  -- Wilder
        requires = { "kyazdani42/nvim-web-devicons",},
    }
    use {"romgrk/barbar.nvim", wants = 'nvim-web-devicons'} -- Tabs Barline
    use "xiyaowong/nvim-transparent" --Transporency
    use {
        "SmiteshP/nvim-navic", -- Navic [ Code Breadcrambs ]
        requires = "neovim/nvim-lspconfig"
    }
    use {
        "utilyre/barbecue.nvim", -- Navic [ Code Breadcrambs ]
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
    use {
      "folke/trouble.nvim",
      requires = "nvim-tree/nvim-web-devicons",
      config = function()
        require("trouble").setup {
            position = "bottom", -- position of the list can be: bottom, top, left, right
            height = 10, -- height of the trouble list when position is top or bottom
            width = 50, -- width of the list when position is left or right
            icons = true, -- use devicons for filenames
            mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
            fold_open = "", -- icon used for open folds
            fold_closed = "", -- icon used for closed folds
            group = true, -- group results by file
            padding = true, -- add an extra new line on top of the list
            action_keys = { -- key mappings for actions in the trouble list
                -- map to {} to remove a mapping, for example:
                -- close = {},
                close = "q", -- close the list
                cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
                refresh = "r", -- manually refresh
                jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
                open_split = { "<c-x>" }, -- open buffer in new split
                open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
                open_tab = { "<c-t>" }, -- open buffer in new tab
                jump_close = {"o"}, -- jump to the diagnostic and close the list
                toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
                toggle_preview = "P", -- toggle auto_preview
                hover = "K", -- opens a small popup with the full multiline message
                preview = "p", -- preview the diagnostic location
                close_folds = {"zM", "zm"}, -- close all folds
                open_folds = {"zR", "zr"}, -- open all folds
                toggle_fold = {"zA", "za"}, -- toggle fold of current file
                previous = "k", -- previous item
                next = "j" -- next item
            },
            indent_lines = true, -- add an indent guide below the fold icons
            auto_open = false, -- automatically open the list when you have diagnostics
            auto_close = false, -- automatically close the list when you have no diagnostics
            auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
            auto_fold = false, -- automatically fold a file trouble list at creation
            auto_jump = {"lsp_definitions"}, -- for the given modes, automatically jump if there is only a single result
            signs = {
                -- icons / text used for a diagnostic
                error = "",
                warning = "",
                hint = "",
                information = "",
                other = "﫠"
            },
            use_diagnostic_signs = false
            }
          end
    }
    ------------------
    -- Dependency   --
    ------------------
    use "ryanoasis/vim-devicons" -- Icons
    use "kyazdani42/nvim-web-devicons" -- Icons
end)
