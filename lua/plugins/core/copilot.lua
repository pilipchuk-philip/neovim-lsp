return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      mappings = {
        complete = {
          insert = "<Tab>",
        },
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    dependencies = {
      { "zbirenbaum/copilot-cmp" },
    },
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
      require("copilot_cmp").setup()
    end,
  },
}
