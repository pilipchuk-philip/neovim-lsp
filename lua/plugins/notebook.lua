return {
  -- FIXME: Проблема с совместимостью плагинов (TmuxNavigator)
  -- что-то не так с этим плагином, он переопределяет буфер в результате чего не работает переключение по табам
  -- (:autocmd FileType ipynb) что-то подобное похож
  {
    'goerz/jupytext.nvim',
    version = '0.2.0',
    opts = {}, -- see Options
  },
  {
    "GCBallesteros/NotebookNavigator.nvim",
    keys = {
      { "]h",        function() require("notebook-navigator").move_cell "d" end },
      { "[h",        function() require("notebook-navigator").move_cell "u" end },
      { "<leader>X", "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
      { "<leader>x", "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
    },
    dependencies = {
      "echasnovski/mini.comment",
      "hkupty/iron.nvim", -- repl provider
      "anuvyklack/hydra.nvim",
    },
    event = "VeryLazy",
    config = function()
      local nn = require "notebook-navigator"
      nn.setup({ activate_hydra_keys = "<leader>h" })
    end,
  },
  {
    "echasnovski/mini.hipatterns",
    event = "VeryLazy",
    dependencies = { "GCBallesteros/NotebookNavigator.nvim" },
    opts = function()
      local nn = require "notebook-navigator"

      local opts = { highlighters = { cells = nn.minihipatterns_spec } }
      return opts
    end,
  }
}
