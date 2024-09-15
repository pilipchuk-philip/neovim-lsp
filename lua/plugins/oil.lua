return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      columns = {
        "size",
        "mtime",
        -- "permissions",
        "icon",
      },
      delete_to_trash = false,
      skip_confirm_for_simple_edits = false,
      -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      },
    })
  end,
}
