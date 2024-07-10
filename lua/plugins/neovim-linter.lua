return {
  "mfussenegger/nvim-lint",
  config = function()
    require('lint').linters_by_ft = {
      markdown = { 'vale', },
      python = { 'mypy', 'ruff', }, -- NOTE: Нужно устанавливать через Mason
    }

    -- Фунцция помощник :ShowDiagnostics - выводит имя диагностики и ощибку
    function _G.show_diagnostics()
      local diagnostics = vim.diagnostic.get(0)
      for i, diagnostic in ipairs(diagnostics) do
        local linter = diagnostic.source or "unknown"
        print(string.format("Diag %d [%s]: %s", i, linter, diagnostic.message))
      end
    end

    vim.cmd("command! ShowDiagnostics lua _G.show_diagnostics()")

    -- Запуск линтеров
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
