return {
  {
    "hkupty/iron.nvim", -- repl provider
    config = function()
      local iron = require("iron.core")
      local view = require("iron.view")
      iron.setup({
        config = {
          -- Whether a repl should be discarded or not
          scratch_repl = true,
          -- How the repl window will be displayed
          -- See below for more information
          repl_open_cmd = view.split("30%"),
        },
      })
    end,
  },
  {
    "GCBallesteros/NotebookNavigator.nvim",
    keys = {
      { "]h",        function() require("notebook-navigator").move_cell "d" end },
      { "[h",        function() require("notebook-navigator").move_cell "u" end },
      { "<leader>X", function() require('notebook-navigator').run_cell() end },
      { "<leader>x", function() require('notebook-navigator').run_and_move() end },
    },
    dependencies = {
      "echasnovski/mini.comment",
      "akinsho/toggleterm.nvim", -- alternative repl provider
    },
    event = "VeryLazy",
    config = function()
      local nn = require "notebook-navigator"
      nn.setup({
        -- activate_hydra_keys = "<leader>h"
      })
    end,
  },
  {
    "echasnovski/mini.hipatterns",
    event = "VeryLazy",
    dependencies = { "GCBallesteros/NotebookNavigator.nvim" },
    opts = function()
      local nn = require "notebook-navigator"
      return { highlighters = { cells = nn.minihipatterns_spec } }
    end,
  },
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    dependencies = { "GCBallesteros/NotebookNavigator.nvim" },
    opts = function()
      local nn = require "notebook-navigator"
      return { custom_textobjects = { h = nn.miniai_spec } }
    end,
  },
  {
    "GCBallesteros/jupytext.nvim",
    config = true,
  }
}
