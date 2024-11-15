return {
  "elentok/format-on-save.nvim",
  config = function()
    local format_on_save = require("format-on-save")
    local formatters = require("format-on-save.formatters")
    local env = os.getenv("MY_ENV")
    local python_formatters

    if env == "WORK" then
      python_formatters = {
        formatters.remove_trailing_whitespace,
        -- NOTE: "-" этот символ не даёт перезаписывать этот файл, иначе в файл попадает результат
        formatters.shell({ cmd = { "ruff", "format", "--config", "/home/ppy/work/unixy/python/pyproject.toml", "-" } })
        -- TODO: можно настроить isort
      }
      print("work")
    else
      python_formatters = {
        formatters.lsp,
        formatters.remove_trailing_whitespace,
      }
      print("any dev")
    end

    format_on_save.setup({
      exclude_path_patterns = {
        "/node_modules/",
        ".local/share/nvim/lazy",
      },
      formatter_by_ft = {
        css = formatters.lsp,
        html = formatters.lsp,
        java = formatters.lsp,
        json = formatters.lsp,
        lua = formatters.lsp,
        markdown = formatters.prettierd,
        openscad = formatters.lsp,
        rust = formatters.lsp,
        scad = formatters.lsp,
        scss = formatters.lsp,
        sh = formatters.shfmt,
        terraform = formatters.lsp,
        typescript = formatters.prettierd,
        typescriptreact = formatters.prettierd,
        yaml = formatters.lsp,
        javascript = formatters.lsp,
        sql = {},                   -- NOTE: так можно не форматировать вообще ничего
        text = formatters.remove_trailing_whitespace,
        python = python_formatters, -- NOTE: так можно их переопределить

        -- Use a tempfile instead of stdin
        go = {
          formatters.shell({
            cmd = { "goimports-reviser", "-rm-unused", "-set-alias", "-format", "%" },
            tempfile = function()
              return vim.fn.expand("%") .. '.formatter-temp'
            end
          }),
          formatters.shell({ cmd = { "gofmt" } }),
        },

      },

      -- Optional: fallback formatter to use when no formatters match the current filetype
      fallback_formatter = {
        formatters.remove_trailing_whitespace,
        -- formatters.remove_trailing_newlines,
        -- formatters.prettierd,
      },

      -- By default, all shell commands are prefixed with "sh -c" (see PR #3)
      -- To prevent that set `run_with_sh` to `false`.
      run_with_sh = false,
    })
  end,
}
