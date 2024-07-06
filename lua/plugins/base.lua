return {
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
    "lewis6991/hover.nvim",
  },
  {
    "isak102/telescope-git-file-history.nvim",
    dependencies = { "tpope/vim-fugitive" }
  },
  { 'davidgranstrom/nvim-markdown-preview' },
  { 'xiyaowong/transparent.nvim' },
  -- { 'kylechui/nvim-surround' },
  { 'm4xshen/autoclose.nvim',              opts = {} },
  { 'snelling-a/better-folds.nvim',        opts = {} },
  { 'b3nj5m1n/kommentary' },
  { 'powerman/vim-plugin-ruscmd' },
  { 'MattesGroeger/vim-bookmarks' },
  { 'ray-x/lsp_signature.nvim' },
  { 'andymass/vim-matchup' },
  { 'tpope/vim-sleuth' },      -- Detect tabstop and shiftwidth automatically
  { 'RRethy/vim-illuminate' }, -- Highlight Same
  -- Telescope (files, lsp, etc)
  { "preservim/nerdtree" },
  {
    'linrongbin16/lsp-progress.nvim',
    config = function()
      require('lsp-progress').setup()
    end
  },
}
