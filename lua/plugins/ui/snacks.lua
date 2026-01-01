return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    explorer = {
      enabled = true,
      notify = true,
    },
    -- indent = { enabled = true },
    input = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    picker = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        -- wo = { wrap = true } -- Wrap notifications
      }
    }
  },
  keys = {
    -- Top Pickers & Explorer
    { "<leader><space>", function() Snacks.picker.smart() end,                desc = "Smart Find Files" },
    { "<leader>/",       function() Snacks.picker.grep() end,                 desc = "Grep" },
    -- ????
    { "<leader>n",       function() Snacks.picker.notifications() end,        desc = "Notification History" },
    { "<BS>",            function() Snacks.explorer() end,                    desc = "File Explorer" },
    { "<leader><BS>",    function() Snacks.explorer.reveal() end,             desc = "File Explorer" },
    -- find
    -- TODO: как это работает?
    { "<leader>fp",      function() Snacks.picker.projects() end,             desc = "Projects" },
    { "<leader>fr",      function() Snacks.picker.recent() end,               desc = "Recent" },
    -- git
    { "<leader>gb",      function() Snacks.picker.git_branches() end,         desc = "Git Branches" },
    { "<leader>gll",     function() Snacks.picker.git_log() end,              desc = "Git Log" },
    { "<leader>gL",      function() Snacks.picker.git_log_line() end,         desc = "Git Log Line" },
    { "<leader>gs",      function() Snacks.picker.git_status() end,           desc = "Git Status" },
    { "<leader>gS",      function() Snacks.picker.git_stash() end,            desc = "Git Stash" },
    { "<leader>gd",      function() Snacks.picker.git_diff() end,             desc = "Git Diff (Hunks)" },
    { "<leader>gf",      function() Snacks.picker.git_log_file() end,         desc = "Git Log File" },
    -- search
    { '<leader>s/',      function() Snacks.picker.search_history() end,       desc = "Search History" },
    { "<leader>sa",      function() Snacks.picker.autocmds() end,             desc = "Autocmds" },
    { "<leader>sb",      function() Snacks.picker.lines() end,                desc = "Buffer Lines" },
    { "<leader>sc",      function() Snacks.picker.command_history() end,      desc = "Command History" },
    { "<leader>sC",      function() Snacks.picker.commands() end,             desc = "Commands" },
    { "<leader>sd",      function() Snacks.picker.diagnostics() end,          desc = "Diagnostics" },
    { "<leader>sD",      function() Snacks.picker.diagnostics_buffer() end,   desc = "Buffer Diagnostics" },
    { "<leader>sh",      function() Snacks.picker.help() end,                 desc = "Help Pages" },
    { "<leader>si",      function() Snacks.picker.icons() end,                desc = "Icons" },
    { "<leader>sk",      function() Snacks.picker.keymaps() end,              desc = "Keymaps" },
    { "<leader>sM",      function() Snacks.picker.man() end,                  desc = "Man Pages" },
    { "<leader>su",      function() Snacks.picker.undo() end,                 desc = "Undo History" },
    -- LSP
    { "gd",              function() Snacks.picker.lsp_definitions() end,      desc = "Goto Definition" },
    { "gD",              function() Snacks.picker.lsp_declarations() end,     desc = "Goto Declaration" },
    { "gr",              function() Snacks.picker.lsp_references() end,       nowait = true,                  desc = "References" },
    { "gI",              function() Snacks.picker.lsp_implementations() end,  desc = "Goto Implementation" },
    { "gy",              function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    -- Other
    { "<leader>cR",      function() Snacks.rename.rename_file() end,          desc = "Rename File" },
    -- TODO: тоже что и мой скрипт, что-то нужно убрать
    { "<leader>gB",      function() Snacks.gitbrowse() end,                   desc = "Git Browse",            mode = { "n", "v" } },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map(
          "<leader>uc")
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.dim():map("<leader>uD")
      end,
    })
  end,
}
-- %%
